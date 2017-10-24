using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DDshoping
{
    /// <summary>
    /// HandlerIndex 的摘要说明
    /// </summary>
    public class HandlerIndex : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Form[0] == "0")
            {
                GetAllBook(context);
            }
            else if (context.Request.Form[0] == "1")
            {
                GetSelectedBook(context.Request.Form[1],context);
            }
            
        }
        
        private void GetSelectedBook(string word,HttpContext context)
        {
            string returnstr = "{";
            SQLTest.SQL sql = new SQLTest.SQL();
            sql.Connect();
            DataSet ds =
            sql.SendInfo("select * from book where book_name like '%"+word+"%'");
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
        }
        private void GetAllBook(HttpContext context)
        {
            string returnstr = "{";
            SQLTest.SQL sql = new SQLTest.SQL();
            sql.Connect();
            DataSet ds=
            sql.SendInfo("select * from book");
            try {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    returnstr = returnstr + "{";
                    for (int j = 0; j < ds.Tables[0].Rows[i].ItemArray.Count(); j++)
                    {
                        returnstr = returnstr + "\"" + ds.Tables[0].Rows[i].ItemArray[j].ToString().Trim()+"\"";
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