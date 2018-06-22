<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>getMenu.jsp</title>
<script	src="${pageContext.request.contextPath}/resources/scripts/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		
		function getMenuList(){
			var requestData = {
					"menu_id" : "${menu.menu_id}"
			};
			
		}
	})


</script>
</head>
<body>
 등록후 확인
	<br> ${vo}
	<hr>
	메뉴이름 : ${menu.menu_id }
	<br> 작성자 : ${menu.menu_name }
	<br> 내용 : ${menu.price }
	<br>

	<a href="../updateMenu">수정</a>
 
</body>
</html>