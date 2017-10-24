var UserName=null;
function Initial(){
    //初始化函数，获取用户id
	var str = window.location.search;   //location.search是从当前URL的?号开始的字符串  
    if(str.indexOf("username=")!=-1)
    {
        var s=str.indexOf("username=")+"username=".length;
        var e=str.length;
        UserName=(str.substring(s,e));
    }
    if(UserName!=null)
    {
        document.getElementById("id_index").href="index.aspx?username="+UserName;
        document.getElementById("id_userinfo").href="userinfo.aspx.aspx?username="+UserName;
        //document.getElementById("id_userinfo").parentElement.style="display:block;"
		document.getElementById("font_username").innerText=UserName;
		document.getElementById("id_setting").href="help.aspx?username="+UserName;
    }
	var postdata = "type=userinfo&username="+UserName;
	$.ajax({
        type: 'post',
        url: 'HandlerUserinfo.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            var array = new Array();
			array = result.split('&');
                //验证成功
			document.getElementById("user_email").childNodes[1].value= array[0];
			document.getElementById("user_phone").childNodes[1].value= array[1];
			document.getElementById("user_location").childNodes[1].value= array[2];
            //alert('登录成功');
				//window.location.href = "index.aspx?username="+ UserName;
            getOrder();
        },
        error: function () {
            alert('发生错误!请检查网络');
        }
    }
        );

}
function getOrder()
{
	var postdata = "type=userorder&username="+UserName;
	$.ajax({
        type: 'post',
        url: 'HandlerUserinfo.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            var strs=new Array();
            result=result.substring(2,result.length-2);
            strs=result.split("},{");
            for(var i=0;i<strs.length;i++)
            {
				
                var items=new Array();
                items=strs[i].split(",");
                var book_img=items[9].substring(1,items[9].length-1);
                var book_name=items[2].substring(1,items[2].length-1);
                var book_date=items[6].substring(1,items[6].length-1);
                var book_status=items[3].substring(1,items[3].length-1);
                var book_price=items[5].substring(1,items[5].length-1);
                var book_count=items[4].substring(1,items[4].length-1);
				var book_description=items[10].substring(1,items[10].length-1);
				var str = "";
				str = "<li class=\"orderitem\">" + 
				"<img src=\""+book_img+"\" class=\"orderitem-img\"></img>" + 
				" <p class=\"booktitle\">" +
				" <a>"+book_name+"<br>"+book_description+"</a></p>" +
				"<p class=\"bookaccount\"><a>"+book_count+"</a></p>"+
				"<p class=\"bookuintprice\"><a>"+Number(book_price)/Number(book_count)+"</a></p>"+
				"<p class=\"booktotalprice\"><a>"+book_price+"</a></p>"+
				"<p class=\"bookorderdate\"><a>"+book_date+"</a></p>"+
				"<p class=\"bookstatus\"><a>"+book_status+"</a></p></li>";
				document.getElementById("ihome-orderlist").innerHTML+=str;
            }
        },
        error: function () {
            alert('发生错误!请检查网络');
        }
    }
        );
	
}
function UpdateUserInfo(){
    
    var email=document.getElementById("user_email").childNodes[1].value;
    var phone=document.getElementById("user_phone").childNodes[1].value;
    var address=document.getElementById("user_location").childNodes[1].value;
    var postdata = "type=updateuserinfo&username="+UserName+"&email="+email+"&phone="+phone+"&address="+address;
	$.ajax({
        type: 'post',
        url: 'HandlerUserinfo.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            if(result=="true")
            {
                window.location.href="userinfo.aspx?username="+UserName;
            }
            else
            {
                alert("输入字符超限");
            }
        },
        error: function () {
            alert('发生错误!请检查网络');
        }
    }
        );
}
