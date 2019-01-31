<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>工大网上订餐后台管理</title>

<link rel="stylesheet" href="layui/css/layui.css" />
<style type="text/css">
.haha{
	height:100%;
}
</style>
<script type="text/javascript" src="<%=basePath %>/layui.all.js"></script>
<script type="text/javascript">
	var msg = '${msg}';
	if (msg) {
		alert(msg);
<%session.removeAttribute("msg");%>
	}
</script>
</head>
<body>
	
	<div class="layui-layout layui-layout-admin">
		 <div class="layui-header" >
    <div class="layui-logo">工大网上订餐后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="<%=request.getContextPath() %>/${restaurant.resphoto1}" class="layui-nav-img">
         ${restaurant.resname }
        </a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:;" class="check" href-url="">修改资料</a></dd>
          <dd><a href="Javascript:;" class="changePassword">密码修改</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="<%=basePath%>/Exit">退了</a></li>
    </ul>
  </div>
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->

				<ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="demo">
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">菜品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="admin/listfood.jsp" target="option">菜品编辑</a>
							</dd>
							<dd>
								<a href="admin/addFood.jsp" target="option">菜品添加</a>
							</dd>
							
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="admin/listorder.jsp" target="option">订单处理</a>
							</dd>
							
							
						</dl>
					</li>
					
				</ul>
			</div>
		</div>
		<div class="layui-body" id="haha">
			<iframe id="option" name="option" src="welcome.jsp"
				style="overflow: visible;" scrolling="no" frameborder="no"
				width="100%" height="100%"></iframe>
		</div>
		<!-- 弹出修改个人信息界面 -->
		<div style="display: none;" id="changeArea" class="change-pas-box">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>修改店铺信息</legend>
			</fieldset>
			<form enctype="multipart/form-data" class="layui-form" method="post"
				action="<%=basePath%>aaa">
				<div class="layui-form-item">
					<label class="layui-form-label">店铺ID</label>
					<div class="layui-input-inline">
						<input id="resid" type="text" name="resid" lay-verify="title" readonly="readonly"
							autocomplete="off" value='${restaurant.resid}' class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">店铺名</label>
					<div class="layui-input-inline">
						<input id="realname" type="text" name="resname" lay-verify="title2"
							autocomplete="off" value="${restaurant.resname }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-inline">
						<input id="tel" type="tel" name="tel" lay-verify="required|phone"
							autocomplete="off" value="${restaurant.tel }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">店铺地址</label>
					<div class="layui-input-inline">
						<input id="resaddress" type="text" name="resaddress" lay-verify="resaddress"
							autocomplete="off" value="${restaurant.resaddres }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">店铺描述</label>
					<div class="layui-input-inline">
						<input id="resdes" type="text" name="resdes" lay-verify="resdes"
							autocomplete="off" value="${restaurant.resdes }" class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">配送时长</label>
					<div class="layui-input-inline">
						<input id="restime" type="text" name="restime" lay-verify="restime"
							autocomplete="off" value="${restaurant.resarrivetime }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">配送费</label>
					<div class="layui-input-inline">
						<input id="resprice" type="text" name="resprice" lay-verify="resprice"
							autocomplete="off" value="${restaurant.respipage }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">起送价格</label>
					<div class="layui-input-inline">
						<input id="resminprice" type="text" name="resminprice" lay-verify="resminprice"
							autocomplete="off" value="${restaurant.resminmoney }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">公告</label>
					<div class="layui-input-inline">
						<input id="resno" type="text" name="resno" lay-verify="resno"
							autocomplete="off" value="${restaurant.resnotices }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">主页图标</label>
					<div class="layui-input-inline">
						<input type="file" name="file" id="test20">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">店铺大图</label>
					<div class="layui-input-inline">
					<input type="file" name="file" id="test21">
					</div>
				</div>
				
				<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="demo1">修改</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="cel">取消</button>
			</div>
		</div>
			</form>
		</div>
	<!-- 修改密码界面 -->
		<div style="display: none;" id="changePass" class="change-pas-box">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 20px;">
				<legend>修改密码</legend>
			</fieldset>
			<form class="layui-form" method="post" action="">
			
				<div class="layui-form-item">
					<label class="layui-form-label"> 旧密码</label>
					<div class="layui-input-inline">
						<input id="pass3" type="password" name="pass3" lay-verify="pass3" 
							placeholder="请输入旧密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"> 密码</label>
					<div class="layui-input-inline">
						<input id="pwd" type="password" name="password" lay-verify="pass"
							placeholder="请输入新密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">重复密码</label>
					<div class="layui-input-inline">
						<input type="password" name="password2" lay-verify="pass2"
							placeholder="请再次输入密码" autocomplete="off" class="layui-input">
					</div>
				</div>


				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo2">修改</button>
						<button type="reset" class="layui-btn layui-btn-primary" id="cel2">取消</button>
					</div>
				</div>
			</form>
		</div>


	</div>


	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.min.js" charset="utf-8"></script> 
	<script>
		layui.use(['upload','element','util','layer','form'], function() {
			var element = layui.element
			,$ = layui.jquery
			,util=layui.util
			,layer=layui.layer
			,form=layui.form
			,upload=layui.upload
			element.on('nav(demo)', function(elem) {
				//layer.msg(elem.text());
				//alert(elem);
			});
			//取消按鈕
			$('#cel').on('click',function(){
				layer.closeAll();
			})
			$('#cel2').on('click',function(){
				var pa=$('#opwd').val();
				layer.msg(pa);
				//layer.closeAll();
			})
			//修改信息按鈕
			$('.check').on('click', function () {
				layer.open({
                    type: 1,
                    btnAlign: 'c',
                    area: ['360px', '710px'],
                    title: false,
                    content: $("#changeArea"), 
                });
		    });
			//修改密码按鈕
			$('.changePassword').on('click', function () {
				layer.open({
                    type: 1,
                    area: ['350px', '340px'],
                    title: false,
                    content: $("#changePass"), 
                });
		    });
			//自定意表单验证
			form.verify({
			    title: function(value){
			      if(value.length < 5){
			        return '昵称至少得5个字符啊';
			      }
			    },
			  	title2: function(value){
			  		if(value.length<3){
			  			return '姓名格式不正确啊';
			  		}
			  	}
			    ,pass3:function(value){
			    	var msg = '';
			    	//layer.msg(old);
			    	$.ajax({
				          url: '<%=basePath%>CheckOldPassSvl',
				          type: "get",
				          async: false,
				          data: {
				             resid:$('#resid').val(),
				             oldpass:value
				          },
				          dataType: 'HTML',
				          
				         success: function (data) {
				            msg=data;
				          } 
				      });
			    	if(msg=='0') return '旧密码输入错误';
			    }
			    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
			    ,pass2:function(value){
			    	var repassvalue = $('#pwd').val();
			    	if(value != repassvalue){
			    	return '两次输入的密码不一致!';}
			    }
			  });
			
			form.on('submit(demo2)', function(data){
				$.ajax({
			          url: '<%=basePath%>ChangePassSvl',
			          type: "post",
			          async: false,
			          data: {
			             resid:$('#resid').val(),
			             pwd:$('#pwd').val()
			          },
			          dataType: 'HTML',
			         success: function (data) {
			          } 
			      });
				  layer.msg('修改成功，2秒后关闭');
				  setTimeout("layer.closeAll()",2000);
				return false;
				  
			  });  
		});
		
	</script>
	<script>
//JavaScript代码区域
	</script>
</body>
</html>