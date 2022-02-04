using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Threading.Tasks;
using System.Web;

namespace Rtt.Wcf.Interfaces
{
    [ServiceContract(Namespace = "Rtt.Wcf")]
    public interface IBaseService<T>
    {
        [OperationContract]
        Task<int?> Create(T item);

        [OperationContract]
        Task<T> Delete(T item);

        [OperationContract]
        Task<int?> Update(T item);

        [OperationContract]
        Task<List<T>> GetAll();

        [OperationContract]
        Task<T> GetById(int id);

    }
}