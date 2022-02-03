using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Rtt.Models;

namespace Rtt.Bl.Interfaces
{
    public interface ICrud<TDto>
    {
        Task<int?> CreateAsync(TDto item);
        Task<int?> DeleteAsync(int id);
        Task<int?> UpdateAsync(TDto item);
        Task<IQueryable<TDto>> GetAllAsync();
        Task<ContactDto> GetByIdAsync(int id);
        Task<TDto> SearchFirstAsync(Expression<Func<TDto, bool>> predicate);
        Task<List<TDto>> SearchForAsync(Expression<Func<TDto, bool>> predicate);
    }
}
