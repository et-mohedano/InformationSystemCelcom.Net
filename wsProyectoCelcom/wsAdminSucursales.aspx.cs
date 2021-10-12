using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using wsCelcom;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de inserción de productos
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.insSucursal(TextBox2.Text,TextBox3.Text,
                                        TextBox4.Text, TextBox5.Text,
                                        TextBox6.Text, TextBox7.Text);
        // Validación de la bandera
        Response.Write("<script language='javascript'>alert('" + bandera + "');</script>");
        
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de modificación de productos
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.updSucursal(int.Parse(TextBox1.Text),
                                        TextBox2.Text, TextBox3.Text,
                                        TextBox4.Text, TextBox5.Text,
                                        TextBox6.Text, TextBox7.Text);
        // Validación de la bandera
        Response.Write("<script language='javascript'>alert('" + bandera + "');</script>");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de eliminación de productos
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.delSucursal(int.Parse(TextBox1.Text));
        // Validación de la bandera
        Response.Write("<script language='javascript'>alert('" + bandera + "');</script>");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de modificación de limpieza del formulario
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
    }
}