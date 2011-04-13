using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Security.Cryptography;

namespace BLL
{
    public class Repository
    {
        /// <summary>
        /// Funkcja zwraca Listę Typów użytkownika
        /// </summary>
        /// <returns>List of Employee_type</returns>
        public static List<Employee_type> GetAllEmployeeTypes()
        {
            //get data context
            TaxiDataClassesDataContext dc = new TaxiDataClassesDataContext();

            var x = from i
                    in dc.Employee_types
                    select i;

            return x.ToList();
        }

        /// <summary>
        /// Funkcja autoryzujące użytkownika
        /// funkcja zwraca userId
        /// 
        /// ret -1 => brak uzytkownika o podanym loginie
        /// ret -2=> zle haslo
        /// </summary>
        /// <param name="login"></param>
        /// <param name="pswd"></param>
        /// <returns></returns>
        public static int UserAuth(string login, string pswd)
        {

            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            var query = from u in ctx.Employees
                        where u.login == login
                        select u;

            Employee user = query.SingleOrDefault();

            if (user == null) return -1;

            ASCIIEncoding ascii = new ASCIIEncoding();
            SHA1 sha = new SHA1CryptoServiceProvider();

            String pswdSalt = pswd + user.salt;

            byte[] passwordHash = sha.ComputeHash(ascii.GetBytes(pswdSalt));
            string password = Convert.ToBase64String(passwordHash);

            if (user.password != password) return -2;

            return user.id;
        }

        /// <summary>
        /// Funkcja zwraca listę wszystkich taksówkarz
        /// </summary>
        /// <returns></returns>
        public static List<TaxiDriver> GetAllTaxiDrivers()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var query = from c in ctx.Employees.OfType<TaxiDriver>() select c;
            return query.ToList();
        }

    }
}
