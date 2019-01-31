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
    <title>阿甲商城学子餐饮页</title>
    <link href="<%=basePath%>css/item_food.css" rel="Stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>css/header.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/footer.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/slide.css" />
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
<!-- banner部分-->
<div class="ck-slide">
    <ul class="ck-slide-wrapper">
        <li>
            <a href="#"><img src="<%=basePath%>images/item_food/item_food_banner1.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="#"><img src="<%=basePath%>images/item_food/item_food_banner2.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="#"><img src="<%=basePath%>images/item_food/item_food_banner3.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="#"><img src="<%=basePath%>images/item_food/item_food_banner4.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="#"><img src="<%=basePath%>images/item_food/item_food_banner1.png" alt=""></a>
        </li>
    </ul>
    <a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next">下一张</a>
    <div class="ck-slidebox">
        <div class="slideWrap">
            <ul class="dot-wrap">
                <li class="current"><em>1</em></li>
                <li><em>2</em></li>
                <li><em>3</em></li>
                <li><em>4</em></li>
                <li><em>5</em></li>
            </ul>
        </div>
    </div>
</div>
<!-- 特推部分-->
<!--精选美食-->
<div class="delicacy">
    <div class="delicacy_top">
        <img src="<%=basePath%>images/item_food/food_icon.png" alt=""/>
        精选美食/1F
    </div>
    <div class="delicacy_content">
        <div class="food">
            <div class="description">
                <img src="<%=basePath%>images/item_food/item_food_img1.png" alt=""/>
                <p class="action">传统系列炸酱面</p>
                <p class="description_des">色泽光亮，让人口齿生津，酸辣已下饭</p>
                <p class="price">￥ <span>18.00</span></p>
                <div id="one" class="detail">查看详情</div>
            </div>
            <img src="<%=basePath%>images/item_food/item_food_img1_1.png" alt=""/>
        </div>
        <div class="food">
            <div class="description">
                <img src="<%=basePath%>images/item_food/item_food_img2.png" alt=""/>
                <p class="action">蔬菜三明治</p>
                <p class="description_des">颜色鲜艳营养健康</p>
                <p class="price">￥ <span>28.00</span></p>
                <div id="two" class="detail">查看详情</div>
            </div>
            <img src="<%=basePath%>images/item_food/item_food_img2_1.png" alt=""/>
        </div>
        <div class="food">
            <div class="description">
                <img src="<%=basePath%>images/item_food/item_food_img3.png" alt=""/>
                <p class="action">超级至尊披萨</p>
                <p class="description_des">美味可口，香脆酥甜</p>
                <p class="price">￥ <span>33.00</span></p>
                <div id="three" class="detail">查看详情</div>
            </div>
            <img src="<%=basePath%>images/item_food/item_food_img3_1.png" alt=""/>
        </div>
        <div class="food1 ">
            <!--<img src="<%=basePath%>images/y1.png" alt=""/>-->
            <img src="<%=basePath%>images/item_food/item_food_img4.png" alt=""/>

            <h2>大补海鲜素材汤<span></span></h2>

            <p>￥20.00</p>
            <a href="#" id="four"onclick="return false;">查看详情</a>
        </div>
        <div class="food1 ">
            <img src="<%=basePath%>images/item_food/item_food_img5.png" alt="" id="food1"/>

            <h2>全素套餐<span> (魏家凉皮) </span></h2>

            <p>￥16.00</p>
            <a href="#" id="five"onclick="return false;">查看详情</a>
        </div>
        <div class="food1 " >
            <img src="<%=basePath%>images/item_food/item_food_img6.png" alt=""/>

            <h2>营养海鲜汤<span> (山西面食家) </span></h2>

            <p>￥25.00</p>
            <a href="#" id="six"onclick="return false;">查看详情</a>
        </div>

    </div>

</div>
<!--商家-->
<div class="store">
    <div class="store_top">
        <img src="<%=basePath%>images/item_food/foodshop_icon.png" alt=""/>
        美食店家/2F
    </div>
 <div class="store_content">
    <c:forEach var="res" items="${reslist}">
        <div>
        <table >
        	<tr> <td><a href="<%=basePath%>ListTypeFoodsSlv?resid=${res.resid}"><img src="<%=basePath%>${res.resphoto1}" alt=""/></a></td></tr>
       	 	<tr><td><p class="one">${res.resname}</p></td></tr>
       	 	<tr><td><p class="two">
            	<span>起送:<span>￥<span>${res.resminmoney}</span></span></span>
            	<span>配送:<span>￥<span>${res.respipage}</span></span></span>
            	<span>送达:<span>${res.resarrivetime}<span>min</span></span></span>
       	 	</p></td></tr>
        	<tr><td><p class="three">
                <span><img src="<%=basePath%>images/item_food/menu_icon1.png" alt=""/>面食</span>
                <span><img src="<%=basePath%>images/item_food/menu_icon2.png" alt=""/>饮料</span>
                <span><img src="<%=basePath%>images/item_food/menu_icon3.png" alt=""/>炒菜</span>
            </p></td></tr>
        </table>
        </div>
     </c:forEach>     
    </div>
</div>
<!-- 品质保障，私人定制等-->
	<div id="foot_box">
		<div class="icon1 lf">
			<img src="<%=basePath%>images/footer/icon1.png" alt="" />

			<h3>品质保障</h3>
		</div>
		<div class="icon2 lf">
			<img src="<%=basePath%>images/footer/icon2.png" alt="" />

			<h3>私人定制</h3>
		</div>
		<div class="icon3 lf">
			<img src="<%=basePath%>images/footer/icon3.png" alt="" />

			<h3>学员特供</h3>
		</div>
		<div class="icon4 lf">
			<img src="<%=basePath%>images/footer/icon4.png" alt="" />

			<h3>专属特权</h3>
		</div>
	</div>
	<!-- 页面底部-->
	<div class="foot_bj">
		<div id="foot">
			<div class="lf">
				<p class="footer1">
					<img src="<%=basePath%>images/footer/logo.png" alt=""
						class=" footLogo" />
				</p>
				<p class="footer2">
					<img src="<%=basePath%>images/footer/footerFont.png" alt="" />
				</p>
			</div>
			<div class="foot_left lf">
				<ul>
					<li><h3><a href="#">买家帮助</a></h3></li>
					<li><a href="#">新手指南</a></li>
					<li><a href="#">服务保障</a></li>
					<li><a href="#">常见问题</a></li>
				</ul>
				<ul>
					<li><h3><a href="#">商家帮助</a></h3></li>
					<li><a href="#">商家入驻</a></li>
					<li><a href="#">商家后台</a></li>
				</ul>
				<ul>
					<li><h3><a href="#">关于我们</a></h3></li>
					<li><a href="#">关于阿甲</a></li>
					<li><a href="#">联系我们</a></li>
					<li><img src="<%=basePath%>images/footer/wechat.png" alt="" />
						<img src="<%=basePath%>images/footer/sinablog.png" alt="" /></li>
				</ul>
			</div>
			<div class="service">
				<p>阿甲商城客户端</p>
				<img src="<%=basePath%>images/footer/ios.png" class="lf"> <img
					src="<%=basePath%>images/footer/android.png" alt="" class="lf" />
			</div>
			<div class="download">
				<img src="<%=basePath%>images/footer/erweima.png">
			</div>
			<!-- 页面底部-备案号 #footer -->
			<div class="record">&copy;2017 阿甲集团有限公司 版权所有 京ICP证xxxxxxxxxxx</div>
		</div>
	</div>
	<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/index.js"></script>
<script src="<%=basePath%>js/slide.js"></script>
<script>
    $('.ck-slide').ckSlide({
        autoPlay: true,//默认为不自动播放，需要时请以此设置
        dir: 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
        interval:3000//默认间隔2000毫秒
    });
</script>
</body>
</html>