<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h3>메뉴 수정</h3>

<form action="./deleteMenu" method="post">
	<input type="text" name="menuId" value="${menu.menuId}">
	<input type="text" name="menuName" value="${menu.menuName}">
	<input type="text" name="price" value="${menu.price}">
	<input type="submit" value="삭제"/>
</form>
</body>
</html>