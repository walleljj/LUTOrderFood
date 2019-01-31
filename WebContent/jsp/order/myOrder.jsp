<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head lang="en">
<meta charset="UTF-8">
<title>我的订单 - 阿甲学子商城</title>
<link href="<%=basePath%>/css/myOrder.css" rel="Stylesheet" />
<link href="<%=basePath%>/css/header.css" rel="Stylesheet" />
<link href="<%=basePath%>/css/footer.css" rel="Stylesheet" />
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
		-->
		<!-- 右边栏-->
		<div class="rightsidebar_box rt">
			<!-- 商品信息标题-->
			
			<table id="order_list_title" cellpadding="0" cellspacing="0">
				<tr>
					<th width="345">商品</th>
					<th width="82">单价（元）</th>
					<th width="50">数量</th>
					<th width="82">售后</th>
					<th width="100">实付款（元）</th>
					<th width="90">交易状态</th>
					<th width="92">操作</th>
				</tr>
			</table>
			<!-- 订单列表项 -->
			<c:forEach items="${allorders }" var="ao">
				<div id="orderItem">
					<p class="orderItem_title">
						<span id="order_id"> &nbsp;&nbsp;订单编号:<a href="#">${ao.orderid }</a>
						</span> &nbsp;&nbsp;成交时间：${ao.paytime }&nbsp;&nbsp; <span> <a
							href="#" class="servie"> 联系客服<img
								src="<%=basePath%>/images/myOrder/kefuf.gif" />
						</a>
						</span>dt
					</p>
				</div>
				<div id="orderItem_detail">
					<ul>
						<li class="product"><b><a href="#"><img style="width:70px;height: 70px"
									src="<%=basePath%>${ao.resphoto}" /></a></b> <b
							class="product_name lf"> <a href="">${ao.resname }</a> <br />
						</b></li>
						<li class="unit_price">专属价 <br /> 
						</li>
						<li class="count">2件</li>
						<li class="sale_support"> <br /> 我要维权
						</li>
						<li class=" payments_received">￥${ao.allmoney }</li>
						<li class="trading_status"><br /> <a
							href="orderInfo.html">订单详情</a> <br /> </li>
						<c:if test="${ao.state == '0' }">
							<li class="operate"><a href="<%=basePath %>PaySvl?orderid=${ao.orderid }&allmoney=${ao.allmoney }">去付款</a></li>
						</c:if>
						<c:if test="${ao.state == '2' }">
							<li class="operate"><a href="#">待处理</a></li>
						</c:if>
						<c:if test="${ao.state == '3' }">
							<li class="operate"><a href="<%=basePath %>OkReceive?orderid=${ao.orderid }">确认收货</a></li>
						</c:if>
						<c:if test="${ao.state == '4' }">
							<li class="operate"><a href="#">已完成</a></li>
						</c:if>
						<c:if test="${ao.state == '5' }">
							<li class="operate"><a href="#">已退款</a></li>
						</c:if>
					</ul>
				</div>
			</c:forEach>
			

		

			<!--分页器-->
			<div class="tcdPageCode"></div>

		</div>
	</div>

	<!--<iframe src="order_status.html" width="1000" height=500""></iframe>-->
	<!-- 品质保障，私人定制等-->
	<div id="foot_box">
		<div class="icon1 lf">
			<img src="<%=basePath%>/images/footer/icon1.png" alt="" />

			<h3>品质保障</h3>
		</div>
		<div class="icon2 lf">
			<img src="<%=basePath%>/images/footer/icon2.png" alt="" />

			<h3>私人定制</h3>
		</div>
		<div class="icon3 lf">
			<img src="<%=basePath%>/images/footer/icon3.png" alt="" />

			<h3>学员特供</h3>
		</div>
		<div class="icon4 lf">
			<img src="<%=basePath%>/images/footer/icon4.png" alt="" />

			<h3>专属特权</h3>
		</div>
	</div>
	<!-- 页面底部-->
	<div class="foot_bj">
		<div id="foot">
			<div class="lf">
				<p class="footer1">
					<img src="<%=basePath%>/images/footer/logo.png" alt="" class=" footLogo" />
				</p>
				<p class="footer2">
					<img src="<%=basePath%>/images/footer/footerFont.png" alt="" />
				</p>

			</div>
			<div class="foot_left lf">
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
					<li><a href="#">关于达内</a></li>
					<li><a href="#">联系我们</a></li>
					<li><img src="<%=basePath%>/images/footer/wechat.png" alt="" /> <img
						src="<%=basePath%>/images/footer/sinablog.png" alt="" /></li>
				</ul>
			</div>
			<div class="service">
				<p>达内商城客户端</p>
				<img src="<%=basePath%>/images/footer/ios.png" class="lf"> <img
					src="<%=basePath%>/images/footer/android.png" alt="" class="lf" />
			</div>
			<div class="download">
				<img src="<%=basePath%>/images/footer/erweima.png">
			</div>
			<!-- 页面底部-备案号 #footer -->
			<div class="record">&copy;2017 阿甲集团有限公司 版权所有 京ICP证xxxxxxxxxxx</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>/js/index.js"></script>
<script src="<%=basePath%>/js/jquery.page.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/order.js"></script>
</html>