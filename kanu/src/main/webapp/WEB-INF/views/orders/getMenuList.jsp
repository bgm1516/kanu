<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>getMenuList.jsp</title>
</head>
<body>
<form style="color: black;">
	<h3>메뉴 목록</h3>
	<br>
	<a href="insertMenu"><input type="button" value="메뉴 등록하기"></a>
	

		<c:forEach items="${menuList}" var="menu">
			menuid:${menu.menuId}<br>
			menuname:${menu.menuName}<br>
			price:${menu.price}<br>
		</c:forEach>
		</form>
</body>
</html>