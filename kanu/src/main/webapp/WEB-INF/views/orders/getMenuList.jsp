<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>getMenuList.jsp</title>
</head>
<body>
	<h3>게시판목록(getMenuList)</h3>
<table border="1">
		<c:forEach items="${menuList}" var="me">
			<tr>
				<td>${me.MENU_ID}</td>
				<td>${me.MENU_NAME}</td>
				<td>${me.RRICE}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>