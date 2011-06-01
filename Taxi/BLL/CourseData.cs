using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class CourseData
    {
        String locationName;
        int idCourse;
        String clientName;
        String clientPhone;

        public int IdCourse
        {
		
            get { return idCourse; }
            set { idCourse = value; }
        }



        public CourseData()
        {
            locationName = null;
            clientPhone = null;
            clientName = null;
        }

        public String LocationName
        {
            get { return locationName; }
            set { locationName = value; }
        }
        

        public String ClientName
        {
            get { return clientName; }
            set { clientName = value; }
        }
        

        public String ClientPhone
        {
            get { return clientPhone; }
            set { clientPhone = value; }
        }
    }
}
