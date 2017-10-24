<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shoppingcart.aspx.cs" Inherits="DDshoping.shoppingcart" %>

<!DOCTYPE html>

<html>
        <head>
            <meta http-equiv=Content-Type content="text/html;charset=utf-8">
            <link href="./css/shoppingcart.css" rel="stylesheet" type="text/css"> 
            <script src="./js/jquery-3.2.1.js" type= "text/javascript"></script>
            <script src="./js/shoppingcart.js" type= "text/javascript"></script>
            <title>叮叮&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</title>
        </head>
        <body onload="Initial()" style="margin:0px;background-color:#f3f3f3;">
            <div id="search-bar">
                <a id="logo"><font style="font-family:verdana">D.&nbsp;D.&nbsp;&nbsp;&nbsp;&nbsp;</font>|&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</a>
                    <div id="userbar">
                        <ul class="aside-list">
                          <li><a href="index.aspx" class="toindex">叮叮首页</a></li>
                            <li><a href="userinfo.aspx" class="toindex">个人中心</a></li>
                            <li><a href="http://www.baidu.com/" class="toindex">设置</a></li>
                            <li><a href="userlogin.aspx" class="toindex">退出</a></li>
                        </ul>
                    </div>
                </div>
            <div id="wgt-banner">
            </div>
            <div id="body-userandorder">
                <div id="ihome-order">
                    <div id="ihome-order-title">
                        <span class="title">购物车</span>
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
                        </div>
                    <ul id="ihome-orderlist">
                        <!--
                        <li class="orderitem">
                            <img src="./img/testbook1.jpg" class="orderitem-img"></img>
                            <p class="booktitle">
                                <a title=" this is a test id">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</a>
                            </p>
                            <p class="bookaccount">
                                <span class="amount-fn-updatecount" >
                                    <a style="cursor:default;" onclick="javascript:ChangeValue(0,this)">-</a>
                                    <input onchange="javascript:ChangeValue(2,this)"  value="1" type="text" >
                                    <a style="cursor:default;" onclick="javascript:ChangeValue(1,this)">+</a>
                                </span>
                            </p>
                            <p  class="bookuintprice">
                                    <a>34</a>
                            </p>
                            <p class="booktotalprice">
                                    <a>72</a>
                            </p>
                        </li>
                    -->
                        
                    </ul>
                    
                </div>
                <div id="acountandpurchase">
                    <a onclick="Pay()" id="checkout_btn">结&nbsp;&nbsp;算</a>
                    <div id="subtotal">
                        <p>
                            <span class="cartsum">总计(不含运费)：</span>
                            <span id="payAmount">¥66</span>
                        </p>
                    </div>
                    
                </div>
                
            </div>
            <p id="tail"></div>
        </body>
    </html>
