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
<title>404页面</title>
<link href="<%=basePath%>css/header.css" rel="Stylesheet" />
<link href="<%=basePath%>css/footer.css" rel="Stylesheet" />
<link href="<%=basePath%>css/404.css" rel="Stylesheet" />
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
	<!--404-->
	<div id="container">
		<div class="rightsidebar_box rt">
			<div class="sys_err">
				<img src="<%=basePath%>/images/404/404_img1.png" alt="" />
				<p>
					<img src="<%=basePath%>/images/404/404_img2.png" alt="" />页面找不到了！
				</p>
				<span>快去看看别的吧！<b><a href="#">回首页&gt;&gt;</a></b></span> <br />
			</div>
		</div>
	</div>
	<!--为你推荐-->
	<div id="recommended">
		<p>
			为你推荐<span>大家都在看</span>
		</p>
		<div id="demo" style="width: 1000px; overflow: hidden;">
			<!-- 外面的大框 -->
			<div id="indemo" style="float: left; width: 200%;">
				<!-- 宽度特别大 -->
				<div id="demo1" style="float: left">
					<!-- 第一个宽度显示 -->
					<div class="detail_1 lf">
						<div class="detail_img1">
							<img src="<%=basePath%>/images/recommend/recommend_img1.png" border="0">
						</div>
						<p>ThinkPad New S2 (20GUA00QCD)13.3英寸超霸笔记本电脑</p>
					</div>
					<div class="detail_1 lf">
						<div class="detail_img1">
							<img src="<%=basePath%>/images/recommend/recommend_img2.png" border="0">
						</div>
						<p>戴尔 DELL燃7000 R1605S 超霸笔记本电脑</p>
					</div>
					<div class="detail_1 lf">
						<div class="detail_img1">
							<img src="<%=basePath%>/images/recommend/recommend_img3.png" border="0">
						</div>
						<p>戴尔(DELL)魔方15MF Pro-R2505TSS灵越超霸笔记本电脑</p>
					</div>
					<div class="detail_1 lf">
						<div class="detail_img1">
							<img src="<%=basePath%>/images/recommend/recommend_img4.png" border="0">
						</div>
						<p>联想(Lenovo) YOGA900 (YOGA4 PRO)多彩版超霸笔记本电脑</p>
					</div>
					<!--</div>-->
				</div>
				<div id="demo2" style="float: left"></div>
			</div>
			<!-- 宽度超大 -->
		</div>
		<!-- 外面大框 -->
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
	<script src="<%=basePath%>/js/index.js"></script>
	<!--图片轮播悬停进入详情页效果-->
	<script>
		var speed = 20;
		var tab = document.getElementById("demo");
		var tab1 = document.getElementById("demo1");
		var tab2 = document.getElementById("demo2");
		tab2.innerHTML = tab1.innerHTML;
		function Marquee() {
			if (tab2.offsetWidth - tab.scrollLeft <= 0)
				tab.scrollLeft -= tab1.offsetWidth
			else {
				tab.scrollLeft++;
			}
		}
		var MyMar = setInterval(Marquee, speed);
		tab.onmouseover = function() {
			clearInterval(MyMar)
		};
		tab.onmouseout = function() {
			MyMar = setInterval(Marquee, speed)
		};
	</script>

</body>
</html>