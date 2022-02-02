using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Dal.Interfaces
{
    public interface IRepository<T>
    {
        //T Add(T tDto);
        //T Remove(T tDto);
        //T Update(object key, T tDto);
        //IQueryable<T> GetAll();
        //T Get(object key);
        //T SearchFirst(Expression<Func<T, bool>> predicate);
        //IQueryable<T> SearchFor(Expression<Func<T, bool>> predicate);
        Task<T> GetAsync(string querystring, SqlParameter[] sqlParameters = null);
        Task<List<T>> GetAllAsync(string querystring, SqlParameter[] sqlParameters);
        Task<T> AddAsync(string querystring, SqlParameter[] sqlParameters = null);
        Task<T> RemoveAsync(string querystring, SqlParameter[] sqlParameters = null);
    }
}
