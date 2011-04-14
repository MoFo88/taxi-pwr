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
        /// <summary>Funkcja zwraca Listę Typów użytkownika
        /// 
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

        /// <summary>Funkcja autoryzujące użytkownika
        /// 
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

        /// <summary> Funkcja zwraca listę wszystkich taksówkarz
        /// </summary>
        /// <returns></returns>
        public static List<TaxiDriver> GetAllTaxiDrivers()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var query = from c in ctx.Employees.OfType<TaxiDriver>() select c;
            return query.ToList();
        }         

        #region Losowy ciąg znaków o zadanej długości
        #endregion
        private static string CreateRandomString(int length)
        {

            Random random = new Random();
           
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] hash = md5.ComputeHash(Encoding.ASCII.GetBytes(random.Next().ToString()));
            string password = Convert.ToBase64String(hash).Substring(0, length);
            string newPass = "";
            
            // Uppercase at random 
            random = new Random();
            for (int i = 0; i < password.Length; i++)
            {
                if (random.Next(0, 2) == 1)
                    newPass += password.Substring(i, 1).ToUpper();
                else
                    newPass += password.Substring(i, 1);
            }
            return newPass;
        }

        /// <summary>Funkja dodająca taksówkarza
        /// ret -1 => uzytlownik o podanym loginie istnieje
        /// ret 0 => OK
        /// ret -2 => błąd przy dodawaniu do bazy
        /// </summary>
        /// <param name="name"></param>
        /// <param name="surname"></param>
        /// <param name="city"></param>
        /// <param name="email"></param>
        /// <param name="houseNr"></param>
        /// <param name="pesel"></param>
        /// <param name="licenceNr"></param>
        /// <param name="postalCode"></param>
        /// <param name="login"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static int AddNewTaxiDriver(String name, String surname, String city, String email, String houseNr, String pesel, String licenceNr, String postalCode, String login, String password)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            TaxiDriver td = new TaxiDriver();

            td.name = name;
            td.surname = surname;
            td.city = city;
            td.e_mail = email;
            td.house_nr = houseNr;
            td.licence_number = licenceNr;
            td.login = login;
            td.pesel = pesel;
            td.postal_code = postalCode;

            Employee check = ctx.Employees.SingleOrDefault(u => u.login == td.login);

            if (check != null)
            {
                return -1;
            }

            td.salt = CreateRandomString(8);

            ASCIIEncoding asci = new ASCIIEncoding();
            SHA1 sha1 = new SHA1CryptoServiceProvider();    

            String pwd;

            if (password != null)
            {
                pwd = Convert.ToBase64String(sha1.ComputeHash( asci.GetBytes(password + td.salt ) ));
            }
            else
            {
                string randomPwd = CreateRandomString(8);
                pwd = Convert.ToBase64String(sha1.ComputeHash(asci.GetBytes(randomPwd + td.salt)));
            }

            td.password = pwd;

            try
            {
                ctx.Employees.InsertOnSubmit(td);
                ctx.SubmitChanges();
            }
            catch(Exception ex)
            {
                return -2;
            }

            return 0;
        }
        public static int AddNewTaxiDriver(String name, String surname, String login, String password)
        {
            return AddNewTaxiDriver(name, surname, null, null, null, null, null, null, login, password);
        }

        public static List<Taxi> GetTaxiList()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from c in ctx.Taxis select c;
            return x.ToList();
        }
    }

    
}
