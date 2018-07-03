<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>

<!DOCTYPE html>
<html>
<head>
<title>reserve_historyList</title>
<script>
 	/* function fdelete() {
			document.form2.action.value="delete";	
			document.form2.submit();				
	}  */
</script>
<script type="text/javascript">
	function reserve(order_id) {
		document.location.href="reserve_history_control.jsp?action=edit&order_id="+order_id;
	}
</script>
</head>
<body>
	<div class="sidenav">
         <ul>
         <c:if test="${!empty sessionScope.ename}">
            <li><a href="${pageContext.request.contextPath}/kangwhi/orders_control.jsp?action=list">주문관리</a></li>
            <li><a href="${pageContext.request.contextPath}/kangwhi/order_history_control.jsp?action=list&p=1">주문내역</a></li>
            <li><a href="#">예약관리</a></li>
            <li><a href="${pageContext.request.contextPath}/changho/canceled_order_control.jsp?action=list">취소내역</a></li>
         <c:if test="${sessionScope.ename==sessionScope.evo.getEMPLOYEE_NAME()}">
            <li><a href="${pageContext.request.contextPath}/heeji/menu_control.jsp?action=list">메뉴관리</a></li>
            <li><a href="${pageContext.request.contextPath}/gyeongmin/recipe_control.jsp?action=list&p=1">레시피관리</a></li></c:if>
   			</c:if>
         </ul>	
	</div>
	

<div align="right" style="border: 1px solid gray">
  <!-- 검색 폼 -->
   <form name="searchFrm" action="reserve_history_control.jsp">
   <input type = "hidden" name="action" value="list"/>
           <input type="hidden" name="p" value="1"/>
    주문번호  <input type="text" name="order_id"/>
     예약자    <input type="text" name="reserver"/>
           <input type="submit" value="검색"/>
   </form>
</div>
<hr>
  <!-- 등록 폼 -->

<div align="right">
		<form name="form2" action="reserve_history_control.jsp" >
		<input type="hidden" name="action" value="insert"/>
		<a href="reserve_history_add.jsp">
		<input type="button" value="등록" ></a> 
		<!-- <input type="button" value="삭제" onclick="fdelete()"> -->
		</form>
</div>
		  
<hr>
<table>
	<tr>
	<!-- <th></th> -->
	<th>주문번호</th>
	<th>예약자</th>
	<th>수령자</th>
	<th>예약시간</th>
	<th>삭제</th>
	</tr>
	
	<c:forEach items="${reserve_historyList}" var="vo">
	<tr>
	<%-- <th><input type="checkbox" name="Order_id" value="${vo.getOrder_id()}"></th> --%>
	<th><a href="javascript:reserve(${vo.getOrder_id()})">${ vo.getOrder_id() }</a></th>
	<th>${ vo.getReserver() }</th>
	<th>${ vo.getReceipter() }</th>
	<th>${ vo.getReceipt_date() }</th>
	<td><a href="reserve_history_control.jsp?action=delete&order_id=${vo.getOrder_id()}">삭제</a></td>
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