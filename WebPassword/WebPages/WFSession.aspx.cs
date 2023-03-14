using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPassword.WSPassword;

namespace WebPassword.WebPages
{
    public partial class WFSession : System.Web.UI.Page
    {
        // objeto de conexion al servicio Web
        private WSPassword.WebServicePasswordSoapClient passwordCliente = new WebServicePasswordSoapClient();
       
        protected void Page_Load(object sender, EventArgs e)
        {

            // Para obtener el valor de la variable de sesión:
            WSPassword.ClienteDTO clienteSession = (WSPassword.ClienteDTO)HttpContext.Current.Session["SessionPassword"];
            if (clienteSession != null)
            {
                this.labelNombreUser.Text = "Hola " + clienteSession.Nombres;
            }
            else 
            {
                this.labelNombreUser.Text = "Hola ";
            }


            if (!IsPostBack)
            {
                // Crear un arreglo con datos de prueba
                var datos = new[]
                {
            new { Id = 1, Nombre = "Juan", Apellido = "Pérez" },
            new { Id = 2, Nombre = "María", Apellido = "García" },
            new { Id = 3, Nombre = "Carlos", Apellido = "Ruiz" }
                };

                // Enlazar el control GridView al arreglo
                GridView1.DataSource = datos;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Obtener los datos de la fila editada
            var id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            var nombre = e.NewValues["Nombre"].ToString();
            var apellido = e.NewValues["Apellido"].ToString();

            // Actualizar el arreglo con los datos editados
            // (en lugar de modificar directamente la base de datos)
            var datos = (IEnumerable<dynamic>)GridView1.DataSource;
            var filaEditada = datos.FirstOrDefault(x => x.Id == id);
            if (filaEditada != null)
            {
                filaEditada.Nombre = nombre;
                filaEditada.Apellido = apellido;
            }

            // Finalizar la edición y volver a enlazar el control GridView al arreglo actualizado
            GridView1.EditIndex = -1;
            GridView1.DataSource = datos;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Obtener el ID de la fila a eliminar
            var id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

            // Eliminar la fila del arreglo
            // (en lugar de modificar directamente la base de datos)
            var datos = (IEnumerable<dynamic>)GridView1.DataSource;
            var filaEliminada = datos.FirstOrDefault(x => x.Id == id);
            if (filaEliminada != null)
            {
                var nuevosDatos = datos.Except(new[] { filaEliminada });
                GridView1.DataSource = nuevosDatos;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ShowPassword")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                TextBox txtApellido = (TextBox)row.FindControl("txtApellido");
                Button btnShowPassword = (Button)row.FindControl("btnShowPassword");

                if (txtApellido.TextMode == TextBoxMode.Password)
                {
                    txtApellido.TextMode = TextBoxMode.SingleLine;
                    btnShowPassword.Text = "Ocultar";
                }
                else
                {
                    txtApellido.TextMode = TextBoxMode.Password;
                    btnShowPassword.Text = "Mostrar";
                }
            }
        }

        protected void btnGeneratePass_Click(object sender, EventArgs e)
        {
            bool caracteresEsp = chkSpecialChars1.Checked;
            bool numeros = chkNumbers.Checked;
            int longitud = int.Parse(txtLength.Value.ToString());
            String password = this.passwordCliente.GenerarPassword(longitud, numeros, caracteresEsp);
            this.txtGeneratedPassword1.Text = password;
        }

        protected void btnCopy1_Click(object sender, EventArgs e)
        {
            String password = this.passwordCliente.GenerarPasswordFacilRecordar();
            this.txtGeneratedPassword1.Text = password;
        }
    }
}