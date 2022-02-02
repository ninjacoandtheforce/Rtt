using Rtt.Bl.Interfaces;
using Rtt.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Bl
{
    public class ContactLogic : ICrud<ContactDto>
    {
        public Rtt.Dal.Repositories.ContactRepository Repository { get; } = new Rtt.Dal.Repositories.ContactRepository();

        public ContactDto Create(ContactDto item)
        {
            try
            {
                return Repository.Add(item);                
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

        public ContactDto Delete(ContactDto item)
        {
            try
            {
                return Repository.Remove(item);
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

        public ContactDto Update(ContactDto item)
        {
            try
            {
                return Repository.Update(item.ID, item);
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

        public IQueryable<ContactDto> GetAll()
        {
            try
            {
                var dtos = new List<ContactDto>();
                var models = Repository.GetAll();
                //if (models.Any())
                //{
                //    dtos.AddRange(models.Select(model => MapModelToDto(model)));
                //}
                return models.AsQueryable();
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

        public ContactDto GetById(int id)
        {
            try
            {
                return Repository.Get(id);
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

        public ContactDto SearchFirst(Expression<Func<ContactDto, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public List<ContactDto> SearchFor(Expression<Func<ContactDto, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public ContactDto MapToDto(string model)
        {
            throw new NotImplementedException();
        }
    }
}
