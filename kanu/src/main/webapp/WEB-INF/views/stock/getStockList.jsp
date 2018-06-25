<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>

#content1 {

  margin: auto;
    width: 40%;
    /* border: 0.5px solid #000000; */
    padding: 10px;
    text-align : center; 
}
#insertfrm{

 margin: auto;
    width: 80%;
    padding: 10px;
    text-align : center; 
}
#tabcenter {
margin: auto;
    width: 60%;
    padding: 30px 0px 0px 0px;
    text-align : center; 
}
</style>
<title></title>
<%--삭제 function 추가 --%>
<script type="text/javascript">
	function delcheck(productId) {
		result = confirm("주의 ! 입고 내역과 레시피의 참조 행도 같이 삭제됩니다. 진행하시겠습니까?"+productId);

		if (result == true) {
			/* document.stockForm.product_id.value = product_id;
			document.stockForm["action"].value = "delete";
			document.stockForm.submit(); */
			location.href="deleteStock.do?productId="+productId;
			
		}
		
	}

</script>
</head>
<body>
	<div id="content1">
	<h3> 재고 현황 </h3>
	<hr>
		<form id="stockForm" action="getStockList.do" method="get"><br> 
			<input type="hidden" name="p" value="1">
			제품분류<input type="text" name="productId" /> 
			<!-- 제품명<input type="text" name="product_name" /> 
			상품위치<input type="text" name="product_location" />  -->
			<input type="submit" value="조회" /> <br><br><br>
			<!-- <input type="button" name="minjaego" value="위험재고검색"><br><br> -->
	
		</form>
		
		<hr>
		<br><br><br><br>
		<div id="tabcenter">
		<table border="1">
			<tr>
				
				<th>제품분류</th>
				<th>상품위치</th>
				<th>재고수량</th>
				<th>최소수량</th>
				<th>공급사ID</th>
				<th>삭제</th>
	
			</tr>
			
				<!-- StockDAO dao = new StockDAO(); -->
			<!-- 	for (StockVO vo : dao.getStockList(searchVO))  -->
			<c:forEach items="${stockList}" var="vo">
			<tr <c:if test="${Integer.parseInt(vo.stockQuantity) lt Integer(vo.minimumQuantity) }"> style="color:red;" </c:if>
			<c:if test="${Integer(vo.stockQuantity) gt Integer(vo.minimumQuantity) }"> style="color:black;" </c:if>  
			>
				
				<td align="center">${vo.productId }</td>
				<td align="center">${vo.productLocation}</td>
				<td align="right" >${vo.stockQuantity}</td>
				<td align="right">${vo.minimumQuantity}</td>
				<td align="right">${vo.supplierId}</td>
				<td><input type="button" onclick="delcheck('${vo.productId}')" value="삭제"></td>
				
			</tr>
			</c:forEach>	
			
		</table>
		</div><!-- tabcenter -->
		<br><br><br><br><br><br>
			</div> <!-- 중간정렬 -->
			<div id="insertfrm">
			<br><br>
		<form action="insertStock.do">
			
			제품분류:<input type="text" name="productId">
			보관위치:<input type="text" name="productLocation">
			입고수량:<input type="text" name="stockQuantity">
			최소수량:<input type="text" name="minimumQuantity">
			공급사ID:<input type="text" name="supplierId">
			<input type="submit" value="추가"> 
			<br><br><br><br><br><br>
		</form>
	</div><!-- insertFrm -->
	
</body>
</html>