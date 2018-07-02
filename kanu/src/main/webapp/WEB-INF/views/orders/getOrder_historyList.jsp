<%@page import="com.kanu.web.orders.Order_history_SearchVO"%>
<%@page import="com.kanu.web.orders.Order_historyVO"%>
<%@page import="com.kanu.web.orders.impl.Order_historyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<title>order_history_List</title>
<script type="text/javascript">
	function check(order_id) {
		document.location.href="order_history_control.jsp?action=edit&order_id="+order_id;
	}
</script>
<script type="text/javascript">
	function reserve(order_id) {
		document.location.href="reserve_history_control.jsp?action=edit&order_id="+order_id;
	}
</script>
<script type="text/javascript">
	function canceled(order_id) {
		document.location.href="canceled_order_control.jsp?action=edit&order_id="+order_id;
	}
</script>
</head>
<body>
<H2 align="center">상세 주문 내역</H2>
<hr color="black">
<h5>Tip!</h5>
<strong><span style="color:#ff99ff">취소된 주문 예시</span></strong><br>
<strong><span style="color:#99ccff">정상적인 주문 예시</span></strong>
<div style="border: 1px solid gray" align="center">
	<form name="searchFrm" method="post" action="${pageContext.request.contextPath}/getOrder_historyList">
			  <input type="hidden" name="p" value="1"/>
		주문번호  <input type="text" name="orderId"/>
			  <input type="submit" value="검색"/><br/>
	</form>
</div>

<form name="formh" id="formd" action="${pageContext.request.contextPath}/delete">
	<table border='1' align='center' id='view' >
		<tr>
			<th>주문번호</th>
			<th>메뉴</th>
			<th>가격</th>
			<th>수량</th>
			<th>총 주문금액</th>
			<th>주문일시</th>
			<th>예약</th>
			<th>취소</th>
			<th>담당직원</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${order_historyList}" var="vo" >
			<c:if test="${vo.canceledOrder == 'Y'}">
            	<tr bgcolor="#ff99ff">
         	</c:if>
         	<c:if test="${vo.canceledOrder == 'N'}">
            	<tr bgcolor="#99ccff">
         	</c:if>
					<td><a href="javascript:check(${vo.orderId})">${vo.orderId}</a></td>
					<td>${vo.menuName}</td>
					<td>${vo.price}</td>
					<td>${vo.orderQuantity}</td>
					<td>${vo.orderTotalsum}</td>
					<td>${vo.orderDate}</td>
					<td><a href="javascript:reserve(${vo.orderId})">${vo.reservation}</a></td>
					<td><a href="javascript:canceled(${vo.orderId})">${vo.canceledOrder}</a></td>
					<td>${vo.employeeId}</td>
					<td><a href="order_history_control.jsp?action=delete&order_id=${vo.orderId}">삭제</a></td>
				</tr>
		</c:forEach>
	</table>
</form>
<!-- 페이징 -->
<%-- <my:paging jsfunc="doList" paging="${paging}"/> --%>
<script>
	function doList(p) {
		document.searchFrm.p.value = p;
		document.searchFrm.submit();
	}
</script>
</body>
</html>