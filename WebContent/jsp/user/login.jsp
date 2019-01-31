<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>阿甲商城学子登陆页面</title>
    <link href="<%=basePath%>css/header.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/footer.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/animate.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/login.css" rel="stylesheet"/>
</head>
<body>
<!-- 页面顶部-->
<header id="top">
    <div class="top">
        <img src="<%=basePath%>images/header/logo.png" alt=""/>
        <span>欢迎登录</span>
    </div>
</header>
<div id="container">
    <div id="cover" class="rt">
   		 <form id="login-form" method="post" action="<%=basePath%>LoginSvl">
            <div class="txt">
                <p>登录学子商城
                    <span>
                        <a href="<%=basePath%>RegisterSvl">新用户注册</a>
                    </span>
                </p>
                <div class="text">
                    <input type="text" name="userid" id="userid" placeholder="请输入您的用户名">
                    <span><img src="<%=basePath%>images/login/yhm.png"></span>
                </div>
                <div class="text">
                    <input type="password" name="pwd" id="pwd" placeholder="请输入您的密码" required minlength="6" maxlength="15">
                    <span><img src="<%=basePath%>images/login/mm.png"></span>
                </div>
                <input class="button_login"name="signon" type="submit" value="登录" id="bt-login"/>
               
            </div>
             <div style="color:#FFFFF0; font-size:18px" align="center">${msg}</div>
        </form>
    </div>
</div>
<!--错误提示-->
<div id="showResult"></div>
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
            <p class="footer2"><img src="<%=basePath%>images/footer/footerFont.png"
			alt=""/></p>
            
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
</html>