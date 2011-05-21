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

    protected void Page_Load(object sender, EventArgs e)
    {
        idEmployee = int.Parse(Session["idEmployeeToEdit"].ToString());
        loadEmployeeData();
    }
    protected void b_Submit_Click(object sender, EventArgs e)
    {

    }

    private void loadEmployeeData()
    {
        Employee driver = (Employee)Repository.getEmployeeById(idEmployee);
        tb_Name.Text = driver.name;
        tb_Surname.Text = driver.surname;
        tb_Login.Text = driver.login;
        tb_City.Text = driver.city;
        tb_E_mail.Text = driver.e_mail;
        tb_House_nr.Text = driver.house_nr;
        tb_Street.Text = driver.street;
        tb_Pesel.Text = driver.pesel;
        tb_Postal_code.Text = driver.postal_code;
        tb_Telephone.Text = driver.telephone;
    }
    protected void bt_Delete_Click(object sender, EventArgs e)
    {
        Session["idEmployeeToDelete"] = idEmployee;
        Response.Redirect("DeleteEmployee.aspx");
    }
}