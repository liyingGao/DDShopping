<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userregister.aspx.cs" Inherits="DDshoping.userregister" %>

<!DOCTYPE html>

<html>
        <head>
            <meta http-equiv=Content-Type content="text/html;charset=utf-8">
            <link href="./css/userregister.css" rel="stylesheet" type="text/css"> 
            <script src="./js/jquery-3.2.1.js" type= "text/javascript"></script>
            <script src="./js/userregister.js" type= "text/javascript"></script>
            <title>叮叮&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</title>
        </head>
        <body style="margin:0px;background-color:#fff;">
            <div id="search-bar">
                <a id="logo"><font style="font-family:verdana">D.&nbsp;D.&nbsp;&nbsp;&nbsp;&nbsp;</font>|&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</a>
                    <div id="userbar">
                        <ul class="aside-list">
                            <li><a href="index.aspx" class="toindex">叮叮首页</a></li>
                            <li><a href="userlogin.aspx" class="toindex">登录</a></li>
                            <li><a href="http://www.baidu.com/" class="toindex">设置</a></li>
                            <li><a href="userlogin.aspx" class="toindex">退出</a></li>
                        </ul>
                    </div>
                </div>
            <div id="wgt-banner"></div>
            <div id="body-register">
                <div id="registerbody">
                    <div id="registercorewrap">
                        <p>用户注册</p>
                    </div>
                    <div id="register_username" class="registertextbox">
                        <span></span>
                        <input class="user" id="txtUsername" name="txtUsername" type="text" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="用户名">
                    </div>
                    <div id="register_userpwd" class="registertextbox">
                            <span></span>
                            <input class="user" id="txtUserpwd" name="txtUserpwd" type="password" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="密码">
                    </div>
                    <div id="register_repeat_userpwd" class="registertextbox">
                            <span></span>
                            <input class="user" id="txtUserrepeatpwd" name="txtUserpwd" type="password" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="重复密码">
                    </div>
                     <div id="register_address" class="registertextbox">
                            <span></span>
                            <input class="user" id="txtUseremail" name="email" type="text" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="邮箱">
                    </div>
                    <div id="register_email" class="registertextbox">
                        <span></span>
                        <input class="user" id="txtUserphone" name="phone" type="text" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="联系电话">
                    </div>
                    <div id="register_telephone" class="registertextbox">
                        <span></span>
                        <input class="user" id="txtUseraddress" name="address" type="text" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1" placeholder="收货地址">
                    </div>
                    <p class="btn">
                        <a onclick="RegisterCheck()"id="submintbtn">注&nbsp;册</a>      
                    </p>
                    
                </div>
            </div>

        </body>
        </html>
