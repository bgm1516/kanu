<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>updateMenu.jsp</title></head>
<body>
<h3>메뉴 수정</h3>

<form action="./updateMenu" method="post">
	<input type="text" name="menuId" value="${menu.menuId}">
	<input type="text" name="menuName" value="${menu.menuName}">
	<input type="text" name="price" value="${menu.price}">
	<input type="submit" value="등록"/>
</form>
${menu}
</body>
</html>