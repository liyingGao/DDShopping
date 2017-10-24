function RegisterCheck(){
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
	if (document.getElementById("txtUserrepeatpwd").value=='')
	{
		alert("请再次输入密码！");
		return;
	}
	else if(document.getElementById("txtUserrepeatpwd").value != document.getElementById("txtUserpwd").value)
	{
		alert("密码不一致！");
		return;
	}
	if (document.getElementById("txtUseremail").value=='')
	{
		alert("请输入邮箱");
		return;
	}
	if (document.getElementById("txtUserphone").value=='')
	{
		alert("请输入联系电话");
		return;
	}
	if (document.getElementById("txtUseraddress").value=='')
	{
		alert("请输入收货地址");
		return;
	}

    var postdata = "type=register&username="+document.getElementById("txtUsername").value+
	"&password="+document.getElementById("txtUserpwd").value
	+"&email="+document.getElementById("txtUseremail").value
	+"&phone="+document.getElementById("txtUserphone").value
	+"&address="+document.getElementById("txtUseraddress").value;
	
    $.ajax({
        type: 'post',
        url: 'HandleUserRegister.ashx',
        data: postdata,
        async: true,
        success: function (result) {
            if (result == "0") {
                //验证成功
                alert('用户名已注册');
				
            }
            else if (result == "1")
                alert('注册成功');
			else if (result == "2")
                alert('密码错误，请重新输入');
            
        },
        error: function () {
            alert('发生错误!请检查网络');
        }
    }
        );
}
