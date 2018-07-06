<%@page import="com.kanu.web.orders.Canceled_orderVO"%>
<%@page import="com.kanu.web.orders.impl.Canceled_orderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<!DOCTYPE html>
<html>
<head>
<title>취소 내역 페이지</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
#reserve_form input{
	width: 80%;
	display: inline-block;
}
#reserve_form label{
	width: 20%;
	text-align: right;
	padding-right: 20px;
	margin-bottom: 30px;
}
#reserve_form select{
	width: 80%;
	display: inline-block;
}

#select_item_form input{
	width: 80%;
	display: inline-block;
}
#select_item_form label{
	width: 20%;
	text-align: right;
	padding-right: 20px;
	margin-bottom: 20px;
}
#select_item_form select{
	width: 78%;
	display: inline-block;
	margin-bottom: 10px;
}
#view th{
	text-align: center;
}
#reserve-content{
	top : 200px;
}
#normal-content{
	top : 200px;
}
#reserve_modal select{
	height : 35px;
}
#normal_modal select{
	height : 35px;
}
</style>


</head>
<body>
<HR>
<text align="center"><H2>취소된 주문 목록</H2></text>
<div align="center">
	<form name="searchFrm" method="post" action="${pageContext.request.contextPath}/getCanceled_orderList">
	<%-- ${pageContext.request.contextPath}는 어떤 경로던간에 상위폴더를 자동적으로 연결 --%>
		주문번호<input type="text" name="orderId"/>
			  <input type="submit" value="검색"/><br/>
	</form>
</div>

<form name="formc" id="formc" action="">
	<table border='1' align='center' id='view'>
		<tr align="center">
			<th>주문번호</th>
			<th>메뉴이름</th>
			<th>개당가격</th>
			<th>주문수량</th>
			<th>총 가격</th>
			<th>주문시간</th>
			<th>취소여부</th>
			<th>담당직원</th>
		</tr>
		
		<c:forEach items="${canceled_orderList}" var="canceled_orderList">
		
			<tr align="center">
				<td>${canceled_orderList.orderId}</td>
				<td>${canceled_orderList.menuName}</td>
				<td>${canceled_orderList.price}</td>
				<td>${canceled_orderList.orderQuantity}</td>
				<td>${canceled_orderList.orderTotalsum}</td>
				<td>${canceled_orderList.orderDate}</td>
				<td>${canceled_orderList.canceledOrder}</td>
				<td>${canceled_orderList.employeeId}</td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>