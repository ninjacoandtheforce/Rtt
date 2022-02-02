using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Rtt.Wcf.DataContracts;

namespace Rtt.Web.Utilities
{
    public class ExceptionUtility
    {
        public static void LogExceptionAndNotifyOps(Exception exc, string requestUrl, [CallerFilePath] string source = "", [CallerMemberName] string method = "")
        {
            var body = "";
            try
            {
                body = LogException(exc, requestUrl);
            }
            catch (Exception ex)
            {
                //Welp
                NotifySystemOps($@"Cannot access the log file.  Exception thrown {ex.Message}");
            }
            NotifySystemOps(body);
        }

        public static string LogException(Exception exc, string requestUrl,
            [CallerFilePath] string source = "", [CallerMemberName] string method = "")
        {
            return LogExceptionAsync(exc, requestUrl).Result;
        }

        public static string LogException(Exception exc, int userId, string requestUrl,
            [CallerFilePath] string source = "", [CallerMemberName] string method = "")
        {
            return LogExceptionAsync(exc, userId, requestUrl).Result;
        }


        // Log an Exception 
        public static async Task<string> LogExceptionAsync(Exception exc, string requestUrl, [CallerFilePath] string source = "", [CallerMemberName] string method = "")
        {
            // Include enterprise logic for logging exceptions 
            // Get the absolute path to the log file 
            string logFile = "~/App_Data/ErrorLog.txt";
            logFile = HttpContext.Current.Server.MapPath(logFile);

            // Open the log file for append and write the log
            //var sw = new StreamWriter(logFile, true);
            var sb = new StringBuilder();
            sb.AppendLine();
            sb.AppendLine($"********** {DateTime.Now} **********");

            sb.Append("HttpRequest.Url: ");
            sb.AppendLine(requestUrl);
            sb.Append("Logged in User name: ");
            sb.AppendLine("System");
            sb.Append("Exception Type: ");
            sb.AppendLine(exc.GetType().ToString());
            sb.AppendLine("Exception: " + exc.Message);
            sb.AppendLine("Source: " + source);
            sb.AppendLine("Method: " + method);
            sb.AppendLine("Stack Trace: ");
            if (exc.StackTrace != null)
            {
                sb.AppendLine(exc.StackTrace);
                sb.AppendLine();
            }
            if (exc.InnerException != null)
            {
                sb.Append("Inner Exception Type: ");
                sb.AppendLine(exc.InnerException.GetType().ToString());
                sb.Append("Inner Exception: ");
                sb.AppendLine(exc.InnerException.ToString());
                sb.Append("Inner Source: ");
                sb.AppendLine(exc.InnerException.Source);
                if (exc.InnerException.StackTrace != null)
                {
                    sb.AppendLine("Inner Stack Trace: ");
                    sb.AppendLine(exc.InnerException.StackTrace);
                }
            }

            await Task.FromResult(WriteTextAsync(logFile, sb.ToString()));

            return sb.ToString();
        }

        public static async Task<string> LogExceptionAsync(Exception exc, int userId, string requestUrl, [CallerFilePath] string source = "", [CallerMemberName] string method = "")
        {
            // Include enterprise logic for logging exceptions 
            // Get the absolute path to the log file 
            string logFile = "~/App_Data/ErrorLog.txt";
            logFile = HttpContext.Current.Server.MapPath(logFile);

            // Open the log file for append and write the log
            //var sw = new StreamWriter(logFile, true);
            var sb = new StringBuilder();
            sb.AppendLine();
            sb.AppendLine($"********** {DateTime.Now} **********");

            sb.Append("HttpRequest.Url: ");
            sb.AppendLine(requestUrl);
            sb.Append("Logged in User name: ");
            sb.AppendLine("System");
            sb.Append("Exception Type: ");
            sb.AppendLine(exc.GetType().ToString());
            sb.AppendLine("Exception: " + exc.Message);
            sb.AppendLine("Source: " + source);
            sb.AppendLine("Method: " + method);
            sb.AppendLine("Stack Trace: ");
            if (exc.StackTrace != null)
            {
                sb.AppendLine(exc.StackTrace);
                sb.AppendLine();
            }
            if (exc.InnerException != null)
            {
                sb.Append("Inner Exception Type: ");
                sb.AppendLine(exc.InnerException.GetType().ToString());
                sb.Append("Inner Exception: ");
                sb.AppendLine(exc.InnerException.ToString());
                sb.Append("Inner Source: ");
                sb.AppendLine(exc.InnerException.Source);
                if (exc.InnerException.StackTrace != null)
                {
                    sb.AppendLine("Inner Stack Trace: ");
                    sb.AppendLine(exc.InnerException.StackTrace);
                }
            }

            await Task.FromResult(WriteTextAsync(logFile, sb.ToString()));

            return sb.ToString();
        }

        public static string LogExceptionFromApiAsync(Exception exc, string username, string dealerName, string requestUrl, [CallerFilePath] string source = "", [CallerMemberName] string method = "")
        {
            // Include enterprise logic for logging exceptions 
            // Get the absolute path to the log file 
            string logFile = "~/App_Data/ErrorLog.txt";
            logFile = HttpContext.Current.Server.MapPath(logFile);

            // Open the log file for append and write the log
            //var sw = new StreamWriter(logFile, true);
            var sb = new StringBuilder();
            sb.AppendLine();
            sb.AppendLine($"********** {DateTime.Now} **********");

            sb.Append("HttpRequest.Url: ");
            sb.AppendLine(requestUrl);
            sb.Append("Logged in User name: ");
            sb.AppendLine(username);
            sb.Append("Dealer name: ");
            sb.AppendLine(dealerName);
            sb.Append("Exception Type: ");
            sb.AppendLine(exc.GetType().ToString());
            sb.AppendLine("Exception: " + exc.Message);
            sb.AppendLine("Source: " + source);
            sb.AppendLine("Method: " + method);
            sb.AppendLine("Stack Trace: ");
            if (exc.StackTrace != null)
            {
                sb.AppendLine(exc.StackTrace);
                sb.AppendLine();
            }
            if (exc.InnerException != null)
            {
                sb.Append("Inner Exception Type: ");
                sb.AppendLine(exc.InnerException.GetType().ToString());
                sb.Append("Inner Exception: ");
                sb.AppendLine(exc.InnerException.ToString());
                sb.Append("Inner Source: ");
                sb.AppendLine(exc.InnerException.Source);
                if (exc.InnerException.StackTrace != null)
                {
                    sb.AppendLine("Inner Stack Trace: ");
                    sb.AppendLine(exc.InnerException.StackTrace);
                }
            }

            byte[] encodedText = Encoding.UTF8.GetBytes(sb.ToString());

            using (var sourceStream = new FileStream(logFile,
                FileMode.Append, FileAccess.Write, FileShare.None,
                bufferSize: 4096, useAsync: true))
            {
                sourceStream.WriteAsync(encodedText, 0, encodedText.Length);
            };

            return sb.ToString();
        }

        static async Task WriteTextAsync(string filePath, string text)
        {
            byte[] encodedText = Encoding.UTF8.GetBytes(text);

            using (var sourceStream = new FileStream(filePath,
                FileMode.Append, FileAccess.Write, FileShare.None,
                bufferSize: 4096, useAsync: true))
            {
                await sourceStream.WriteAsync(encodedText, 0, encodedText.Length);
            };
        }

        private static void NotifySystemOps(string body)
        {
            var request = new EmailRequest
            {
                Subject = "Exception Encountered",
                Body = body,
                ToRecipients = new List<string> { "jaco@ninjaco.co.za" },
                HasAttachment = false,
                ShouldSend = true,
                ////RequestDateTime = DateTime.Now,
            };

            Task.Factory.StartNew(() =>
            {
                //NotifySystemOpsOfException(request);
            });
        }
    }
}