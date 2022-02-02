﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Rtt.ErrorHandler.Models.Repository.Entities
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class RttEntities : DbContext
    {
        public RttEntities()
            : base("name=RttEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<aspnet_SchemaVersions> aspnet_SchemaVersions { get; set; }
        public virtual DbSet<aspnet_WebEvent_ErrorCodes> aspnet_WebEvent_ErrorCodes { get; set; }
        public virtual DbSet<aspnet_WebEvent_Events> aspnet_WebEvent_Events { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ELMAH_Error> ELMAH_Error { get; set; }
        public virtual DbSet<NLog_Error> NLog_Error { get; set; }
        public virtual DbSet<aspnet_WebEvents_extended> aspnet_WebEvents_extended { get; set; }
    
        public virtual int aspnet_CheckSchemaVersion(string feature, string compatibleSchemaVersion)
        {
            var featureParameter = feature != null ?
                new ObjectParameter("Feature", feature) :
                new ObjectParameter("Feature", typeof(string));
    
            var compatibleSchemaVersionParameter = compatibleSchemaVersion != null ?
                new ObjectParameter("CompatibleSchemaVersion", compatibleSchemaVersion) :
                new ObjectParameter("CompatibleSchemaVersion", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("aspnet_CheckSchemaVersion", featureParameter, compatibleSchemaVersionParameter);
        }
    
        public virtual int aspnet_WebEvent_LogEvent(string eventId, Nullable<System.DateTime> eventTimeUtc, Nullable<System.DateTime> eventTime, string eventType, Nullable<decimal> eventSequence, Nullable<decimal> eventOccurrence, Nullable<int> eventCode, Nullable<int> eventDetailCode, string message, string applicationPath, string applicationVirtualPath, string machineName, string requestUrl, string exceptionType, string details)
        {
            var eventIdParameter = eventId != null ?
                new ObjectParameter("EventId", eventId) :
                new ObjectParameter("EventId", typeof(string));
    
            var eventTimeUtcParameter = eventTimeUtc.HasValue ?
                new ObjectParameter("EventTimeUtc", eventTimeUtc) :
                new ObjectParameter("EventTimeUtc", typeof(System.DateTime));
    
            var eventTimeParameter = eventTime.HasValue ?
                new ObjectParameter("EventTime", eventTime) :
                new ObjectParameter("EventTime", typeof(System.DateTime));
    
            var eventTypeParameter = eventType != null ?
                new ObjectParameter("EventType", eventType) :
                new ObjectParameter("EventType", typeof(string));
    
            var eventSequenceParameter = eventSequence.HasValue ?
                new ObjectParameter("EventSequence", eventSequence) :
                new ObjectParameter("EventSequence", typeof(decimal));
    
            var eventOccurrenceParameter = eventOccurrence.HasValue ?
                new ObjectParameter("EventOccurrence", eventOccurrence) :
                new ObjectParameter("EventOccurrence", typeof(decimal));
    
            var eventCodeParameter = eventCode.HasValue ?
                new ObjectParameter("EventCode", eventCode) :
                new ObjectParameter("EventCode", typeof(int));
    
            var eventDetailCodeParameter = eventDetailCode.HasValue ?
                new ObjectParameter("EventDetailCode", eventDetailCode) :
                new ObjectParameter("EventDetailCode", typeof(int));
    
            var messageParameter = message != null ?
                new ObjectParameter("Message", message) :
                new ObjectParameter("Message", typeof(string));
    
            var applicationPathParameter = applicationPath != null ?
                new ObjectParameter("ApplicationPath", applicationPath) :
                new ObjectParameter("ApplicationPath", typeof(string));
    
            var applicationVirtualPathParameter = applicationVirtualPath != null ?
                new ObjectParameter("ApplicationVirtualPath", applicationVirtualPath) :
                new ObjectParameter("ApplicationVirtualPath", typeof(string));
    
            var machineNameParameter = machineName != null ?
                new ObjectParameter("MachineName", machineName) :
                new ObjectParameter("MachineName", typeof(string));
    
            var requestUrlParameter = requestUrl != null ?
                new ObjectParameter("RequestUrl", requestUrl) :
                new ObjectParameter("RequestUrl", typeof(string));
    
            var exceptionTypeParameter = exceptionType != null ?
                new ObjectParameter("ExceptionType", exceptionType) :
                new ObjectParameter("ExceptionType", typeof(string));
    
            var detailsParameter = details != null ?
                new ObjectParameter("Details", details) :
                new ObjectParameter("Details", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("aspnet_WebEvent_LogEvent", eventIdParameter, eventTimeUtcParameter, eventTimeParameter, eventTypeParameter, eventSequenceParameter, eventOccurrenceParameter, eventCodeParameter, eventDetailCodeParameter, messageParameter, applicationPathParameter, applicationVirtualPathParameter, machineNameParameter, requestUrlParameter, exceptionTypeParameter, detailsParameter);
        }
    
        public virtual ObjectResult<string> ELMAH_GetErrorsXml(string application, Nullable<int> pageIndex, Nullable<int> pageSize, ObjectParameter totalCount)
        {
            var applicationParameter = application != null ?
                new ObjectParameter("Application", application) :
                new ObjectParameter("Application", typeof(string));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("ELMAH_GetErrorsXml", applicationParameter, pageIndexParameter, pageSizeParameter, totalCount);
        }
    
        public virtual ObjectResult<string> ELMAH_GetErrorXml(string application, Nullable<System.Guid> errorId)
        {
            var applicationParameter = application != null ?
                new ObjectParameter("Application", application) :
                new ObjectParameter("Application", typeof(string));
    
            var errorIdParameter = errorId.HasValue ?
                new ObjectParameter("ErrorId", errorId) :
                new ObjectParameter("ErrorId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("ELMAH_GetErrorXml", applicationParameter, errorIdParameter);
        }
    
        public virtual int ELMAH_LogError(Nullable<System.Guid> errorId, string application, string host, string type, string source, string message, string user, string allXml, Nullable<int> statusCode, Nullable<System.DateTime> timeUtc)
        {
            var errorIdParameter = errorId.HasValue ?
                new ObjectParameter("ErrorId", errorId) :
                new ObjectParameter("ErrorId", typeof(System.Guid));
    
            var applicationParameter = application != null ?
                new ObjectParameter("Application", application) :
                new ObjectParameter("Application", typeof(string));
    
            var hostParameter = host != null ?
                new ObjectParameter("Host", host) :
                new ObjectParameter("Host", typeof(string));
    
            var typeParameter = type != null ?
                new ObjectParameter("Type", type) :
                new ObjectParameter("Type", typeof(string));
    
            var sourceParameter = source != null ?
                new ObjectParameter("Source", source) :
                new ObjectParameter("Source", typeof(string));
    
            var messageParameter = message != null ?
                new ObjectParameter("Message", message) :
                new ObjectParameter("Message", typeof(string));
    
            var userParameter = user != null ?
                new ObjectParameter("User", user) :
                new ObjectParameter("User", typeof(string));
    
            var allXmlParameter = allXml != null ?
                new ObjectParameter("AllXml", allXml) :
                new ObjectParameter("AllXml", typeof(string));
    
            var statusCodeParameter = statusCode.HasValue ?
                new ObjectParameter("StatusCode", statusCode) :
                new ObjectParameter("StatusCode", typeof(int));
    
            var timeUtcParameter = timeUtc.HasValue ?
                new ObjectParameter("TimeUtc", timeUtc) :
                new ObjectParameter("TimeUtc", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ELMAH_LogError", errorIdParameter, applicationParameter, hostParameter, typeParameter, sourceParameter, messageParameter, userParameter, allXmlParameter, statusCodeParameter, timeUtcParameter);
        }
    }
}
