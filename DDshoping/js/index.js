var UserName=null;
function Initial()
{
    //初始化函数，获取用户id
	var str = window.location.search;   //location.search是从当前URL的?号开始的字符串  
    if(str.indexOf("username=")!=-1)
    {
        var s=str.indexOf("username=")+"username=".length;
        var e=str.length;
        UserName=(str.substring(s,e));
        
    }
	if(UserName!=null)//已登录
    {
        document.getElementById("id_index").href="index.aspx?username="+UserName;
        document.getElementById("id_userinfo").href="userinfo.aspx?username="+UserName;
		document.getElementById("id_setting").href="help.aspx?username="+UserName;
        document.getElementById("id_userinfo").parentElement.style="display:block;";
		document.getElementById("id_login").parentElement.style="display:none;";
		document.getElementById("id_register").parentElement.style="display:none;"
    }
    else//未登录
    {
        document.getElementById("id_index").href="index.aspx";
        //document.getElementById("id_userinfo").href="userlogin.aspx";
        document.getElementById("id_userinfo").parentElement.style="display:none;";
		document.getElementById("id_userlogin").parentElement.style="display:none;"
    }
	LoadBook(0);  
}
function GotoPay(){
	if(UserName==null)
	{
		window.location.href = "userlogin.aspx";
		return;
	}
    var booklist=document.getElementById("cart-list");
    count=booklist.getElementsByClassName("cart-book").length;
    var postdata = "&bookids=";
    for(var i=0;i<count;i++)
    {
        var bookitem=booklist.getElementsByClassName("cart-book")[i];
        var bookid=bookitem.id;
        postdata+=bookid;
        if(i!=count-1)
        {
            postdata+=",";
        }
        

    }

                //alert('成功获取');
                window.location.href="shoppingcart.aspx?username="+UserName+postdata;
                
            
}
function AddtoCart(bookname,bookid){
	if(UserName==null)
	{
		window.location.href = "userlogin.aspx";
		return;
	}
    var cart_list_item_str="<li id=\"cart_"+bookid+"\" class=\"cart-book\" style=\"position: relative;margin-bottom:2px;\">"
    +"<p class=\"cart-item-name\" id=\""+bookid+"\">"+bookname+"</p>"
    +"<span class=\"shoppingcart_btn_delete \" name=\"Delete\" dd_name=\"删除商品\" onclick=\"javascript:RemoveFromCart('cart_"+bookid+"')\" >删除商品</span>"
    +"</li>";
    document.getElementById("cart-list").innerHTML+=cart_list_item_str;
}
function RemoveFromCart(a)
{
    document.getElementById("cart-list").removeChild(document.getElementById(a));
}

function LoadBook(a){
    //alert("!!!!");
    //type=0 获取所有书籍
    //type=1 获取指定书籍
    //清空显示的所有书籍
    
    document.getElementById("ihome-booklist").innerHTML="";
    var postdata = "type="+a;
    if(a==1)
    {
        //有指定的书籍
        if(document.getElementById("search-textbox").value!="")
            postdata+="&word="+document.getElementById("search-textbox").value;
        else//当指定书籍为空时
        postdata = "type=0";
    }
    
    
    $.ajax({
        type: 'post',
        url: 'HandlerIndex.ashx',
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

                var c_li=document.createElement("li");
                c_li.className="bookitem";
                
                
                var c_li_a=document.createElement("a");
                c_li_a.title=book_id;
                var c_li_a_img=document.createElement("img");
                c_li_a_img.src=book_img;
                c_li_a_img.style="height:200px;background-size: 100% auto";
                
                var c_li_p_booktitle=document.createElement("p");
                c_li_p_booktitle.className="booktitle";
                var c_li_p_booktitle_a=document.createElement("a");
                c_li_p_booktitle_a.innerText=book_name;
                c_li_p_booktitle_a.title=book_name;

                var c_li_p_bookprice=document.createElement("p");
                c_li_p_bookprice.className="bookprice";
                var c_li_p_bookprice_span=document.createElement("span");
                c_li_p_bookprice_span.className="search-now-prize";
                c_li_p_bookprice_span.innerText=book_price;

                var c_li_p_bookdetails=document.createElement("p");
                c_li_p_bookdetails.className="bookdetails";
                c_li_p_bookdetails.innerText=book_introduction;

                var c_li_span_btn_cart_str="<span class='search_btn_cart' onclick=\"javascript:AddtoCart('"+book_name+"','"+book_id+"')\">加入购物车</span>";

                c_li_a.appendChild(c_li_a_img);
                c_li_p_booktitle.appendChild(c_li_p_booktitle_a);
                c_li_p_bookprice.appendChild(c_li_p_bookprice_span);
                c_li.appendChild(c_li_a);
                c_li.appendChild(c_li_p_booktitle);
                c_li.appendChild(c_li_p_bookprice);
                c_li.appendChild(c_li_p_bookdetails);
                c_li.innerHTML=c_li.innerHTML+c_li_span_btn_cart_str;

                document.getElementById("ihome-booklist").appendChild(c_li);


            }
            
        },
        error: function () {
            alert('获取书籍发生错误!');
        }
    }
        );
}
