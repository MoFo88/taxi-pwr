using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ICourseModel
/// </summary>
public interface ICourseModel
{
	public ICourseModel()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public virtual IEnumerable<DAL.Course> getAllCourses();

    public virtual IEnumerable<DAL.Course> getAllCourses(DAL.Course_status type);

    public virtual bool cancelCourse(int id);
}