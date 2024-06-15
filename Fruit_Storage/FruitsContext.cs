using System;
using System.Collections.Generic;
using Fruit_Storage.Models;
using System.Data.Entity;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fruit_Storage
{
    public class FruitsContext : DbContext
    {
        public DbSet<Fruit> Fruits { get; set; }
        public DbSet<FruitType> FruitTypes { get; set; }
    }
}
