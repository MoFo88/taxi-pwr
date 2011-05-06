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

        /* USER */

        /// <summary>Funkcja autoryzująca użytkownika
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

            if (user == null)
                throw new UserNotExistException();
            String pswdSalt = pswd + user.salt;
            String password = CalculateSHA1(pswdSalt, Encoding.ASCII);

            if (user.password != password)
                throw new WrongPasswordException("Wrong password");

            return user.id;
        }

        /// <summary>Pobierz uzytkownika o podanym id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        /// <exception cref="UserNotExistException"></exception>
        public static Employee GetUserById(int id)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Employee e = ctx.Employees.SingleOrDefault(u => u.id == id);

            if (e == null)
            {
                throw new UserNotExistException();
            }

            return e;
        }

        /// <summary>Usuń uzytkownika o podanym Id
        /// </summary>
        /// <param name="userId"></param>
        /// <exception cref="UserNotExistException"></exception>
        public static void DeleteUser(int userId)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            var x = from u in ctx.Employees
                    where u.id == userId
                    select u;

            Employee user = x.SingleOrDefault();

            if (user == null)
            {
                throw new UserNotExistException();
            }

            ctx.Employees.DeleteOnSubmit(user);
            ctx.SubmitChanges();
        }

        /// <summary> Funkcja zmiany hasła użytkownika
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="newPassword"></param>
        /// <exception cref="UserNotExistException"></exception>
        public static void ChangeUserPassword(int userId, String newPassword)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            Employee e = ctx.Employees.SingleOrDefault(em => em.id == userId);

            if (e == null)
            {
                throw new UserNotExistException();
            }

            String NewPassword = Repository.CalculateSHA1(newPassword + e.salt, Encoding.ASCII);

            e.password = NewPassword;

            ctx.SubmitChanges();

        }

        //PRIVATE MEMBER
        private static Employee AddNewUser(
            String name,
            String surname,
            String city,
            String email,
            String houseNr,
            String street,
            String pesel,
            String postalCode,
            String login,
            String password)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Employee e = new Employee();

            e.name = name;
            e.surname = surname;
            e.city = city;
            e.e_mail = email;
            e.house_nr = houseNr;
            e.login = login;
            e.pesel = pesel;
            e.postal_code = postalCode;
            e.street = street;

            //Employee check = ctx.Employees.SingleOrDefault(u => u.login == e.login);

            //if  (check != null)
            //{
            //    throw new UserExistException();
            //}

            e.salt = CreateRandomString(8);

            String pwd;

            if (password != null)
            {
                pwd = Repository.CalculateSHA1(password + e.salt, Encoding.ASCII);
            }
            else
            {
                string randomPwd = CreateRandomString(8);
                pwd = Repository.CalculateSHA1(randomPwd + e.salt, Encoding.ASCII);
            }

            e.password = pwd;

            return e;

        }

        /// <summary>Funkcja zwraca listę wszystkich pracowników
        /// </summary>
        /// <returns></returns>
        public static List<Employee> GetAllEmployees()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from e in ctx.Employees
                    select e;
            return x.ToList();
        }

        /// <summary>zmiana danych employee
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="name"></param>
        /// <param name="surname"></param>
        /// <param name="city"></param>
        /// <param name="street"></param>
        /// <param name="house_nr"></param>
        /// <param name="postal_code"></param>
        /// <param name="e_mail"></param>
        /// <param name="pesel"></param>
        /// <param name="telephone"></param>
        public static void EditUserData(
            int userId,
            String name,
            String surname,
            String city,
            String street,
            String house_nr,
            String postal_code,
            String e_mail,
            String pesel,
            String telephone)
        {

            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            Employee e = ctx.Employees.FirstOrDefault(em => em.id == userId);

            e.name = name;
            e.surname = surname;
            e.city = city;
            e.street = street;
            e.house_nr = house_nr;
            e.postal_code = postal_code;
            e.e_mail = e_mail;
            e.pesel = pesel;
            e.telephone = telephone;

            ctx.SubmitChanges();

        }
        /* TAXI DRIVER */

        /// <summary> Funkcja zwraca listę wszystkich taksówkarz
        /// </summary>
        /// <returns></returns>
        public static List<TaxiDriver> GetAllTaxiDrivers()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var query = from c in ctx.Employees.OfType<TaxiDriver>()
                        select c;
            return query.ToList();
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
        public static void AddNewTaxiDriver(String name, String surname, String city, String email, String houseNr, String street, String pesel, String licenceNr, String postalCode, String login, String password)
        {

            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            Employee e = Repository.AddNewUser(name, surname, city, email, houseNr, street, pesel, postalCode, login, password);

            TaxiDriver td = new TaxiDriver(e);

            td.licence_number = licenceNr;

            ctx.Employees.InsertOnSubmit(td);
            ctx.SubmitChanges();

        }

        public static void AddNewTaxiDriver(String name, String surname, String login, String password)
        {
            AddNewTaxiDriver(name, surname, null, null, null, null, null, null, null, login, password);
        }

        /// <summary>Zmiana danych taksówkarza
        /// </summary>
        /// <param name="taxiDriveId"></param>
        /// <param name="name"></param>
        /// <param name="surname"></param>
        /// <param name="city"></param>
        /// <param name="email"></param>
        /// <param name="houseNr"></param>
        /// <param name="pesel"></param>
        /// <param name="licenceNr"></param>
        /// <param name="postalCode"></param>
        /// <exception cref="UserNotExistException"></exception>
        public static void EditTaxiDriverData(int taxiDriveId, String name, String surname, String city, String email, String houseNr, String pesel, String licenceNr, String postalCode)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from t in ctx.Employees.OfType<TaxiDriver>()
                    where t.id == taxiDriveId
                    select t;

            if (x == null)
            {

                throw new UserNotExistException();
            }

            TaxiDriver taxiDriver = x.SingleOrDefault();

            taxiDriver.city = city;
            taxiDriver.e_mail = email;
            taxiDriver.house_nr = houseNr;
            taxiDriver.licence_number = licenceNr;
            taxiDriver.name = name;
            taxiDriver.pesel = pesel;
            taxiDriver.surname = surname;
            taxiDriver.postal_code = postalCode;

            ctx.SubmitChanges();
        }

        public static void EditTaxiDriverData(int taxiDriverId, String name, String surname, String city, String email, String houseNr, String pesel, String licenceNr, String postalCode, String login, String password)
        {
            EditTaxiDriverData(taxiDriverId, name, surname, city, email, houseNr, pesel, licenceNr, postalCode);
            ChangeUserPassword(taxiDriverId, password);

            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from t in ctx.Employees.OfType<TaxiDriver>()
                    where t.id == taxiDriverId
                    select t;
            TaxiDriver taxiDriver = x.SingleOrDefault();

            taxiDriver.login = login;

            ctx.SubmitChanges();
        }

        /// <summary>Pobierz listę taksówkarzy o podanym statusie
        /// </summary>
        /// <param name="statusId"></param>
        /// <returns></returns>
        public static List<TaxiDriver> GetTaxiDriversByStatus(int statusId)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            var x =
                from td in ctx.Employees.OfType<TaxiDriver>()
                where td.Driver_status.id == statusId
                select td;

            return x.ToList();
        }

        /// <summary>Pobierz listę taksówkarzy o podanym statusie
        /// </summary>
        /// <param name="ds"></param>
        /// <returns></returns>
        public static List<TaxiDriver> GetTaxiDriversByStatus(Driver_status ds)
        {
            return GetTaxiDriversByStatus(ds.id);
        }

        /// <summary> funkcja zwraca listę taksówkarzy, do których przypisana jest taksówka określoneo typu
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static List<TaxiDriver> GetTaxiDriverByCarType(int id)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            var x =
                from td in ctx.Employees.OfType<TaxiDriver>()
                where td.Taxi.Car_type.id == id
                select td;

            return x.ToList();
        }
        public static List<TaxiDriver> GetTaxiDriverByCarType(Car_type ct)
        {
            return GetTaxiDriverByCarType(ct.id);
        }

        public static List<TaxiDriver> GetTaxiDriverByStatusAndCarType(int driverStatusId, int carTypeId)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            var x = from td in ctx.Employees.OfType<TaxiDriver>()
                    where
                    td.Driver_status.id == driverStatusId
                    &&
                    td.Taxi.Car_type.id == carTypeId
                    select td;

            return x.ToList();

        }

        /* ADMIN */

        /// <summary>Dodaj administratora
        /// </summary>
        /// <param name="name"></param>
        /// <param name="surname"></param>
        /// <param name="city"></param>
        /// <param name="email"></param>
        /// <param name="houseNr"></param>
        /// <param name="street"></param>
        /// <param name="pesel"></param>
        /// <param name="postalCode"></param>
        /// <param name="login"></param>
        /// <param name="password"></param>
        public static void AddNewAdmin(String name, String surname, String city, String email, String houseNr, String street, String pesel, String postalCode, String login, String password)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Employee e = Repository.AddNewUser(name, surname, city, email, houseNr, street, pesel, postalCode, login, password);
            Admin a = new Admin(e);

            ctx.Employees.InsertOnSubmit(a);
            ctx.SubmitChanges();

        }


        /* DISPATCHER */

        /// <summary>Dodaj dyspozytora
        /// </summary>
        /// <param name="name"></param>
        /// <param name="surname"></param>
        /// <param name="city"></param>
        /// <param name="email"></param>
        /// <param name="houseNr"></param>
        /// <param name="street"></param>
        /// <param name="pesel"></param>
        /// <param name="postalCode"></param>
        /// <param name="login"></param>
        /// <param name="password"></param>
        public static void AddNewDispatcher(String name, String surname, String city, String email, String houseNr, String street, String pesel, String postalCode, String login, String password)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Employee e = Repository.AddNewUser(name, surname, city, email, houseNr, street, pesel, postalCode, login, password);
            Dispatcher d = new Dispatcher(e);

            ctx.Employees.InsertOnSubmit(d);
            ctx.SubmitChanges();

        }


        /* COURS */

        /// <summary>Dodaj nowy kurs
        /// </summary>
        /// <param name="taxidriver_id"></param>
        /// <param name="depositor_id"></param>
        /// <param name="client_phone"></param>
        /// <param name="course_date"></param>
        /// <param name="course_status_id"></param>
        /// <param name="client_name"></param>
        /// <param name="startpoint_name"></param>
        /// <param name="startpoint_lon"></param>
        /// <param name="startpoint_lat"></param>
        /// <param name="endpoint_lon"></param>
        /// <param name="endpoint_lat"></param>
        public static void addNewCourse(
            int? taxidriver_id,
            int? depositor_id,
            String client_phone,
            DateTime? course_date,
            int? course_status_id,
            String client_name,
            String startpoint_name,
            Decimal startpoint_lon,
            Decimal startpoint_lat,
            Decimal endpoint_lon,
            Decimal endpoint_lat)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Course course = new Course();

            if (course_date == null)
            {
                course_date = DateTime.Now;
            }

            course.client_phone = client_phone;
            course.date = DateTime.Now;
            course.course_date = course_date;
            course.client_name = client_name;
            course.course_status_id = course_status_id;
            course.depositor_id = depositor_id;
            course.taxidriver_id = taxidriver_id;
            course.startpoint_lat = startpoint_lat;
            course.startpoint_lon = startpoint_lon;
            course.endpoint_lat = endpoint_lat;
            course.endpoint_lon = endpoint_lon;
            course.startpoint_name = startpoint_name;


            ctx.Courses.InsertOnSubmit(course);
            ctx.SubmitChanges();

        }


        /// <summary>Edytuj dane kuru
        /// </summary>
        /// <param name="courseId"></param>
        /// <param name="taxidriver_id"></param>
        /// <param name="depositor_id"></param>
        /// <param name="client_phone"></param>
        /// <param name="course_date"></param>
        /// <param name="course_status_id"></param>
        /// <param name="client_name"></param>
        /// <param name="startpoint_name"></param>
        /// <param name="startpoint_lon"></param>
        /// <param name="startpoint_lat"></param>
        /// <param name="endpoint_lon"></param>
        /// <param name="endpoint_lat"></param>
        public static void EditCourse(
            int courseId,
            int taxidriver_id,
            int depositor_id,
            String client_phone,
            DateTime? course_date,
            int course_status_id,
            String client_name,
            String startpoint_name,
            Decimal startpoint_lon,
            Decimal startpoint_lat,
            Decimal endpoint_lon,
            Decimal endpoint_lat)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Course course = ctx.Courses.SingleOrDefault(c => c.id == courseId);

            if (course == null)
            {
                throw new CourseNotExistException();
            }

            if (course_date == null)
            {
                course_date = DateTime.Now;
            }

            course.client_phone = client_phone;
            course.course_date = course_date;
            course.client_name = client_name;
            course.course_status_id = course_status_id;
            course.depositor_id = depositor_id;
            course.taxidriver_id = taxidriver_id;
            course.startpoint_lat = startpoint_lat;
            course.startpoint_lon = startpoint_lon;
            course.endpoint_lat = endpoint_lat;
            course.endpoint_lon = endpoint_lon;

            ctx.SubmitChanges();
        }



        /* TAXI */

        /// <summary>Pobierz listę taksówek
        /// </summary>
        /// <returns></returns>
        public static List<Taxi> GetTaxiList()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from c in ctx.Taxis
                    select c;
            return x.ToList();
        }

        /// <summary>Funkcja zwraa listę typów samochodów
        /// </summary>
        /// <returns></returns>
        public static List<Car_type> GetCarModelsList()
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from c in ctx.Car_types
                    select c;
            return x.ToList();
        }

        /*  */

        /// <summary> funkcja dodaje typ samochodu o podanej nazwie
        /// </summary>
        /// <param name="name"></param>
        public static void AddNewCarType(String name)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();

            Car_type ct = new Car_type();
            ct.name = name;

            ctx.Car_types.InsertOnSubmit(ct);
            ctx.SubmitChanges();
        }

        /// <summary>funkcja usuwająca typ sa taksówki o podanym id
        /// </summary>
        /// <param name="id"></param>
        public static void DeleteCarType(int id)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            Car_type ct = ctx.Car_types.SingleOrDefault(c => c.id == id);

            ctx.Car_types.DeleteOnSubmit(ct);
            ctx.SubmitChanges();
        }

        /// <summary>Funkcja zwraca Listę Typów użytkownika
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

        /// <summary>Aktualizuje polozenie taksowkarza
        /// </summary>
        /// <returns>nothing</returns>
        public static bool setTaxiPosition(Decimal lon, Decimal lat, int idTaxi)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from i in ctx.Employees.OfType<TaxiDriver>()
                    where i.id == idTaxi && i.employee_type_id == 1
                    select i;
            TaxiDriver td = x.SingleOrDefault();
            td.position_lon = lon;
            td.position_lat = lat;
            ctx.SubmitChanges();
            //na razie zwraca zawsze true ;), moze wypadaloby zwrocic stan taksowkarza?
            return true;
        }

        public static bool setTaxiState(int state, int idTaxi)
        {
            TaxiDataClassesDataContext ctx = new TaxiDataClassesDataContext();
            var x = from i in ctx.Employees.OfType<TaxiDriver>()
                    where i.id == idTaxi && i.employee_type_id == 1
                    select i;
            TaxiDriver td = x.SingleOrDefault();
            var y = from i in ctx.Driver_status
                    where i.id == state
                    select i;
            td.Driver_status = y.SingleOrDefault();
            //na razie zwraca zawsze true ;), moze wypadaloby zwrocic stan taksowkarza?
            ctx.SubmitChanges();
            return true;
        }


        /* PRIVATE MEMBER */

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

        #region Suma SHA1
        #endregion
        private static string CalculateSHA1(string text, Encoding enc)
        {
            byte[] buffer = enc.GetBytes(text);
            SHA1CryptoServiceProvider cryptoTransformSHA1 = new SHA1CryptoServiceProvider();
            string hash = BitConverter.ToString(cryptoTransformSHA1.ComputeHash(buffer)).ToLower().Replace("-", "");
            return hash;
        }


    }
}
