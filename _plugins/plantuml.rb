require 'digest'
require 'fileutils'

module Jekyll
  class PlantumlBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      site = context.registers[:site]
      name = Digest::MD5.hexdigest(super)
      if !File.exists?(File.join(site.dest, "uml/#{name}.svg"))
        uml = File.join(site.source, "uml/#{name}.uml")
        FileUtils.mkdir_p(File.dirname(uml))
        File.open(uml, 'w') { |f|
          f.write("@startuml\n")
          f.write(super)
          f.write("\n@enduml")
        }
        system("plantuml -tsvg #{uml}")
        site.static_files << Jekyll::StaticFile.new(
          site, site.source, 'uml', "#{name}.svg"
        )
      end
      "<p><object type='image/svg+xml' data='/uml/#{name}.svg' class='plantuml'>Your browser does not support SVG</object>"
    end
  end
end

Liquid::Template.register_tag('plantuml', Jekyll::PlantumlBlock)