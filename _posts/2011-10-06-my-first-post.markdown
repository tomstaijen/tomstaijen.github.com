---
layout: post
title: First Post
tags: none
---

Hello

{% highlight ruby %}

    add_task_address=<YOUR TODO APP EMAIL ADDRESS>
    task=$*

    if [ $task ]; then
      # Send email with task as subject
      echo "" | mail -s $task $add_task_address
        if [ $? ]; then
            echo "Successfully added task \"$task\""
              fi
              else
                mail -s "Inbox" $import_tasks_address
                fi

{% endhighlight %}