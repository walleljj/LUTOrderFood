<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/"; 
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 阿甲学子商城</title>
    <link href="<%=basePath%>css/myOrder.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/header.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/footer.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/personage.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/icon/css/bootstrap.min.css">
	<link href="<%=basePath%>css/icon/css/cropper.min.css" rel="stylesheet">
	<link href="<%=basePath%>css/icon/css/sitelogo.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/icon/css/font-awesome.min.css">
</head>
<body>
<!-- 页面顶部-->
	<header id="top">
		<div id="logo" class="lf">
			<img src="<%=basePath%>images/header/logo.png" alt="logo" />
		</div>
		<div id="top_input" class="lf">
			<div class="seek" tabindex="-1">
				<div class="seek_content">
					<div id="shcy">生活餐饮</div>
					<div id="xxyp">学习用品</div>
					<div id="srdz">私人订制</div>
				</div>
			</div>
		</div>
		<div class="rt">
			<ul class="lf">
			<c:if test="${user == null}">
				<li><a href="<%=basePath%>LoginSvl">登录</a></li>
			</c:if>
			<c:if test="${user != null}">
				<li><a href="<%=basePath%>MyOrderSvl">${user.username}</a><b>|</b></li>
				<li><a href="<%=basePath%>LogoutSvl">退出</a></li>
			</c:if>
			</ul>
		</div>
	</header>
<!-- nav主导航-->
<nav id="nav">
    <ul>
        <li><a href="<%=basePath%>MainSvl" class="acti">首页</a></li>
        <li><a href="#">生活餐饮</a></li>
        <li><a href="#">学习用品</a></li>
        <li><a href="#">私人定制</a></li>
    </ul>
</nav>
<!-- 我的订单导航栏-->
<div id="nav_order">
		<ul>
			<li><a href="">首页<span>&gt;</span>订单管理
			</a></li>
		</ul>
	</div>
	<!--我的订单内容区域 #container-->
	<div id="container" class="clearfix">
		<!-- 左边栏-->
		<div id="leftsidebar_box" class="lf">
			<div class="line"></div>
			<dl class="my_order">
				<dt onClick="changeImage()">
					我的订单 <img src="<%=basePath%>/images/myOrder/myOrder2.png">
				</dt>
				<dd class="first_dd">
					<a href="<%=basePath%>MyOrderSvl">全部订单</a>
				</dd>
				<dd>
					<a href="<%=basePath%>ListDaiFuOrders"> 待付款 <span>
							<!--待付款数量-->
					</span>
					</a>
				</dd>
				<dd>
					<a href="<%=basePath%>ListDaiShouOrders"> 待收货 <span>
							<!--待收货数量-->
					</span>
					</a>
				</dd>
				<dd>
					<a href="<%=basePath%>ListOkOrders"> 已完成<span>
							<!--待评价数量-->
					</span>
					</a>
				</dd>
				<dd>
					<a href="<%=basePath%>ListTuiOrders">已退款</a>
				</dd>
			</dl>
			<dl class="footMark">
				<dt onClick="changeImage()">
					我的优惠卷<img src="<%=basePath%>/images/myOrder/myOrder1.png">
				</dt>
			</dl>
			<dl class="address">
				<dt>
					收货地址<img src="<%=basePath%>/images/myOrder/myOrder1.png">
				</dt>
				<dd><a href="<%=basePath%>AddressSvl">地址编辑</a></dd>
				<dd><a href="<%=basePath%>ViewAdsSvl">地址管理</a></dd>
			</dl>
			<dl class="count_managment">
				<dt onClick="changeImage()">
					帐号管理<img src="<%=basePath%>/images/myOrder/myOrder1.png">
				</dt>
				<dd class="first_dd">
					<a href="<%=basePath%>PersonageSvl">我的信息</a>
				</dd>
				<dd>
					<a href="<%=basePath%>UpdatepwdSvl">安全管理</a>
				</dd>
			</dl>
		</div>
    <!-- 右边栏-->
    <!--个人信息头部-->
    <form id="login-form" method="post" action="<%=basePath%>PersonageSvl">
    <div class="rightsidebar_box rt">
        <div class="rs_header">
            <span class="rs_header_active"><a href="personage.html">我的信息</a></span>
            <span><a href="#">￥${user.money }</a></span>
        </div>

        <!--个人信息具体内容 -->
        <div class="rs_content">
            <!--用户名-->
            <div class="rs_content_username">
                <span class="same">用户名：</span>
                <input autocomplete required minlength="1" maxlength="9" name="username" id="username"  type="text" value="${user.username}" style="BACKGROUND-COLOR: transparent;"/>
            </div>
            <!--绑定电话-->

             <div class="rs_content_username">
                <span class="same">绑定电话：</span>
                <input name="tel" id="tel"  placeholder="请输入您的手机号" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$" required  class="ed_username" type="text" value="${user.tel}" style="BACKGROUND-COLOR: transparent;"/>
           	            </div>
            
            <!--绑定邮箱-->
            <div class="rs_content_mail">
                <span class="same">绑定邮箱：</span>
                <input name="email" id="email" class="ed_email" autocomplete required type="email" value="${user.email}" style="BACKGROUND-COLOR: transparent;"/>
                  <span class="msg-default hidden">请输入合法的邮箱地址</span>
            </div>
            <input class="btn btn-info btn-block avatar-save fa fa-save"name="save" type="submit" value="保存修改" data-dismiss="modal"id="bt-login"/>
             <div style="color:#00000; font-size:18px" align="center">${msg}</div>
        </div>
    </div>
    </form>
</div>

<!-- 品质保障，私人定制等-->
<div id="foot_box">
    <div class="icon1 lf">
        <img src="<%=basePath%>images/footer/icon1.png" alt=""/>

        <h3>品质保障</h3>
    </div>
    <div class="icon2 lf">
        <img src="<%=basePath%>images/footer/icon2.png" alt=""/>

        <h3>私人定制</h3>
    </div>
    <div class="icon3 lf">
        <img src="<%=basePath%>images/footer/icon3.png" alt=""/>

        <h3>学员特供</h3>
    </div>
    <div class="icon4 lf">
        <img src="<%=basePath%>images/footer/icon4.png" alt=""/>

        <h3>专属特权</h3>
    </div>
</div>
<!-- 页面底部-->
<div class="foot_bj">
    <div id="foot">
        <div class="lf">
            <p class="footer1"><img src="<%=basePath%>images/footer/logo.png" alt="" class=" footLogo"/></p>
            <p class="footer2"><img src="<%=basePath%>images/footer/footerFont.png"alt=""/></p>
            
        </div>
        <div class="foot_left lf" >
            <ul>
                <li><a href="#"><h3>买家帮助</h3></a></li>
                <li><a href="#">新手指南</a></li>
                <li><a href="#">服务保障</a></li>
                <li><a href="#">常见问题</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>商家帮助</h3></a></li>
                <li><a href="#">商家入驻</a></li>
                <li><a href="#">商家后台</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>关于我们</h3></a></li>
                <li><a href="#">关于阿甲</a></li>
                <li><a href="#">联系我们</a></li>
                <li>
                    <img src="<%=basePath%>images/footer/wechat.png" alt=""/>
                    <img src="<%=basePath%>images/footer/sinablog.png" alt=""/>
                </li>
            </ul>
        </div>
        <div class="service">
            <p>阿甲商城客户端</p>
            <img src="<%=basePath%>images/footer/ios.png" class="lf">
            <img src="<%=basePath%>images/footer/android.png" alt="" class="lf"/>
        </div>
        <div class="download">
            <img src="<%=basePath%>images/footer/erweima.png">
        </div>
		<!-- 页面底部-备案号 #footer -->
            <div class="record">
                &copy;2017 阿甲集团有限公司 版权所有 京ICP证xxxxxxxxxxx
            </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>

<script src="<%=basePath%>js/jquery.page.js"></script>
<script type="text/javascript" src="<%=basePath%>js/order.js"></script>
<script src="<%=basePath%>js/icon/bootstrap.min.js"></script>
<script src="<%=basePath%>js/icon/cropper.js"></script>
<script src="<%=basePath%>js/icon/sitelogo.js"></script>
<script src="<%=basePath%>js/icon/html2canvas.min.js" type="text/javascript" charset="utf-8"></script> 
</html>