using Rtt.Models;
using Rtt.Wcf.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Rtt.Wcf
{
    [ServiceContract(Namespace = "Rtt.Wcf", Name = "ContactService", SessionMode = SessionMode.NotAllowed)]
    [ServiceKnownType(typeof(ContactDto))]
    public interface IContactService : IBaseService<ContactDto>
    {

        
    }


    
}
