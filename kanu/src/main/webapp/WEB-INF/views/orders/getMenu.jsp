<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>getMenu.jsp</title>
<script	src="${pageContext.request.contextPath}/resources/scripts/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		//ajax로 게시글 로딩
		function getMenuList() {
			var requestData = {
				"menu_id" : "${menu.menu_id}"
		
	 
		
	};
	
</script>
</head>
<body>
 
	<hr>
	메뉴번호: ${menu.menu_id}<br>
	  메뉴이름 : ${menu.menu_name}<br>
	 가격 : ${menu.price}<br>
	 

	 
	<div id="commentsList"></div>
</body>
</html>