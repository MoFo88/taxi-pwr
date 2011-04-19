using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class UserExistException : ApplicationException
    {
        public UserExistException(string p) : base(p){}
        public UserExistException(){ }
    }

    public class DatabaseException : ApplicationException
    {
        public DatabaseException() { }
        public DatabaseException(string p) : base(p) { }
    }

    public class UserNotExistException : ApplicationException
    {
        public UserNotExistException() { }
        public UserNotExistException(string p) : base(p) { }
    }

    public class WronPasswordException : ApplicationException
    {
        public WronPasswordException(){}
        public WronPasswordException(string p):base(p) { }
    }
}
