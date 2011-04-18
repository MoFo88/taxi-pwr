﻿using System;
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

            if (user == null) throw new UserNotExistException();
            String pswdSalt = pswd + user.salt;
            String password = CalculateSHA1(pswdSalt, Encoding.ASCII);

            if (user.password != password) throw new WronPasswordException("Wrong password");

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

        public static string CalculateSHA1(string text, Encoding enc)
        {
            byte[] buffer = enc.GetBytes(text);
            SHA1CryptoServiceProvider cryptoTransformSHA1 = new SHA1CryptoServiceProvider();
            string hash = BitConverter.ToString(cryptoTransformSHA1.ComputeHash(buffer)).ToLower().Replace("-", "");
            return hash;
        }

        /// <summary>Funkja dodająca taksówkarza
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
        public static void AddNewTaxiDriver(String name, String surname, String city, String email, String houseNr, String pesel, String licenceNr, String postalCode, String login, String password)
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
                throw new UserExistException("User with given login already exist");
            }

            td.salt = CreateRandomString(8);


            String pwd;

            if (password != null)
            {
                pwd = Repository.CalculateSHA1(password + td.salt, Encoding.ASCII);
            }
            else
            {
                string randomPwd = CreateRandomString(8);
                pwd = Repository.CalculateSHA1(randomPwd + td.salt, Encoding.ASCII);
            }

            td.password = pwd;

            try
            {
                ctx.Employees.InsertOnSubmit(td);
                ctx.SubmitChanges();
            }
            catch(Exception ex)
            {
                throw new DatabaseException("Exception with inserting to database");
            }

        }
        public static void AddNewTaxiDriver(String name, String surname, String login, String password)
        {
            AddNewTaxiDriver(name, surname, null, null, null, null, null, null, login, password);
        }

        public static List<Taxi> GetTaxiList()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from c in ctx.Taxis select c;
            return x.ToList();
        }

        public static  Employee GetUserById(int id)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = ctx.Employees.SingleOrDefault(u => u.id == id);
            
            Employee e = new Employee();
            e = (Employee)x;
            
            return e;
        }

        public static void addNewCourse(int taxidriver_id, int depositor_id, String client_phone, DateTime course_date, int course_status_id, String client_name,
            String startpoint_name, Decimal startpoint_lon,Decimal startpoint_lat, Decimal endpoint_lon, Decimal endpoint_lat)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Course course = new Course();
            course.client_phone=client_phone;
            course.date=System.DateTime.Now;
            course.course_date = course_date;
            course.client_name = client_name;
            course.course_status_id = course_status_id;
            course.depositor_id = depositor_id;
            course.taxidriver_id = taxidriver_id;
            course.startpoint_lat = startpoint_lat;
            course.startpoint_lon = startpoint_lon;
            course.endpoint_lat = endpoint_lat;
            course.endpoint_lon = endpoint_lon;
            try
            {
                ctx.Courses.InsertOnSubmit(course);
                ctx.SubmitChanges();
            }
            catch (Exception e)
            {
                
            }

        }
    }

    
}
