using Rtt.Bl;
using Rtt.Models;
using Rtt.Wcf.Attributes;
using Rtt.Wcf.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Wcf
{
    [GlobalErrorBehavior(typeof(GlobalErrorHandler))]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]

    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    public class ContactService : IContactService
    {
        public ContactService()
        {
            Logic = new ContactLogic()
        }

        public ContactService(ContactLogic logic)
        {
            Logic = logic;
        }

        private ContactLogic Logic { get; }

        public async Task<int?> Create(ContactDto item)
        {
            return await Logic.CreateAsync(item);
        }

        public async Task<int?> Delete(int id)
        {
            return await Logic.DeleteAsync(id);
        }

        public async Task<int?> Update(ContactDto item)
        {
            return await Logic.UpdateAsync(item);
        }

        public async Task<List<ContactDto>> GetAll()
        {
            return await Logic.GetAllAsync();
        }

        public async Task<ContactDto> GetById(int id)
        {
            return await Logic.GetByIdAsync(id);
        }
    }
}
