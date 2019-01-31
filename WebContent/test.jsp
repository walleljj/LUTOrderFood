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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${shopCar }" var="s">
		<h1>菜品id：${s.key }</h1>
		<h2>数量:${s.value.food.foodname }</h2>
		<h2>数量:${s.value.food.foodprice }</h2>
		<h2>数量:${s.value.food.foodphoto }</h2>
		<h2>数量:${s.value.food.resid }</h2>
	</c:forEach>

</body>
</html>