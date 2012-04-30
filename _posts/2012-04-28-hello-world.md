---
layout: post
title: "Hello World"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# Testing some albacore features

{% highlight csharp %}

using System;
using System.IO;
using System.Reflection;
using System.Threading;
using Common.Logging;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using RabbitMQ.Client.Exceptions;

namespace NControl.Common.Queue
{
    /// <summary>
    /// RabbitMQ implementation of a workqueue. Published work is divided over consumers in a fair way (only one message at a time). 
    /// </summary>
    /// <typeparam name="TWork"></typeparam>
    public class WorkQueue<TWork> : IWorkQueue<TWork>
    {
        private static readonly ILog _log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        private readonly string _queuename;
        private bool _isConsuming;
        private readonly IConnection _connection;
        private readonly IQueueSerializer<TWork> _serializer;

        public WorkQueue(IConnection connection, IQueueSerializer<TWork> serializer) : this(connection, serializer, false)
        {
        }

        public WorkQueue(IConnection connection, IQueueSerializer<TWork> serializer, bool isErrorQueue)
        {
            _queuename = TypeNameSerializer.Serialize(typeof(TWork));
            if (isErrorQueue) _queuename += "_Error";

            _connection = connection;
            _serializer = serializer;

            // make sure the queue exists
            DeclareQueue(Model);
        }

        private void DeclareQueue(IModel model)
        {
            model.QueueDeclare(_queuename, false, false, false, null);
        }

        private IModel _model;
        private IModel Model
        {
            get
            {
                if (_model == null)
                    _model = _connection.CreateModel();

                return _model;
            }
            
        }

        /// <summary>
        /// convert string to byte[] and publish to queue
        /// </summary>
        /// <param name="work"></param>
        public void Publish(TWork work)
        {
            var bytes =_serializer.MessageToBytes(work);

//            using( var model = _connection.CreateModel())
//            {
//                DeclareQueue(model);
                IBasicProperties basicProperties = Model.CreateBasicProperties();
                basicProperties.SetPersistent(false);
                Model.BasicPublish("", _queuename, basicProperties, bytes);
//            }
        }

        public void Dispose()
        {
            if (_connection != null)
            {
                _connection.Close();
                _connection.Dispose();
            }
        }

        private delegate void ConsumeDelegate(Func<TWork,bool> onMessage, ushort prefetchCount, bool exitWhenIdle);
        public void StartConsuming(Func<TWork, bool> onMessage, ushort prefetchCount, bool blocking = false, bool exitOnIdle = false)
        {
            _isConsuming = true;
            if (!blocking)
            {
                var consume = new ConsumeDelegate(Consume);
                consume.BeginInvoke(onMessage, prefetchCount, false, null, null);
            }
            else
            {
                Consume(onMessage, prefetchCount, exitOnIdle);
            }
        }

        public void StopConsuming()
        {
            _isConsuming = false;
        }

        private void Consume(Func<TWork,bool> onMessage, ushort prefetchCount, bool exitWhenIdle = false)
        {
            using (var model = _connection.CreateModel())
            {
                model.BasicQos(0, prefetchCount, false);
                //DeclareQueue(model);
                var consumer = new QueueingBasicConsumer(model);
                var consumerTag = model.BasicConsume(_queuename, false, consumer);
                while (_isConsuming && _connection.IsOpen)
                {
                    try
                    {
                        object o;
                        consumer.Queue.Dequeue(1000, out o);
                        var eventArgs = o as BasicDeliverEventArgs; 

                        // fetch
                        //var eventArgs = (BasicDeliverEventArgs) consumer.Queue.DequeueNoWait(null);
                        
                        // convert to work
                        if (eventArgs != null)
                        {
                            var work = _serializer.BytesToMessage(eventArgs.Body);
                            model.BasicAck(eventArgs.DeliveryTag, false);
                            // altijd acknowledgen
                            onMessage(work);
                            
                        }
                        else
                        {
                            if( exitWhenIdle ) 
                                return;
                            Thread.Sleep(2000);
                        }
                    }
                    catch (OperationInterruptedException e)
                    {
                        _log.Error("RabbitMQ operation failure, exiting.", e);
                        return;
                        // The consumer was removed, either through
                        // channel or connection closure, or through the
                        // action of IModel.BasicCancel().);
                        //break;
                    }
                    catch (EndOfStreamException e)
                    {
                        _log.Error("RabbitMQ connection failure, exiting.", e);
                        return;
                        // The consumer was cancelled, the model closed, or the
                        // connection went away.
                        //break;
                    }
                    catch(Exception e)
                    {
                        _log.Error("Unhandled exception during work, exiting.", e);
                        return;
                    }
                }
            }
        }
    }
}


{% endhighlight %}