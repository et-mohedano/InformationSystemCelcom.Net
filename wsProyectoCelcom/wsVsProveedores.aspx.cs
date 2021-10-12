using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using wsCelcom;
using System.Data;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Agregar el evento PageIndexChanging al gridview
        GridView1.PageIndexChanging += GridView1_PageIndexChanging;
        // Crear objeto del tipo servicio, en base a la referencia agregada
        wsCelcom.ServiceSoapClient objServicio = new ServiceSoapClient();
        DataSet ds = new DataSet();
        ds = objServicio.wvProveedor();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // throw new NotImplementedException();
        // Actualizar el indice de la pagina del grid
        GridView1.PageIndex = e.NewPageIndex;
        // Actualizar los datos de la pagina
        GridView1.DataBind();
    }
}