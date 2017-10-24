<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo.aspx.cs" Inherits="DDshoping.userinfo" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv=Content-Type content="text/html;charset=utf-8">
        <link href="./css/userinfo.css" rel="stylesheet" type="text/css"> 
        <script src="./js/jquery-3.2.1.js" type= "text/javascript"></script>
        <script src="./js/userinfo.js" type= "text/javascript"></script>
        <title>叮叮&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</title>

    </head>
            
    <body style="margin:0px;background-color:#f3f3f3;" onload="Initial()">
        <div id="search-bar">
            <a id="logo"><font style="font-family:verdana">D.&nbsp;D.&nbsp;&nbsp;&nbsp;&nbsp;</font>|&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</a>
                <div id="userbar">
                    <ul class="aside-list">
                         <li><a id="id_index" href="index.aspx" class="toindex">叮叮首页</a></li>
                     <li style="display:none;"><a id="id_userinfo" href="userinfo.aspx" class="toindex">个人中心</a></li>
                     <li><a id="id_setting" href="help.aspx" class="toindex">帮助</a></li>
                     <li><a  id="id_userlogin" href="userlogin.aspx" class="toindex">退出</a></li>
                </ul>
                </div>
            </div>
        <div id="wgt-banner">
        </div>
   

        <div id="body-userandorder">
            <div id="iname-order-title">
                    <span class="title">我的个人信息</span>
                </div>
            <div style="width:100%; height:28px">

            </div>
            <div id="ihome-user" style="margin-left:60px">
                <a title="测试"><img src='./img/myself.jpg'/></a>
                
                <p id="user_name">会员 <font id="font_username" style="font-size:30px;font-family:黑体;font-weight:bold;color:blue;"></font> 您好</p>
                <p id="user_email">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input class="input_text" id="input_email" type="text" /></p>
                <p id="user_phone">电&nbsp;&nbsp;&nbsp;&nbsp;话：<input class="input_text" id="input_tele" type="text" /></p>
                <p id="user_location">地&nbsp;&nbsp;&nbsp;&nbsp;址：<input class="input_text" id="input_address" type="text" /></p>
                <span id="user_update" onclick="UpdateUserInfo()">更新个人信息</span>
                <br />
                <!-- update database-->
            </div>
            
            <div id="ihome-order">
                <div id="ihome-order-title">
                    <span class="title">我的订单</span>
                </div>
                <div id="itemheader">
                    <p class="iteminfo">
                        <a>商品信息</a>
                    </p>
                    <p class="itemcount">
                        <a>数量</a>
                    </p>
                    <p class="itemuintprize">
                        <a>单价</a>
                    </p>
                    <p class="itemtotalprize">
                        <a>总价</a>
                    </p>
                    <p class="itemdate">
                        <a>订单产生日期</a>
                    </p>
                    <p class="itemstatus">
                        <a>订单状态</a>
                    </p>
                </div>
                <ul id="ihome-orderlist">
                    <p class="booktitle"> <a>软件工程</a><a>软件开发工作者和学习者的一部好书</a></p>
                    <!--<li class="orderitem">
                        <img src="./img/testbook1.jpg" class="orderitem-img"></img>
                        <p class="booktitle">
                            <a title=" 绘本123每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</a>
                        </p>
                        <p class="bookaccount"><a>1</a></p>
                        <p class="bookuintprice"><a>34.00</a></p>
                        <p class="booktotalprice"><a>72.00</a></p>
                        <p class="bookstatus">
                            <a>正在派送</a>
                        </p>
                        
                    </li>
                    <li class="orderitem">
                            <img src="./img/testbook1.jpg" class="orderitem-img"></img>
                            <p class="booktitle">
                                <a title=" 绘本123每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</a>
                            </p>
                            <p class="bookaccount">
                                <a>1</a>
                            </p>
                            <p class="bookuintprice">
                                    <a>34.00</a>
                            </p>
                            <p class="booktotalprice">
                                    <a>72.00</a>
                            </p>
                            <p class="bookstatus">
                                <a>正在派送</a>
                            </p>
                            
                    </li>
                    -->
                </ul>
            </div>
            
        </div>
        <p id="tail">
    </body>
</html>
