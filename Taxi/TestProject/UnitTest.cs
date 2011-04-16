using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BLL;
using DAL;

namespace TestProject
{
    [TestClass]
    public class UnitTest
    {
        [TestMethod]
        public void TestMethodGetAllTaxiDrivers()
        {
            List<TaxiDriver> l = Repository.GetAllTaxiDrivers();

            Assert.IsNotNull( l.First() );
            Assert.IsTrue(l.First() is TaxiDriver);
            
        }

        [TestMethod]
        public void TestMethodAddTaviDriver()
        {
            Repository.AddNewTaxiDriver("jan", "grzegrzolka", "yasio", "yasio1");     
        }

        [TestMethod]
        public void TestMethodAuthUser()
        {


            int x1 = Repository.UserAuth("admin", "yasio1");
            Assert.IsTrue(x1 > 0);

            int x2 = Repository.UserAuth("admin", "yasio11");
            Assert.IsTrue(x2 == -2);


            Employee e = Repository.GetUserById(x1);
            Assert.IsTrue(e.employee_type_id == 3);

        }


    }
}
