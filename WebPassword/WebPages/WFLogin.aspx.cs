using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPassword.WSPassword;

namespace WebPassword.WebPages
{
    
    public partial class WebForm1 : System.Web.UI.Page
    {
        //private WS_PassWord.WS_PassWordSoapClient passwordClient = new WS_PassWord.WS_PassWordSoapClient();
        private WSPassword.WebServicePasswordSoapClient passwordClient = new WebServicePasswordSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void BtnNewRegistro_Click(object sender, EventArgs e)
        {
            Response.Redirect("WFRegister.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //declaramos un objeto de tipo cliente que sera recibido desde el web service
            WSPassword.ClienteDTO cliente;
            // obtenemos el email y contraseñas desde el web form
            string email=this.txtRegUsernam.Text;
            string password = this.txtRegPassword1.Text;
            //envio las credenciales al WS y recibo una respuesta del mismo
           cliente = this.passwordClient.AccesoUsuario(email, password);

            if (cliente != null)
            // si el cliente Existe guardo su información y comienzo la sesión
            {
               
                // para recuperar la variable desde cualquier pagina
                //WS_PassWord.ClienteDTO clienteSesion = (WS_PassWord.ClienteDTO)Session["_SesionPassword"];

                // Para guardar un valor en la variable de sesión:
                HttpContext.Current.Session["SesionPassword"] = cliente;
                // Redirigir a la página principal de sesion

                Response.Redirect("WFSession.aspx");

            }
            else
            {
                // mensaje de alerta de credenciales incorrectas
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Credenciales Incorrectas, intentalo de nuevo.');", true);
                
            }
        }
    }
}