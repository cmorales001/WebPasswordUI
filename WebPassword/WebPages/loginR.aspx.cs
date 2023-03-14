using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPassword
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int length = int.Parse(txtLength.Value);
            bool includeSpecialChars = chkSpecialChars.Checked;
            bool includeDigits = chkDigits.Checked;
            bool includeUpperCase = chkUpperCase.Checked;
        }
    }
}