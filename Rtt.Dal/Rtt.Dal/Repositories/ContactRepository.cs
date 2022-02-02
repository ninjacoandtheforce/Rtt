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
    public class ContactRepository : Repository<ContactDto>
    {
         
        




















        public ContactDto Add(ContactDto tDto)
        {
            string _connStr = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            string _query = "INSERT INTO [Contacts] (TITLE,FIRST_NAME,INITIALS,LAST_NAME,EMAIL,TELH,TELW,MOBILE,POSTAL_ADDRESS_1,POSTAL_ADDRESS_2,POSTAL_SUBURB,POSTAL_CODE,STREET_ADDRESS_1"+
",STREET_ADDRESS_2,SUBURB,CITY,STATE,STREET_CODE,COUNTRY) values (@TITLE,@FIRST_NAME,@INITIALS,@LAST_NAME,@EMAIL,@TELH,@TELW,@MOBILE,@POSTAL_ADDRESS_1,@POSTAL_ADDRESS_2,@POSTAL_SUBURB"+
",@POSTAL_CODE,@STREET_ADDRESS_1,@STREET_ADDRESS_2,@SUBURB,@CITY,@STATE,@STREET_CODE,@COUNTRY)";
            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@first", tDto.FIRST_NAME);
                    comm.Parameters.AddWithValue("@TITLE", tDto.TITLE);
                    comm.Parameters.AddWithValue("@FIRST_NAME", tDto.FIRST_NAME);
                    comm.Parameters.AddWithValue("@INITIALS", tDto.INITIALS);
                    comm.Parameters.AddWithValue("@LAST_NAME", tDto.LAST_NAME);
                    comm.Parameters.AddWithValue("@EMAIL", tDto.EMAIL);
                    comm.Parameters.AddWithValue("@TELH", tDto.TELH);
                    comm.Parameters.AddWithValue("@TELW", tDto.TELW);
                    comm.Parameters.AddWithValue("@MOBILE", tDto.MOBILE);
                    comm.Parameters.AddWithValue("@POSTAL_ADDRESS_1", tDto.POSTAL_ADDRESS_1);
                    comm.Parameters.AddWithValue("@POSTAL_ADDRESS_2", tDto.POSTAL_ADDRESS_2);
                    comm.Parameters.AddWithValue("@POSTAL_SUBURB", tDto.POSTAL_SUBURB);
                    comm.Parameters.AddWithValue("@POSTAL_CODE", tDto.POSTAL_CODE);
                    comm.Parameters.AddWithValue("@STREET_ADDRESS_1", tDto.STREET_ADDRESS_1);
                    comm.Parameters.AddWithValue("@STREET_ADDRESS_2", tDto.STREET_ADDRESS_2);
                    comm.Parameters.AddWithValue("@SUBURB", tDto.SUBURB);
                    comm.Parameters.AddWithValue("@CITY", tDto.CITY);
                    comm.Parameters.AddWithValue("@STATE", tDto.STATE);
                    comm.Parameters.AddWithValue("@STREET_CODE", tDto.STREET_CODE);
                    comm.Parameters.AddWithValue("@COUNTRY", tDto.COUNTRY);
                        
                    conn.Open();
                    comm.ExecuteNonQuery();
                    return tDto;
                    
                }
            }
        }

        public ContactDto Get(object key)
        {
            
            string _query = "SELECT TITLE,FIRST_NAME,INITIALS,LAST_NAME,EMAIL,TELH,TELW,MOBILE,POSTAL_ADDRESS_1,POSTAL_ADDRESS_2,POSTAL_SUBURB,POSTAL_CODE,STREET_ADDRESS_1,ID" +
",STREET_ADDRESS_2,SUBURB,CITY,STATE,STREET_CODE,COUNTRY FROM [Contacts] where ID = @ID";
            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@ID", key);

                    conn.Open();
                    SqlDataReader reader = comm.ExecuteReader();
                    ContactDto contact = new ContactDto();
                    while (reader.Read())
                    {
                        contact.TITLE = reader.GetString(0);
                        contact.FIRST_NAME = reader.GetString(1);
                        contact.INITIALS = reader.GetString(2);
                        contact.LAST_NAME = reader.GetString(3);
                        contact.EMAIL = reader.GetString(4);
                        contact.TELH = reader.GetString(5);
                        contact.TELW = reader.GetString(6);
                        contact.MOBILE = reader.GetString(7);
                        contact.POSTAL_ADDRESS_1 = reader.GetString(8);
                        contact.POSTAL_ADDRESS_2 = reader.GetString(9);
                        contact.POSTAL_SUBURB = reader.GetString(10);
                        contact.POSTAL_CODE = reader.GetString(11);
                        contact.STREET_ADDRESS_1 = reader.GetString(12);
                        contact.ID = reader.GetInt32(13);
                    }

                    return contact;

                }
            }
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
            string _connStr = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            string _query = "update [Contacts] set (TITLE=@TITLE,FIRST_NAME=@FIRST_NAME,INITIALS=@INITIALS,LAST_NAME=@LAST_NAME,EMAIL=@EMAIL,TELH=@TELH,TELW=@TELW,MOBILE=@MOBILE,POSTAL_ADDRESS_1=@POSTAL_ADDRESS_1,POSTAL_ADDRESS_2=@POSTAL_ADDRESS_2,POSTAL_SUBURB=@POSTAL_SUBURB" +
",POSTAL_CODE=@POSTAL_CODE,STREET_ADDRESS_1=@STREET_ADDRESS_1,STREET_ADDRESS_2=@STREET_ADDRESS_2,SUBURB=@SUBURB,CITY=@CITY,STATE=@STATE,STREET_CODE=@STREET_CODE,COUNTRY=@COUNTRY) where ID = @ID";
            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@first", tDto.FIRST_NAME);
                    comm.Parameters.AddWithValue("@TITLE", tDto.TITLE);
                    comm.Parameters.AddWithValue("@FIRST_NAME", tDto.FIRST_NAME);
                    comm.Parameters.AddWithValue("@INITIALS", tDto.INITIALS);
                    comm.Parameters.AddWithValue("@LAST_NAME", tDto.LAST_NAME);
                    comm.Parameters.AddWithValue("@EMAIL", tDto.EMAIL);
                    comm.Parameters.AddWithValue("@TELH", tDto.TELH);
                    comm.Parameters.AddWithValue("@TELW", tDto.TELW);
                    comm.Parameters.AddWithValue("@MOBILE", tDto.MOBILE);
                    comm.Parameters.AddWithValue("@POSTAL_ADDRESS_1", tDto.POSTAL_ADDRESS_1);
                    comm.Parameters.AddWithValue("@POSTAL_ADDRESS_2", tDto.POSTAL_ADDRESS_2);
                    comm.Parameters.AddWithValue("@POSTAL_SUBURB", tDto.POSTAL_SUBURB);
                    comm.Parameters.AddWithValue("@POSTAL_CODE", tDto.POSTAL_CODE);
                    comm.Parameters.AddWithValue("@STREET_ADDRESS_1", tDto.STREET_ADDRESS_1);
                    comm.Parameters.AddWithValue("@STREET_ADDRESS_2", tDto.STREET_ADDRESS_2);
                    comm.Parameters.AddWithValue("@SUBURB", tDto.SUBURB);
                    comm.Parameters.AddWithValue("@CITY", tDto.CITY);
                    comm.Parameters.AddWithValue("@STATE", tDto.STATE);
                    comm.Parameters.AddWithValue("@STREET_CODE", tDto.STREET_CODE);
                    comm.Parameters.AddWithValue("@COUNTRY", tDto.COUNTRY);
                    comm.Parameters.AddWithValue("@ID", tDto.ID);

                    conn.Open();
                    comm.ExecuteNonQuery();
                    return tDto;

                }
            }
        }

        
    }
}
