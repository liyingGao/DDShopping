using SQLTest;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DDshoping
{
    /// <summary>
    /// HandleUserRegister 的摘要说明
    /// </summary>
    public class HandleUserRegister : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Form[0] == "register")
            {
                Register(context.Request.Form[1], context.Request.Form[2], context.Request.Form[3],
                    context.Request.Form[4], context.Request.Form[5], context);
            }
        }
        public void Register(String username, String password, String email,String phone, String address ,HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            DataSet DS = new DataSet();
            DS = sql.SendInfo("select * from userinfo where user_name = '" + username + "'");
            if(DS != null)
            {
                Console.Write("not null!");
            }
            if(DS.Tables[0].Rows.Count>0)
            {
                Console.Write("not null!2");
                context.Response.Write("0"); //repeat user
            }
            else
            {
                DS = sql.SendInfo("select MAX(user_id) from userinfo");
                String maxID = DS.Tables[0].Rows[0].ItemArray[0].ToString().Trim();
                int user_id = int.Parse(maxID);
                user_id++;
                String sqlmm = "insert into userinfo values(" + user_id + ",'" + username + "','" + password + "','" + email +
                    "','" + phone + "','" + address + "','"+"普通用户"+"')";
                Console.WriteLine(sqlmm);
                DS = sql.SendInfo(sqlmm);
                context.Response.Write("1");//register success！
                DS = null;
                sql.Close();
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}