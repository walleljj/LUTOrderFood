<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>用户注册</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
        <link rel="stylesheet" href="layui/css/layui.css" />
        <script type="text/javascript">
			var msg = '${msg}';
				if(msg){
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
                            <h1><strong>后台权限管理系统</strong> </h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>用户注册</h3>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    
			                    
			                    
			                    
			                    <form class="layui-form" action="">
								  <div class="layui-form-item">
								    <label class="layui-form-label">输入框</label>
								    <div class="layui-input-block">
								      <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">密码框</label>
								    <div class="layui-input-inline">
								      <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
								    </div>
								    <div class="layui-form-mid layui-word-aux">辅助文字</div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">选择框</label>
								    <div class="layui-input-block">
								      <select name="city" lay-verify="required">
								        <option value=""></option>
								        <option value="0">北京</option>
								        <option value="1">上海</option>
								        <option value="2">广州</option>
								        <option value="3">深圳</option>
								        <option value="4">杭州</option>
								      </select>
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">复选框</label>
								    <div class="layui-input-block">
								      <input type="checkbox" name="like[write]" title="写作">
								      <input type="checkbox" name="like[read]" title="阅读" checked>
								      <input type="checkbox" name="like[dai]" title="发呆">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">开关</label>
								    <div class="layui-input-block">
								      <input type="checkbox" name="switch" lay-skin="switch">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">单选框</label>
								    <div class="layui-input-block">
								      <input type="radio" name="sex" value="男" title="男">
								      <input type="radio" name="sex" value="女" title="女" checked>
								    </div>
								  </div>
								  <div class="layui-form-item layui-form-text">
								    <label class="layui-form-label">文本域</label>
								    <div class="layui-input-block">
								      <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <div class="layui-input-block">
								      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
								      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
								    </div>
								  </div>
								</form>
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
    </body>

</html>