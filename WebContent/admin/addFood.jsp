<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="<%=basePath %>layui/css/layui.css"
	media="all">
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>



	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>添加新菜品</legend>
	</fieldset>

	<form enctype="multipart/form-data" class="layui-form" method="post" action="<%=basePath %>AddFoodSvl">
		<div class="layui-form-item">
			<label class="layui-form-label">店铺ID</label>
			<div class="layui-input-inline">
				<input id="resid" type="text" name="resid" lay-verify="title" readonly="readonly"
					autocomplete="off" value='${restaurant.resid}' class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">菜名</label>
			<div class="layui-input-block">
				<input id="foodname" type="text" name="foodname" lay-verify="title"
					autocomplete="off" placeholder="请输入菜名" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
					<label class="layui-form-label">照片</label>
					<div class="layui-input-inline">
						<input type="file" name="file" id="test20">
					</div>
				</div>
		<div class="layui-form-item">
			<label class="layui-form-label">价格</label>
			<div class="layui-input-block">
				<input type="text" name="price" lay-verify="price"
					autocomplete="off" placeholder="请输入价格" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script src="<%=request.getContextPath() %>/layui/layui.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.min.js" charset="utf-8"></script> 
	
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
layui.use(['form', 'layedit', 'laydate','layer'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
 
  
 
  
  //监听提交
  form.on('submit(demo1)', function(data){
	  layer.msg('success');
     
    
  });
 
  
  
  
});
</script>

</body>
</html>