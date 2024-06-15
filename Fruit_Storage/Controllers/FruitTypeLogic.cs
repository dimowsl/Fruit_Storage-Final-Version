using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fruit_Storage.Controllers
{
    public class FruitTypeLogic
    {
        private readonly string connString;

        public FruitTypeLogic(string connectionString)
        {
            connString = connectionString;
        }

        public DataTable GetFruitTypes()
        {
            string query = "SELECT Id, Name FROM FruitType";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }
    }
}
