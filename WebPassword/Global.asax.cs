﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebPassword
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);     
        }

        void Session_Start(object sender, EventArgs e)
        {
            // ******como guardar la Sesión de usuario******
            // Habilitar las variables de sesión
            // Crear variable de sesión en el evento Session_Start
            Session["SessionPassword"] = null;
        }


    }
}