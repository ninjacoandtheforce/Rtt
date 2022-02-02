using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rtt.Web.Extensions;

namespace Rtt.Web
{
    public partial class AddAContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Error(object sender, EventArgs e)
        {
            var ex = Server.GetLastError();
            this.HandleException(ex, false);
        }
    }
}