using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

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


    }
}
