using System;
using System.Configuration;
using System.IO;

namespace Starter_.NET_4._8_NG_18.App_Data
{
    public class Logger
    {
        private static string logPath = ConfigurationManager.AppSettings["logPath"];

        public static void Log(string message)
        {
            try
            {
                using (StreamWriter file = new StreamWriter(logPath, true))
                {
                    file.WriteLine($"Log - {DateTime.Now.ToString()} - {message}");
                }
            }
            catch (Exception exLog)
            {
                //check folder permissions
                throw exLog;
            }
        }

        public static void Error(string message, Exception ex = null)
        {
            try
            {
                string logPath = ConfigurationManager.AppSettings["logPath"];
                using (StreamWriter file = new StreamWriter(logPath, true))
                {
                    file.WriteLine($"Error - {DateTime.Now.ToString()} - {message} :: {ex?.ToString()}");
                }
            }
            catch (Exception exLog)
            {
                //check folder permissions
                throw exLog;
            }
        }
    }
}