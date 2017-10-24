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
                     <li><a  id="id_userlogin" href="userlogin.aspx" class="toindex">退出</a></li>
                </ul>
                </div>
            </div>
        <div id="wgt-banner">
        </div>
   

        <div id="body-userandorder">
            <p id="user_name">
                    这是一个叮叮网上购书系统的用户帮助手册。主要是对本网上书店的一些介绍，使用户能快速了解叮叮网上书店。
            </p>
            <div id="iname-order-title">
                    <span class="title">前台系统</span>
                </div>
            <div style="width:100%; height:28px">

            </div>
            <div id="ihome-user" style="margin-left:60px">
                <p>
                    1． 图书浏览：普通用户和会员可以对图书进行浏览。在页面上，应向用户显示书籍信息，用户进行查
                    询之后，应能显示含有该关键字的实际书籍（如果有）的信息：书籍图片、书籍名称、市场价、书籍
                    描述，并能添加到购物车。</p><p>
        2． 购物车：购物车中要列出用户所选择的书籍，跟图书浏览在图一个界面，这样更加方便用户选择删除还是支付购买，
                    用户可以：</p><p>
        &nbsp;&nbsp; 1)	删除购物车中的书籍；</p><p>
         &nbsp;&nbsp; 2)	结算：到结算页面下修改书籍数目，结算并下订单。</p><p>
        3． 用户信息：在个人中心界面可以显示“我的个人信息”并可以修改更新，显示我的订单信息。</p><p>
        4． 订单生成与管理：购物后，确认支付和配送方法后生成订单。在生成订单的同时，系统发邮件通知书店管理员。
    会员还可以查询自己订单的处理情况和历史订单。
验证合法的用户可查看在网站上成交的订单，包括订单的个数，总计金额，订单的列表。列表项包括：
    订单号、订单日期、收货人、书籍名、书籍数目、订单金额、订单状态，收货人地址和联系方式。
                </p>
            </div>
            <div id="iname-order-title">
                    <span class="title">后台系统</span>
                </div>
            <div style="width:100%; height:28px">

            </div>
            <div id="ihome-user" style="margin-left:60px">
            <p>
                1． 用户管理：主要包括用户注册、用户登录和用户信息修改。网上书店的用户主要有两个：普通用户、会员和管理员。普通用户可以通过注册成为书店会员。每个注册会员，有一个属于自已的帐户管理界面，可以轻松的管理个人基本资料，如进行资料的修改。书店管理员可以对个人基本信息进行修改，并拥有系统的所有功能权限。
            </p><p>
                2． 图书管理：管理员可以对图书进行添加、修改和删除，普通用户和会员可以对图书进行浏览和查询。在页面上，应向用户显示书籍类别，用户选择了某个类别之后，应能显示该类别下的实际书籍（如果有）的信息：书籍图片、书籍名称、价格，当书籍数目过多时，要提供分页浏览功能。
            </p><p>
                3． 购书管理：普通用户和会员都可以对图书进行查询，会员可以把要买的书添加到购物车里，还可以将购物车里不想买的书删除。
            </p><p>
                4． 订单管理：会员购物后，确认支付和配送方法后生成订单。会员还可以查询自己订单的处理情况和历史订单。管理员可查看在网站上成交的订单列表项，列表项包括：订单ID，下单人，书籍信息、数量，下单时间、订单金额、订单状态，联系方式和收货地址。对于列表的订单，管理员可以：
            </p><p>
                （1）	删除订单：对未审核的订单进行删除。
            </p><p>
                （2）	更新订单：更新订单状态和收货人的相关信息。
            </p>
            </div>
        <p id="tail">
    </body>
</html>