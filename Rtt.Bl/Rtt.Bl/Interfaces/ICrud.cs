using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Bl.Interfaces
{
    public interface ICrud<TDto>
    {
        TDto Create(TDto item);
        TDto Delete(TDto item);
        TDto Update(TDto item);
        IQueryable<TDto> GetAll();
        TDto GetById(int id);
        TDto SearchFirst(Expression<Func<TDto, bool>> predicate);
        List<TDto> SearchFor(Expression<Func<TDto, bool>> predicate);
        TDto MapToDto(string model);
    }
}
