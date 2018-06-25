<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>getMenuList.jsp</title>
</head>
<body>
	<a href="insertMenu">게시글등록하기</a>
	<h3>메뉴 목록(getMenuList)</h3>
	
		<form>
		<select>
		<option>선택</option>
		<c:forEach items="${conditionMap}" var = "menu">
			<option value="${menu.value}">${menu.key}</option>
		</c:forEach>
		</select>
		<input type="submit" value="검색"/>
		
		</form>
	
	<c:forEach items="${menuList}" var="menu">
		<div style="border: 1px solid blue;">
			menu_id:<a href="getMenu/${menu.MENU_ID}">${menu.MENU_ID}</a><br>
			menu_name:${menu.menu_name}<br>
			price:${menu.price}<br>
		</div>
	</c:forEach>
</body>
</html>
		
<%-- <table border="1">
		<c:forEach items="${MenuList}" var="me">
			<tr>
				<td>${me.MENU_ID}</td>
				<td>${me.MENU_NAME}</td>
				<td>${me.RRICE}</td>
			</tr>
		</c:forEach>
	</table> --%>
 