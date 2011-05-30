using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

public partial class DeleteEmployee : System.Web.UI.Page
{
    private int idEmployee;
    private int employeeType;

    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        if (!Session["userType"].ToString().Equals("3"))
            Response.Redirect("NoAccessRights.aspx");
        idEmployee = int.Parse(Session["idEmployeeToDelete"].ToString());
        loadEmployeeData();
    }

    private void loadEmployeeData()
    {
        Employee employee = Repository.getEmployeeById(idEmployee);
        employeeType = employee.employee_type_id;
        lb_name.Text = employee.name;
        lb_surname.Text = employee.surname;
        lb_city.Text = employee.postal_code+ " " +employee.city;
        lb_address.Text = employee.street+ " "+employee.house_nr;
        lb_PESEL.Text = employee.pesel;
        lb_phone.Text = employee.telephone;
    }
    protected void bt_Delete_Click(object sender, EventArgs e)
    {
        Repository.DeleteUser(idEmployee);
        Response.Redirect("EmployeesList.aspx");
    }
    protected void bt_Return_Click(object sender, EventArgs e)
    {
        switch (employeeType)
        {
            case 1:
                Response.Redirect("EditTaxiDriver.aspx");
                break;
            case 2:
                Response.Redirect("EditAdminOrDispatcher.aspx");
                break;
            case 3:
                Response.Redirect("EditAdminOrDispatcher.aspx");
                break;
        }
    }
}