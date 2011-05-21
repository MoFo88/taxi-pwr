using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

public partial class EditTaxiDriver : System.Web.UI.Page
{
    private int idDriver;

    protected void Page_Load(object sender, EventArgs e)
    {
        prepareDropList();
        idDriver = int.Parse(Session["idEmployeeToEdit"].ToString());            
        loadDriverData();
    }

    private void loadDriverData()
    {
        TaxiDriver driver = (TaxiDriver)Repository.getEmployeeById(idDriver);
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
        tb_Licence_number.Text = driver.licence_number;
        tb_Taxi_number.Text = driver.Taxi.taxi_number;
        tb_Registration_number.Text = driver.Taxi.registration_number;
        ddl_Car_model.SelectedValue = driver.Taxi.id_car_type.ToString();
        tb_CarBrand.Text = driver.Taxi.Car_model.producer;
        tb_CarModel.Text = driver.Taxi.Car_model.model;
        tb_SeatPlaces.Text = driver.Taxi.Car_model.seats.ToString();
        tb_ProductionYear.Text = driver.Taxi.Car_model.production_year.ToString();
    }


    private void prepareDropList()
    {
        this.ddl_Car_model.DataSource = Repository.getAllCarTypes();
        this.ddl_Car_model.DataTextField = "name";
        this.ddl_Car_model.DataValueField = "id";
        this.DataBind();
    }
    
    protected void b_Submit_Click(object sender, EventArgs e)
    {
        int carType = int.Parse(ddl_Car_model.SelectedValue);
        Repository.EditTaxiDriver(idDriver, tb_Name.Text, tb_Surname.Text, tb_City.Text, tb_E_mail.Text, tb_House_nr.Text,
                                    tb_Street.Text, tb_Pesel.Text, tb_Licence_number.Text, tb_Postal_code.Text, tb_Telephone.Text,tb_Login.Text,
                                    tb_CarBrand.Text, tb_CarModel.Text, tb_ProductionYear.Text, tb_SeatPlaces.Text,
                                    tb_Registration_number.Text, tb_Taxi_number.Text, carType);
        Response.Redirect("EmployeesList.aspx");
    }
    protected void bt_Delete_Click(object sender, EventArgs e)
    {
        Session["idEmployeeToDelete"] = idDriver;
        Response.Redirect("DeleteEmployee.aspx");
    }
}