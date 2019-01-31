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
    <title>阿甲学子商城——支付页面</title>
    <link href="<%=basePath%>css/payment.css" rel="Stylesheet" />
    <link href="<%=basePath%>css/header.css" rel="Stylesheet" />
    <link href="<%=basePath%>css/footer.css" rel="Stylesheet" />
    <style>
    	.okPay a{
    		color: #FFFFFF;
    	}
    </style>
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
<div id="navlist">
    <ul>
        <li class="navlist_gray_left"></li>
        <li class="navlist_gray">确认订单信息</li>
        <li class="navlist_gray_arro"><canvas id="canvas_gray" width="20" height="38"></canvas>
        </li>
        <li class="navlist_blue">支付订单<b></b></li>
        <li class="navlist_blue_arro"><canvas id="canvas_blue" width="20" height="38"></canvas>
        </li>
        <li class="navlist_gray">支付完成<b></b></li>
        <li class="navlist_gray_right"></li>
    </ul>
</div>
<!--订单确认-->
<form action="pay_success.html" method="post" id="pay_form">
    <div id="container" class="clearfix" >
        <!-- 支付订单信息-->
        <div class="pay_info">
            <b>支付金额：<i>${order.allmoney }元</i></b><input type="hidden" name="payment" value="0.01"/>
            <span>支付订单：${order.orderid } 收款方：${order.resid }</span><input type="hidden" name="orderId" />
        </div>
        <!--支付方式-->
        <div id="pay_type">
            <!-- 支付方式头-->
            <div class="pay_type_title">
                <b>网上银行支付</b>
            </div>
            <div id="dnBank">
                <ul>
                    <li><input type="radio" name="bankId" value="BOC-NET-B2C" id="02zg">
                        <label for="02zg"><img src="<%=basePath%>images/pay/pay_img1.jpg" alt="" /></label>
                    </li>
                    <li><input type="radio" name="bankId" value="ICBC-NET-B2C" id="03gs">
                        <label for="03gs"><img src="<%=basePath%>images/pay/pay_img2.jpg" alt="" /></label>
                    </li>
                    <li><input type="radio" name="bankId" value="CMBCHINA-NET-B2C" id="04zs">
                        <label for="04zs"><img src="<%=basePath%>images/pay/pay_img3.jpg" alt="" /></label>
                    </li>
                    <li><input type="radio" name="bankId" value="CCB-NET-B2C" id="05js">
                        <label for="05js"><img src="<%=basePath%>images/pay/pay_img4.jpg" alt=""/></label>
                    </li>
                    <li><input type="radio" name="bankId" value="ABC-NET-B2C" id="06ny">
                        <label for="06ny"><span><img src="<%=basePath%>images/pay/pay_img5.jpg" alt=""/></span></label>
                    </li>

                </ul>
            </div>

        </div>
        <!--结算条-->
        <div id="count_bar">
        <span class="pay_leftTime">
            剩余付款时间：<b>15：00</b>
            <!--获取待支付时间并更改订单状态-->
        </span>
            <span class="okPay"><a href="PaySvl?orderid=${order.orderid }&allmoney=${order.allmoney }">确认支付</a></span>
            <!-- <input type="submit" value="立即付款"> -->
        </div>

    </div>
</form>
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
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/index.js"></script>
<script>
    $("#count_bar .okPay").css("display","none");
    $("#dnBank>ul>li img").click(function(){
        $(this).addClass("hover") ;
        $(this).parent().parent().siblings().children('label').children('img').removeClass('hover');
        $("#count_bar .okPay").show("3000");
    });
    /* $(":not(#count_bar .okPay)").css("display","none"); */
</script>
<script type="text/javascript">
    function payment() {
        $("#pay_form").submit();
        // document.getElementById('pay_form').submit();
        alert(11);
    }  
</script>
<script>
	$(".okPay").click(function(){
		Window.location.href="pay_success.html";
    })
</script>
<script>
    var canvas=document.getElementById("canvas_gray");
    var cxt=canvas.getContext("2d");
    var gray = cxt.createLinearGradient (10, 0, 10, 38);
    gray.addColorStop(0, '#f5f4f5');
    gray.addColorStop(1, '#e6e6e5');
    cxt.beginPath();
    cxt.fillStyle = gray;
    cxt.moveTo(20,19);
    cxt.lineTo(0,38);
    cxt.lineTo(0,0);
    cxt.fill();
    cxt.closePath();
</script>
<script>
    var canvas=document.getElementById("canvas_blue");
    var cxt=canvas.getContext("2d");
    var blue = cxt.createLinearGradient (10, 0, 10, 38);
    blue.addColorStop(0, '#27b0f6');
    blue.addColorStop(1, '#0aa1ed');
    cxt.beginPath();
    cxt.fillStyle = blue;
    cxt.moveTo(20,19);
    cxt.lineTo(0,38);
    cxt.lineTo(0,0);
    cxt.fill();
    cxt.closePath();
</script>
</body>
</html>

