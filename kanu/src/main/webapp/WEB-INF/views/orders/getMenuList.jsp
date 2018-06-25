<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>getMenuList.jsp</title>
</head>
<body>
<form>
	<h3>메뉴 목록</h3>
	<br>
	<a href="insertMenu"><input type="button" value="메뉴 등록하기"></a>
	
	 <table border="1">
		<c:forEach items="${menuList}" var="menu">
		<tr>
			<td>menuid:${menu.MENUID}</td>
			<td>menuname:${menu.MENUNAME}</td>
			<td>price:${menu.PRICE}</td>
			</tr>
		</c:forEach>
		</table>
		</form>
</body>
</html>