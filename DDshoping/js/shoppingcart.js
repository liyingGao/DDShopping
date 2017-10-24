var UserName = null;
var ordernumber=0;
function Initial(){
    var str = window.location.search;   //location.search是从当前URL的?号开始的字符串  
    if(str.indexOf("username=")!=-1)
    {
        var s=str.indexOf("username=")+"username=".length;
        var e=str.indexOf("&",s);
        UserName=(str.substring(s,e));
    }
	if(UserName!=null)//已登录
    {
        document.getElementById("id_index").href="index.aspx?username="+UserName;
        document.getElementById("id_userinfo").href="userinfo.aspx?username="+UserName;
		document.getElementById("id_setting").href="help.aspx?username="+UserName;
    }
	if(str.indexOf("bookids=")!=-1)
    {
        var s=str.indexOf("bookids=")+"bookids=".length;
        var e=str.length;
        var cart_list=(str.substring(s,e));
        
        postdata="type=gotopay&"+cart_list;
        $.ajax({
            type: 'post',
            url: 'HandlerShoppingCart.ashx',
            data: postdata,
            async: true,
            success: function (result) {
                //alert('成功获取');
                var strs=new Array();
                result=result.substring(2,result.length-2);
                strs=result.split("},{");
                for(var i=0;i<strs.length;i++)
                {
                    var items=new Array();
                    items=strs[i].split(",");
                    var book_id=items[0].substring(1,items[0].length-1);
                    var book_name=items[1].substring(1,items[1].length-1);
                    var book_type=items[2].substring(1,items[2].length-1);
                    var book_date=items[3].substring(1,items[3].length-1);
                    var book_price=items[4].substring(1,items[4].length-1);
                    var book_count=items[5].substring(1,items[5].length-1);
                    var book_img=items[6].substring(1,items[6].length-1);
                    var book_introduction=items[7].substring(1,items[7].length-1);
                    var book_author=items[8].substring(1,items[8].length-1);

                    var li_str="<li class=\"orderitem\">"+
                    "<img src=\""+book_img+"\" class=\"orderitem-img\"></img>"+
                    "<p title=\""+book_id+"\" class=\"booktitle\">"+
                    "<a title=\" "+book_id+"\">"+book_name+"</a>"+
                    "</p>"+
                    "<p class=\""+book_price+"\">"+
                    "<span class=\"amount-fn-updatecount\" >"+
                    "<a style=\"cursor:default;\" onclick=\"javascript:ChangeValue(0,this)\">-</a>"+
                    "<input onchange=\"javascript:ChangeValue(2,this)\"  value=\"1\" type=\"text\" >"+
                    "<a style=\"cursor:default;\" onclick=\"javascript:ChangeValue(1,this)\">+</a>"+
                    "</span>"+
                    "</p>"+
                    "<p class=\"bookuintprice\">"+
                    "<a>"+book_price+"</a>"+
                    "</p>"+
                    "<p class=\"booktotalprice\">"+
                    "<a>"+book_price+"</a>"+
                    "</p>"+
                    "</li>";

                    document.getElementById("ihome-orderlist").innerHTML+=li_str;

    
                }
                CalTotal();
            },
            error: function () {
                alert('获取书籍发生错误!');
                history.back(-1);
            }
        }
            );
    }
}
function ChangeValue(a,b)
{
    var t=b.parentNode;
    t=t.parentNode;
    t=t.parentNode;
    var bookid=t.getElementsByClassName("booktitle")[0].title;
    var bookcount=b.parentNode.childNodes[1].value;
    if(a==1)
        bookcount++;
    else if(a==0)
    {
        bookcount--;
        if(bookcount<1)
            bookcount=1;
    }
    else if(a==2)
    {
        ;//看着变
    }
    b.parentNode.childNodes[1].value=bookcount;
    t.childNodes[4].value=bookcount*t.childNodes[3].innerText;
    t.childNodes[4].innerText=bookcount*t.childNodes[3].innerText;
    CalTotal();//计算总价格
}

function CalTotal()
{
    var TotalPay=0;
    var ul_pay=document.getElementById("ihome-orderlist");

    for(var i=0;i<ul_pay.children.length;i++)
    {
        var li_pay=ul_pay.children[i];
        TotalPay+=Number(li_pay.children[4].innerText);
    }
    document.getElementById("payAmount").innerText=TotalPay;
}

function Pay()
{
    var pay_ul=document.getElementById("ihome-orderlist");
    for(var i=0;i<pay_ul.children.length;i++)
    {
        var pay_li=pay_ul.children[i];
        var order_owner=UserName;
        var order_totalprice=pay_li.children[4].innerText;
        var order_bookname=pay_li.children[1].innerText;
        var order_count=pay_li.childNodes[2].childNodes[0].childNodes[1].value
        
        postdata="type=pay&onwer="+order_owner+"&bookname="+order_bookname+"&totalprize="+order_totalprice+"&count="+order_count;
        $.ajax({
            type: 'post',
            url: 'HandlerShoppingCart.ashx',
            data: postdata,
            async: true,
            success: function (result) {
                if(result == "1")
                {
					ordernumber++;
					if(ordernumber == pay_ul.children.length)
						alert('订单交付成功！');
                    
                }
            },
            error: function () {
                alert('发送订单发生错误!');
            }
        }
            );
    }
}