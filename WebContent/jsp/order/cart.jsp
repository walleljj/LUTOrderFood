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
<title>阿甲商城购物车</title>
<link rel="stylesheet" href="<%=basePath%>/css/header.css" />
<link rel="stylesheet" href="<%=basePath%>/css/footer.css" />
<link rel="stylesheet" href="<%=basePath%>/css/cart.css" />
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
	<div class="modal" style="display: none">
		<div class="modal_dialog">
			<div class="modal_header">删除提醒</div>
			<div class="modal_information">
				<img src="<%=basePath%>/images/model/model_img2.png" alt="" /> <span>确定删除您的这个宝贝吗？</span>
			</div>
			<div class="yes">
				<span>删除</span>
			</div>
			<div class="no">
				<span>不删除</span>
			</div>
		</div>
	</div>
	<div class="modalNo" style="display: none">
		<div class="modal_dialog">
			<div class="modal_header">
				删除提示 <img src="<%=basePath%>/images/model/model_img1.png" alt=""
					class="rt close" />
			</div>
			<div class="modal_information">
				<img src="<%=basePath%>/images/model/model_img2.png" alt="" /> <span>请选择商品</span>
			</div>
		</div>
	</div>
	<div class="big">
		<form name="" action="" method="post">
			<section id="section">
			<div id="title">
				<b>购物车</b>
				<p>
					已选<span class="total color">0</span>件商品<span class="interval"></span>合计(不含运费):<span
						class="totalPrices color susum">0.00</span><span
						class="unit color">元</span>
				</p>
			</div>
			<div id="box">
				<div id="content_box">
					<div class="imfor_top">
						<div class="check_top">
							<div class="all">
								<span class="normal"> <img
									src="<%=basePath%>/images/cart/product_normal.png" alt="" />
								</span> <input type="hidden" name="" value="">全选
							</div>
						</div>
						<div class="pudc_top">商品</div>
						<div class="pices_top">单价(元)</div>
						<div class="num_top">数量</div>
						<div class="totle_top">金额</div>
						<div class="del_top">操作</div>
					</div>
					
					<div class="imfor">
						<div class="check">
							<div class="Each">
								<span class="normal"> <img
									src="<%=basePath%>/images/cart/product_normal.png" alt="" />
								</span> <input type="hidden" name="" value="">
							</div>
						</div>
					<
					<div class="imfor">
						<div class="check">
							<div class="Each">
								<span class="normal"><img
									src="<%=basePath%>/images/cart/product_normal.png" alt="" /></span>
							</div>
						</div>
						<div class="pudc">
							<div class="pudc_information" id="pudcId2">
								<img src="<%=basePath%>/images/cart/product_simg1.png" class="lf" /> <input
									type="hidden" name="" value=""> <span class="des lf">
									联想(Lenovo)YOGA5 PRO 标配版电脑(i5-7200u 8G 512G SSD FHD IPS)银 <input
									type="hidden" name="" value="">
								</span>
								<p class="col lf">
									<span>颜色：</span><span class="color_des">炫酷黑 <input
										type="hidden" name="" value=""></span>
								</p>
							</div>
						</div>
						<div class="pices">
							<p class="pices_des">阿甲专享价</p>
							<p class="pices_information">
								<b>￥</b><span>4888.00</span>
							</p>
						</div>
						<div class="num">
							<span class="reduc">&nbsp;-&nbsp;</span><input type="text"
								value="1" /><span class="add">&nbsp;+&nbsp;</span>
						</div>
						<div class="totle">
							<span>￥</span> <span class="totle_information">4888.00</span>
						</div>
						<div class="del">
							<!-- <div>
                           <img src="img/true.png" alt=""/>
                           <span>已移入收藏夹</span>
                       </div>
                        <a href="javascript:;" class="del_yr">移入收藏夹</a>
                       -->
							<a href="javascript:;" class="del_d">删除</a>
						</div>
					</div>
				</div>
				<div class="foot">
					<div class="foot_check">
						<div class="all">
							<span class="normal"> <img
								src="<%=basePath%>/images/cart/product_normal.png" alt="" />
							</span> <input type="hidden" name="" value="">全选
						</div>
					</div>
					<a href="javascript:;" class="foot_del">删除</a>
					<!--<a href="javascript:;" class="foot_yr">移入收藏夹</a>-->
					<div class="foot_qk">清空失效商品</div>
					<div class="foot_cash" id="go-buy">去结算</div>
					<div class="foot_tol">
						<span>合计(不含运费):</span><span class="foot_pices susumOne">0.00</span><span
							class='foot_des'>元</span>
					</div>
					<div class="foot_selected">
						已选<span class="totalOne color">0</span>件商品
					</div>
				</div>
			</div>
			</section>
		</form>
		<div class="none" style="display: none">
			<p class="none_title">购物车</p>
			<div class="none_top"></div>
			<div class="none_content">
				<img src="<%=basePath%>/images/30.png" alt="" class="lf" />
				<p class="lf">您的购物车竟然还是空哒( ⊙ o ⊙ )</p>
				<span class="lf">赶快去下单吧！</span> <a href="#" class="lf">去购物>></a>
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
	<script src="<%=basePath%>/js/cart.js"></script>
	<script src="<%=basePath%>/js/index.js"></script>
	<script>
	<!-- 显示空购物车页面-->
		$(function() {
			if (!$(".imfor")) {
				$('#section').hide();
				$('.none').show();
			}
		})
		$("#go-buy").click(function() {
			window.location.href = "orderConfirm.html";
		})
	</script>
</body>
</html>