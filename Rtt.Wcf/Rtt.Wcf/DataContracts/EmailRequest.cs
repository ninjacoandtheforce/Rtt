using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Rtt.Wcf.DataContracts
{
    [DataContract(Namespace = "Rtt.Wcf.DataContracts", Name = "EmailRequest")]
    [KnownType(typeof(EmailRequest))]
    public class EmailRequest 
    {
        [DataMember]
        public string Subject { get; set; }
        [DataMember]
        public string Body { get; set; }
        [DataMember]
        public List<string> ToRecipients { get; set; } = new List<string>();
        [DataMember]
        public List<string> CcRecipients { get; set; } = new List<string>();
        [DataMember]
        public List<string> BccRecipients { get; set; } = new List<string>();
        //todo: what about more than one attachment?
        [DataMember]
        public bool HasAttachment { get; set; }
        [DataMember]
        public List<string> Attachments { get; set; } = new List<string>();
        [DataMember]
        public bool ShouldSend { get; set; }
        [DataMember]
        public bool SendReadReceipt { get; set; }
    }
}