using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using Rtt.Web.Attributes;

namespace Rtt.Web.Enums
{
    [Help(@"string contactAction = ContactActionsEnum.Description();"), DataContract(Namespace = "Rtt.Web.Enums", Name = "ErrorsEnum")]
    public enum ErrorsEnum
    {
        #region Errors
        [Description("Exception Thrown."), FriendlyErrorMessage("An exception was encountered during this request. The Error has been logged and forwarded to the developers for attention."), EnumMember(Value = "ExceptionEncountered")]
        ExceptionEncountered = 6,
        [Description("Problem Saving Data Object"), FriendlyErrorMessage("The system could not update the object in the database."), EnumMember(Value = "ProblemSavingDataObject")]
        ProblemSavingDataObject = 28,
        [Description("Cannot Connect To Remote Server"), FriendlyErrorMessage("Cannot Connect To Remote Server."), EnumMember(Value = "CannotConnectToRemoteServer")]
        CannotConnectToRemoteServer = 77,
        [Description("Unspecified Error Occurred."), FriendlyErrorMessage("Unspecified Error Occurred."), EnumMember(Value = "UnspecifiedErrorOccurred")]
        UnspecifiedErrorOccurred = 78,
        #endregion


        #region Contacts
        [Description("The contact already exists"), FriendlyErrorMessage("A contact already exists for Id for this dealer."), EnumMember(Value = "ContactAlreadyExistsForId")]
        ContactAlreadyExistsForId = 40,
        [Description("A contact already exists for Mobile"), FriendlyErrorMessage("A contact already exists with this mobile number for this dealer."), EnumMember(Value = "ContactAlreadyExistsForMobile")]
        ContactAlreadyExistsForMobile = 41,
        [Description("A problem occurred while creating a Contact for this Lead"), FriendlyErrorMessage("A problem occurred while creating a Contact for this Lead."), EnumMember(Value = "CouldNotConvertLeadToContact")]
        CouldNotConvertLeadToContact = 42,
        [Description("A problem occurred while linking the contact to the user"), FriendlyErrorMessage("The contact has been created. However, a problem occurred while linking the contact to the user."), EnumMember(Value = "CouldNotCreateContactUser")]
        CouldNotCreateContactUser = 43,
        #endregion

       
        #region Email
        [Description("HasHostedExchangeYN Param Missing"), FriendlyErrorMessage("HasHostedExchangeYN parameter is missing in database."), EnumMember(Value = "HasHostedExchangeYnParamMissing")]
        HasHostedExchangeYnParamMissing = 57,
        [Description("Smtp Url Param Missing"), FriendlyErrorMessage("SMTP Host Name parameter is missing in database."), EnumMember(Value = "SmtpUrlParamMissing")]
        SmtpUrlParamMissing = 58,
        [Description("Smtp Port Param Missing"), FriendlyErrorMessage("SMTP Port parameter is missing in database."), EnumMember(Value = "SmtpPortParamMissing")]
        SmtpPortParamMissing = 59,
        #endregion

        

        


        
    }
}