<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DDshoping.index" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv=Content-Type content="text/html;charset=utf-8">
        <link href="./css/index.css" rel="stylesheet" type="text/css"> 
        <script src="./js/jquery-3.2.1.js" type= "text/javascript"></script>
        <script src="./js/index.js" type= "text/javascript"></script>
        <title>叮叮&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</title>
    </head>
    <body onload="Initial()" style="margin:0px;background-color:#f3f3f3;">
    <div id="search-bar">
        <a id="logo"><font style="font-family:verdana">D.&nbsp;D.&nbsp;&nbsp;&nbsp;&nbsp;</font>|&nbsp;&nbsp;&nbsp;&nbsp;您购书的不二选择</a>

                <input id="search-textbox" type="text" maxlength="256" tabindex="1" size="65" name="word" placeholder="请输入书籍">
                <input id="search-btn" type="submit" id="search-btn" hidefoucs="true" tabindex="2" value="搜索书籍" onclick="LoadBook(1)">

            <div id="userbar">
                <ul class="aside-list">
                     <li><a id="id_index" href="index.aspx" class="toindex">叮叮首页</a></li>
                     <li><a id="id_login" href="userlogin.aspx" class="toindex">登录</a></li>
                     <li><a id="id_register" href="userregister.aspx" class="toindex">注册</a></li>
                     <li style="display:none;"><a id="id_userinfo" href="userinfo.aspx" class="toindex">个人中心</a></li>
                     <li><a id="id_setting" href="help.aspx" class="toindex">帮助</a></li>
                     <li><a  id="id_userlogin" href="userlogin.aspx" class="toindex">退出</a></li>
                </ul>
            </div>
    </div>
    <div id="wgt-banner">
    </div>
    <div id="body-userandbook">
        <ul id="ihome-booklist">
            <!--
            <li class="bookitem">
                <a title="测试"><img src='./img/testbook1.jpg'/></a>
                <p class="booktitle">
                    <a title=" 绘本123每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</a>
                </p> 
                <p class="bookprice">
                    <span class="search-now-prize">¥36.50</span>
                </p>
                <p class="bookdetails">
                        掌握0-6岁黄金关键期，让宝宝自然爱上第二语言。爸妈不要怕！跟着做，孩子英语也能顶呱呱！ 大放送！15万多字精彩内容，精选123本书单，教你读又教你玩，共享甜蜜的亲子阅读时光。 超专业！受过六国洗礼的哈佛双语专家吴敏兰，教你带宝宝玩出英语好胃口。 真细致！分龄规划适合0-2、2-3、3-6岁的分龄书单，循序渐进让宝宝自然而然爱上英语。 好方便！书中几十个二维码链接，无论何时何地，英语短片歌谣随身带着走，走到哪儿、唱到哪儿、玩到哪儿。 无压力！6大陪读共玩诀窍，爸妈不必精通英文，跟着宝宝一起无痛慢学，玩出英语好感度！ 购买超值套装请点击 ： 语感启蒙经典英文儿歌图画书( 含吴敏兰(绘本123)双语修订版套装共23册6张盘
                </p>
                <span class="search_btn_cart " name="Buy" dd_name="加入购物车" >加入购物车</span>
            </li>
            <li class="bookitem">
                <div class="bookid" style="display:none;">123</div>
                <a title="测试"><img src='./img/testbook1.jpg'/></a>
                <p class="booktitle">
                    <a title=" 绘本123每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</a>
                </p> 
                <p class="bookprice">
                    <span class="search-now-prize">¥36.50</span>
                </p>
                <p class="bookdetails">
                        掌握0-6岁黄金关键期，让宝宝自然爱上第二语言。爸妈不要怕！跟着做，孩子英语也能顶呱呱！ 大放送！15万多字精彩内容，精选123本书单，教你读又教你玩，共享甜蜜的亲子阅读时光。 超专业！受过六国洗礼的哈佛双语专家吴敏兰，教你带宝宝玩出英语好胃口。 真细致！分龄规划适合0-2、2-3、3-6岁的分龄书单，循序渐进让宝宝自然而然爱上英语。 好方便！书中几十个二维码链接，无论何时何地，英语短片歌谣随身带着走，走到哪儿、唱到哪儿、玩到哪儿。 无压力！6大陪读共玩诀窍，爸妈不必精通英文，跟着宝宝一起无痛慢学，玩出英语好感度！ 购买超值套装请点击 ： 语感启蒙经典英文儿歌图画书( 含吴敏兰(绘本123)双语修订版套装共23册6张盘
                </p>
                <span class="search_btn_cart " name="Buy" dd_name="加入购物车" >加入购物车</span>
            </li>
            <li class="bookitem">
                <a title="测试"><img src='./img/testbook1.jpg'/></a>
                <p class="booktitle">
                    <a title=" 绘本123每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</a>
                </p> 
                <p class="bookprice">
                     <span class="search-now-prize">¥36.50</span>
                 </p>
                <p class="bookdetails">
                        掌握0-6岁黄金关键期，让宝宝自然爱上第二语言。爸妈不要怕！跟着做，孩子英语也能顶呱呱！ 大放送！15万多字精彩内容，精选123本书单，教你读又教你玩，共享甜蜜的亲子阅读时光。 超专业！受过六国洗礼的哈佛双语专家吴敏兰，教你带宝宝玩出英语好胃口。 真细致！分龄规划适合0-2、2-3、3-6岁的分龄书单，循序渐进让宝宝自然而然爱上英语。 好方便！书中几十个二维码链接，无论何时何地，英语短片歌谣随身带着走，走到哪儿、唱到哪儿、玩到哪儿。 无压力！6大陪读共玩诀窍，爸妈不必精通英文，跟着宝宝一起无痛慢学，玩出英语好感度！ 购买超值套装请点击 ： 语感启蒙经典英文儿歌图画书( 含吴敏兰(绘本123)双语修订版套装共23册6张盘
                 </p>
                <span class="search_btn_cart " name="Buy" dd_name="加入购物车" >加入购物车</span>
            </li>
            <-->
        </ul>
        <div id="ihome-user">
            <a style="top:5px;padding:5px;"><img src="./img/shoppingcart.png" style="margin-top:2px;margin-left:2px;width:20px;height:20px;"></img>
                <span style="position:absolute; margin-top:2px;margin-left:2px;top:0px; left:20px;height:20px;">
                    <p style="margin-top:2px;margin-bottom:2px;color:rgb(167, 167, 167);margin-left:10px;">购物车</p>
                </span>
            </a>
            <ul id="cart-list">
                <!--
                <li class="cart-book" style="position: relative;margin-bottom:2px;">
                    
                    <p class="cart-item-name">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</p>
                    <span class="shoppingcart_btn_delete " name="Delete" dd_name="删除商品" >删除商品</span>
                </li>
                <li class="cart-book" style="position: relative;margin-bottom:2px;">
                        <p class="cart-item-name">绘本每个妈妈都能胜任的英语启蒙（吴敏兰力作）上市以来狂印5次，数十万家长追捧！英语启蒙家长扫盲必修课！不能错过的儿童英文亲子家教阅读指南！</p>
                        <span class="shoppingcart_btn_delete " name="Delete" dd_name="删除商品" >删除商品</span>
                </li>
                -->
            </ul>
            <div id="cart-purchase">
                   <span class="shoppingcart_btn_purchase " name="Purchase" dd_name="支付购买" onclick="GotoPay()">支付购买</span>
            </div>
        </div>
    </div>
    </body>
</html>
