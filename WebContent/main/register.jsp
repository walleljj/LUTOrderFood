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
  <title>阿甲商城学子注册页面</title>
  <link href="<%=basePath%>css/header.css" rel="Stylesheet"/>
  <link href="<%=basePath%>css/footer.css" rel="Stylesheet"/>
  <link href="<%=basePath%>css/animate.css" rel="Stylesheet"/>
  <link href="<%=basePath%>css/login.css" rel="stylesheet" />
</head>
<body>
<!-- 页面顶部-->
<header id="top">
  <div class="top">
    <img src="<%=basePath%>images/header/logo.png" alt=""/>
    <span>欢迎注册</span>
  </div>
</header>
<div class="parent">
  <!--<video src="audio/snow.mp4" width="100%" autoplay loop muted></video>-->
  <div class="container">
    <div class="panel rt">
      <form id="form-register" method="post" action="<%=basePath%>RegisterSvl">
        <div class="txt">
          <p>新用户注册
            <span>
              <a href="<%=basePath%>LoginSvl">直接登录</a>
            </span>
          </p>
        </div>
        <div class="form-group">
          <label for="uname">用户ID：</label>
          <input autocomplete required minlength="6" maxlength="9" type="text" placeholder="请输入用户ID" autofocus name="userid" id="uuserid"/>
          <span class="msg-default">用户名长度在6到9位之间</span>
        </div>
        <div class="form-group">
          <label for="uname">用户名：</label>
          <input autocomplete required minlength="6" maxlength="9" type="text" placeholder="请输入用户名" autofocus name="username" id="username"/>
        </div>
        <div class="form-group">
          <label for="upwd">登录密码：</label>
          <input required type="pwd" minlength="6" maxlength="12" placeholder="请输入密码" name="pwd" autofocus id="pwd"/>
          <span class="msg-default hidden">密码长度在6到12位之间</span>
        </div>
        <div class="form-group">
          <label for="email">邮箱：</label>
          <input autocomplete required type="email" placeholder="请输入邮箱地址" name="email" id="email"/>
          <span class="msg-default hidden">请输入合法的邮箱地址</span>
        </div>
        <div class="form-group">
          <label for="phone">手机号：</label>
          <input id="tel" name="tel" placeholder="请输入您的手机号" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$" required type="text" />
          <span class="msg-default hidden">请输入合法的手机号</span>
        </div>
        <div class="form-group">
          <label></label>
          <input class="bt-register" type="submit" value="提交注册信息" id="bt-register"/>
        </div>
        <div style="color:#FFFFF0; font-size:18px" align="center">alert(${msg})</div>
      </form>
    </div>
  </div>
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
</html>