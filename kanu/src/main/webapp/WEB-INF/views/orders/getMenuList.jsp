<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.c1 {
	margin: auto;
	width: 40%;
	
	padding: 10px;
	text-align: center;
}
.c2 {
	margin: auto;
	width: 40%;
	border: 0.5px solid #000000;
	padding: 10px;
	text-align: center;
}

.label {
	display:block; 
	width:x; 
	height:y; 
	text-align:center;
	}
	
</style>
<title>getMenuList.jsp</title>
<script type="text/javascript">

 //중복 함수
 
 function overlapcheck(){
	 /* var menuName  */
	 $( 'p:contains(document.menuForm.menuName.value)' )
	 if (result == true){
	return false;
	 }
	else{
		return true;
	}
	 
 }
 
 
 
 //삭제 함수
	function delcheck(menuId) {
		result = confirm("정말로 삭제하시겠습니까 ?");

		if (result == true) {
			location.href = "deleteMenu?menuId=" + menuId;

		}

	}
	
// 숫자 값만 받는 함수	
	function onlyNumber(obj) {
	    $(obj).keyup(function(){
	         $(this).val($(this).val().replace(/[^0-9]/g,""));
	    }); 
	}
</script>
</head>
<body>


	
<div class="row">
<div class="col">
		<H2 align="center">메뉴</H2>
		<HR>
		
		<form>
		 
			<P>
			<div class="c1">
			<br>
				<table class="table table-striped" border="1">

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
		<div class=c2>
			<form action="./insertMenu" method="post" onsubmit="return overlapcheck()" name="menuForm">
					<label>메뉴명</label><input type="text" name="menuName"><br>
					<!-- <label>가격</label><input type="text" name="price"> -->
					<label>가격</label><input onkeydown="onlyNumber(this)" name="price" placeholder='숫자만 입력하세요'>
					<label><input type="submit" value="등록"/></label>
					<!-- <input onkeydown="onlyNumber(this)"/> -->
				</form>
				   
				</div>
	</div>
	<div class="col">
	
	<H2 align="center">레시피</H2>
	<hr>  
	
	
</div> 
</div>
</body>
</html>