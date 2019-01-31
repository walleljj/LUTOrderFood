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
  <title>订单表格</title>
  <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>layui/css/layui.css"  media="all">
</head>
<body>
<h1 align="center" style="margin-top:5px" >订单处理</h1>
<h2 align="center" style="margin-top:5px;color:red" >状态：'0'为未付款、'1'为已付款、'2'为待处理、'3'为配送中、'4'为订单已结束、'5'为退款</h2>

<table id="demo" lay-filter="demo" class="layui-hide" lay-data="{height: 'full-100', cellMinWidth: 80}">
	  <thead>
	    <tr>
	      <th lay-data="{field:'id', width:80}">ID</th>
	      <th lay-data="{field:'userid',sort:true}">用户ID</th>
	      <th lay-data="{field:'address',sort:true}">详细配送地址</th>
	      <th lay-data="{field:'receivername', sort:true}">收件人姓名</th>
	      <th lay-data="{field:'tel', sort:true}">收件人联系方式</th>
	      <th lay-data="{field:'time', sort:true}">支付时间</th>
	      <th lay-data="{field:'state', sort:true}">状态</th>
	      <th lay-data="{field:'allmoney', sort:true}">金额</th>
	      <th lay-data="{fixed:'right',toolbar: '#barDemo',width:227}">操作</th>
	    </tr> 
	  </thead>
	  
</table>
<!-- 查看详情 -->
<div style="display: none;" id="item" class="change-pas-box">
	<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>订单内容</legend>
		</fieldset>
	<table id="listitem" lay-filter="listitem" class="layui-hide" lay-data="{height: 400, cellMinWidth: 80}">
	  <thead>
	    <tr>
	      <th lay-data="{field:'name',sort:true}">菜名</th>
	      <th lay-data="{field:'price',sort:true}">单价</th>
	      <th lay-data="{field:'qty',sort:true}">数量</th>
	      <th lay-data="{field:'allmoney',sort:true}">总价</th>
	    </tr> 
	  </thead>
	</table>
</div>
<!-- 种类状态 -->
<div style="display: none;" id="editstate" class="change-pas-box">
	<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>状态更新</legend>
		</fieldset>
	<table id="UR" lay-filter="UR" class="layui-hide" lay-data="{height: 400, cellMinWidth: 80}">
	  <thead>
	    <tr>
	      <th lay-data="{field:'id',sort:true}">订单ID</th>
	      <th lay-data="{field:'name',sort:true}">操作名</th>
	      <th lay-data="{field:'desc',sort:true}">操作描述</th>
	      <th lay-data="{field:'time',sort:true}">操作时间</th>
	    </tr> 
	  </thead>
	  
	</table>
	<form class="layui-form" method="post" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">配送员</label>
				<div class="layui-input-inline">
					<input id="psname" type="text" name="psname" lay-verify="title2"
						autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">联系方式</label>
					<div class="layui-input-inline">
						<input id="pstel" type="tel" name="pstel" lay-verify="required|phone"
							autocomplete="off"  class="layui-input">
					</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="reset" class="layui-btn layui-btn-primary"  id="update">配送</button>
					<button type="reset" class="layui-btn layui-btn-primary"  id="delorder">退款</button>
					<button type="reset" class="layui-btn layui-btn-primary" id="celupdate">取消</button>
				</div>
			</div>
		</form>
</div>



	<script src="<%=request.getContextPath() %>/layui/layui.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.min.js" charset="utf-8"></script> 
 	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="lookitem">查看订单内容</a>
		<a class="layui-btn layui-btn-xs" lay-event="editstate">订单处理</a>
	</script>
	
<script>
layui.use(['table','form','layer'],function(){
    var table = layui.table
    ,layer=layui.layer
    
    ,$ = layui.jquery//加载表格模块
  /*   var resid = ${restaurant.resid }; */
    table.init('demo', {
         hight:500  
        ,url:'<%=basePath%>/ListAllOrderSvl?resid=<%=session.getAttribute("resid")%>'
        ,page:true //开启分页
        ,limits: [30,60,90]
        ,limit: 30 //每页默认显示的数量
    });
  //监听工具条
  var rrr;
    table.on('tool(demo)', function (obj) {
            var data = obj.data;
            var event = obj.event;
            rrr=data;
            if (event === 'lookitem') {
            	table.init('listitem', {
                    hight:500
                   ,url:'<%=basePath%>/ListItemSvl?orderid='+data.id 
                   ,page:true //开启分页
                   ,limits: [5,10,15]
                   ,limit: 5 //每页默认显示的数量
               });
            	layer.open({
                    type: 1,
                    btnAlign: 'c',
                    area: ['400px', '480px'],
                    title: false,
                    content: $("#item"), 
                });
            }else{
            	
            	layer.msg(rrr.id);
            	table.init('UR', {
                    hight:500
                   ,url:'<%=basePath%>/ListUpdateSvl?orderid='+rrr.id 
                   ,page:true //开启分页
                   ,limits: [5,10,15]
                   ,limit: 5 //每页默认显示的数量
               });
            	layer.open({
                    type: 1,
                    btnAlign: 'c',
                    area: ['630px', '600px'],
                    title: false,
                    content: $("#editstate"), 
                });
              
            }
    });
    $('#update').on('click',function(){
    	var msg;
  	  $.ajax({
           url: '<%=request.getContextPath()%>/AddPeiSongSvl',
           type: "GET",
           async: false,
           data: {
        	   orderid:rrr.id,
        	   state:rrr.state,
	           psname:$('#psname').val(),
	           pstel:$('#pstel').val()
	       },
           dataType: 'HTML',
           success: function (data) {
        	   msg=data;
            } 
        });
  	  if(msg=='1'){
  		layer.msg('状态更新成功');
  		$(".layui-laypage-btn").click();
  	  }else if(msg=='2'){
  		layer.msg('配送失败，订单当前状态无法配送');
  	  }else{
  		layer.msg('配送失败，服务器出错');
  	  }
    });
    $('#delorder').on('click',function(){
    	var msg;
  	  $.ajax({
            url: '<%=request.getContextPath()%>/DelOrderSvl',
            type: "GET",
            async: false,
            data: {
         	   orderid:rrr.id,
         	   state:rrr.state,
 	           allmoney:rrr.allmoney,
 	           userid:rrr.userid
 	       },
            dataType: 'HTML',
           success: function (data) {
        	   msg=data;
            } 
        });
  	  if(msg=='1'){
  		layer.msg('退款成功');
  		$(".layui-laypage-btn").click();
  	  }else if(msg=='2'){
  		layer.msg('退款失败,当前状态无法退款');
  	  }else{
  		layer.msg('退款失败,服务器出错');
  	  }
    });
    $('#celupdate').on('click',function(){
    	layer.closeAll();
	});

});


</script>
</body>
</html>