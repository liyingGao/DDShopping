using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DDshoping
{
    /// <summary>
    /// HandlerShoppingCart 的摘要说明
    /// </summary>
    public class HandlerShoppingCart : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Form[0] == "gotopay")
            {
                GoToPay(context);
            }
            else if (context.Request.Form[0] == "pay")
            {
                Pay(context.Request.Form[1], context.Request.Form[2], context.Request.Form[3], context.Request.Form[4], context);
            }
        }
        private void GoToPay(HttpContext context)
        {
            string bookstr = context.Request.Form[1];
            bookstr = bookstr.Substring(0, bookstr.Length );
            string[] books = bookstr.Split(',');
            //这里的books都是id
            //根据id封装好书籍信息传递到真正的购物车里
            string returnstr = "{";
            for (int i = 0; i < books.Length; i++)
            {
                string id = books[i].Substring(5,books[i].Length-5);
                string str =GetBookInfoById(id);
                if (str != null)
                {
                    returnstr = returnstr + str;
                }
                if (i != books.Length - 1)
                {
                    returnstr += ",";
                }

            }
            returnstr += "}";
            context.Response.Write(returnstr);


        }
        private string GetBookInfoById(string id)
        {
            string returnstr = "";
            SQLTest.SQL sql = new SQLTest.SQL();
            sql.Connect();
            DataSet ds =
            sql.SendInfo("select * from book where book_id='" + id + "'");
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

                return returnstr;
            }
            catch (Exception e)
            {
                ;
            }
            return null;
        }
        private void Pay(string owner, string bookname, string totalprize, string count, HttpContext context)
        {
            SQLTest.SQL sql = new SQLTest.SQL();
            sql.Connect();
            //构造
            DataSet ds = sql.SendInfo("select MAX(orderid) from bookorder");
            String maxorderID = ds.Tables[0].Rows[0].ItemArray[0].ToString().Trim();
            int order_id = int.Parse(maxorderID);
            order_id++;
            String orderTime = DateTime.Now.ToShortDateString().ToString();
            ds = sql.SendInfo("select * from userinfo where user_name = '" + owner + "'");
            String ownertele = ds.Tables[0].Rows[0].ItemArray[4].ToString().Trim();
            String ownerlocation = ds.Tables[0].Rows[0].ItemArray[5].ToString().Trim();

            ds = sql.SendInfo("select * from book where book_name = '" + bookname + "'");
            String picture = ds.Tables[0].Rows[0].ItemArray[6].ToString().Trim();
            String bookdescription = ds.Tables[0].Rows[0].ItemArray[7].ToString().Trim();

            String str = "insert into bookorder values(" + order_id + ",'" + owner + "','" + bookname + "','已下单',"
                + count + "," + totalprize + ",'" + orderTime + "','" + ownertele + "','" + ownerlocation + "','" + picture
                + "','" + bookdescription + "'"+")";
            sql.SendInfo(str);
            context.Response.Write("1"); //添加到数据库成功
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