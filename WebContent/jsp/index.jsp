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
<title>阿甲商城学子餐饮店家页</title>
<link href="<%=basePath%>css/foodstore.css" rel="Stylesheet" />
<link href="<%=basePath%>css/header.css" rel="Stylesheet" />
<link href="<%=basePath%>css/footer.css" rel="Stylesheet" />
</head>
<body>
	<!-- 页面顶部-->
	<header id="top">
		<div id="logo" class="lf">
			<img src="<%=basePath%>images/header/logo.png" alt="logo" />
		</div>
		<div id="top_input" class="lf">
			<input id="input" type="text" placeholder="请输入您要搜索的内容" />
			<a href="" class="rt"><img id="search"
				src="<%=basePath%>images/header/search2.png" alt="搜索" /></a>
		</div>
		<div class="rt">
			<ul class="lf">
			<c:if test="${user == null}">
				<li><a href="lookforward.html">帮助</a><b>|</b></li>
				<li><a href="<%=basePath%>LoginSvl">登录</a></li>
			</c:if>
			<c:if test="${user != null}">
				<li><a href="<%=basePath%>MyOrderSvl" title="我的订单">
					<img class="order" src="<%=basePath%>images/header/order.png" alt="订单" /></a><b>|</b>
				</li>
				<li><a href="<%=basePath%>CartSvl" title="我的购物车">
					<img class="shopcar" src="<%=basePath%>images/header/shop_car.png" alt="我的购物车" /></a><b>|</b>
				</li>
				<li><a href="<%=basePath%>MainSvl">${user.username}</a><b>|</b></li>
				<li><a href="<%=basePath%>LogoutSvl">退出</a></li>
			</c:if>
			</ul>
		</div>

	</header>
	<!-- nav主导航-->
	<div class="store">
	dsdsfs
		<img src="${res.resphoto2 }" alt="" />
		<div class="store_top">
			<div class="store_top_left lf">
				<p>
					${res.resname } 
				</p>
				<p>
					<img src="<%=basePath%>images/foodstore/foodstore_img1.png" alt="" />地址：
					<span>${res.resaddres }</span>
				<p>
					<img src="<%=basePath%>images/foodstore/foodstore_img2.png" alt="" />营业时间：<span>06:00-14:00
						16:00-20:00</span><img
						src="<%=basePath%>images/foodstore/foodstore_img4.png" alt="" />
				</p>
			</div>
			<div class="store_top_right lf">
				<img src="<%=basePath%>images/foodstore/foodstore_img5.png" alt="" />
				<p>送达时间</p>
				<p>
					${res.resarrivetime }min<span class="only">起</span>
				</p>
			</div>
			<div class="store_top_right lf">
				<img src="<%=basePath%>images/foodstore/foodstore_img6.png" alt="" />
				<p>起送量</p>
				<p>
					￥<span>${res.resminmoney }</span>
				</p>
			</div>
			<div class="store_top_right lf">
				<img src="<%=basePath%>images/foodstore/foodstore_img7.png" alt="" />
				<p>配送费</p>
				<p>
					￥<span>${res.respipage }</span>
				</p>
			</div>
			<div></div>
		</div>
	</div>

	<!--精选美食-->
	<div class="sotre_action">
		<div class="store_action_left">
			<div class="store_action_left_top">
				<p>
					<img src="<%=basePath%>images/foodstore/foodstore_icon1.png" alt="" />精美菜品
				</p>
				
			</div>
			<div class="store_action_left_content">
			<c:forEach items="${type_food }" var="tf">
				<div id="${tf.typeid}">
					<div class="salc_top">
			                    ${tf.typename }
			        </div>
			        <div class="salc_content">
						<c:forEach items="${tf.food }" var="f">
							<div id="${f.foodid }">
								<img src="<%=basePath %>${f.foodphoto }" alt="" />
								<div>
									<p>
										<span class="foodname">${f.foodname }</span> <span>￥:<span
											class="price">${f.foodprice }</span>/份
										</span>
									</p>
									<div>
										<span class="reduc lf">-</span><input type="text" value="1"
											class="lf" /><span class="add lf">+</span>
										<div class="addcart">加入购物车</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="store_action_right rt">
			<div class="store_action_right_top">
				<p>
					<img src="<%=basePath%>images/foodstore/foodstore_icon2.png" alt="" />商家公告
				</p>
				<div>
					<p>${res.resdes }</p>
					
				</div>
			</div>
			<div class="store_action_right_cart">
				<div class="store_action_right_cart_top">
					购物车 <span class="clear rt">清空</span>
				</div>
				<div class="store_action_right_cart_content">
					<div></div>
				</div>
				<div class="sarc">
					<div class="total_price lf">
						<img src="<%=basePath%>images/foodstore/foodstore_car_2.png"
							alt="" /> ￥：<span>0.00</span>
					</div>
					<div class="settle lf">去结算</div>
				</div>
			</div>
		</div>
	</div>
	<!--商家-->

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
	<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>js/index.js"></script>
	<script src="<%=basePath%>js/foodstore.js"></script>
	<script type="text/javascript">
		$('.addcart').click(function(){
		    var foodname=$(this).parent().prev('p').children('.foodname').html();
		    var id=$(this).parent().parent().parent().attr('id');
		    
		    var price=$(this).parent().parent().parent().find('.price').html();
		    var num=$(this).parent().parent().parent().find('input').val();
		    var length=$('.store_action_right_cart_content>div').length;
		    var one_total_price=(price*num).toFixed(2);
		    $.ajax({
		        url: '<%=basePath%>ShopCarAddSvl',
		        type: "get",
		        async: false,
		        data: {
		           foodid:id,
		           foodprice:price,
		           qty:num
		        },
		        dataType: 'html',
		       success: function (data) {
		        } 
		    });
		    $('.store_action_right_cart_content>div').each(function(){
		        if($(this).attr('id')===id){
		            var one_cartnum=parseFloat($(this).find('input').val());
		            var one_cartprice=parseFloat($(this).find('.cart_unit_price').html());
		            var newnum=one_cartnum+parseFloat(num);
		            $(this).find('input').val(newnum);
		            $(this).find('.cart_unit_price').html((one_cartprice+parseFloat(one_total_price)).toFixed(2));
		        }
		        else{
		            length--;
		            if(length===0){
		                var html="<div id="+id+" class='addtion'><span>"+foodname+"</span><div><span class='cart_reduc lf'>-</span><input type='text' value="+num+" class='lf'/><span class='cart_add lf'>+</span></div><span class='rt pc'>￥:<span class='cart_unit_price'>"+one_total_price+"</span></span></div>";
		                $('.store_action_right_cart_content').append(html);
		            }
		        }
		    })
		    total();
		})
		
		$('.settle').click(function(){
			window.location.href="<%=basePath%>ToOrderConfirmSvl?userid=${user.userid}";
		})
		
	</script>
</body>
</html>