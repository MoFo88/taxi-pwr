using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class admin_drivers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        this.prepareGridView();
        this.prepareDropList();
    }

    private void prepareDropList()
    {
        //this.ddl_Car_model.DataSource = Repository.GetCarModelsList();
    }

    private void prepareGridView()
    {
        this.gv_Employees.Columns[0].HeaderText = "Położenie";
        this.gv_Employees.Columns[1].HeaderText = "Nr. licencji";
        this.gv_Employees.Columns[2].HeaderText = "Imię";
        this.gv_Employees.Columns[3].HeaderText = "Nazwisko";
        this.gv_Employees.Columns[4].HeaderText = "Stanowisko";
        this.gv_Employees.Columns[5].HeaderText = "Telefon";
        /*Dictionary<int, String> positions = new Dictionary<int, String>();
        List<DAL.Employee_type> pos = Repository.GetAllEmployeeTypes();
        foreach(DAL.Employee_type type in pos)
            positions.Add(type.id,type.name);
        foreach (GridViewRow row in this.gv_Employees.Rows)
        {
            int type;
            if(Int32.TryParse(row.Cells[4].Text, out type))
                row.Cells[4].Text = positions[type];
        }*/
        

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
        if (employee_type == "dispatcher")
        {
            Repository.AddNewDispatcher(tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_E_mail.Text, tb_House_nr.Text,
                                        tb_Street.Text, tb_Pesel.Text, tb_Postal_code.Text, tb_Login.Text, tb_Password.Text);
            Response.Redirect("Admin_employees.aspx");
            clearControls();
        }
        if (employee_type == "driver")
        {
            Repository.AddNewTaxiDriver(tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_E_mail.Text, tb_House_nr.Text,
                                        tb_Street.Text, tb_Pesel.Text, tb_Licence_number.Text, tb_Postal_code.Text, tb_Login.Text, tb_Password.Text);
            Response.Redirect("Admin_employees.aspx");
            clearControls();
        }
    }

    protected void gv_Employees_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}