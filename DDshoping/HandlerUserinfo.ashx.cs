using SQLTest;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DDshoping
{
    /// <summary>
    /// HandlerUserinfo 的摘要说明
    /// </summary>
    public class HandlerUserinfo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Form[0] == "userinfo")
                getUserinfo(context.Request.Form[1], context);
            else if (context.Request.Form[0] == "userorder")
                getUserOrder(context.Request.Form[1], context);
            else if (context.Request.Form[0] == "updateuserinfo")
            {
                UpdateUserInfo(context.Request.Form[1], context.Request.Form[2], context.Request.Form[3], context.Request.Form[4], context);
            }
        }
        private void UpdateUserInfo(string username, string email, string phone, string address, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            DataSet ds = new DataSet();
            ds = sql.SendInfo("update userInfo set user_email='"+email+"' ,user_phone='"+phone+"',user_address='"+address+"' where user_name='"+username+"'");
            sql.Close();
            ds = null;
            context.Response.Write("true");
        }

        public void getUserOrder(String username, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            System.Data.DataSet ds = new System.Data.DataSet();
            ds = sql.SendInfo("select * from bookorder where orderowner = '" + username + "'");
            String returnstr = "";
            try
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    returnstr = returnstr + "{";
                    for (int j = 0; j < ds.Tables[0].Rows[i].ItemArray.Count(); j++)
                    {
                        returnstr = returnstr + "\"" + ds.Tables[0].Rows[i].ItemArray[j].ToString().Trim() + "\"";
                        if (j != ds.Tables[0].Rows[i].ItemArray.Count() - 1)
                        {
                            returnstr = returnstr + ",";
                        }
                    }
                    returnstr = returnstr + "}";
                    if (i != ds.Tables[0].Rows.Count - 1)
                    {
                        returnstr = returnstr + ",";
                    }
                }
                returnstr = returnstr + "}";
                context.Response.Write(returnstr);
            }
            catch (Exception e)
            {
                ;
            }
            ds = null;
            sql.Close();
        }

        public void getUserinfo(String username, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            System.Data.DataSet DS = new System.Data.DataSet();
            DS = sql.SendInfo("select * from userinfo where user_name = '" + username + "'");
            if (DS.Tables[0].Rows.Count == 1)
            {
                String userIF = DS.Tables[0].Rows[0].ItemArray[3].ToString().Trim() + "&" +
                     DS.Tables[0].Rows[0].ItemArray[4].ToString().Trim() + "&" +
                     DS.Tables[0].Rows[0].ItemArray[5].ToString().Trim();
                context.Response.Write(userIF); // success
            }
            DS = null;
            sql.Close();
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