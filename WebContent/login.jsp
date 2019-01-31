<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台管理系统登录</title>

<!-- CSS -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/style.css">

<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

<link rel="stylesheet" href="<%=basePath%>frame/layui/css/layui.css">
<link rel="stylesheet" href="<%=basePath%>frame/static/css/style.css">
<link rel="icon" href="../frame/static/image/code.png">

<script type="text/javascript">
	var msg = '${msg}';
	if (msg) {
		alert(msg);
<%session.removeAttribute("msg");%>
	}
</script>

</head>

<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1 style="font-size: 50px">后台管理</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3 style="font-size: 30px">登录</h3>
								<p style="font-size: 15px">请输入你的商家ID和密码:</p>
							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form class="layui-form" method="post" action="<%=basePath %>ResLoginSvl">
								<div class="layui-form-item">
									<label class="layui-form-label">商家ID</label>
									<div class="layui-input-block">
										<input id="resid" type="text" name="resid"
											lay-verify="title" autocomplete="off" placeholder="请输入用户名"
											class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">密码</label>
									<div class="layui-input-block">
										<input id="pwd" type="password" name="pwd"
											lay-verify="pass" placeholder="请输入密码" autocomplete="off"
											class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block" style="margin-left: 170px">
										<button class="layui-btn" lay-submit="" lay-filter="demo1"
											margin-left="20px">立即登录</button>
										<button type="reset" class="layui-btn layui-btn-primary">重置</button>
									</div>
								</div>
								<hr />

								<p>
									<a href="javascript:;" class="fr register">注册商家</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div style="display: none;" id="reg" class="change-pas-box">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>注册商家</legend>
		</fieldset>
		<form class="layui-form" method="post"
			action="#">
			<div class="layui-form-item">
				<label class="layui-form-label">商家ID</label>
				<div class="layui-input-inline">
					<input id="username2" type="text" name="username2" lay-verify="title2"
						autocomplete="off" placeholder="请输入用户名" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">店名</label>
				<div class="layui-input-inline">
					<input id="realname2" type="text" name="realname2" lay-verify="title22"
						autocomplete="off" placeholder="请输入姓名" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input id="password2" type="password" name="password2" lay-verify="pass2"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="password22" lay-verify="pass22"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block" style="margin-left: -20px">
					<button class="layui-btn tijiao" lay-submit="" lay-filter="demo2">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>






	<script src="<%=request.getContextPath()%>/layui/layui.js"
		charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js"
		charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"
		charset="utf-8"></script>
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script>
		layui.use([ 'form','layedit', 'laydate', 'layer' ], function() {
			var form = layui.form,layer = layui.layer, $ = layui.jquery,layedit = layui.layedit
			  ,laydate = layui.laydate;//加载表格模块
			$('.register').on('click', function() {
				layer.open({
					type : 1,
					btnAlign : 'c',
					area : [ '310px', '400px' ],
					title : false,
					content : $("#reg"),
				});
			});
			//自定义验证规则
			  form.verify({
			    title2: function(value){
			      if(value.length < 5){
			        return '昵称至少得5个字符啊';
			      }
			      $.ajax({
			          url: '<%=basePath%>ResIdIsOk',
			          type: "GET",
			          async: false,
			          data: {
			              username:value
			          },
			          dataType: 'HTML',
			          
			         success: function (data) {
			             msg = data;
			          } 
			      });
			     if(msg=='0'){return "用户名重复，请重新输入！";}
			      
			    },
			  	title22: function(value){
			  		if(value.length<3){
			  			return '姓名格式不正确啊';
			  		}
			  	}
			    ,pass2: [/(.+){6,12}$/, '密码必须6到12位']
			    ,pass22:function(value){
			    	var repassvalue = $('#password2').val();
			    	if(value != repassvalue){
			    	return '两次输入的密码不一致!';}
			    }
			    
			    ,content: function(value){
			      layedit.sync(editIndex);
			    }
			  });
			  
			  form.on('submit(demo2)', function(data){
				  $.ajax({
			          url: '<%=basePath%>ResRegistSvl',
			          type: "POST",
			          async: false,
			          data: {
			        	  username2:$('#username2').val(),
			        	  realname2:$('#realname2').val(),
			        	  password2:$('#password2').val(),
			        	  email2:$('#email2').val(),
			        	  phone2:$('#tel2').val()
			          },
			          dataType: 'HTML',
			         success: function (data) {
			          } 
			      });
				  layer.msg('注册成功，请尽快登录并完善信息');
				  setTimeout("layer.closeAll()",2000);
			     return false;
			    
			  });
			
			

		});
	</script>
</body>

</html>