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
        // Boton que ejecuta el método de inserción de proveedores
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.insProveedor(TextBox2.Text, TextBox3.Text,TextBox4.Text,
                                        TextBox5.Text, int.Parse(TextBox7.Text),
                                        TextBox8.Text, TextBox9.Text, TextBox10.Text, 
                                        int.Parse(TextBox11.Text));
        // Validación de la bandera
        Response.Write("<script language='javascript'>alert('"+bandera+"');</script>");
        
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de modificación de clientes
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.updProveedor(int.Parse(TextBox1.Text), TextBox2.Text, TextBox3.Text,
                                        TextBox4.Text, TextBox5.Text, 
                                        int.Parse(TextBox7.Text),TextBox8.Text, TextBox9.Text, 
                                        TextBox10.Text, int.Parse(TextBox11.Text));
        // Validación de la bandera
        Response.Write("<script language='javascript'>alert('" + bandera + "');</script>");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de eliminación de clientes
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.delProveedor(int.Parse(TextBox1.Text));
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
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
    }
}