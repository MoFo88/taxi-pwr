using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

public partial class EditAdminOrDispatcher : System.Web.UI.Page
{
    int idEmployee;
    Employee employee;

    protected void Page_Load(object sender, EventArgs e)
    {
        idEmployee = int.Parse(Session["idEmployeeToEdit"].ToString());
        this.employee = Repository.getEmployeeById(idEmployee);
        if (!IsPostBack)
        {
            loadEmployeeData();

        }
    }
    protected void b_Submit_Click(object sender, EventArgs e)
    {
        if (employee is Admin)
        {
            Repository.EditAdminData(idEmployee, tb_Login.Text, tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_Street.Text, tb_E_mail.Text, tb_House_nr.Text,
                                         tb_Pesel.Text, tb_Postal_code.Text, tb_Telephone.Text);
            Response.Redirect("EmployeesList.aspx");
        }
        if (employee is Dispatcher)
        {
            Repository.EditDispatcheDatar(idEmployee, tb_Login.Text, tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_Street.Text, tb_E_mail.Text, tb_House_nr.Text,
                                         tb_Pesel.Text, tb_Postal_code.Text, tb_Telephone.Text);
            Response.Redirect("EmployeesList.aspx");
        }
    }

    private void loadEmployeeData()
    {
        tb_Name.Text = employee.name;
        tb_Surname.Text = employee.surname;
        tb_Login.Text = employee.login;
        tb_City.Text = employee.city;
        tb_E_mail.Text = employee.e_mail;
        tb_House_nr.Text = employee.house_nr;
        tb_Street.Text = employee.street;
        tb_Pesel.Text = employee.pesel;
        tb_Postal_code.Text = employee.postal_code;
        tb_Telephone.Text = employee.telephone;
    }
    protected void bt_Delete_Click(object sender, EventArgs e)
    {
        Session["idEmployeeToDelete"] = idEmployee;
        Response.Redirect("DeleteEmployee.aspx");
    }
}