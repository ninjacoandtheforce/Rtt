using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Dal.Interfaces
{
    public interface IRepository<T> where T : class
    {
        T Add(T tDto);
        T Remove(T tDto);
        T Update(object key, T tDto);
        IQueryable<T> GetAll();
        T Get(object key);
        T SearchFirst(Expression<Func<T, bool>> predicate);
        IQueryable<T> SearchFor(Expression<Func<T, bool>> predicate);
    }
}
