using Rtt.Bl.Interfaces;
using Rtt.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Bl
{
    public class ContactLogic : ICrud<ContactDto>
    {
        public Repository<ContactDto> Repository { get; } = new Repository<ContactDto>();

        public ContactDto Create(ContactDto item)
        {
            try
            {
                return Repository.Add(item);                
            }
            catch (SqlException dbx)
            {
                ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.LogException(ex);
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
                ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.LogException(ex);
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
                ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.LogException(ex);
                return null;
            }
        }

        public IQueryable<ContactDto> GetAll()
        {
            try
            {
                var dtos = new List<ContactDto>();
                var models = Repository.GetAll();
                if (models.Any())
                {
                    dtos.AddRange(models.Select(model => MapModelToDto(model)));
                }
                return dtos.AsQueryable();
            }
            catch (SqlException dbx)
            {
                ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.LogException(ex);
                return null;
            }

        }

        public ContactDto GetById(int id)
        {
            try
            {
                var model = Repository.Get(id);
                return model != null ? MapModelToDto(model) : null;
            }
            catch (SqlException dbx)
            {
                ErrorHandler.LogException(dbx);
                return null;
            }
            catch (System.Exception ex)
            {
                ErrorHandler.LogException(ex);
                return null;
            }
        }
    }
}
