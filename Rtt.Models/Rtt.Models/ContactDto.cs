using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Models
{
    [Serializable]
    [DataContract(Namespace = "Rtt.Models.Dto", Name = "ContactDto")]
    [KnownType(typeof(ContactDto))]
    public class ContactDto
    {
        
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string TITLE { get; set; }
        [DataMember]
        public string FIRST_NAME { get; set; }
        [DataMember]
        public string INITIALS { get; set; }
        [DataMember]
        public string LAST_NAME { get; set; }
        [DataMember]
        public string EMAIL { get; set; }
        [DataMember]
        public string TELH { get; set; }
        [DataMember]
        public string TELW { get; set; }
        [DataMember]
        public string MOBILE { get; set; }
        [DataMember]
        public string POSTAL_ADDRESS_1 { get; set; }
        [DataMember]
        public string POSTAL_ADDRESS_2 { get; set; }
        [DataMember]
        public string POSTAL_SUBURB { get; set; }
        [DataMember]
        public string POSTAL_CODE { get; set; }
        [DataMember]
        public string STREET_ADDRESS_1 { get; set; }
        [DataMember]
        public string STREET_ADDRESS_2 { get; set; }
        [DataMember]
        public string SUBURB { get; set; }
        [DataMember]
        public string CITY { get; set; }
        [DataMember]
        public string STATE { get; set; }
        [DataMember]
        public string STREET_CODE { get; set; }
        [DataMember]
        public string COUNTRY { get; set; }
        [DataMember]
        public DateTime AddedOn { get; set; }
        [DataMember]
        public DateTime ModifiedOn { get; set; }

        ////BCC/ BEGIN CUSTOM CODE SECTION
        [DataMember]
        public string FullName
        {
            get { return $@"{TITLE} {LAST_NAME}, {FIRST_NAME}"; }
            protected set { }
        }

        


        ////ECC/ END CUSTOM CODE SECTION 

    }
}
