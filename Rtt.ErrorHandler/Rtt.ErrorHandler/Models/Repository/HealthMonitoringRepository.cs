﻿using System;
using System.Data.SqlClient;
using System.Linq;
using Rtt.ErrorHandler.Models.Repository.Entities;
using Rtt.ErrorHandler.Models.Repository.Interfaces;
using Rtt.ErrorHandler.Models;

namespace Rtt.ErrorHandler.Models.Repository
{
    /// <summary>
    /// This class extracts information that ASP.NET Health Monitoring stores so that we can report on it
    /// </summary>
    public class HealthMonitoringRepository : ILogReportingRepository
    {
        private RttEntities Context { get; }

        /// <summary>
        /// Default Constructor uses the default Entity Container
        /// </summary>
        public HealthMonitoringRepository()
        {
            Context = new RttEntities();
        }

        /// <summary>
        /// Overloaded constructor that can take an EntityContainer as a parameter so that it can be mocked out by our tests
        /// </summary>
        /// <param name="context">The Entity context</param>
        public HealthMonitoringRepository(RttEntities context)
        {
            Context = context;
        }

        /// <summary>
        /// Gets a filtered list of log events
        /// </summary>
        /// <param name="pageIndex">0 based page index</param>
        /// <param name="pageSize">max number of records to return</param>
        /// <param name="start">start date</param>
        /// <param name="end">end date</param>
        /// <param name="logLevel">The level of the log messages</param>
        /// <returns>A filtered list of log events</returns>
        public IQueryable<LogEvent> GetByDateRangeAndType(DateTime start, DateTime end, string logLevel)
        {
            IQueryable<LogEvent> list = from h in Context.vw_aspnet_WebEvents_extended
                                        where h.EventTimeUtc >= start && h.EventTimeUtc <= end
                                        && (h.Level == logLevel || logLevel == "All")
                                        select new LogEvent
                                        {
                                            IdType = "string"
                                                            ,
                                            Id = h.EventId
                                                            ,
                                            IdAsInteger = 0
                                                            ,
                                            IdAsGuid = Guid.NewGuid()
                                                            ,
                                            LoggerProviderName = "Health Monitoring"
                                                            ,
                                            LogDate = h.EventTimeUtc
                                                            ,
                                            MachineName = h.MachineName
                                                            ,
                                            Message = h.Message
                                                            ,
                                            Type = h.EventType
                                                            ,
                                            Level = h.Level
                                                            ,
                                            Source = h.RequestUrl
                                                            ,
                                            StackTrace = ""
                                        };

            return list;
        }

        /// <summary>
        /// Returns a single Log event
        /// </summary>
        /// <param name="id">Id of the log event as a string</param>
        /// <returns>A single Log event</returns>
        public LogEvent GetById(string id)
        {
            LogEvent logEvent = logEvent = (from b in Context.vw_aspnet_WebEvents_extended
                                            where b.EventId == id
                                            select new LogEvent
                                            {
                                                IdType = "string"
                                                                ,
                                                Id = b.EventId
                                                                ,
                                                LoggerProviderName = "Health Monitoring"
                                                                ,
                                                LogDate = b.EventTimeUtc
                                                                ,
                                                MachineName = b.MachineName
                                                                ,
                                                Message = b.Message
                                                                ,
                                                Type = b.EventType
                                                                ,
                                                Level = b.Level
                                                                ,
                                                Source = b.RequestUrl
                                                                ,
                                                StackTrace = ""
                                                                ,
                                                AllXml = ""
                                            })
                                .SingleOrDefault();

            return logEvent;

        }

        /// <summary>
        /// Clears log messages between a date range and for specified log levels
        /// </summary>
        /// <param name="start">start date</param>
        /// <param name="end">end date</param>
        /// <param name="logLevels">string array of log levels</param>
        public void ClearLog(DateTime start, DateTime end, string[] logLevels)
        {
            string logLevelList = "";
            foreach (string logLevel in logLevels)
            {
                logLevelList += ",'" + logLevel + "'";
            }
            if (logLevelList.Length > 0)
            {
                logLevelList = logLevelList.Substring(1);
            }

            string commandText = "";
            commandText += "DELETE ";
            commandText += "FROM ";
            commandText += "	aspnet_WebEvent_Events ";
            commandText += "WHERE";
            commandText += "	EventId IN	";
            commandText += "(SELECT EventId	";
            commandText += " FROM vw_aspnet_WebEvents_extended ";
            commandText += " WHERE ";
            commandText += "	[EventTimeUtc] >= @p0";
            commandText += " AND [EventTimeUtc] <= @p1";
            commandText += " AND [Level] IN (@p2)"; // eg:  AND [Level] IN ('Info','Debug')
            commandText += " )";

            SqlParameter paramStartDate = new SqlParameter { ParameterName = "p0", Value = start.ToUniversalTime(), DbType = System.Data.DbType.DateTime };
            SqlParameter paramEndDate = new SqlParameter { ParameterName = "p1", Value = end.ToUniversalTime(), DbType = System.Data.DbType.DateTime };
            SqlParameter paramLogLevelList = new SqlParameter { ParameterName = "p2", Value = logLevelList };

            Context.Database.ExecuteSqlCommand(commandText, paramStartDate, paramEndDate, paramLogLevelList);
        }

    }
}