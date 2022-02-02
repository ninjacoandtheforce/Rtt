using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rtt.Web.Attributes
{
    public class XslNameAttribute : Attribute
    {
        public string XslName;
        public XslNameAttribute(string xslName)
        {
            XslName = xslName;
        }
    }
}