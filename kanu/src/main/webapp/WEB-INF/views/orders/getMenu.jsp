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
				"menuId" : "${menu.menuId}"
		
	 
		
	}
		}
	});
	
</script>
</head>
<body>
 
	<hr>
	메뉴번호: ${menu.menuId}<br>
	  메뉴이름 : ${menu.menuName}<br>
	 가격 : ${menu.price}<br>
	 

	 
	<div id="commentsList"></div>
</body>
</html>