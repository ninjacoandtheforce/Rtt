using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;

namespace Rtt.Web.Utilities
{
    public sealed class ChannelFactoryManager : IDisposable
    {
        private static readonly Dictionary<Type, ChannelFactory> Factories = new Dictionary<Type, ChannelFactory>();
        private static readonly object SyncRoot = new object();

        public T CreateChannel<T>() where T : class
        {
            return CreateChannel<T>("*", null);
        }

        public T CreateChannel<T>(string endpointConfigurationName) where T : class
        {
            return CreateChannel<T>(endpointConfigurationName, null);
        }

        public T CreateChannel<T>(string endpointConfigurationName, string endpointAddress)
        {
            T local = GetFactory<T>(endpointConfigurationName, endpointAddress).CreateChannel();
            ((IClientChannel)local).Faulted += ChannelFaulted;
            return local;
        }

        private ChannelFactory<T> GetFactory<T>(string endpointConfigurationName, string endpointAddress)
        {
            lock (SyncRoot)
            {
                if (!Factories.TryGetValue(typeof(T), out var factory))
                {
                    factory = CreateFactoryInstance<T>(endpointConfigurationName, endpointAddress);
                    Factories.Add(typeof(T), factory);
                }
                return (factory as ChannelFactory<T>);
            }
        }

        private ChannelFactory CreateFactoryInstance<T>(string endpointConfigurationName, string endpointAddress)
        {
            ChannelFactory factory = null;
            if (!string.IsNullOrEmpty(endpointAddress))
            {
                factory = new ChannelFactory<T>(endpointConfigurationName, new EndpointAddress(endpointAddress));
            }
            else
            {
                factory = new ChannelFactory<T>(endpointConfigurationName);
            }
            factory.Faulted += FactoryFaulted;
            factory.Open();
            return factory;
        }

        private void ChannelFaulted(object sender, EventArgs e)
        {
            IClientChannel channel = (IClientChannel)sender;
            try
            {
                channel.Close();
            }
            catch
            {
                channel.Abort();
            }
            throw new ApplicationException("Exc_ChannelFailure");
        }

        private void FactoryFaulted(object sender, EventArgs args)
        {
            ChannelFactory factory = (ChannelFactory)sender;
            try
            {
                factory.Close();
            }
            catch
            {
                factory.Abort();
            }
            Type[] genericArguments = factory.GetType().GetGenericArguments();
            if ((genericArguments != null) && (genericArguments.Length == 1))
            {
                Type key = genericArguments[0];
                if (Factories.ContainsKey(key))
                {
                    Factories.Remove(key);
                }
            }
            throw new ApplicationException("Exc_ChannelFactoryFailure");
        }

        public void Dispose()
        {
            Dispose(true);
        }

        private void Dispose(bool disposing)
        {
            if (disposing)
            {
                lock (SyncRoot)
                {
                    foreach (Type type in Factories.Keys)
                    {
                        ChannelFactory factory = Factories[type];
                        try
                        {
                            factory.Close();
                            continue;
                        }
                        catch
                        {
                            factory.Abort();
                            continue;
                        }
                    }
                    Factories.Clear();
                }
            }
        }
    }
}