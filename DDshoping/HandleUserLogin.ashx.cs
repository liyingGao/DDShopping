using SQLTest;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DDshoping
{
    /// <summary>
    /// HandleUserLogin 的摘要说明
    /// </summary>
    public class HandleUserLogin : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Form[0] == "login")
            {
                Login(context.Request.Form[1], context.Request.Form[2], context);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public void Login(String username,String password, HttpContext context)
        {
            //Console.WriteLine("hello");
            SQL sql = new SQL();
            sql.Connect();
            DataSet DS = new DataSet();

            DS = sql.SendInfo("select * from userinfo where user_name = '" + username + "'");
            if (DS.Tables[0].Rows.Count==1)
            {
                if(DS.Tables[0].Rows[0].ItemArray[2].ToString().Trim()== password)
                {
                    if (DS.Tables[0].Rows[0].ItemArray[6].ToString().Trim() == "管理员")
                    {
                        context.Response.Write("4");
                    }
                    else
                    {
                        context.Response.Write("0");
                    }
                }
                else
                    context.Response.Write("2"); // password error!
            }
            else
                context.Response.Write("1"); // no user
            sql.Close();
            DS = null;
        }
    }
}