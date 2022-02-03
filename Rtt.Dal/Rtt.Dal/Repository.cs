using Rtt.Dal.Interfaces;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FastMember;
using Rtt.Dal.Extensions;

namespace Rtt.Dal
{
    public class Repository<T> : IRepository<T> where T : class, new()
    {
        protected readonly string _connStr;

        protected Repository()
        {
            _connStr = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        }

        

        public async Task<T> GetAsync (string querystring, SqlParameter[] sqlParameters) 
        {
            using (var conn = new SqlConnection(_connStr))
            {
                var sqlCommand = await GetSqlCommandAsync(querystring, conn, sqlParameters);
                var dataReader = await sqlCommand.ExecuteReaderAsync(CommandBehavior.CloseConnection);

                if (dataReader.HasRows)
                {
                    var newObject = new T();

                    if (await dataReader.ReadAsync())
                    { dataReader.MapDataToObject(newObject); }

                    return newObject;
                }
                else
                { return null; }
            }
        }

        public async Task<List<T>> GetAllAsync(string querystring, SqlParameter[] sqlParameters = null) 
        {
            var newListObject = new List<T>();
            using (var conn = new SqlConnection(_connStr))
            {
                conn.Open();
                var sqlCommand = await GetSqlCommandAsync(querystring, conn, sqlParameters);
                using (var dataReader = await sqlCommand.ExecuteReaderAsync(CommandBehavior.Default))
                {
                    if (dataReader.HasRows)
                    {
                        while (await dataReader.ReadAsync())
                        {
                            var newObject = new T();
                            dataReader.MapDataToObject(newObject);
                            newListObject.Add(newObject);
                        }
                    }
                }
            }
            return newListObject;
        }

        private Task<SqlCommand> GetSqlCommandAsync(string querystring, SqlConnection conn, SqlParameter[] sqlParameters)
        {
            var command = new SqlCommand
            {
                Site = null,
                Connection = conn,
                NotificationAutoEnlist = false,
                Notification = null,
                Transaction = null,
                CommandText = querystring,
                CommandType = CommandType.Text,
                DesignTimeVisible = false,
                UpdatedRowSource = UpdateRowSource.None,
            };
            command.CommandTimeout = 0;
            command.Parameters.AddRange(sqlParameters);
            return Task.FromResult<SqlCommand>(command);
        }

        private Task<SqlCommand> CreateAddCommandAsync(string querystring, SqlConnection connection, SqlParameter[] sqlParameters)
        {
            var command = connection.CreateCommand();
            command.CommandText = querystring;
            command.Parameters.AddRange(sqlParameters);
            return Task.FromResult<SqlCommand>(command);

        }



        public async Task<T> AddAsync(string querystring, SqlParameter[] sqlParameters = null)
        {
            using (var conn = new SqlConnection(_connStr))
            {
                var sqlCommand = await CreateAddCommandAsync(querystring, conn, sqlParameters);
                var dataReader = await sqlCommand.ExecuteReaderAsync(CommandBehavior.CloseConnection);

                if (dataReader.HasRows)
                {
                    var newObject = new T();

                    if (await dataReader.ReadAsync())
                    { dataReader.MapDataToObject(newObject); }

                    return newObject;
                }
                else
                { return null; }
            }
        }

        public Task<T> RemoveAsync(string querystring, SqlParameter[] sqlParameters = null)
        {
            throw new NotImplementedException();
        }
    }
}
