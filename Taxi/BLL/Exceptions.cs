using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class UserExistException : ApplicationException
    {
        public UserExistException(string p) : base(p){}
        public UserExistException() : base("User with given login already exist") { }
    }

    public class DatabaseException : ApplicationException
    {
        public DatabaseException() : base("Exception with inserting to database") { }
        public DatabaseException(string p) : base(p) { }
    }

    public class UserNotExistException : ApplicationException
    {
        public UserNotExistException() :base("User don't exist") { }
        public UserNotExistException(string p) : base(p) { }
    }

    public class WrongPasswordException : ApplicationException
    {
        public WrongPasswordException() : base("Given password isn't correct") {}
        public WrongPasswordException(string p):base(p) { }
    }

    public class CourseNotExistException : ApplicationException
    {
        public CourseNotExistException() : base("Course don't exist") { }
        public CourseNotExistException(string p) : base(p) { } 
    }
}
