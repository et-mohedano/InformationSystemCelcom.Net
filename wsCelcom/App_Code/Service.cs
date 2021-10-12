using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using MySql.Data.MySqlClient;
using System.Data;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]

public class Service : System.Web.Services.WebService
{
    // Creacion de atributos enfocados a la conexion a BD
    private string CadConn = "server=localhost;database=celcom;uid=root;pwd=12345!;";
    // server localhost
    // database efras_busisness
    // user root
    // password Translader22!

    // Metodos de conexion a base de datos
    [WebMethod]
    public DataSet wvSucursales()
    {
        string CadSql = "select * from vwRptSucursales;";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlDataAdapter myDa = new MySqlDataAdapter(CadSql, myConn);
        DataSet Ds = new DataSet();
        myDa.Fill(Ds, "vwSucursales");
        return Ds;
    }

    [WebMethod]
    public DataSet wvClientes()
    {
        string CadSql = "select * from vwRptCliente;";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlDataAdapter myDa = new MySqlDataAdapter(CadSql, myConn);
        DataSet Ds = new DataSet();
        myDa.Fill(Ds, "vwCliente");
        return Ds;
    }

    [WebMethod]
    public DataSet wvProveedor()
    {
        string CadSql = "select * from vwRptProveedor;";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlDataAdapter myDa = new MySqlDataAdapter(CadSql, myConn);
        DataSet Ds = new DataSet();
        myDa.Fill(Ds, "vwProveedor");
        return Ds;
    }

    [WebMethod]
    public DataSet wvProducto()
    {
        string CadSql = "select * from vwRptProducto;";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlDataAdapter myDa = new MySqlDataAdapter(CadSql, myConn);
        DataSet Ds = new DataSet();
        myDa.Fill(Ds, "vwProducto");
        return Ds;
    }

    [WebMethod]
    public DataSet wvAlmacena()
    {
        string CadSql = "select * from vwRptAlmacena;";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlDataAdapter myDa = new MySqlDataAdapter(CadSql, myConn);
        DataSet Ds = new DataSet();
        myDa.Fill(Ds, "vwAlmacena");
        return Ds;
    }

    [WebMethod]
    public DataSet wvSurte()
    {
        string CadSql = "select * from vwRptSurte;";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlDataAdapter myDa = new MySqlDataAdapter(CadSql, myConn);
        DataSet Ds = new DataSet();
        myDa.Fill(Ds, "vwSurte");
        return Ds;
    }

    [WebMethod]
    public string insSucursal(string sucursal, 
                                string ubicacion, 
                                string telefono, 
                                string paterno, 
                                string materno, 
                                string nombre)
    {
        string CadSql = "call spInsSucursal ('"+sucursal+"', '"+ubicacion+"', '"+telefono+"', '"+paterno+"', '"+materno+"', '"+nombre+"');";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string updSucursal(int clave, 
                                string sucursal, 
                                string ubicacion, 
                                string telefono, 
                                string paterno, 
                                string materno, 
                                string nombre)
    {
        string CadSql = "call spUpdSucursal ("+clave+",'" + sucursal + "', '" + ubicacion + "', '" + telefono + "', '" + paterno + "', '" + materno + "', '" + nombre + "');";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string delSucursal(int clave)
    {
        string CadSql = "call spDelSucursal ("+clave+");";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string insSurte(int producto, 
                            int proveedor)
    {
        string CadSql = "call spInsSurte ("+producto+", "+proveedor+");";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string updSurte(int producto, 
                            int proveedor)
    {
        string CadSql = "call spUpdSurte (" + producto + ", " + proveedor + ");";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string delSurte(int producto, 
                            int proveedor)
    {
        string CadSql = "call spDelSurte (" + producto + ", " + proveedor + ");";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string insProducto(string nombre, 
                                string modelo, 
                                string marca, 
                                int precio)
    {
        string CadSql = "call spInsProducto('"+nombre+"', '"+modelo+"', '"+marca+"', "+precio+");";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string updProducto(int clave, 
                                string nombre, 
                                string modelo, 
                                string marca, 
                                int precio)
    {
        string CadSql = "call spUpdProducto("+clave+",'"+ nombre + "', '" + modelo + "', '" + marca + "', " + precio + ");";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string delProducto(int clave)
    {
        string CadSql = "call spDelProducto("+clave+");";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();
        return bandera;
    }

    [WebMethod]
    public string insAlmacena(int cve_producto,
                                    int cve_sucursal,
                                    int stock)
    {
        string CadSql = "call spInsAlmacena('" + cve_producto.ToString() + "','" + cve_sucursal.ToString() + "','"
           + stock.ToString() + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string updAlmacena(int cve_producto,
                                    int cve_sucursal,
                                    int stock)
    {
        string CadSql = "call spUpdAlmacena('" + cve_producto.ToString() + "','" + cve_sucursal.ToString() + "','"
           + stock.ToString() + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string delAlmacena(int cve_producto, int cve_sucursal)
    {
        string CadSql = "call spDelAlmacena('" + cve_producto.ToString() + "','" + cve_sucursal.ToString() + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string insProveedor(string telefono,
                                    string nombre,
                                    string apellido_pa,
                                    string apellido_ma,
                                    int codigo_postal,
                                    string calle,
                                    string colonia,
                                    string ciudad,
                                    int dir_numero)
    {
        string CadSql = "call spInsProveedor('" + telefono + "','" + nombre + "','"
           + apellido_pa + "','" + apellido_ma + "','" + codigo_postal.ToString() + "','"
           + calle + "','" + colonia + "','" + ciudad + "','" + dir_numero.ToString()
           + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string updProveedor(int clave,
                                    string telefono,
                                    string nombre,
                                    string apellido_pa,
                                    string apellido_ma,
                                    int codigo_postal,
                                    string calle,
                                    string colonia,
                                    string ciudad,
                                    int dir_numero)
    {
        string CadSql = "call spUpdProveedor('" + clave.ToString() + "','" + telefono + "','" + nombre + "','"
           + apellido_pa + "','" + apellido_ma + "','" + codigo_postal.ToString() + "','"
           + calle + "','" + colonia + "','" + ciudad + "','" + dir_numero.ToString()
           + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string delProveedor(int clave)
    {
        string CadSql = "call spDelProveedor('" + clave.ToString() + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string insCliente(string telefono,
                                    string correo,
                                    string nombre,
                                    string apellido_pa,
                                    string apellido_ma,
                                    int codigo_postal,
                                    string calle,
                                    string colonia,
                                    string ciudad,
                                    int dir_numero)
    {
        string CadSql = "call spInsCliente('" + telefono + "','" + correo + "','" + nombre + "','"
           + apellido_pa + "','" + apellido_ma + "','" + codigo_postal.ToString() + "','"
           + calle + "','" + colonia + "','" + ciudad + "','" + dir_numero.ToString()
           + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string updCliente(int clave,
                                string telefono,
                                string correo,
                                string nombre,
                                string apellido_pa,
                                string apellido_ma,
                                int codigo_postal,
                                string calle,
                                string colonia,
                                string ciudad,
                                int dir_numero)
    {
        string CadSql = "call spUpdCliente('" + clave.ToString() + "','" + telefono + "','" + correo + "','"
           + nombre + "','" + apellido_pa + "','" + apellido_ma + "','" + codigo_postal.ToString() + "','"
           + calle + "','" + colonia + "','" + ciudad + "','" + dir_numero.ToString()
           + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public string delCliente(int clave)
    {
        string CadSql = "call spDelCliente('" + clave.ToString() + "');";

        MySqlConnection myConn = new MySqlConnection(CadConn);
        // Creación del objeto tipo comando de sql
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        // Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader myDr = myCmd.ExecuteReader();
        // Ya se tienen los datos en el mysqldatareades. se migraran a un datatable
        myDr.Read();
        string bandera = myDr.GetValue(0).ToString();
        myConn.Close();

        return bandera;
    }
    [WebMethod]
    public DataTable spQryProductoFiltrado(string nombre)
    {
        string CadSql = "call spQryProductoFiltrado('" + nombre + "');";
        MySqlConnection myConn = new MySqlConnection(CadConn);
        MySqlCommand myCmd = new MySqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandType = CommandType.Text;
        myCmd.CommandText = CadSql;
        //Ejecutar el comando y verificar el retorno de datos
        myConn.Open();
        MySqlDataReader mDr = myCmd.ExecuteReader();
        //ya se tienen los datos en el mysqlreader, se migran a un datatable
        DataTable MyDT = new DataTable("QryProductoFiltrado");
        MyDT.Columns.Add("clave producto", typeof(int));
        MyDT.Columns.Add("nombre", typeof(string));
        MyDT.Columns.Add("modelo", typeof(string));
        MyDT.Columns.Add("marca", typeof(string));
        MyDT.Columns.Add("precio", typeof(int));
        //Recorrer el datareader para extraer los datos y migrarlos al datatable
        while (mDr.Read() == true)
        {
            DataRow row = MyDT.NewRow();
            row["clave producto"] = mDr.GetValue(0);
            row["nombre"] = mDr.GetValue(1);
            row["modelo"] = mDr.GetValue(2);
            row["marca"] = mDr.GetValue(3);
            row["precio"] = mDr.GetValue(4);
            //agregar el datarow al datatable
            MyDT.Rows.Add(row);
        }
        //en este momento, MyDt ya tiene todos los registros almacenados

        myConn.Close();
        return MyDT;
    }

    public Service()
    {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

}
