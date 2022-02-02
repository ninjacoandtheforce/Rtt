using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rtt.Web.Attributes;

namespace Rtt.Web.Attributes
{
    public class ShortDescriptionAttribute : Attribute
    {
        public string ShortDescription;

        [Help(@"For use in the DocumentType enum")]
        public ShortDescriptionAttribute(string shortDescription)
        {
            ShortDescription = shortDescription;
        }
    }
}