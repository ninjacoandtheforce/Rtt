﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using Rtt.ErrorHandler.Models.Repository.Entities;
using Rtt.ErrorHandler.Models.Repository.Interfaces;
using Rtt.ErrorHandler.Services.Logging;
using Rtt.ErrorHandler.Models;

namespace Rtt.ErrorHandler.Models.Repository
{
    /// <summary>
    /// This class provides a facade over all of our LogReport repositories
    /// </summary>
    public class LogReportingFacade : ILogReportingFacade
    {
        private RttEntities Context { get; } = new RttEntities();

        private Dictionary<string, string> LogProviders { get; set; } = null;

        /// <summary>
        /// Default constructor
        /// </summary>
        public LogReportingFacade()
        {            
            Init();
        }

        /// <summary>
        /// Overloaded constructor that can take an EntityContainer as a parameter so that it can be mocked out by our tests
        /// </summary>
        /// <param name="context">The Entity context</param>
        public LogReportingFacade(RttEntities context)
        {
            Context = context;

            Init();
        }

        /// <summary>
        /// 
        /// </summary>
        private void Init()
        {
            LogProviders = new Dictionary<string, string>();

            // Call ConfigurationManager to read the custom logConfiguration
            // of the web.config file and put its contents into an 
            // instance of the custom class created for it.
            LogConfigurationSection configSection = ConfigurationManager.GetSection("logConfiguration") as LogConfigurationSection;

            if (configSection == null)
                throw new ApplicationException("Failed to load the Log Configuration section.");
            else
            {
                for (int i = 0; i < configSection.LogProviders.Count; i++)
                {
                    LogProviders.Add(configSection.LogProviders[i].Name, configSection.LogProviders[i].Type);
                }
            }            
        }

        /// <summary>
        /// Creates and returns an instance of a log provider
        /// </summary>
        /// <param name="logProviderName">The type name of the log provider</param>
        /// <returns>An instance of a log provider</returns>
        private ILogReportingRepository GetProvider(string logProviderName)
        {
            string logSourceType = LogProviders[logProviderName];

            Type providerType = Type.GetType(logSourceType);

            ILogReportingRepository provider = Activator.CreateInstance(providerType, Context) as ILogReportingRepository;

            return provider;
        }


        /// <summary>
        /// Gets a filtered list of log events
        /// </summary>
        /// <param name="pageIndex">0 based page index</param>
        /// <param name="pageSize">max number of records to return</param>
        /// <param name="start">start date</param>
        /// <param name="end">end date</param>
        /// <param name="logProviderName">name of the log provider</param>
        /// <param name="logLevel">The level of the log messages</param>
        /// <returns>A filtered list of log events</returns>
        //public IQueryable<LogEvent> GetByDateRangeAndTypePaged(int pageIndex, int pageSize, DateTime start, DateTime end, string logProviderName, string logLevel)
        //{
        //    IQueryable<LogEvent> list = null;

        //    switch (logProviderName)
        //    {
        //        case "All":
        //            foreach (string providerName in LogProviders.Keys)
        //            {
        //                IQueryable<LogEvent> logList = GetProvider(providerName).GetByDateRangeAndType(pageIndex, pageSize, start, end, logLevel);
        //                list = (list == null) ? logList : list.Union(logList);
        //            }
        //            break;

        //        default:
        //            list = GetProvider(logProviderName).GetByDateRangeAndType(pageIndex, pageSize, start, end, logLevel);
        //            break;
        //    }

        //    list = list.OrderByDescending(d => d.LogDate);

        //    return IQueryable<LogEvent>(list, pageIndex, pageSize);
        //}

        public IQueryable<LogEvent> GetByDateRangeAndType(DateTime start, DateTime end, string logProviderName, string logLevel)
        {
            IQueryable<LogEvent> list = null;

            switch (logProviderName)
            {
                case "All":
                    foreach (string providerName in LogProviders.Keys)
                    {
                        IQueryable<LogEvent> logList = GetProvider(providerName).GetByDateRangeAndType( start, end, logLevel);
                        list = (list == null) ? logList : list.Union(logList);
                    }
                    break;

                default:
                    list = GetProvider(logProviderName).GetByDateRangeAndType( start, end, logLevel);
                    break;
            }

            return list?.OrderByDescending(d => d.LogDate);

        }

        /// <summary>
        /// Returns a single Log event
        /// </summary>
        /// <param name="logProviderName">name of the log provider</param>
        /// <param name="id">Id of the log event as a string</param>
        /// <returns>A single Log event</returns>
        public LogEvent GetById(string logProviderName, string id)
        {            
            LogEvent logEvent = GetProvider(logProviderName).GetById(id);
            return logEvent;
        }

        /// <summary>
        /// Clears log messages between a date range and for specified log levels
        /// </summary>
        /// <param name="logProviderName">name of the log provider</param>
        /// <param name="start">start date</param>
        /// <param name="end">end date</param>
        /// <param name="logLevels">string array of log levels</param>
        public void ClearLog(string logProviderName, DateTime start, DateTime end, string[] logLevels)
        {
            GetProvider(logProviderName).ClearLog(start, end, logLevels);
        }

        /// <summary>
        /// Returns a list of all registered log providers
        /// </summary>
        /// <returns>A list of all registered log providers</returns>
        public Dictionary<string, string> GetLogProviders()
        {
            return LogProviders;
        }

    }
}