using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rtt.Dal.Interfaces;

namespace Rtt.Dal
{
    public class UnitOfWork : IUnitOfWork
    {
        public UnitOfWork(IContactRepository contactRepository)
        {
            Contacts = contactRepository;
        }
        public IContactRepository Contacts { get; }
    }
}
