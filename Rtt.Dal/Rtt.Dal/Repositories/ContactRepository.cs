using Rtt.Dal.Interfaces;
using Rtt.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.Dal.Repositories
{
    public class ContactRepository : IRepository<ContactDto>
    {
        public ContactDto Add(ContactDto tDto)
        {
            string _connStr = ConfigurationManager.GetConnectionString();
            string _query = "INSERT INTO [Contacts] (Firstname,Lastname,Email,Pass,Type) values (@first,@last,@email,@pass,@type)";
            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@first", txtfirst.Text);
                    comm.Parameters.AddWithValue("@last", txtlast.Text);
                    comm.Parameters.AddWithValue("@email", txtemail.Text);
                    comm.Parameters.AddWithValue("@pass", txtpass.Text);
                    comm.Parameters.AddWithValue("@type", "customer");
                    try
                    {
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        // other codes here
                        // do something with the exception
                        // don't swallow it.
                    }
                }
            }
        }

        public ContactDto Get(object key)
        {
            throw new NotImplementedException();
        }

        public IQueryable<ContactDto> GetAll()
        {
            throw new NotImplementedException();
        }

        public ContactDto Remove(ContactDto tDto)
        {
            throw new NotImplementedException();
        }

        public ContactDto SearchFirst(System.Linq.Expressions.Expression<Func<ContactDto, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public IQueryable<ContactDto> SearchFor(System.Linq.Expressions.Expression<Func<ContactDto, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public ContactDto Update(object key, ContactDto tDto)
        {
            throw new NotImplementedException();
        }
    }
}
