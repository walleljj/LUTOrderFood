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
  <title>菜单表格</title>
  <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>layui/css/layui.css"  media="all">
</head>
<body>
<h1 align="center" style="margin-top:5px" >菜品管理</h1>
<table id="demo" lay-filter="demo" class="layui-hide" lay-data="{height: 'full-50', cellMinWidth: 80}">
	  <thead>
	    <tr>
	      <th lay-data="{field:'id', width:80}">ID</th>
	      <th lay-data="{field:'name',sort:true}">菜名</th>
	      <th lay-data="{field:'photo',sort:true,width:660}">图片</th>
	      <th lay-data="{field:'price', sort:true}">价格</th>
	      <th lay-data="{field:'state', sort:true}">状态</th>
	      <th lay-data="{fixed:'right',toolbar: '#barDemo',width:227}">操作</th>
	    </tr> 
	  </thead>
	  
</table>
<!-- 种类添加 -->
<div style="display: none;" id="editrole" class="change-pas-box">
	<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>种类管理</legend>
		</fieldset>
	<table id="UR" lay-filter="UR" class="layui-hide" lay-data="{height: 400, cellMinWidth: 80}">
	  <thead>
	    <tr>
	      <th lay-data="{field:'id',sort:true,width:150}">所属种类ID</th>
	      <th lay-data="{field:'name',sort:true,width:180}">所属种类名</th>
	      <th lay-data="{fixed:'right',toolbar: '#barUR', width:50}">操作</th>
	    </tr> 
	  </thead>
	  
	</table>
	<form class="layui-form" method="post" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">添加种类</label>
				<div class="layui-input-inline">
					<input id="rolename" type="text" name="rolename" lay-verify="title" autocomplete="off" placeholder="请输入要添加的角色名"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="reset" class="layui-btn layui-btn-primary"  id="update">添加</button>
					<button type="reset" class="layui-btn layui-btn-primary" id="celupdate">取消</button>
				</div>
			</div>
		</form>
</div>

<!-- 菜品编辑 -->
<div style="display: none;" id="editcai" class="change-pas-box">
<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>菜品编辑</legend>
	</fieldset>

	<form enctype="multipart/form-data" class="layui-form" method="post" action="<%=basePath %>UpdateFoodSvl">
		<div class="layui-form-item">
			<label class="layui-form-label">店铺ID</label>
			<div class="layui-input-inline">
				<input id="resid" type="text" name="resid" lay-verify="title" readonly="readonly"
					autocomplete="off" value='${restaurant.resid}' class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">菜品ID</label>
			<div class="layui-input-inline">
				<input id="foodid" type="text" name="foodid" lay-verify="title" readonly="readonly"
					autocomplete="off"  class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">菜名</label>
			<div class="layui-input-inline">
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
			<div class="layui-input-inline">
				<input id="price" type="text" name="price" lay-verify="price"
					autocomplete="off" placeholder="请输入价格" class="layui-input">
			</div>
		</div>
		 <div class="layui-form-item">
		    <label class="layui-form-label">是否可用</label>
		    <div class="layui-input-inline">
		      <input type="checkbox" checked="" name="state" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
		    </div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>



<script type="text/html" id="barUR">
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delUR">删除</a>
</script>


	<script src="<%=request.getContextPath() %>/layui/layui.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.min.js" charset="utf-8"></script> 
 	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="editp">菜品编辑</a>
  		<a class="layui-btn layui-btn-xs" lay-event="editz">种类编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	
<script>
layui.use(['table','form','layer'],function(){
    var table = layui.table
    ,layer=layui.layer
    
    ,$ = layui.jquery//加载表格模块
  /*   var resid = ${restaurant.resid }; */
    table.init('demo', {
         hight:500  
        ,url:'<%=request.getContextPath() %>/ListAllUserSvl?resid=<%=session.getAttribute("resid")%>'
        ,page:true //开启分页
        ,limits: [30,60,90]
        ,limit: 30 //每页默认显示的数量
    });
  //监听工具条
  var rrr;
    table.on('tool(demo)', function (obj) {
            var data = obj.data;
            var event = obj.event;
            
            if (event === 'del') {
                var msg='';
           	   layer.confirm('真的删除'+data.name+'么?', function(index){
           		   $.ajax({
                          url: '<%=request.getContextPath()%>/DeletFoodSvl',
                          type: "GET",
                          async: false,
                          data: {
                              foodid:data.id
                          },
                          dataType: 'HTML',
                          
                         success: function (data) {
                             msg = data;
                          } 
                      });
           		   if(msg=='1'){
           			   layer.msg('删除成功', { icon: 1, time: 1500 }, function () {
                              obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                              $(".layui-laypage-btn").click();
                          });
           			   layer.close(index);
           		   }else{
           			   layer.msg('删除失败', { icon: 2, time: 1500 });
           		   }
           		   
           	       
           	      });
            }else if(event == 'editp'){
            	$("#foodid").attr("value",data.id);
            	$("#foodname").attr("value",data.name);
            	$("#price").attr("value",data.price);
            	layer.open({
                    type: 1,
                    btnAlign: 'c',
                    area: ['370px', '450px'],
                    title: false,
                    content: $("#editcai"), 
                });
            }else if(event == 'editz'){
            	rrr=data.id;
            	layer.msg(rrr);
            	table.init('UR', {
                    hight:500
                   ,url:'<%=request.getContextPath()%>/ListUR?foodid='+rrr //设置高度
                   ,page:true //开启分页
                   ,limits: [5,10,15]
                   ,limit: 5 //每页默认显示的数量
               });
            	layer.open({
                    type: 1,
                    btnAlign: 'c',
                    area: ['390px', '600px'],
                    title: false,
                    content: $("#editrole"), 
                });
            	
            	
            	
            	
            }
    });
    
    
    table.on('tool(UR)', function (obj) {
        var data = obj.data;
        var event = obj.event;
        if (event === 'delUR') {
        	var msg='';
         	   layer.confirm('真的删除此角色么?', function(index){
         		  $.ajax({
                      url: '<%=request.getContextPath()%>/DeleteTypeSvl',
                      type: "GET",
                      async: false,
                      data: {
                          foodid:rrr,
                          typeid:data.id
                      },
                      dataType: 'HTML',
                     success: function (data) {
                         msg = data;
                      } 
                  });
         		 if(msg=='1'){
         		   layer.msg('删除成功', { icon: 1, time: 1500 }, function () {
                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        $(".layui-laypage-btn").click();
                    });
         	        layer.close(index);
	         	   }else
	             	   layer.msg('删除失败', { icon: 2, time: 1500 }); 
         	   });
            
        }
    });
    $('#update').on('click',function(){
    	var msg;
  	  $.ajax({
            url: '<%=request.getContextPath()%>/AddTypeSvl',
            type: "GET",
            async: false,
            data: {
            	foodid:rrr,
                typename:$('#rolename').val()
            },
            dataType: 'HTML',
           success: function (data) {
        	   msg=data;
            } 
        });
  	  if(msg=='1'){
  		layer.msg('添加成功');
  		$(".layui-laypage-btn").click();
  	  }else{
  		layer.msg('添加失败,没有分类');
  	  }
    });
    $('#celupdate').on('click',function(){
    	layer.closeAll();
	});

});


</script>
</body>
</html>