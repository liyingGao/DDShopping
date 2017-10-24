function LoginCheck(){
    //alert("!!!!");
	if (document.getElementById("txtUsername").value=='')
	{
		alert("用户名不能为空！");
		return;
	}
	if (document.getElementById("txtUserpwd").value=='')
	{
		alert("密码不能为空！");
		return;
	}
    //type=0 获取所有书籍
    //type=1 获取指定书籍
    var postdata = "type=login&username="+document.getElementById("txtUsername").value+
	"&password="+document.getElementById("txtUserpwd").value;
    $.ajax({
        type: 'post',
        url: 'HandleUserLogin.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            if (result == "0") {
                //验证成功
                //alert('登录成功');
				window.location.href = "index.aspx?username="+ document.getElementById("txtUsername").value;
            }
            else if(result=="4")
            {
                window.location.href="Management.aspx"?manager="+ document.getElementById("txtUsername").value;
            }
            else if (result == "1")
                alert('无此用户，请注册');
			else if (result == "2")
                alert('密码错误，请重新输入');
            
        },
        error: function () {
            alert('发生错误!请检查网络');
        }
    }
        );
}
