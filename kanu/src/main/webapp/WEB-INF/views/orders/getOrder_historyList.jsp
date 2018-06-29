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
<h3 align="center">검색기능</h3>
<div style="border: 1px solid gray" align="center">
	<form name="searchFrm" action="order_history_control.jsp">
	<input type = "hidden" name="action" value="list"/>
			  <input type="hidden" name="p" value="1"/>
		주문번호  <input type="text" name="order_id"/>
		담당직원    <input type="text" name="employee_id"/>
			  <input type="submit" value="검색"/><br/>
	</form>
</div>

<h3 align="center">주문내역목록</h3>
<table border='1' align="center">
	<tr>
		<th>주문번호</th>
		<th>주문상품</th>
		<th>상품가격</th>
		<th>주문수량</th>
		<th>총 주문금액</th>
		<th>주문일시</th>
		<th>예약여부</th>
		<th>취소여부</th>
		<th>담당직원</th>
		<th>취소</th>
	</tr>
<c:forEach items="${Order_history_List}" var="vo" >
	<tr>
		<td><a href="javascript:check(${vo.getOrder_id()})">${vo.getOrder_id()}</a></td>
		<td>${vo.getMenu_name()}</td>
		<td>${vo.getPrice()}</td>
		<td>${vo.getOrder_quantity()}</td>
		<td>${vo.getOrder_totalsum()}</td>
		<td>${vo.getOrder_date()}</td>
		<td><a href="javascript:reserve(${vo.getOrder_id()})">${vo.getReservation()}</a></td>
		<td><a href="javascript:canceled(${vo.getOrder_id()})">${vo.getCanceled_order()}</a></td>
		<td>${vo.getEmployee_id()}</td>
		<td><a href="order_history_control.jsp?action=delete&order_id=${vo.getOrder_id()}">삭제</a></td>
	</tr>
</c:forEach>
</table>

<!-- 페이징 -->
<my:paging jsfunc="doList" paging="${paging}"/>
<script>
	function doList(p) {
		document.searchFrm.p.value = p;
		document.searchFrm.submit();
	}
</script>
</body>
</html>