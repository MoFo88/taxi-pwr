using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class addNewEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        this.prepareDropList();
    }

    private void prepareDropList()
    {
        this.ddl_Car_model.DataSource = Repository.getAllCarTypes(); 
        this.ddl_Car_model.DataTextField = "name";
        this.ddl_Car_model.DataValueField = "id";
        this.DataBind();
    }

    private void clearControls()
    {
        tb_Name.Text = "";
        tb_Surname.Text = "";
        tb_City.Text = "";
        tb_E_mail.Text = "";
        tb_House_nr.Text = "";
        tb_Street.Text = "";
        tb_Pesel.Text = "";
        tb_Postal_code.Text = "";
        tb_Login.Text = "";
        tb_Password.Text = "";
    }

    protected void b_Add_Click(object sender, EventArgs e)
    {
        string employee_type = rbl_UserType.SelectedValue;
        if (employee_type == "admin")
        {
            Repository.AddNewAdmin(tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_E_mail.Text, tb_House_nr.Text,
                                   tb_Street.Text, tb_Pesel.Text, tb_Postal_code.Text, tb_Login.Text, tb_Password.Text);
            Response.Redirect("Admin_employees.aspx");
            clearControls();
            
        }
        else if (employee_type == "dispatcher")
        {
            Repository.AddNewDispatcher(tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_E_mail.Text, tb_House_nr.Text,
                                        tb_Street.Text, tb_Pesel.Text, tb_Postal_code.Text, tb_Login.Text, tb_Password.Text);
            Response.Redirect("Admin_employees.aspx");
            clearControls();
        }
        else if (employee_type == "driver")
        {
            Repository.AddNewTaxiDriver(tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_E_mail.Text, tb_House_nr.Text,
                                        tb_Street.Text, tb_Pesel.Text, tb_Licence_number.Text, tb_Postal_code.Text, tb_Login.Text, tb_Password.Text);
            Response.Redirect("Admin_employees.aspx");
            clearControls();
        }
    }
}