using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rtt.ErrorHandler
{
    public static class ErrorHandler
    {
        public static void LogException(Exception e)
        {
            LogFactory.Logger().Error(e);
        }

        public static void LogMessage(string message)
        {
            LogFactory.Logger().Info(message);
        }
    }
}
