using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;

namespace Rtt.Wcf.Interfaces
{
    [ServiceContract(Namespace = "Rtt.Wcf")]
    public interface IBaseService<T>
    {
        [OperationContract]
        T Create(T item);

        [OperationContract]
        T Delete(T item);

        [OperationContract]
        T Update(T item);

        [OperationContract]
        List<T> GetAll();

        [OperationContract]
        T GetById(int id);

    }
}