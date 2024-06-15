using Fruit_Storage.Controllers;
using Fruit_Storage.Models;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Fruit_Storage
{
    public partial class Form1 : Form
    {
        private string connString = @"Server=(localdb)\MSSQLLocalDB;Database=Fruit_Storage.FruitsContext;Integrated Security=true";
        private FruitLogic fruitController;
        private FruitTypeLogic fruitTypeController;

        public Form1()
        {
            InitializeComponent();
            fruitController = new FruitLogic(connString);
            fruitTypeController = new FruitTypeLogic(connString);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadData();
            LoadFruitTypes();
        }

        private void LoadData()
        {
            try
            {
                DataTable fruits = fruitController.GetFruits();

                foreach (DataRow row in fruits.Rows)
                {
                    row["Price"] = string.Format("{0:F2}", row["Price"]);
                }

                dataGridView1.DataSource = fruits;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Проблем с базата данни: " + ex.Message);
            }
        }

        private void LoadFruitTypes()
        {
            try
            {
                comboBox1.DataSource = fruitTypeController.GetFruitTypes();
                comboBox1.DisplayMember = "Name";
                comboBox1.ValueMember = "Id";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Проблем с базата данни: " + ex.Message);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text;
            string description = textBox2.Text;
            float price;
            int typeId;

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(description) ||
                !float.TryParse(textBox3.Text, out price) || comboBox1.SelectedValue == null ||
                !int.TryParse(comboBox1.SelectedValue.ToString(), out typeId))
            {
                MessageBox.Show("Невалиден вход");
                return;
            }

            try
            {
                var fruit = new Fruit
                {
                    Name = name,
                    Description = description,
                    Price = price,
                    FruitTypeId = typeId
                };

                fruitController.AddFruit(fruit);
                LoadData();
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                comboBox1.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Проблем с вкарването на запис: " + ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentCell == null)
            {
                MessageBox.Show("Избери ред");
                return;
            }

            int index = dataGridView1.CurrentCell.RowIndex;
            if (index < 0)
            {
                MessageBox.Show("Невалиден ред");
                return;
            }

            DataGridViewRow selectedRow = dataGridView1.Rows[index];
            var idCell = selectedRow.Cells["Id"];

            if (idCell == null || idCell.Value == DBNull.Value)
            {
                MessageBox.Show("Невалиден Primary key");
                return;
            }

            int id = Convert.ToInt32(idCell.Value);

            string name = string.IsNullOrWhiteSpace(textBox1.Text) ? selectedRow.Cells["Name"].Value.ToString() : textBox1.Text;
            string description = string.IsNullOrWhiteSpace(textBox2.Text) ? selectedRow.Cells["Description"].Value.ToString() : textBox2.Text;
            float price;
            if (!float.TryParse(textBox3.Text, out price))
            {
                price = Convert.ToSingle(selectedRow.Cells["Price"].Value);
            }
            int typeId;
            if (comboBox1.SelectedValue == null || !int.TryParse(comboBox1.SelectedValue.ToString(), out typeId))
            {
                typeId = Convert.ToInt32(selectedRow.Cells["FruitTypeId"].Value);
            }

            try
            {
                var fruit = new Fruit
                {
                    Id = id,
                    Name = name,
                    Description = description,
                    Price = price,
                    FruitTypeId = typeId
                };

                fruitController.UpdateFruit(fruit);
                LoadData();
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                comboBox1.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Проблем с обновяването на записа: " + ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentCell == null)
            {
                MessageBox.Show("Избери ред");
                return;
            }

            int index = dataGridView1.CurrentCell.RowIndex;
            if (index < 0)
            {
                MessageBox.Show("Невалиден ред");
                return;
            }

            DataGridViewRow selectedRow = dataGridView1.Rows[index];
            var idCell = selectedRow.Cells["Id"];

            if (idCell == null || idCell.Value == DBNull.Value)
            {
                MessageBox.Show("Невалиден Primary key");
                return;
            }

            int id = Convert.ToInt32(idCell.Value);

            try
            {
                fruitController.DeleteFruit(id);
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Проблем с изтриването на записа: " + ex.Message);
            }
        }
    }
}