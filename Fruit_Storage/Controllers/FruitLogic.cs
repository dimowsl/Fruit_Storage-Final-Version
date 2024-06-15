using Fruit_Storage.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fruit_Storage.Controllers
{
    public class FruitLogic
    {
        private readonly string connString;

        public FruitLogic(string connectionString)
        {
            connString = connectionString;
        }

        public DataTable GetFruits()
        {
            string query = "SELECT * FROM Fruit";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }

        public void AddFruit(Fruit fruit)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string insertQuery = "INSERT INTO Fruit (Name, Description, Price, FruitTypeId) VALUES (@Name, @Description, @Price, @FruitTypeId)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", fruit.Name);
                    cmd.Parameters.AddWithValue("@Description", fruit.Description);
                    cmd.Parameters.AddWithValue("@Price", fruit.Price);
                    cmd.Parameters.AddWithValue("@FruitTypeId", fruit.FruitTypeId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateFruit(Fruit fruit)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string updateQuery = "UPDATE Fruit SET Name = @Name, Description = @Description, Price = @Price, FruitTypeId = @FruitTypeId WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", fruit.Name);
                    cmd.Parameters.AddWithValue("@Description", fruit.Description);
                    cmd.Parameters.AddWithValue("@Price", fruit.Price);
                    cmd.Parameters.AddWithValue("@FruitTypeId", fruit.FruitTypeId);
                    cmd.Parameters.AddWithValue("@Id", fruit.Id);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void DeleteFruit(int fruitId)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string deleteQuery = "DELETE FROM Fruit WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", fruitId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
