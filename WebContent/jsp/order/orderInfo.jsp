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
<title>阿甲学子商城-订单详情页</title>
<link rel="stylesheet" href="<%=basePath%>/css/header.css" />
<link rel="stylesheet" href="<%=basePath%>/css/footer.css" />
<link rel="stylesheet" href="<%=basePath%>/css/orderInfo.css" />
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
	<!--详细信息-->
	<div id="container">
		<!-- 导航 -->
		<div class="container_nav">
			首页&gt;订单管理&gt;订单<span>12345677777</span>
		</div>
		<div class="orderInfo_icon">
			<p>
				订单<span class="order-num">12345677777</span>&nbsp;&nbsp;&nbsp;当前状态：<span
					class="state">等待发货</span>
			</p>
		</div>
		<!-- 订单状态流程图-->
		<div id="orderStatusChart">
			<dl>
				<dt>
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img1_2.png" alt="" />
				</dt>
				<dd>
					<p>提交订单</p>
					<span>2016.01.01 13:00</span>
				</dd>
			</dl>
			<dl>
				<dt class="point">
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img6_2.png" alt="" />
				</dt>
			</dl>

			<dl>
				<dt>
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img2_1.png" alt="" />
				</dt>
				<dd>
					<p>付款成功</p>
					<span>2016.01.01 13:00</span>
				</dd>
			</dl>
			<dl>
				<dt class="point">
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img6.png" alt="" />
				</dt>
			</dl>

			<dl>
				<dt>
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img3.png" alt="" />
				</dt>
				<dd>
					<p style="display: none">配送中</p>
					<span style="display: none">2016.01.01 13:00</span>
				</dd>
			</dl>
			<dl>
				<dt class="point">
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img6.png" alt="" />
				</dt>
			</dl>

			<dl>
				<dt>
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img4.png" alt="" />
				</dt>
				<dd>
					<p style="display: none">确认收货</p>
					<span style="display: none">2016.01.01 13:00</span>
				</dd>
			</dl>
			<dl>
				<dt class="point">
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img6.png" alt="" />
				</dt>
			</dl>

			<dl>
				<dt>
					<img src="<%=basePath%>/images/orderinfo/orderinfo_img5.png" alt="" />
				</dt>
				<dd>
					<p style="display: none">评价</p>
					<span style="display: none">2016.01.01 13:00</span>
				</dd>
			</dl>

		</div>
		<div class="clear">

			<!-- 详细信息-->
			<h1>详细信息</h1>
			收货人：<span class="consignee">某某某</span>&nbsp;&nbsp;&nbsp;&nbsp;邮编：<span
				class="postcode">100000</span>&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<span
				class="tel">13913883111</span> <br />
			<p>
				收货地址：<span>北京市昌平沙河小镇小沙河单身男公寓11楼1单元1号门</span>
			</p>
		</div>

		<!-- 物流信息-->
		<div style="width: 1000px; margin: 0px auto" class="logistics">
			<h1>物流信息</h1>
			<p>
				发货时间：<span>2011.11.11 11:11</span>
			</p>
			<p>
				物流公司：<span class="express">顺丰快递</span><a href="#">顺丰官网</a>
			</p>
			<p>
				快递单号：<span>301111303203048</span>
			</p>
			<div>
				<span>物流信息：</span>
				<div>
					<p>2016.11.11 12:11 您的快递在【北京马驹桥镇分拣中心】分拣完毕</p>
					<p>2016.11.11 12:11 您的快递在【北京马驹桥镇分拣中心】准备装车</p>
					<p>2016.11.11 12:11 您的快递到达【北京昌平分拣中心】</p>
					<p>2016.11.11 12:11 您的快递到达【北京昌平沙河分拣中心】</p>
				</div>
			</div>
		</div>

		<!-- 商品信息-->
		<div style="width: 1000px; margin: 0px auto">
			<h1 class="commodity">商品信息</h1>
			<div class="product_confirm">
				<ul class="item_title">
					<li class="p_info">商品信息</li>
					<li class="p_price">单价(元)</li>
					<li class="p_count">数量</li>
					<li class="p_tPrice">实付款</li>
				</ul>
				<div>
					订单编号：<span>1234567890123</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成交时间：2016-11-12
					11:11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系客服：<img
						src="<%=basePath%>/images/orderinfo/kefuf.gif" alt="" />
				</div>
				<ul class="item_detail">
					<li class="p_info"><b><img
							src="<%=basePath%>/images/orderinfo/product_simg1.png" /></b>
						<p class="product_name lf">联想(Lenovo)YoGA5 PRO 标配版电脑
							(I5-7200U 8G 512G SSD IPS)</p> <br /> <span class="product_color ">
							颜色：深空灰 </span></li>
					<li class="p_price"><i>专属价</i> <br /> <span class="pro_price">￥4888.80</span>
					</li>
					<li class="p_count">1件</li>
					<li class="p_tPrice">￥4888.80</li>
					<!--<li class="remark">备注</li>-->
					<li></li>
				</ul>
			</div>

		</div>

	</div>
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
					<li><a href="#">关于阿甲</a></li>
					<li><a href="#">联系我们</a></li>
					<li><img src="<%=basePath%>/images/footer/wechat.png" alt="" /> <img
						src="<%=basePath%>/images/footer/sinablog.png" alt="" /></li>
				</ul>
			</div>
			<div class="service">
				<p>阿甲商城客户端</p>
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
	<script src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
	<script>
		//搜索下拉
		$('.seek').focus(
				function() {

					if ($(this).hasClass('clickhover')) {

						$(this).removeClass('clickhover');
						$(this).find('.seek_content').hide();
						$(this).find('img').attr('src',
								'<%=basePath%>/images/header/header_normal.png');

					} else {
						$(this).addClass('clickhover');
						$(this).find('.seek_content').show();
						$(this).find('img').attr('src',
								'<%=basePath%>/images/header/header_true.png');
					}
				})
		$('.seek_content>div').click(
				function() {
					$('.seek').removeClass('clickhover');
					var text = $(this).html();
					$('.seek span').html(text);
					$(this).parent().hide();
					$('.seek').find('img').attr('src',
							'<%=basePath%>/images/header/header_normal.png');
					$('.seek').blur();

				})

		$('.seek').blur(
				function() {

					$('.seek').removeClass('clickhover');
					$('.seek_content').hide();

					$('.seek').find('img').attr('src',
							'<%=basePath%>/images/header/header_normal.png');
					console.log(1);
				})
		//头部hover
		$(".care").hover(function() {
			$(this).attr('src', "<%=basePath%>/images/header/care1.png");
		}, function() {
			$(this).attr('src', "<%=basePath%>/images/header/care.png");
		});
		$(".order").hover(function() {
			$(this).attr('src', "<%=basePath%>/images/header/order1.png");
		}, function() {
			$(this).attr('src', "<%=basePath%>/images/header/order.png");
		});
		$(".shopcar").hover(function() {
			$(this).attr('src', "<%=basePath%>/images/header/shop_car1.png");
		}, function() {
			$(this).attr('src', "<%=basePath%>/images/header/shop_car.png");
		});
	</script>
</html>