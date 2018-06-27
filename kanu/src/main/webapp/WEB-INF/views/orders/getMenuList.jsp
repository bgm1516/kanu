<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#c1 {
	margin: auto;
	width: 40%;
	border: 0.5px solid #000000;
	padding: 10px;
	text-align: center;
}
</style>
<title>getMenuList.jsp</title>
<script type="text/javascript">

	function delcheck(menuId) {
		result = confirm("정말로 삭제하시겠습니까 ?");

		if (result == true) {
			location.href = "deleteMenu.do?menuId=" + menuId;

		}

	}
</script>
</head>
<body>


	


	<div align="center">
		<H2>메뉴:목록</H2>
		<HR>
		<form>
			<!-- <br> <a href="insertMenu"><input type="button"
				value="메뉴 등록하기"></a> <br> -->
		<!-- 		<body>
			<form action="./insertMenu" method="post" >
			메뉴 이름<input type="text" name="menuName">
			가격<input type="text" name="price">
			<input type="submit" value="등록"/>
			</form>

				</body> -->
			<P>
			<div id="c1">
				<table class="table table-striped">

					<tr>
						<th>메뉴번호</th>
						<th>메뉴명</th>
						<th>가격</th>
						<th>삭제</th>

					</tr>
					<c:forEach items="${menuList}" var="menu">
						<tr>
							<td align="center">${menu.menuId}<br></td>
							<th align="center">${menu.menuName}</th>
							<th align="center">${menu.price}</th>
							<th><input type="button" value="삭제"
								onClick="delcheck('${menu.menuId}')"></th>
						</tr>
					</c:forEach>

				</table>
				
	
			</div>
			<HR>
		</form>
			<form action="./insertMenu" method="post">
					메뉴 이름<input type="text" name="menuName">
					가격<input type="text" name="price">
					<input type="submit" value="등록"/>
				</form>
				
	</div>

</body>
</html>