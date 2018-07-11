<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<script src="./resources/scripts/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="./resources/scripts/jquery-ui.css">
<script src="./resources/scripts/jquery-ui.js"></script>
<style>


</style>

<title>입고내역</title>
</head>
<body>
	<div id="content1">
	<br>
	<h3>입고내역</h3>
	<hr>
	<form id="inputsearch" action="getInputList" method="get">
	<input type="hidden" name = action" value="insert">
	<br> <input type="hidden" name="p" value="1">
	공급사ID :  
		<select name="supplierId">
			<c:forEach items="${supplierList}" var="vo">
			<option value="${vo.supplierId}">${vo.supplierName}</option>
			</c:forEach>
		</select>
	제품분류 :	
		<select name="productId">
			<c:forEach items="${productIdList}" var="vol">
			<option value="${vol.productId}">${vol.productId}</option>
			</c:forEach>
		</select>
		<button onclick="search">조회</button>	
	</form>
	<hr>
	<br><br>
	<script>
	function search(){
		var search = $("#search").val()
		if (result == supplierId) {
			location.href = "getInputList?supplierId=" + supplierId;
			console.log("supplierID:" + supplierId);
		}
		else if (result == productId) {
			location.href = "getInputList?productId=" + productId;
			console.log("productID :" + productId);
		}
	}
	</script>
	<div class="container">
		<form id="form1" method="get" action="insertInput">
			제품분류:
			<select name="productId" id="productId">
			<c:forEach items="${productIdList}" var="i">
			<option value="${i.productId}">${i.productId}</option>
			</c:forEach>
			</select>
			공급사ID:
			<select name="supplierId" id="supplierId">
			<c:forEach items="${supplierList}" var="j">
			<option value="${j.supplierId}">${j.supplierName}</option>
			</c:forEach>
			</select>
			제품명:
			<input type="text" name="inputName" id="inputName" size="6">
			입고수량:
			<input type="text" name="inputQuantity" id="inputQuantity" size="1">
			단가:
			<input type="text" name="cost" id="cost" size="5">
			유통기한:
			<input type="text" name="expireDate" id="expireDate" size="6">
			입고일자:
			<input type="text" name="inputDate" id="inputDate">
			<input type="submit" value="추가"/>
		</form><br>
<!-- DATE PICKER 유통기한 -->
		<script>
	$(function() {
		$("#expireDate").datepicker({
			dateFormat : 'yy-mm-dd',
			defaultDate : 3,
			//minDate : "+1w",
			//maxDate : new Date(2018, 6 - 1, 20),
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ]

		})
	});
</script>
<!-- /DATE PICKER 유통기한 -->
		<table border="2" id="detail" class="table table-hover">
		<thead align="center">
			<tr>
				<th>입고번호</th>
				<th>제품명</th>
				<th>입고수량</th>
				<th>단가</th>
				<th>유통기한</th>
				<th>제품ID</th>
				<th>공급사ID</th>
				<th>입고일자</th>
			</tr> 
		</thead>
		<c:forEach items="${inputList}" var="vo">
		<tbody id="updatedlist">
			<tr id="${vo.inputNumber}">
				<td align="center">${vo.inputNumber}</td>
				<td align="center">${vo.inputName}</td>
				<td align="center">${vo.inputQuantity}</td>
				<td align="center">${vo.cost}</td>
				<td align="center">${fn:substring(vo.expireDate,2,10)}</td>
				<td align="center">${vo.productId}</td>
				<td align="center">${vo.supplierName}(${vo.supplierId})</td>
				<td align="center">${fn:substring(vo.inputDate,2,10)}</td>
			</tr> 
		</c:forEach>
		</tbody>
		</table>

	</div>
	</div>
</body>
</html>