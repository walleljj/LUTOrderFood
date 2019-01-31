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
    <link href="<%=basePath%>css/foodstore.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/header.css" rel="Stylesheet"/>
    <link href="<%=basePath%>css/footer.css" rel="Stylesheet"/>
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
<!-- nav主导航-->
<nav id="nav">
    <ul>
        <li><a href="<%=basePath%>MainSvl" class="acti">首页</a></li>
        <li><a href="#">生活餐饮</a></li>
        <li><a href="#">学习用品</a></li>
        <li><a href="#">私人定制</a></li>
    </ul>
</nav>
<!-- banner部分-->
<div class="store">
    <img src="<%=basePath%>images/foodstore/foodstore_top.png" alt=""/>
    <div class="store_top">
        <div class="store_top_left lf">
            <p>必胜客欢乐餐厅 <span>(大钟寺店)</span></p>
            <p><img src="<%=basePath%>images/foodstore/foodstore_img1.png" alt=""/>地址：<sapn>海淀区北三环西路大钟寺中坤广场B座商户</sapn>
            <p><img src="<%=basePath%>images/foodstore/foodstore_img2.png" alt=""/>营业时间：<span>06:00-14:00  16:00-20:00</span><img src="<%=basePath%>images/foodstore/foodstore_img4.png" alt=""/></p>
            <p class="store_collection">
                <img src="<%=basePath%>images/foodstore/foodstore_img3.png" alt=""/>收藏店家
            </p>
        </div>
        <div class="store_top_right lf">
            <img src="<%=basePath%>images/foodstore/foodstore_img5.png" alt=""/>
            <p>送达时间</p>
            <p>30min<span class="only">起</span></p>
        </div>
        <div class="store_top_right lf">
            <img src="<%=basePath%>images/foodstore/foodstore_img6.png" alt=""/>
            <p>起送量</p>
            <p>￥<span>20.00</span></p>
        </div>
        <div class="store_top_right lf">
            <img src="<%=basePath%>images/foodstore/foodstore_img7.png" alt=""/>
            <p>配送费</p>
            <p>￥<span>6.00</span></p>
        </div>
        <div></div>
    </div>
</div>

<!--精选美食-->
<div class="sotre_action">
    <div class="store_action_left">
        <div class="store_action_left_top">
            <p><img src="<%=basePath%>images/foodstore/foodstore_icon1.png" alt=""/>精美菜品</p>
            <div>
                <a href="#zc" class="active">早餐系列</a>
                <a href="#youhui">优惠套餐</a>
                <a href="#djzc">单点主餐</a>
                <a href="#pcxl">配餐系列</a>
                <a href="#ylxl">饮料系列</a>
            </div>
        </div>
        <div class="store_action_left_content">
            <div id="zc">
                <div class="salc_top">
                    早餐系列
                </div>
                <div class="salc_content">
                    <div id="4">
                        <img src="<%=basePath%>images/foodstore/breakfast_1.png" alt=""/>
                        <div>
                            <p><span class="foodname">双黄鸡蛋</span> <span>￥:<span class="price">7.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="5">
                        <img src="<%=basePath%>images/foodstore/breakfast_2.png" alt=""/>
                        <div>
                            <p><span class="foodname">莲蓉饼</span> <span>￥:<span class="price">8.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="6">
                        <img src="<%=basePath%>images/foodstore/breakfast_3.png" alt=""/>
                        <div>
                            <p><span class="foodname">春卷</span> <span>￥:<span class="price">8.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="7">
                        <img src="<%=basePath%>images/foodstore/breakfast_4.png" alt=""/>
                        <div>
                            <p><span class="foodname">豆沙馅饼</span> <span>￥:<span class="price">5.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="8">
                        <img src="<%=basePath%>images/foodstore/breakfast_5.png" alt=""/>
                        <div>
                            <p><span class="foodname">蔓越莓饼</span> <span>￥:<span class="price">6.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="9">
                        <img src="<%=basePath%>images/foodstore/breakfast_6.png" alt=""/>
                        <div>
                            <p><span class="foodname">五彩馒头</span> <span>￥:<span class="price">5.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="youhui">
                <div class="salc_top">
                    优惠套餐
                </div>
                <div class="salc_content">
                    <div id="1">
                        <img src="<%=basePath%>images/foodstore/catering_1.png" alt=""/>
                        <div>
                            <p><span class="foodname">薯片沙拉</span> <span>￥:<span class="price">10.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="2">
                        <img src="<%=basePath%>images/foodstore/catering_2.png" alt=""/>
                        <div>
                            <p><span class="foodname">豆豉花生</span> <span>￥:<span class="price">18.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="3">
                        <img src="<%=basePath%>images/foodstore/catering_3.png" alt=""/>
                        <div>
                            <p><span class="foodname">蔬菜沙拉</span> <span>￥:<span class="price">20.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="djzc">
                <div class="salc_top">
                    单点主餐
                </div>
                <div class="salc_content">
                    <div id="14">
                        <img src="<%=basePath%>images/foodstore/dinner_1.png" alt=""/>
                        <div>
                            <p><span class="foodname">油焖大虾套餐</span> <span>￥:<span class="price">25.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="15">
                        <img src="<%=basePath%>images/foodstore/dinner_2.png" alt=""/>
                        <div>
                            <p><span class="foodname">鸡肉套餐</span> <span>￥:<span class="price">19.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="16">
                        <img src="<%=basePath%>images/foodstore/dinner_3.png" alt=""/>
                        <div>
                            <p><span class="foodname">焖豆角套餐</span> <span>￥:<span class="price">10.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="17">
                        <img src="<%=basePath%>images/foodstore/dinner_4.png" alt=""/>
                        <div>
                            <p><span class="foodname">黄瓜套餐</span> <span>￥:<span class="price">8.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="18">
                        <img src="<%=basePath%>images/foodstore/dinner_5.png" alt=""/>
                        <div>
                            <p><span class="foodname">排骨米饭套餐</span> <span>￥:<span class="price">19.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="19">
                        <img src="<%=basePath%>images/foodstore/dinner_6.png" alt=""/>
                        <div>
                            <p><span class="foodname">小黄鱼套餐</span> <span>￥:<span class="price">17.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="pcxl">
                <div class="salc_top">
                    配餐系列
                </div>
                <div class="salc_content">
                    <div id="21">
                        <img src="<%=basePath%>images/foodstore/preferential_1.png" alt=""/>
                        <div>
                            <p><span class="foodname">营养海鲜汤</span> <span>￥:<span class="price">25.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="22">
                        <img src="<%=basePath%>images/foodstore/preferential_2.png" alt=""/>
                        <div>
                            <p><span class="foodname">全素套餐</span> <span>￥:<span class="price">16.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="23">
                        <img src="<%=basePath%>images/foodstore/preferential_3.png" alt=""/>
                        <div>
                            <p><span class="foodname">红烧肉盖饭套餐</span> <span>￥:<span class="price">20.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ylxl">
                <div class="salc_top">
                    饮料系列
                </div>
                <div class="salc_content">
                    <div id="31">
                        <img src="<%=basePath%>images/foodstore/drink_1.png" alt=""/>
                        <div>
                            <p><span class="foodname">雪花啤酒</span> <span>￥:<span class="price">20.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="32">
                        <img src="<%=basePath%>images/foodstore/drink_2.png" alt=""/>
                        <div>
                            <p><span class="foodname">雪碧饮料</span> <span>￥:<span class="price">20.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="33">
                        <img src="<%=basePath%>images/foodstore/drink_3.png" alt=""/>
                        <div>
                            <p><span class="foodname">珠江啤酒</span> <span>￥:<span class="price">20.00</span>/份</span></p>
                            <div>
                                <span class="reduc lf">-</span><input type="text" value="1" class="lf"/><span class="add lf">+</span>
                                <div class="addcart">
                                    加入购物车
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="store_action_right rt">
        <div class="store_action_right_top">
            <p><img src="<%=basePath%>images/foodstore/foodstore_icon2.png" alt=""/>商家公告</p>
            <div>
                <p>本店推出全网最低价套餐，保证比其他平台的价格要低！</p>
                <p>不要葱、姜、蒜等这些忌口暂时无法坐不了，敬请谅解！</p>
                <p>晚上10点以后订餐需另加送餐费2元！谢谢合作！</p>
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
                    <img src="<%=basePath%>images/foodstore/foodstore_car_2.png" alt=""/>
                    ￥：<span>0.00</span>
                </div>
                <div class="settle lf">
                    去结算
                </div>
            </div>
        </div>
    </div>
</div>
<!--商家-->

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
<script src="<%=basePath%>js/foodstore.js"></script>
<script>


</script>
</body>
</html>