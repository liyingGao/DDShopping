function Initial(){
    document.getElementById("ihome-custumor").style.display="none";
    document.getElementById("ihome-book").style.display="none";
    document.getElementById("ihome-order").style.display="none";
    
}
function GetAllCustumor(){
    document.getElementById("ihome-custumor").style.display="";
    document.getElementById("ihome-book").style.display="none";
    document.getElementById("ihome-order").style.display="none";
    document.getElementById("ihome-custumorlist").innerHTML="";
    var postdata="type=getallcustumor";
    $.ajax({
    type: 'post',
    url: 'HandlerManagement.ashx',
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
            var user_id=items[0].substring(1,items[0].length-1);
            var user_name=items[1].substring(1,items[1].length-1);
            var user_pwd=items[2].substring(1,items[2].length-1);
            var user_email=items[3].substring(1,items[3].length-1);
            var user_phone=items[4].substring(1,items[4].length-1);
            var user_address=items[5].substring(1,items[5].length-1);
			if(user_name == "admin" && user_pwd == "admin")
				continue;
            var html_str="";
            html_str="<li class=\"custumoritem\"><p class=\"custumor-item-userid\"><a>"+
            user_id+"</a></p><p class=\"custumor-item-username\">"+
            "<input type=\"text\" class=\"custumor-item-username-input\"value=\""+user_name+"\"/>"+
            "</p><p class=\"custumor-item-userpwd\"><input type=\"text\" class=\"custumor-item-userpwd-input\"value=\""+user_pwd+"\"/>"+
            "</p><p class=\"custumor-item-email\"><input type=\"text\" class=\"custumor-item-email-input\"value=\""+user_email+"\"/>"+
            "</p><p class=\"custumor-item-phone\"><input type=\"text\" class=\"custumor-item-phone-input\"value=\""+user_phone+"\"/>"+
            "</p><p class=\"custumor-item-address\"><input type=\"text\" class=\"custumor-item-address-input\"value=\""+user_address+"\"/>"+
            "</p><p class=\"custumor-item-control\">"+
            "<span class=\"custumor-item-control-update\" onclick=\"javascript:UpdateCustumor(this)\">更新</span>"+
            "<span class=\"custumor-item-control-delete\" onclick=\"javascript:DeleteCustumor(this)\">删除</span>"+
            "</p></li>";
            document.getElementById("ihome-custumorlist").innerHTML+=html_str;
        }
    },
    error: function () {
    alert('获取用户信息错误');
    }
    }
    );
}
function GetAllBook(){
    
    document.getElementById("ihome-custumor").style.display="none";
    document.getElementById("ihome-book").style.display="";
    document.getElementById("ihome-order").style.display="none";
    document.getElementById("ihome-booklist").innerHTML="";
    

    var postdata="type=getallbook";
    $.ajax({
    type: 'post',
    url: 'HandlerManagement.ashx',
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
            var book_id=items[0].substring(1,items[0].length-1);
            var book_name=items[1].substring(1,items[1].length-1);
            var book_type=items[2].substring(1,items[2].length-1);
            var book_date=items[3].substring(1,items[3].length-1);
            var book_price=items[4].substring(1,items[4].length-1);
            var book_count=items[5].substring(1,items[5].length-1);
            var book_img=items[6].substring(1,items[6].length-1);
            var book_introduction=items[7].substring(1,items[7].length-1);
            var book_author=items[8].substring(1,items[8].length-1);

            var html_str="";
            html_str="<li class=\"bookitem\"><p class=\"book-item-bookid\"><a>"+
            book_id+"</a></p><p class=\"book-item-bookname\">"+
            "<input type=\"text\" class=\"book-item-bookname-input\"value=\""+book_name+"\"/>"+
            "</p><p class=\"book-item-type\"><input type=\"text\" class=\"book-item-type-input\"value=\""+book_type+"\"/>"+
            "</p><p class=\"book-item-date\"><input type=\"text\" class=\"book-item-date-input\"value=\""+book_date+"\"/>"+
            "</p><p class=\"book-item-price\"><input type=\"text\" class=\"book-item-price-input\"value=\""+book_price+"\"/>"+
            "</p><p class=\"book-item-count\"><input type=\"text\" class=\"book-item-count-input\"value=\""+book_count+"\"/>"+
            "</p><p class=\"book-item-introduction\"><input type=\"text\" class=\"book-item-introduction-input\"value=\""+book_introduction+"\"/>"+
            "</p><p class=\"book-item-author\"><input type=\"text\" class=\"book-item-author-input\"value=\""+book_author+"\"/>"+
            "</p><p class=\"book-item-control\">"+
            "<span class=\"book-item-control-update\" onclick=\"javascript:UpdateBook(this)\">更新</span>"+
            "<span class=\"book-item-control-delete\" onclick=\"javascript:DeleteBook(this)\">删除</span>"+
            "</p></li>";
            document.getElementById("ihome-booklist").innerHTML+=html_str;
        }
        var html_str="";
        html_str="<li class=\"bookitem\"><p class=\"book-item-bookid\"><a>"+"</a></p><p class=\"book-item-bookname\">"+
        "<input type=\"text\" class=\"book-item-bookname-input\"value=\""+"\"/>"+
        "</p><p class=\"book-item-type\"><input type=\"text\" class=\"book-item-type-input\"value=\""+"\"/>"+
        "</p><p class=\"book-item-date\"><input type=\"text\" class=\"book-item-date-input\"value=\""+"\"/>"+
        "</p><p class=\"book-item-price\"><input type=\"text\" class=\"book-item-price-input\"value=\""+"\"/>"+
        "</p><p class=\"book-item-count\"><input type=\"text\" class=\"book-item-count-input\"value=\""+"\"/>"+
        "</p><p class=\"book-item-introduction\"><input type=\"text\" class=\"book-item-introduction-input\"value=\""+"\"/>"+
        "</p><p class=\"book-item-author\"><input type=\"text\" class=\"book-item-author-input\"value=\""+"\"/>"+
        "</p><p class=\"book-item-control\">"+
        "<span class=\"book-item-control-update\" style=\"margin-left:20px;\" onclick=\"javascript:AddBook(this)\">新增</span>"+
        "</p></li>";
        document.getElementById("ihome-booklist").innerHTML+=html_str;
    },
    error: function () {
    alert('获取书籍信息错误');
    }
    }
    );
}
function GetAllOrder(){
    document.getElementById("ihome-custumor").style.display="none";
    document.getElementById("ihome-book").style.display="none";
    document.getElementById("ihome-order").style.display="";
    document.getElementById("ihome-orderlist").innerHTML="";
    var postdata="type=getallorder";
    $.ajax({
    type: 'post',
    url: 'HandlerManagement.ashx',
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
            var order_orderid=items[0].substring(1,items[0].length-1);
            var order_orderowner=items[1].substring(1,items[1].length-1);
            var order_bookname=items[2].substring(1,items[2].length-1);
            var order_orderstatus=items[3].substring(1,items[3].length-1);
            var order_ordercount=items[4].substring(1,items[4].length-1);
            var order_orderprize=items[5].substring(1,items[5].length-1);
            var order_ordertime=items[6].substring(1,items[6].length-1);
            var order_orderphone=items[7].substring(1,items[7].length-1);
            var order_orderaddress=items[8].substring(1,items[8].length-1);
            var order_orderpicture=items[9].substring(1,items[9].length-1);
            var order_orderintroduction=items[10].substring(1,items[10].length-1);


            var html_str="";
            html_str="<li class=\"orderitem\"><p class=\"order-item-orderid\"><a>"+
            order_orderid+"</a></p><p class=\"order-item-orderowner\">"+
            "<input type=\"text\" class=\"order-item-orderowner-input\"value=\""+order_orderowner+"\"/>"+
            "</p><p class=\"order-item-bookname\"><input type=\"text\" class=\"order-item-bookname-input\"value=\""+order_bookname+"\"/>"+
            "</p><p class=\"order-item-status\"><input type=\"text\" class=\"order-item-status-input\"value=\""+order_orderstatus+"\"/>"+
            "</p><p class=\"order-item-count\"><input type=\"text\" class=\"order-item-count-input\"value=\""+order_ordercount+"\"/>"+
            "</p><p class=\"order-item-time\"><input type=\"text\" class=\"order-item-time-input\"value=\""+order_ordertime+"\"/>"+
            "</p><p class=\"order-item-phone\"><input type=\"text\" class=\"order-item-phone-input\"value=\""+order_orderphone+"\"/>"+
            "</p><p class=\"order-item-address\"><input type=\"text\" class=\"order-item-address-input\"value=\""+order_orderaddress+"\"/>"+
            "</p><p class=\"order-item-control\">"+
            "<span class=\"order-item-control-update\" onclick=\"javascript:UpdateOrder(this)\">更新</span>"+
            "<span class=\"order-item-control-delete\" onclick=\"javascript:DeleteOrder(this)\">删除</span>"+
            "</p></li>";
            document.getElementById("ihome-orderlist").innerHTML+=html_str;
        }
    },
    error: function () {
    alert('获取用户信息错误');
    }
    }
    );
}

function UpdateCustumor(a)
{
    var li_custumor=a.parentNode.parentNode;
    var custumor_id=li_custumor.children[0].innerText;
    var custumor_username=li_custumor.children[1].children[0].value;
    var custumor_userpwd=li_custumor.children[2].children[0].value;
    var custumor_email=li_custumor.children[3].children[0].value;
    var custumor_phone=li_custumor.children[4].children[0].value;
    var custumor_address=li_custumor.children[5].children[0].value;

    var postdata="type=updatecustumor&userid="+custumor_id+"&username="+custumor_username+"&userpwd="+custumor_userpwd+
                    "&email="+custumor_email+"&phone="+custumor_phone+"&address="+custumor_address;


    $.ajax({
        type: 'post',
        url: 'HandlerManagement.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            //alert('成功获取');
            alert('更新用户信息成功');
            GetAllCustumor()//更新列表
        },
        error: function () {
            alert('更新用户信息错误');
        }
    }
        );


}
function DeleteCustumor(a)
{
    var li_custumor=a.parentNode.parentNode;
    var custumor_id=li_custumor.children[0].innerText;
    
    var postdata="type=deletecustumor&userid="+custumor_id;

    $.ajax({
    type: 'post',
    url: 'HandlerManagement.ashx',
    data: postdata,
    async: true,
    success: function (result) {
    //alert('成功获取');
    alert('删除用户成功');
    GetAllCustumor();//更新列表
    },
    error: function () {
    alert('删除用户错误');
    }
    }
    );

}
function UpdateBook(a)
{
    var li_book=a.parentNode.parentNode;
    var book_id=li_book.children[0].innerText;
    var book_bookname=li_book.children[1].children[0].value;
    var book_booktype=li_book.children[2].children[0].value;
    var book_bookdate=li_book.children[3].children[0].value;
    var book_bookprice=li_book.children[4].children[0].value;
    var book_bookcount=li_book.children[5].children[0].value;
    var book_bookintroduction=li_book.children[6].children[0].value;
    var book_bookauthor=li_book.children[7].children[0].value;

    var postdata="type=updatebook&bookid="+book_id+
                "&bookname="+book_bookname+
                "&booketpye="+book_booktype+
                "&bookdate="+book_bookdate+
                "&bookprice="+book_bookprice+
                "&bookcount="+book_bookcount+
                "&bookintroduction="+book_bookintroduction+
                "&bookauthor="+book_bookauthor;
    $.ajax({
        type: 'post',
        url: 'HandlerManagement.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            //alert('成功获取');
            alert('更新书籍成功');
            GetAllBook()//更新列表
        },
        error: function () {
            alert('更新书籍错误');
        }
    }
        );
}
function DeleteBook(a)
{
    var li_book=a.parentNode.parentNode;
    var book_id=li_book.children[0].innerText;
    var postdata="type=deletebook&bookid="+book_id;
    
        $.ajax({
        type: 'post',
        url: 'HandlerManagement.ashx',
        data: postdata,
        async: true,
        success: function (result) {
        //alert('成功获取');
        alert('删除书籍成功');
        GetAllBook();//更新列表
        },
        error: function () {
        alert('删除书籍错误');
        }
        }
        );
}
function AddBook(a)
{
    var li_book=a.parentNode.parentNode;
    var book_id=li_book.children[0].innerText;
    var book_bookname=li_book.children[1].children[0].value;
    var book_booktype=li_book.children[2].children[0].value;
    var book_bookdate=li_book.children[3].children[0].value;
    var book_bookprice=li_book.children[4].children[0].value;
    var book_bookcount=li_book.children[5].children[0].value;
    var book_bookintroduction=li_book.children[6].children[0].value;
    var book_bookauthor=li_book.children[7].children[0].value;

    var postdata="type=addbook&bookid="+book_id+
                "&bookname="+book_bookname+
                "&booketpye="+book_booktype+
                "&bookdate="+book_bookdate+
                "&bookprice="+book_bookprice+
                "&bookcount="+book_bookcount+
                "&bookintroduction="+book_bookintroduction+
                "&bookauthor="+book_bookauthor;
    $.ajax({
        type: 'post',
        url: 'HandlerManagement.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            //alert('成功获取');
            alert('更新书籍成功');
            GetAllBook()//更新列表
        },
        error: function () {
            alert('更新书籍错误');
        }
    }
        );
}
function UpdateOrder(a)
{
    var li_order=a.parentNode.parentNode;
    var order_orderid=li_order.children[0].innerText;
    var order_orderowner=li_order.children[1].children[0].value;
    var order_bookname=li_order.children[2].children[0].value;
    var order_status=li_order.children[3].children[0].value;
    var order_count=li_order.children[4].children[0].value;
    var order_time=li_order.children[5].children[0].value;
    var order_phone=li_order.children[6].children[0].value;
    var order_address=li_order.children[7].children[0].value;

    var postdata="type=updateorder&orderid="+order_orderid+
                "&orderowner="+order_orderowner+
                "&bookname="+order_bookname+
                "&status="+order_status+
                "&count="+order_count+
                "&timet="+order_time+
                "&phone="+order_phone+
                "&address="+order_address;
    $.ajax({
        type: 'post',
        url: 'HandlerManagement.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            //alert('成功获取');
            alert('更新订单成功');
            GetAllOrder()//更新列表
        },
        error: function () {
            alert('更新订单错误');
        }
    }
        );
}
function DeleteOrder(a)
{
    var li_order=a.parentNode.parentNode;
    var order_orderid=li_order.children[0].innerText;
    var postdata="type=deleteorder&orderid="+order_orderid;
    
        $.ajax({
        type: 'post',
        url: 'HandlerManagement.ashx',
        data: postdata,
        async: true,
        success: function (result) {
        //alert('成功获取');
        alert('删除订单成功');
        GetAllOrder();//更新列表
        },
        error: function () {
        alert('删除订单错误');
        }
        }
        );
}