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
using Dapper;
using Microsoft.Extensions.Configuration;

namespace Rtt.Dal.Repositories
{
    public class ContactRepository : IContactRepository
    {
        private readonly IConfiguration _configuration;
        public ContactRepository(IConfiguration configuration)
        {
            this._configuration = configuration;
        }
        public async Task<int> AddAsync(ContactDto entity)
        {
            entity.AddedOn = DateTime.Now;
            var sql = "Insert into Contacts (TITLE,FIRST_NAME,INITIALS,LAST_NAME,EMAIL,TELH,TELW,MOBILE,POSTAL_ADDRESS_1,POSTAL_ADDRESS_2,POSTAL_SUBURB,POSTAL_CODE,STREET_ADDRESS_1,STREET_ADDRESS_2,SUBURB,CITY,STATE,STREET_CODE,COUNTRY,AddedOn) VALUES (@TITLE,@FIRST_NAME,@INITIALS,@LAST_NAME,@EMAIL,@TELH,@TELW,@MOBILE,@POSTAL_ADDRESS_1,@POSTAL_ADDRESS_2,@POSTAL_SUBURB,@POSTAL_CODE,@STREET_ADDRESS_1,@STREET_ADDRESS_2,@SUBURB,@CITY,@STATE,@STREET_CODE,@COUNTRY,@AddedOn)";
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnectionString")))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(sql, entity);
                return result;
            }
        }
        public async Task<int> DeleteAsync(int id)
        {
            var sql = "DELETE FROM Contacts WHERE ID = @Id";
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnectionString")))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(sql, new { Id = id });
                return result;
            }
        }
        public async Task<IReadOnlyList<ContactDto>> GetAllAsync()
        {
            var sql = "SELECT * FROM Contacts";
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnectionString")))
            {
                connection.Open();
                var result = await connection.QueryAsync<ContactDto>(sql);
                return result.ToList();
            }
        }
        public async Task<ContactDto> GetByIdAsync(int id)
        {
            var sql = "SELECT * FROM Contacts WHERE ID = @Id";
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnectionString")))
            {
                connection.Open();
                var result = await connection.QuerySingleOrDefaultAsync<ContactDto>(sql, new { Id = id });
                return result;
            }
        }
        public async Task<int> UpdateAsync(ContactDto entity)
        {
            entity.ModifiedOn = DateTime.Now;
            var sql = "UPDATE Contacts SET TITLE = @TITLE,FIRST_NAME = @FIRST_NAME,INITIALS = @INITIALS,LAST_NAME=@LAST_NAME,EMAIL=@EMAIL,TELH=@TELH,TELW=@TELW,MOBILE=@MOBILE,POSTAL_ADDRESS_1=@POSTAL_ADDRESS_1,POSTAL_ADDRESS_2=@POSTAL_ADDRESS_2,POSTAL_SUBURB=@POSTAL_SUBURB,POSTAL_CODE=@POSTAL_CODE,STREET_ADDRESS_1=@STREET_ADDRESS_1,STREET_ADDRESS_2=@STREET_ADDRESS_2,SUBURB=@SUBURB,CITY=@CITY,STATE=@STATE,STREET_CODE=@STREET_CODE,COUNTRY=@COUNTRY, ModifiedOn = @ModifiedOn WHERE ID = @Id";
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnectionString")))
            {
                connection.Open();
                var result = await connection.ExecuteAsync(sql, entity);
                return result;
            }
        }
    }
}
