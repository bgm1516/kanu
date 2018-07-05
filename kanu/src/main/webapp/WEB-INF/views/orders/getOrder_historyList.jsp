<%@page import="com.kanu.web.orders.Order_history_SearchVO"%>
<%@page import="com.kanu.web.orders.Order_historyVO"%>
<%@page import="com.kanu.web.orders.impl.Order_historyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
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
#view th {
	text-align: center;
	align: center;
}

#view td {
	text-align: center;
	align: center;
}
#Modal .modal-header button.close {
    visibility: hidden;
}

</style>
</head>
<body>
	<H2 align="center">상세 주문 내역</H2>
	<hr color="black">
	<h5>Tip!</h5>
	<strong><span style="color: #ff99ff">취소된 주문 예시</span></strong>
	<br>
	<strong><span style="color: #99ccff">정상적인 주문 예시</span></strong>
	<br>
	<strong>(주의사항) - "예약여부 변경"과 "취소여부 변경"은 단일 선택만 가능합니다</strong>
	<br>
	<strong>(사용법) - "취소하기" 후에 "취소사유" 버튼을 눌러 사유를 작성해주세요</strong>
	<div style="border: 1px solid gray" align="center">
		<form name="searchFrm" method="post"
			action="${pageContext.request.contextPath}/getOrder_historyList">
			<input type="hidden" name="p" value="1" /> 주문번호 <input type="text" name="orderId" />
			<input type="submit" value="검색" /><br />
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
				<th><button onclick="ohres_submit()" type="button" class="btn btn-secondary">예약변경</button></th>
				<th><button onclick="ohcan_submit()" type="button" class="btn btn-warning">취소하기</button>
					<button onclick="modal_popup()" type="button" class="btn btn-warning">취소사유</button>			
				</th>
				<th><button onclick="ohdel_submit()" type="button" class="btn btn-danger">삭제</button></th>
			</tr>

			<script>
				var orderId = [];
				var canceledOrder = [];
				var orderDate = [];
			</script>

			<c:forEach items="${order_historyList}" var="vo" varStatus="status">
				<c:if test="${vo.canceledOrder == 'Y'}">
					<tr bgcolor="#ff99ff">
				</c:if>
				<c:if test="${vo.canceledOrder == 'N'}">
					<tr bgcolor="#99ccff">
				</c:if>

				<script>
					orderId.push('${vo.orderId}');
					canceledOrder.push('${vo.canceledOrder}');
					orderDate.push('${vo.orderDate}');
				</script>
				
				<td class="order_id_class">${vo.orderId}</td>
				<td>${vo.menuName}</td>
				<td>${vo.price}</td>
				<td>${vo.orderQuantity}</td>
				<td>${vo.orderTotalsum}</td>
				<td>${vo.orderDate}</td>
				<td>${vo.employeeId}</td>
				<td>${vo.reservation}<input type="radio" name="reserve_ohistory" value="${vo.orderId}" /></td>
				<td>${vo.canceledOrder}<input type="radio" name="canceled_ohistory" value="${status.index}" /></td>
				<td><input type="checkbox" name="delete_ohistory" value="${vo.orderId}" /></td>
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
		function ohdel_submit() {
			var formh = $(document).find("#formh");
			var ohdel_submit_formh = $('<form>');

			ohdel_submit_formh.attr('action', "/kanu/hdelete"); //delete 실행
			ohdel_submit_formh.attr('method', 'post'); //전송방법 post

			if ($("input[name=delete_ohistory]:checked").length === 0) { //체크된박스의 여부를 문자열길이를 체크해서 0이라면 경고창

				alert("삭제할 주문을 선택해주세요.")
			} else {
				$("input[name=delete_ohistory]:checked").each(function() {
					var ohdel = $(this).val(); //체크박스여부를 체크해서 체크된 값을 chdel에 담는다.
					console.log(ohdel); //단순 확인용 출력 (test)
					alert("주문번호 " + ohdel + "을 삭제하였습니다.")
					var input_ohdel_orderId = $('<input name="orderId">'); //선언
					input_ohdel_orderId.val(ohdel) //선언한 함수에 chdel을 담는다
					ohdel_submit_formh.append(input_ohdel_orderId); //del_submit_form에 자식으로 추가한다.
				})
				$(document).find("body").append(ohdel_submit_formh)
				ohdel_submit_formh.submit();
			}
		}
		
		//취소하기 function
		function ohcan_submit() {
			var formh = $(document).find("#formh");
			var ohcan_submit_formh = $('<form>'); //동적 폼 생성(이 폼은 전송 완료 후 사라집니다)
			
			if ($("input[name=canceled_ohistory]:checked").length === 0) { //체크된박스의 여부를 문자열길이를 체크해서 0이라면 경고창
				alert("취소할 주문을 선택해주세요.")
			
			} else {
				$("input[name=canceled_ohistory]:checked").each(function() {
					var ohcan = $(this).val(); //체크박스여부를 체크해서 체크된 값을 ohcan에 담는다.
					var o_id = orderId[ohcan]; //o_id에는 위에서 생성한 배열인 orderId[]에 ohcan을 담는다.
					var o_cancel = canceledOrder[ohcan] //o_cancel에도 동일하다
					var o_date = orderDate[ohcan]

					//이건 order_id를 담기위함이다.
					var input_ohcan_orderId = $('<input name="orderId">'); //변수 선언
					input_ohcan_orderId.val(o_id) //선언한 변수의값으로 o_id를 담는다.
					ohcan_submit_formh.append(input_ohcan_orderId); //동적으로 생성된 폼에 자식으로 o_id를 담은 변수를 더한다.

					//이건 위와 동일하지만 canceled_order의 값을 담고있다.
					var input_ohcan_canceledOrder = $('<input name="canceledOrder">'); //변수 선언
					input_ohcan_canceledOrder.val(o_cancel) //선언한 변수에 o_cancel을 담는다
					ohcan_submit_formh.append(input_ohcan_canceledOrder); //동적으로 생성된 폼에 자식으로 o_cancel을 담은 변수를 더한다.

					var input_ohcan_orderDate = $('<input name="orderDate">');
					input_ohcan_orderDate.val(o_date)
					ohcan_submit_formh.append(input_ohcan_orderDate);

					//1)조건=취소여부가 Y인 경우(현재 N값인 경우) (넘어가는 맵핑값이 다르므로)
					if (o_cancel === "N") {
					ohcan_submit_formh.attr('action', "/kanu/cinsert"); //취소여부를 N으로 바꾸고 canceled_order에서 delete문 실행
					
					//2)조건=취소여부가 N인 경우(현재 Y값인 경우) (넘어가는 맵핑값이 다르므로)
					} else { 
					ohcan_submit_formh.attr('action', "/kanu/cupdate"); //취소여부를 Y로 바꾸고 canceled_order에서 insert문 실행
					}
						ohcan_submit_formh.attr('method', 'post'); //전송방법은 post이며 공통이므로 밖으로 빼내었다
				})
					$(document).find("body").append(ohcan_submit_formh)
					ohcan_submit_formh.submit();
			}
		}

		//취소여부 N인 값을 Y로 바꾸려고 할때 뜰 Modal 팝업
		function modal_popup() {
			$("input[name=canceled_ohistory]:checked").each(function() {
				var pop = $(this).val();	//체크된 값을 pop에 담고
				var pop_cancel = canceledOrder[pop];	//pop_cancel에 체크된 취소여부 값을 담는다
				
				if (pop_cancel === "N") {					
						alert("취소 사유를 입력해주세요");
						$("#cancel_modal").modal("show");	//shown은 액션의 완료 후에 이루어진다
				} else {
					alert("취소내역에서 정상적으로 복구되었습니다")
				}
				})
		}
		
		
		//취소하기 전에 확인칸 추가
		function cancel_item_add() {

			var select_item_formh = $(document).find("#select_item_formh");
			var horder_item = {};
			horder_item.cancelReason = select_item_formh.find("select[name='cancelReason'] option:selected").val();
			horder_item.orderId = select_item_formh.find("input[name='orderId']").val();

			console.log(horder_item)

			var horder_item_cancelReason = $("<input type='hidden' name='cancelReason'>");
			horder_item_cancelReason.val(horder_item.cancelReason)

			var horder_item_orderId = $("<input type='hidden' name='orderId'>");
			horder_item_orderId.val(horder_item.orderId)

			var horder_item_div = $("<div class='horder_item_div'>");

			horder_item_div.append(horder_item_cancelReason);
			horder_item_div.append(horder_item_orderId);

			var horder_item_table = $(document).find("table.horder_item_table tbody");
			var horder_item_tr = $("<tr>");
			horder_item_tr.append($("<td>" + horder_item.cancelReason+ " </td>"))
			horder_item_tr.append($("<td>" + horder_item.orderId + " </td>"))
			horder_item_tr.append($("<td>"+ "<button onclick='delect_cancel_item(this)' class='btn btn-danger cancel_item_delete'>x</button>"+ " </td>"));
			horder_item_table.append(horder_item_tr);
			$(document).find('#cancel_form').append(horder_item_div);
		}

		//취소 확인칸에서 삭제
		function delect_cancel_item(obj) {

			var horder_item_div = $(document).find('#cancel_form .horder_item_div');

			var index = $(".cancel_item_delete").index(this);

			var remove_obj = $(obj).closest('tr');

			remove_obj.remove();
			horder_item_div.eq(index).remove();

		}

		//취소 modal 등록
		function cancel_form_submit() {

			var horder_item_div = $(document).find('#cancel_form .horder_item_div');

			var horder_length = horder_item_div.length;

			if (horder_length > 0) {
				$(document).find('#cancel_form').submit();
			} else {
				alert("정보를 입력해주세요")
			}
		}
	</script>

<!-- 취소 Modal -->
<div id="cancel_modal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
	
	<!-- Modal content-->
	<div id="cancel-content" class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">취소 사유</h4>
		</div>
	<div class="modal-body">
	<div class="row">
	<div class="col-xs-7">
	<form align="center" name="cancel_form" id="cancel_form" style="border: 1 solid gray" action="${pageContext.request.contextPath}/updateA">
		<label>주문번호 :</label><input type="text" class="formh-control" name="orderId" value="${vo.orderId}"><br>
	</form>
	
	<form align="center" action="" id="select_item_formh">
		<label>취소사유 :</label> 
		<select class="formh-control" name="cancelReason">
			<option value="MENU CHANGE">메뉴 변경</option>
			<option value="NO REASON">단순 변심</option>
			<option value="QUANTITY CHANGE">수량 변경</option>
			<option value="EMPLOYEER MISS">직원 실수</option>
			<option value="ETC">기타</option>
		</select><br>
	</form>
	</div>
	<div class="col-xs-5 reserve_view">
	
	<table class="table order_item_table">
  	<thead>
  	<tr>
		<th>주문번호</th>
		<th>취소사유</th>
		<th>삭제</th>
	</tr>
  	
  	</thead>
  	
  	<tbody>
  	
  	</tbody>
  
	</table>
	</div>
	</div>
	</div>
		
	<div class="modal-footer">
		<button onclick="cancel_form_submit()" type="button" class="btn btn-danger">등록</button>
		<button onclick="cancel_item_add()" type="button" class="btn btn-primary">확인하기</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	</div>
	</div>
</div>
</body>
</html>