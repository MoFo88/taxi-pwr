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
            Repository.AddNewTaxiDriver("stefan", "posadzki", "stefanek", "stefan");     
        }

        [TestMethod]
        public void TestMethodAuthUser()
        {
            int x1 = Repository.UserAuth("stefan", "stefan");
            Assert.IsTrue(x1 > 0);
        }

        [TestMethod]
        public void TestMethodGetAllEmployees()
        {
            Repository.GetAllEmployees();
        }

        [TestMethod]
        public void TestMethodAddDispatcher()
        {
            Repository.AddNewDispatcher("jan", "grzegrzolka", "kup", "email", "1", "ulica", "aads", "45-08", "stefaneczek", "gruba ryba");
        }


        //[TestMethod]
        //public void TestMethodAddDispatcher()
        //{
        //    Repository.AddNewDispatcher("jan", "grzegrzolka", "kup", "email", "1", "ulica", "aads", "45-08", "stefaneczek", "gruba ryba");
        //}

        //[TestMethod]
        //public void TestMethodAddDispatcher()
        //{
        //    Repository.AddNewDispatcher("jan", "grzegrzolka", "kup", "email", "1", "ulica", "aads", "45-08", "stefaneczek", "gruba ryba");
        //}
    }
}
