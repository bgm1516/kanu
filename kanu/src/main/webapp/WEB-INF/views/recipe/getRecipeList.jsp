<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body> 
<form>
<div align="right"> 
<a href="./insertRecipe" class="btn btn-primary" role="button" aria-pressed="true">레시피등록</a>
<a href="./updateRecipe" class="btn btn-secondary" role="button" aria-pressed="true">레시피수정</a>
<a href="./deleteRecipe" class="btn btn-success" role="button" aria-pressed="true">레시피삭제</a>
</div>
<br>
<br>
 
<table class="table table-striped">
<tr>
<th>CHK</th><th>메뉴번호</th><th>메뉴명</th><th>제품명</th><th>재료사용량</th></tr>
<c:forEach items="${recipe}" var="rp">
<tr>
<td width="5"><input type="checkbox" name="menuId" value="${rp.menuId}"/></td> 
<td>${rp.menuId}</td> 
<td>${rp.menuName}</td>	
<td>${rp.productId}</td> 
<td>${rp.materialAmount}</td>	
</tr>

</c:forEach>
</table>
</form>


</body>
</html>