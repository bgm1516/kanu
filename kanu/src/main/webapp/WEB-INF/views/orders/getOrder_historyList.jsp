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

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
#view th{
	text-align: center;
	align: center;
}
#view td{
	text-align: center;
	align: center;
}
</style>
</head>
<body>
<H2 align="center">상세 주문 내역</H2>
<hr color="black">
<h5>Tip!</h5>
<strong><span style="color:#ff99ff">취소된 주문 예시</span></strong><br>
<strong><span style="color:#99ccff">정상적인 주문 예시</span></strong><br>
<strong>(주의사항) - "예약여부 변경"과    "취소여부 변경"은    단일    선택만    가능합니다</strong>
<div style="border: 1px solid gray" align="center">
	<form name="searchFrm" method="post" action="${pageContext.request.contextPath}/getOrder_historyList">
			  <input type="hidden" name="p" value="1"/>
		주문번호  <input type="text" name="orderId"/>
			  <input type="submit" value="검색"/><br/>
	</form>
</div>

<form name="formh" id="formh">
	<table border='1' align='center' id='view'>
		<tr align="center">
			<th>주문번호</th>
			<th>메뉴</th>
			<th>가격</th>
			<th>수량</th>
			<th>총 주문금액</th>
			<th>주문일시</th>
			<th>담당직원</th>
			<th><button onclick="res_submit()" type="button" class="btn btn-secondary">예약변경</button></th>
			<th><button onclick="can_submit()" type="button" class="btn btn-warning">취소하기</button></th>
			<th><button onclick="del_submit()" type="button" class="btn btn-danger">삭제</button></th>
		</tr>
		<c:forEach items="${order_historyList}" var="vo" varStatus="status" >
			<c:if test="${vo.canceledOrder == 'Y'}">
            	<tr bgcolor="#ff99ff">
         	</c:if>
         	<c:if test="${vo.canceledOrder == 'N'}">
            	<tr bgcolor="#99ccff">
         	</c:if>
					<td>${vo.orderId}</td>
					<td>${vo.menuName}</td>
					<td>${vo.price}</td>
					<td>${vo.orderQuantity}</td>
					<td>${vo.orderTotalsum}</td>
					<td>${vo.orderDate}</td>
					<td>${vo.employeeId}</td>
					<td>${vo.reservation}     <input type="radio" name="reserve_ohistory" value="${vo.orderId}"/></td>
					<td>${vo.canceledOrder}     <input type="radio" name="canceled_ohistory" value="${vo.canceledOrder}"/></td>
					<td><input type="checkbox" name="delete_ohistory" value="${vo.orderId}"/></td>
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
	
	//삭제
	function del_submit() {
		var formh = $(document).find("#formh");
		var ohdel_submit_formh =  $('<form>');
			
		ohdel_submit_formh.attr('action',"/kanu/hdelete");	//delete 실행
		ohdel_submit_formh.attr('method','post');	//전송방법 post
			
			if($("input[name=delete_ohistory]:checked").length === 0){	//체크된박스의 여부를 문자열길이를 체크해서 0이라면 경고창
				alert("삭제할 주문을 선택해주세요.")
			}else{
				$("input[name=delete_ohistory]:checked").each(function() {
					var ohdel = $(this).val();	//체크박스여부를 체크해서 체크된 값을 chdel에 담는다.
					console.log(ohdel);	//단순 확인용 출력 (test)
					alert("주문번호 "+ohdel+"을 삭제하였습니다.")
					var input_ohdel_order_id  = $('<input name="order_id">');	//선언
					input_ohdel_order_id.val(ohdel)	//선언한 함수에 chdel을 담는다
					ohdel_submit_formh.append(input_ohdel_order_id);	//del_submit_form에 자식으로 추가한다.
			})
					
					$(document).find("body").append(ohdel_submit_formh)
					ohdel_submit_formh.submit();
		}
	}
</script>

<!-- hinsert 팝업 -->
<div id="hinsert_modal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
  
    <!-- Modal content-->
    <div id="hinsert-content" class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">예약 상세 정보</h4>
      </div>
      <div class="modal-body">
      <div class="row">
	<div class="col-xs-7">
	<form align="left" name="hinsert_form" id="hinsert_form" style="border:1 solid gray" action="${pageContext.request.contextPath}/hinsert">
		<label>예약자 :</label><input type="text" class="formh-control" name="reserver"><br>
		<label>수령자 :</label><input type="text" class="formh-control" name="receipter"><br>
		<label>담당직원 :</label><input type="text" class="formh-control" name="employeeId"><br>
		<label>예약시간 :</label><input type="date" class="formh-control" name="receiptDate"><br>
	</form>
	</div>
	</div>
      </div>
      <div class="modal-footer">
      	<button onclick="hinsert_form_submit()" type="button" class="btn btn-danger" >등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>