using SQLTest;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DDshoping
{
    /// <summary>
    /// HandlerManagement 的摘要说明
    /// </summary>
    public class HandlerManagement : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Form[0] == "getallcustumor")
            {
                GetAllCustumor(context);
            }
            else if (context.Request.Form[0] == "updatecustumor")
            {

                UpdateCustumor(context.Request.Form[1], context.Request.Form[2], context.Request.Form[3], context.Request.Form[4], context.Request.Form[5], context.Request.Form[6], context);
            }
            else if (context.Request.Form[0] == "deletecustumor")
            {

                DeleteCustumor(context.Request.Form[1], context);
            }
            else if (context.Request.Form[0] == "getallbook")
            {
                GetAllBook(context);
            }
            else if (context.Request.Form[0] == "updatebook")
            {
                UpdateBook(context.Request.Form[1], context.Request.Form[2], context.Request.Form[3], context.Request.Form[4]
                    , context.Request.Form[5], context.Request.Form[6], context.Request.Form[7], context.Request.Form[8], context);
            }
            else if (context.Request.Form[0] == "deletebook")
            {
                DeleteBook(context.Request.Form[1], context);
            }
            else if (context.Request.Form[0] == "addbook")
            {
                AddBook(context.Request.Form[1], context.Request.Form[2], context.Request.Form[3], context.Request.Form[4]
                    , context.Request.Form[5], context.Request.Form[6], context.Request.Form[7], context.Request.Form[8], context);
            }
            else if (context.Request.Form[0] == "getallorder")
            {
                GetAllOrder(context);
            }
            else if (context.Request.Form[0] == "updateorder")
            {
                UpdateOrder(context.Request.Form[1], context.Request.Form[2], context.Request.Form[3], context.Request.Form[4]
                    , context.Request.Form[5], context.Request.Form[6], context.Request.Form[7], context.Request.Form[8], context);
            }
            else if (context.Request.Form[0] == "deleteorder")
            {
            }
        }
        private void GetAllCustumor(HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            DataSet ds =
            sql.SendInfo("select * from userinfo");
            string returnstr = "{";
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
            sql.Close();
            ds = null;
        }
        private void UpdateCustumor(string id, string name, string pwd, string email, string phone, string address, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            string sqlstr = "update userInfo set user_name='" + name + "',user_password='" + pwd + "',user_email='" + email + "',user_phone='" + phone + "',user_address='" + address + "' where user_id=" + id;
            DataSet ds = sql.SendInfo(sqlstr);
            context.Response.Write("true");
            sql.Close();
            ds = null;
        }
        private void DeleteCustumor(string id, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            string sqlstr = "delete from userInfo where user_id=" + id;
            DataSet ds = sql.SendInfo(sqlstr);
            context.Response.Write("true");
            sql.Close();
            ds = null;
        }

        private void GetAllBook(HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            DataSet ds =
            sql.SendInfo("select * from book");
            string returnstr = "{";
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
            sql.Close();
            ds = null;
        }

        private void UpdateBook(string id, string name, string type, string date, string price, string count, string introduction, string author, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            string sqlstr = "update book set book_name='" + name + "',book_类别='" + type + "',book_data='" + date + "',book_price=" + price + ",book_count=" + count + ",图片URL='" + "bookURL/" + name + ".png" + "',简介='" + introduction + "',book_author='" + author + "' where book_id=" + id;
            DataSet ds = sql.SendInfo(sqlstr);
            context.Response.Write("true");
            sql.Close();
            ds = null;
        }
        private void DeleteBook(string id, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            string sqlstr = "delete from book where book_id=" + id;
            DataSet ds = sql.SendInfo(sqlstr);
            context.Response.Write("true");
            sql.Close();
            ds = null;
        }
        private void AddBook(string id, string name, string type, string date, string price, string count, string introduction, string author, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();

            DataSet DS = sql.SendInfo("select MAX(book_id) from book");
            String maxID = DS.Tables[0].Rows[0].ItemArray[0].ToString().Trim();
            int book_id = int.Parse(maxID);
            book_id++;
            string sqlstr = "insert into book values(" + book_id + ",'" + name + "','" + type + "','" + date + "'," + price + "," + count + ",'" + "bookURL/" + name + ".png" + "','" + introduction + "','" + author + "')";
            DataSet ds = sql.SendInfo(sqlstr);
            context.Response.Write("true");
            sql.Close();
            ds = null;
        }
        private void GetAllOrder(HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            DataSet ds =
            sql.SendInfo("select * from bookorder");
            string returnstr = "{";
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
            sql.Close();
            ds = null;
        }

        private void UpdateOrder(string id, string owner, string bookname, string status, string count, string time, string phone, string address, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            string sqlstr = "update bookorder set orderowner='" + owner + "',bookname='" + bookname + "',orderstatus='" + status + "',ordercount=" + count + ",ordertime='" + time + "',ordertele='" + phone + "',orderaddress='" + address + "' where orderid=" + id;
            DataSet ds = sql.SendInfo(sqlstr);
            context.Response.Write("true");
            sql.Close();
            ds = null;
        }
        private void DeleteOrder(string id, HttpContext context)
        {
            SQL sql = new SQL();
            sql.Connect();
            string sqlstr = "delete from bookorder where orderid=" + id;
            DataSet ds = sql.SendInfo(sqlstr);
            context.Response.Write("true");
            sql.Close();
            ds = null;
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