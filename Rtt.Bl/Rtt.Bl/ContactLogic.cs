using Rtt.Bl.Interfaces;
using Rtt.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Rtt.Dal.Interfaces;

namespace Rtt.Bl
{
    public class ContactLogic : ICrud<ContactDto>
    {
        private readonly IUnitOfWork _unitOfWork;
        public ContactLogic(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }


        public async Task<int?> CreateAsync(ContactDto item)
        {
            try
            {
                return await _unitOfWork.Contacts.AddAsync(item);                
            }
            catch (SqlException dbx)
            {
                ErrorHandler.ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.ErrorHandler.LogException(ex);
                return null;
            }
        }

        public async Task<int?> DeleteAsync(int id)
        {
            try
            {
                return await _unitOfWork.Contacts.DeleteAsync(id);
            }
            catch (SqlException dbx)
            {
                ErrorHandler.ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.ErrorHandler.LogException(ex);
                return null;
            }
        }

        public async Task<int?> UpdateAsync(ContactDto item)
        {
            try
            {
                return await _unitOfWork.Contacts.UpdateAsync(item);
            }
            catch (SqlException dbx)
            {
                ErrorHandler.ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.ErrorHandler.LogException(ex);
                return null;
            }
        }

        public async Task<IQueryable<ContactDto>> GetAllAsync()
        {
            try
            {
                var results = await _unitOfWork.Contacts.GetAllAsync();
                return results?.AsQueryable();
            }
            catch (SqlException dbx)
            {
                ErrorHandler.ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.ErrorHandler.LogException(ex);
                return null;
            }

        }

        public async Task<ContactDto> GetByIdAsync(int id)
        {
            try
            {
                return await _unitOfWork.Contacts.GetByIdAsync(id);
            }
            catch (SqlException dbx)
            {
                ErrorHandler.ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.ErrorHandler.LogException(ex);
                return null;
            }
        }

        public Task<ContactDto> SearchFirstAsync(Expression<Func<ContactDto, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public Task<List<ContactDto>> SearchForAsync(Expression<Func<ContactDto, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        
    }
}
