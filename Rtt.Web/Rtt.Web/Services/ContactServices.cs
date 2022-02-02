using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Rtt.Models;
using Rtt.Wcf;
using Rtt.Web.Utilities;

namespace Rtt.Web.Services
{
    public static class ContactServices
    {
        private static WcfProxy Proxy { get; } = new WcfProxy();

        public static ContactDto GetById(int id)
        {
            return Proxy.PerformRemote<IContactService, ContactDto>(x => x.GetById(id));
        }

        public static ContactDto CreateOrUpdate(ContactDto item)
        {
            return item.ID == 0
                ? Proxy.PerformRemote<IContactService, ContactDto>(x => x.Create(item))
                : Proxy.PerformRemote<IContactService, ContactDto>(x => x.Update(item));
        }

        public static List<ContactDto> GetAll()
        {
            return Proxy.PerformRemote<IContactService, List<ContactDto>>(x => x.GetAll());
        }

        public static ContactDto Delete(ContactDto item)
        {
            return Proxy.PerformRemote<IContactService, ContactDto>(x => x.Delete(item));
        }
    }
}