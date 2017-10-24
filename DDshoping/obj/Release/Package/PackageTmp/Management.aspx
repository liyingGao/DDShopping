<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="DDshoping.Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv=Content-Type content="text/html;charset=utf-8">
    <link href="./css/management.css" rel="stylesheet" type="text/css"> 
    <script src="./js/jquery-3.2.1.js" type= "text/javascript"></script>
    <script src="./js/management.js" type= "text/javascript"></script>
<title>管理中心</title>
</head>
<body style="margin:0px;background-color:#f3f3f3;" onload="Initial()">
    <div id="search-bar">
        <a id="logo"><font style="font-family:verdana">D.&nbsp;D.&nbsp;&nbsp;&nbsp;&nbsp;</font>|&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</a>
            <div id="userbar">
                <ul class="aside-list">
                     <li><a id="id_index" href="index.aspx" class="toindex">叮叮首页</a></li>
                 <li style="display:none;"><a id="id_userinfo" href="userinfo.aspx" class="toindex">个人中心</a></li>
                 <li><a id="id_setting" href="http://www.baidu.com/" class="toindex">帮助</a></li>
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
            <span id="user_updatecustumor" onclick="GetAllCustumor()">修改顾客信息</span>
            <span id="user_updatebook" onclick="GetAllBook()">修改图书信息</span>
            <span id="user_updateorder" onclick="GetAllOrder()">修改订单信息</span>
            <br />
            <!-- update database-->
        </div>
        
        <div id="ihome-custumor" class="ihome-x">
            <div id="ihome-order-title" class="ihome-x-title">
                <span class="title">用户管理</span>
            </div>
            <div id="item-custumor-header" class="item-x-header">
                <p class="custumor-header-userid">
                    <a>用户id</a>
                </p>
                <p class="custumor-header-username">
                    <a>用户名</a>
                </p>
                <p class="custumor-header-userpwd">
                    <a>用户密码</a>
                </p>
                <p class="custumor-header-email">
                    <a>用户邮箱</a>
                </p>
                <p class="custumor-header-phone">
                    <a>用户手机</a>
                </p>
                <p class="custumor-header-address">
                    <a>用户住址</a>
                </p>
                <p class="custumor-header-control">
                    <a>删除/更新</a>
                </p>
            </div>
            <ul id="ihome-custumorlist" class="ihome-x-list">
                <li class="custumoritem">
                    <p class="custumor-item-userid"><a>1</a></p>
                    <p class="custumor-item-username">
                        <input type="text" class="custumor-item-username-input"/>
                    </p>
                    <p class="custumor-item-userpwd">
                        <input type="text" class="custumor-item-userpwd-input"/>
                    </p>
                    <p class="custumor-item-email">
                            <input type="text" class="custumor-item-email-input"/>
                    </p>
                    <p class="custumor-item-phone">
                            <input type="text" class="custumor-item-phone-input"/>
                    </p>
                    <p class="custumor-item-address">
                            <input type="text" class="custumor-item-address-input"/>
                    </p>
                    <p class="custumor-item-control">
                            <span class="custumor-item-control-update" onclick="javascript:UpdateCustumor(this)">更新</span>
                            <span class="custumor-item-control-delete" onclick="javascript:DeleteCustumor(this)">删除</span>
                    </p>
                </li>
            </ul>
        </div>
        
        <div id="ihome-book" class="ihome-x">
                <div id="ihome-order-title" class="ihome-x-title">
                    <span class="title">书籍管理</span>
                </div>
                <div id="item-book-header" class="item-x-header">
                    <p class="book-header-bookid">
                        <a>书籍id</a>
                    </p>
                    <p class="book-header-bookname">
                        <a>书籍名</a>
                    </p>
                    <p class="book-header-type">
                        <a>书籍类别</a>
                    </p>
                    <p class="book-header-date">
                        <a>出版日期</a>
                    </p>
                    <p class="book-header-price">
                        <a>单价</a>
                    </p>
                    <p class="book-header-count">
                        <a>库存</a>
                    </p>
                    <p class="book-header-introduction">
                        <a>简介</a>
                        </p>
                    <p class="book-header-author">
                        <a>作者</a>
                    </p>
                    <p class="book-header-control">
                        <a>操作</a>
                    </p>
                </div>
                <ul id="ihome-booklist" class="ihome-x-list">
                    <li class="bookitem">
                        <p class="book-item-bookid"><a>1</a></p>
                        <p class="book-item-bookname">
                            <input type="text" class="book-item-bookname-input"/>
                        </p>
                        <p class="book-item-type">
                            <input type="text" class="book-item-type-input"/>
                        </p>
                        <p class="book-item-date">
                                <input type="text" class="book-item-date-input"/>
                        </p>
                        <p class="book-item-price">
                                <input type="text" class="book-item-price-input"/>
                        </p>
                        <p class="book-item-count">
                                <input type="text" class="book-item-count-input"/>
                        </p>
                        <p class="book-item-introduction">
                                <input type="text" class="book-item-count-input"/>
                        </p>
                        <p class="book-item-author">
                                <input type="text" class="book-item-count-input"/>
                        </p>
                        <p id="book-control" class="book-item-control">
                                <span class="book-item-control-update" onclick="javascript:UpdateBook(this)">更新</span>
                                <span class="book-item-control-delete" onclick="javascript:DeleteBook(this)">删除</span>
                        </p>
                    </li>
                </ul>
        </div>

        <div id="ihome-order" class="ihome-x">
                <div id="ihome-order-title" class="ihome-x-title">
                    <span class="title">订单管理</span>
                </div>
                <div id="item-order-header" class="item-x-header">
                    <p class="order-header-orderid">
                        <a>订单id</a>
                    </p>
                    <p class="order-header-orderowner">
                        <a>下单人</a>
                    </p>
                    <p class="order-header-bookname">
                        <a>书籍</a>
                    </p>
                    <p class="order-header-status">
                        <a>订单状态</a>
                    </p>
                    <p class="order-header-count">
                        <a>数量</a>
                    </p>
                    <p class="order-header-time">
                        <a>下单时间</a>
                    </p>
                    <p class="order-header-phone">
                        <a>联系方式</a>
                    </p>
                    <p class="order-header-address">
                        <a>地址</a>
                    </p>
                    <p class="order-header-control">
                        <a>操作</a>
                    </p>
                </div>
                <ul id="ihome-orderlist" class="ihome-x-list">
                    <li class="orderitem">
                        <p class="order-item-orderid"><a>1</a></p>
                        <p class="order-item-orderowner">
                            <input type="text" class="order-item-orderowner-input"/>
                        </p>
                        <p class="order-item-bookname">
                            <input type="text" class="order-item-bookname-input"/>
                        </p>
                        <p class="order-item-status">
                                <input type="text" class="order-item-status-input"/>
                        </p>
                        <p class="order-item-count">
                                <input type="text" class="order-item-count-input"/>
                        </p>
                        <p class="order-item-time">
                                <input type="text" class="order-item-time-input"/>
                        </p>
                        <p class="order-item-phone">
                                <input type="text" class="order-item-phone-input"/>
                        </p>
                        <p class="order-item-address">
                                <input type="text" class="order-item-address-input"/>
                        </p>
                        <p id="order-control" class="order-item-control">
                                <span class="order-item-control-update" onclick="javascript:UpdateOrder(this)">更新</span>
                                <span class="order-item-control-delete" onclick="javascript:DeleteOrder(this)">删除</span>
                        </p>
                    </li>
                </ul>
    </div>
        
    </div>
    <p id="tail">
</body>
</html>
