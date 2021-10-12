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
        // Boton que ejecuta el método de inserción de clientes
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        if ((TextBox2.Text).Length>10)
        {
            Response.Write("<script language='javascript'>alert('Ingresa un número telefónico de 10 digitos');</script>");
        }
        else
        {
            bandera = objServicio.insCliente(TextBox2.Text, TextBox3.Text,TextBox4.Text,
                                        TextBox5.Text, TextBox6.Text, int.Parse(TextBox7.Text),
                                        TextBox8.Text, TextBox9.Text, TextBox10.Text, 
                                        int.Parse(TextBox11.Text));
            // Validación de la bandera
           if (bandera == "0")
                Response.Write("<script language='javascript'>alert('El cliente ya existe en el sistema');</script>");
           if (bandera == "1")
               Response.Write("<script language='javascript'>alert('El cliente fue registrado existosamente');</script>");
        
       }
        
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de modificación de clientes
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.updCliente(int.Parse(TextBox1.Text), TextBox2.Text, TextBox3.Text,
                                        TextBox4.Text, TextBox5.Text, TextBox6.Text, 
                                        int.Parse(TextBox7.Text),TextBox8.Text, TextBox9.Text, 
                                        TextBox10.Text, int.Parse(TextBox11.Text));
        // Validación de la bandera
        if (bandera == "0")
            Response.Write("<script language='javascript'>alert('El cliente es incorrecto, verificar que ya exista en el sistema');</script>");
        if (bandera == "1")
            Response.Write("<script language='javascript'>alert('El cliente fue modificado existosamente');</script>");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        // Boton que ejecuta el método de eliminación de clientes
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        string bandera;
        // Ejecución del método
        bandera = objServicio.delCliente(int.Parse(TextBox1.Text));
        // Validación de la bandera
        if (bandera == "0")
            Response.Write("<script language='javascript'>alert('El clinte es incorrecto, verificar que ya exista en el sistema');</script>");
        if (bandera == "1")
            Response.Write("<script language='javascript'>alert('El clinte fue eliminado existosamente');</script>");
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
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
    }
}