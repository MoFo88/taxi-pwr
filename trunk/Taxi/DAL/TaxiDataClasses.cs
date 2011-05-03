using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public partial class TaxiDriver
    {
        public TaxiDriver(Employee e)
        {
            this.name = e.name;
            this.city = e.city;
            this.e_mail = e.e_mail;
            this.house_nr = e.house_nr;
            this.id = e.id;
            this.login = e.login;
            this.password = e.password;
            this.pesel = e.pesel;
            this.postal_code = e.postal_code;
            this.salt = e.salt;
            this.surname = e.surname;
            this.telephone = e.telephone;
            this.street = e.street;
        }
    }


    public partial class Admin
    {
        public Admin(Employee e)
        {
            this.name = e.name;
            this.city = e.city;
            this.e_mail = e.e_mail;
            this.house_nr = e.house_nr;
            this.id = e.id;
            this.login = e.login;
            this.password = e.password;
            this.pesel = e.pesel;
            this.postal_code = e.postal_code;
            this.salt = e.salt;
            this.surname = e.surname;
            this.telephone = e.telephone;
            this.street = e.street;
        }
    }

    public partial class Dispatcher
    {
        public Dispatcher(Employee e)
        {
            this.name = e.name;
            this.city = e.city;
            this.e_mail = e.e_mail;
            this.house_nr = e.house_nr;
            this.id = e.id;
            this.login = e.login;
            this.password = e.password;
            this.pesel = e.pesel;
            this.postal_code = e.postal_code;
            this.salt = e.salt;
            this.surname = e.surname;
            this.telephone = e.telephone;
            this.street = e.street;
        }
    }

}
