<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="DDshoping.userlogin" %>

<!DOCTYPE html>

<html>
<head>

    <meta http-equiv=Content-Type content="text/html;charset=utf-8">
    <link href="./css/userlogin.css" rel="stylesheet" type="text/css"> 
    <script src="./js/jquery-3.2.1.js" type= "text/javascript"></script>
    <script src="./js/userlogin.js" type= "text/javascript"></script>
    <title>叮叮&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</title>
</head>

<body style="margin:0px;background-color:#fff;">
    <div id="search-bar">
        <a id="logo"><font style="font-family:verdana">D.&nbsp;D.&nbsp;&nbsp;&nbsp;&nbsp;</font>|&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</a>
            <div id="userbar">
                <ul class="aside-list">
                    <li><a href="index.aspx" class="toindex">叮叮首页</a></li>
                    <li><a href="userregister.aspx" class="toindex">注册</a></li>
                </ul>
            </div>
        </div>
    <form action="post" method="post">
    <div id="wgt-banner"></div>
    <div id="body-logoandlogin">
        <div id="mainlogo">
         <img src="./img/biglogo.jpg">
        </div>
        <div id="loginbody">
            <div id="logincorewrap">
                <p>密码登录</p>
            </div>
            <div id="login_username" class="logintextbox">
                <span></span>
                <input class="user" id="txtUsername" name="username" type="text" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="用户名">
            </div>
            <div id="login_userpwd" class="logintextbox">
                    <span></span>
                    <input class="user" id="txtUserpwd" name="pswd" type="password" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="密码">
            </div>
            
            <p class="btn">
            	<a onclick="LoginCheck()" id="submintbtn">登&nbsp;录</a>
                <a id="registerbtn" href="./userregister.aspx">立即注册</a>           
            </p>
        </div>
    </div>
</form>


</body>
</html> 
