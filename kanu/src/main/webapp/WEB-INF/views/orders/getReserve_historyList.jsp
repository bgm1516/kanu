<%@page import="com.kanu.web.orders.Reserve_historyVO"%>
<%@page import="com.kanu.web.orders.impl.Reserve_historyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<!DOCTYPE html>
<html>
<head>
<title>예약 내역 페이지</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
#formr th {
	width : auto;
	text-align : center;
}
#formr td {
	width : auto;
	text-align : center;
}
</style>


</head>
<body>
<hr>
<text align="center"><H2>예약 목록</H2></text>
<div align="center">
	<form name="searchFrm" method="post" action="${pageContext.request.contextPath}/getReserve_historyList">
	<%-- ${pageContext.request.contextPath}는 어떤 경로던간에 상위폴더를 자동적으로 연결 --%>
		주문번호<input type="text" name="orderId"/>
			  <input type="submit" value="검색"/><br/>
	</form>
</div>

<form name="formr" id="formr" action="">
	<table border='1' align='center' id='view'>
		<tr align="center">
			<th>주문번호</th>
			<th>메뉴이름</th>
			<th>개당가격</th>
			<th>주문수량</th>
			<th>총 가격</th>
			<th>주문시간</th>
			<th>예약여부</th>
			<th>예약자</th>
			<th>수령자</th>
			<th>담당직원</th>
		</tr>
		
		<c:forEach items="${reserve_historyList}" var="reserve_historyList">
		
			<tr align="center">
				<td>${reserve_historyList.orderId}</td>
				<td>${reserve_historyList.menuName}</td>
				<td>${reserve_historyList.price}</td>
				<td>${reserve_historyList.orderQuantity}</td>
				<td>${reserve_historyList.orderTotalsum}</td>
				<td>${reserve_historyList.orderDate}</td>
				<td>${reserve_historyList.reservation}</td>
				<td>${reserve_historyList.reserver}</td>
				<td>${reserve_historyList.receipter}</td>
				<td>${reserve_historyList.employeeId}</td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>