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
<<<<<<< HEAD
#Modal .modal-header button.close {
    visibility: hidden;
}
#cancelY_form input{
	width: 80%;
	display: inline-block;
}
#cancelY_form label{
	width: 20%;
	text-align: right;
	padding-right: 20px;
	margin-bottom: 30px;
}
#cancelY_form select{
	width: 80%;
	display: inline-block;
}

#Yselect_item_form input{
	width: 80%;
	display: inline-block;
}
#Yselect_item_form label{
	width: 20%;
	text-align: right;
	padding-right: 20px;
	margin-bottom: 20px;
}
#Yselect_item_form select{
	width: 78%;
	display: inline-block;
	margin-bottom: 10px;
}
#cancelY-content{
	top : 200px;
}
#cancelN-content{
	top : 200px;
}
#cancelY_modal select{
	height : 35px;
}
#cancelN_modal select{
	height : 35px;
}
=======
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
</style>
</head>
<body>
<<<<<<< HEAD
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
				<th><button onclick="ohcan_submit()" type="button" class="btn btn-warning">취소하기</button></th>
				<th><button onclick="ohdel_submit()" type="button" class="btn btn-danger">삭제</button></th>
			</tr>

			<script>
				var orderId = [];
				var reservation = [];
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
					reservation.push('${vo.reservation}');
				</script>
				
				<td class="order_id_class">${vo.orderId}</td>
				<td>${vo.menuName}</td>
				<td>${vo.price}</td>
				<td>${vo.orderQuantity}</td>
				<td>${vo.orderTotalsum}</td>
				<td>${vo.orderDate}</td>
				<td>${vo.employeeId}</td>
				<td>${vo.reservation}<input type="radio" name="reserve_ohistory" value="${status.index}" /></td>
				<td>${vo.canceledOrder}<input type="radio" name="canceled_ohistory" value="${status.index}" /></td>
				<td><input type="checkbox" name="delete_ohistory" value="${vo.orderId}" /></td>
				</tr>
			</c:forEach>
		</table>
=======
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
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
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
			<th><button onclick="ohcan_submit()" type="button" class="btn btn-warning">취소하기</button></th>
			<th><button onclick="ohdel_submit()" type="button" class="btn btn-danger">삭제</button></th>
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
	
	//삭제하기 function
	function ohdel_submit() {
		
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
	
	//예약변경 function
	function ohres_submit() {
		
<<<<<<< HEAD
		//예약변경 function 팝업띄우기
		function ohres_submit() {
			var formh = $(document).find("#formh");
			var ohres_submit_formh = $('<form>'); //동적 폼 생성(이 폼은 전송 완료 후 사라집니다)
			
			if ($("input[name=reserve_ohistory]:checked").length === 0) { //체크된박스의 여부를 문자열길이를 체크해서 0이라면 경고창
				alert("변경할 예약주문을 선택해주세요.")
			
			} else {
				$("input[name=reserve_ohistory]:checked").each(function() {
					var ohres = $(this).val(); //체크박스여부를 체크해서 체크된 값을 ohcan에 담는다.
					var o_id = orderId[ohres]; //o_id에는 위에서 생성한 배열인 orderId[]에 ohcan을 담는다.
					var o_reser = reservation[ohres];

					//이건 order_id를 담기위함이다.
					var input_ohres_orderId = $('<input name="orderId">'); //변수 선언
					input_ohres_orderId.val(o_id) //선언한 변수의값으로 o_id를 담는다.
					ohres_submit_formh.append(input_ohres_orderId); //동적으로 생성된 폼에 자식으로 o_id를 담은 변수를 더한다.
					
					//이건 위와 동일하지만 reservation의 값을 담고있다.
					var input_ohres_reservation = $('<input name="reservation">'); //변수 선언
					input_ohres_reservation.val(o_reser) //선언한 변수에 o_cancel을 담는다
					ohres_submit_formh.append(input_ohres_reservation); //동적으로 생성된 폼에 자식으로 o_cancel을 담은 변수를 더한다.

					//1)조건=예약여부가 Y인 경우(현재 N값인 경우) (넘어가는 맵핑값이 다르므로)
					if (o_reser === "N") {
						$('#orderIdRN').val(o_id)
						alert("취소 사유를 작성해주십시오")
						$("#reserN_modal").modal("show");
						
					//2)조건=예약여부가 N인 경우(현재 Y값인 경우) (넘어가는 맵핑값이 다르므로)
					} else { 
						$('#orderIdRY').val(o_id)
						alert("정말 취소한 주문을 되돌리시겠습니까?")
						$("#reserY_modal").modal("show");
					}
				})
			}
		}
		
		//예약변경N 전에 확인칸 추가
		function cancelRN_item_add() {

			var RNselect_item_formh = $(document).find("#RNselect_item_formh");
			var RNhorder_item = {};
			RNhorder_item.reservation = Nselect_item_formh.find("select[name='reservation'] option:selected").val();

			console.log(RNhorder_item)

			var RNhorder_item_reservation = $("<input type='hidden' name='reservation'>");
			RNhorder_item_reservation.val(RNhorder_item.reservation)

			var RNhorder_item_div = $("<div class='RNhorder_item_div'>");

			RNhorder_item_div.append(RNhorder_item_reservation);
			RNhorder_item.orderId =$(document).find("#cancelRN_form").find("input[name='orderId']").val();
			RNhorder_item.reserver =$(document).find("#cancelRN_form").find("input[name='reserver']").val();
			RNhorder_item.receipter =$(document).find("#cancelRN_form").find("input[name='receipter']").val();
			RNhorder_item.receiptDate =$(document).find("#cancelRN_form").find("input[name='receiptDate']").val();

			var RNhorder_item_table = $(document).find("table.RNhorder_item_table tbody");
			var RNhorder_item_tr = $("<tr>");
			RNhorder_item_tr.append($("<td>" + RNhorder_item.orderId + " </td>"))
			RNhorder_item_tr.append($("<td>" + RNhorder_item.reserver + " </td>"))
			RNhorder_item_tr.append($("<td>" + RNhorder_item.receipter+ " </td>"))
			RNhorder_item_tr.append($("<td>" + RNhorder_item.receiptDate + " </td>"))
			RNhorder_item_tr.append($("<td>" + RNhorder_item.reservation + " </td>"))
			RNhorder_item_tr.append($("<td>"+ "<button onclick='deleteRN_cancel_item(this)' class='btn btn-danger cancelRN_item_delete'>x</button>"+ " </td>"));
			RNhorder_item_table.append(RNhorder_item_tr);
			$(document).find('#cancelRN_form').append(RNhorder_item_div);
		}

		//예약변경N 확인칸에서 삭제
		function deleteRN_cancel_item(obj) {

			var RNhorder_item_div = $(document).find('#cancelRN_form .RNhorder_item_div');

			var index = $(".cancelRN_item_delete").index(this);

			var remove_obj = $(obj).closest('tr');

			remove_obj.remove();
			RNhorder_item_div.eq(index).remove();

		}

		//예약변경N modal 등록
		function cancelRN_form_submit() {

			var RNhorder_item_div = $(document).find('#cancelRN_form .RNhorder_item_div');

			var RNhorder_length = RNhorder_item_div.length;

			if (RNhorder_length > 0) {
				$(document).find('#cancelRN_form').submit();
			} else {
				alert("정보를 입력해주세요")
			}
		}
		
		
		//예약변경Y 전에 확인칸 추가
		function cancelRY_item_add() {

			var RYselect_item_formh = $(document).find("#RYselect_item_formh");
			var RYhorder_item = {};
			RYhorder_item.reservation = RYselect_item_formh.find("select[name='reservation'] option:selected").val();

			console.log(RYhorder_item)

			var RYhorder_item_reservation = $("<input type='hidden' name='reservation'>");
			RYhorder_item_reservation.val(RYhorder_item.reservation)

			var RYhorder_item_div = $("<div class='RYhorder_item_div'>");

			RYhorder_item_div.append(RYhorder_item_reservation);
			RYhorder_item.orderId =$(document).find("#cancelRY_form").find("input[name='orderId']").val();
			
			var RYhorder_item_table = $(document).find("table.RYhorder_item_table tbody");
			var RYhorder_item_tr = $("<tr>");
			RYhorder_item_tr.append($("<td>" + RYhorder_item.orderId+ " </td>"))
			RYhorder_item_tr.append($("<td>" + RYhorder_item.reservation + " </td>"))
			RYhorder_item_tr.append($("<td>"+ "<button onclick='deleteRY_cancel_item(this)' class='btn btn-danger cancelRY_item_delete'>x</button>"+ " </td>"));
			RYhorder_item_table.append(RYhorder_item_tr);
			$(document).find('#cancelRY_form').append(RYhorder_item_div);
		}

		//예약변경Y 확인칸에서 삭제
		function deleteRY_cancel_item(obj) {

			var RYhorder_item_div = $(document).find('#cancelRY_form .RYhorder_item_div');

			var index = $(".cancelRY_item_delete").index(this);

			var remove_obj = $(obj).closest('tr');

			remove_obj.remove();
			RYhorder_item_div.eq(index).remove();

		}

		//예약변경Y modal 등록
		function cancelRY_form_submit() {

			var RYhorder_item_div = $(document).find('#cancelRY_form .RYhorder_item_div');

			var RYhorder_length = RYhorder_item_div.length;

			if (RYhorder_length > 0) {
				$(document).find('#cancelRY_form').submit();
			} else {
				alert("정보를 입력해주세요")
			}
		}
		
		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		//취소하기 function 팝업띄우기
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
						$('#orderIdY').val(o_id)
						$('#orderDate').val(o_date)
						
						alert("취소 사유를 작성해주십시오")
						$("#cancelN_modal").modal("show");
						
					//2)조건=취소여부가 N인 경우(현재 Y값인 경우) (넘어가는 맵핑값이 다르므로)
					} else { 
						$('#orderIdN').val(o_id)
						alert("정말 취소한 주문을 되돌리시겠습니까?")
						$("#cancelY_modal").modal("show");
					}
				})
			}
=======
		var formh = $(document).find("#formh");
		var ohres_submit_formh =  $('<form>');
		
		//값을 Y로 변경하느냐 N으로 변경하느냐에 따라 처리 action이 다르므로 분별한다.
		if(document.formh.reserve_ohistory.value == 'Y') {	//예약여부를 N으로 바꿀경우
			ohres_submit_formh.attr('action',"/kanu/hupdate");	//update,delete 실행
			ohres_submit_formh.attr('method','post');	//전송방법 post
		} else if (document.formh.reserve_ohistory.value == 'N') {	//예약여부를 Y로 바꿀경우
			ohres_submit_formh.attr('action',"/kanu/hinsert");	//update,insert 실행
			ohres_submit_formh.attr('method','post');	//전송방법 post
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
		}
<<<<<<< HEAD
		
		
		//취소하기N 전에 확인칸 추가
		function cancelN_item_add() {

			var Nselect_item_formh = $(document).find("#Nselect_item_formh");
			var Nhorder_item = {};
			Nhorder_item.cancelReason = Nselect_item_formh.find("select[name='cancelReason'] option:selected").val();
			Nhorder_item.canceledOrder = Nselect_item_formh.find("select[name='canceledOrder'] option:selected").val();

			console.log(Nhorder_item)

			var Nhorder_item_cancelReason = $("<input type='hidden' name='cancelReason'>");
			Nhorder_item_cancelReason.val(Nhorder_item.cancelReason)

			var Nhorder_item_canceledOrder = $("<input type='hidden' name='canceledOrder'>");
			Nhorder_item_canceledOrder.val(Nhorder_item.canceledOrder)
			
			var Nhorder_item_div = $("<div class='Nhorder_item_div'>");

			Nhorder_item_div.append(Nhorder_item_cancelReason);
			Nhorder_item_div.append(Nhorder_item_canceledOrder);
			Nhorder_item.orderId =$(document).find("#cancelN_form").find("input[name='orderId']").val();
			Nhorder_item.orderDate =$(document).find("#cancelN_form").find("input[name='orderDate']").val();

			var Nhorder_item_table = $(document).find("table.Nhorder_item_table tbody");
			var Nhorder_item_tr = $("<tr>");
			Nhorder_item_tr.append($("<td>" + Nhorder_item.orderId + " </td>"))
			Nhorder_item_tr.append($("<td>" + Nhorder_item.orderDate + " </td>"))
			Nhorder_item_tr.append($("<td>" + Nhorder_item.cancelReason+ " </td>"))
			Nhorder_item_tr.append($("<td>" + Nhorder_item.canceledOrder + " </td>"))
			Nhorder_item_tr.append($("<td>"+ "<button onclick='deleteN_cancel_item(this)' class='btn btn-danger cancelN_item_delete'>x</button>"+ " </td>"));
			Nhorder_item_table.append(Nhorder_item_tr);
			$(document).find('#cancelN_form').append(Nhorder_item_div);
		}

		//취소N 확인칸에서 삭제
		function deleteN_cancel_item(obj) {

			var Nhorder_item_div = $(document).find('#cancelN_form .Nhorder_item_div');

			var index = $(".cancelN_item_delete").index(this);

			var remove_obj = $(obj).closest('tr');

			remove_obj.remove();
			Nhorder_item_div.eq(index).remove();

		}

		//취소N modal 등록
		function cancelN_form_submit() {

			var Nhorder_item_div = $(document).find('#cancelN_form .Nhorder_item_div');

			var Nhorder_length = Nhorder_item_div.length;

			if (Nhorder_length > 0) {
				$(document).find('#cancelN_form').submit();
			} else {
				alert("정보를 입력해주세요")
			}
		}
		
		
		//취소하기Y 전에 확인칸 추가
		function cancelY_item_add() {

			var Yselect_item_formh = $(document).find("#Yselect_item_formh");
			var Yhorder_item = {};
			Yhorder_item.canceledOrder = Yselect_item_formh.find("select[name='canceledOrder'] option:selected").val();

			console.log(Yhorder_item)

			var Yhorder_item_canceledOrder = $("<input type='hidden' name='canceledOrder'>");
			Yhorder_item_canceledOrder.val(Yhorder_item.canceledOrder)

			var Yhorder_item_div = $("<div class='Yhorder_item_div'>");

			Yhorder_item_div.append(Yhorder_item_canceledOrder);
			Yhorder_item.orderId =$(document).find("#cancelY_form").find("input[name='orderId']").val();
			
			var Yhorder_item_table = $(document).find("table.Yhorder_item_table tbody");
			var Yhorder_item_tr = $("<tr>");
			Yhorder_item_tr.append($("<td>" + Yhorder_item.orderId+ " </td>"))
			Yhorder_item_tr.append($("<td>" + Yhorder_item.canceledOrder + " </td>"))
			Yhorder_item_tr.append($("<td>"+ "<button onclick='deleteY_cancel_item(this)' class='btn btn-danger cancelY_item_delete'>x</button>"+ " </td>"));
			Yhorder_item_table.append(Yhorder_item_tr);
			$(document).find('#cancelY_form').append(Yhorder_item_div);
		}

		//취소Y 확인칸에서 삭제
		function deleteY_cancel_item(obj) {

			var Yhorder_item_div = $(document).find('#cancelY_form .Yhorder_item_div');

			var index = $(".cancelY_item_delete").index(this);

			var remove_obj = $(obj).closest('tr');

			remove_obj.remove();
			Yhorder_item_div.eq(index).remove();

		}

		//취소Y modal 등록
		function cancelY_form_submit() {

			var Yhorder_item_div = $(document).find('#cancelY_form .Yhorder_item_div');

			var Yhorder_length = Yhorder_item_div.length;

			if (Yhorder_length > 0) {
				$(document).find('#cancelY_form').submit();
			} else {
				alert("정보를 입력해주세요")
=======
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
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
			}
<<<<<<< HEAD
		}
	</script>

<!-- 취소N Modal -->
<div id="cancelN_modal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
=======
	}
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
	
<<<<<<< HEAD
	<!-- Modal content-->
	<div id="cancelN-content" class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">취소 사유</h4>
		</div>
	<div class="modal-body">
	<div class="row">
	<div class="col-xs-7">
	<form align="center" name="cancelN_form" id="cancelN_form" style="border: 1 solid gray" action="${pageContext.request.contextPath}/cinsert">
		<label>주문번호 :</label><input type="text" class="Nformh-control" id="orderIdY" name="orderId" value=""><br>
		<label>주문시간 :</label><input type="text" class="Nformh-control" id="orderDate" name="orderDate" value="orderDate"><br>
	</form>
	
	<form align="center" action="" id="Nselect_item_formh">
		<label>취소사유 :</label> 
		<select class="Nformh-control" name="cancelReason">
			<option value="MENU CHANGE">메뉴 변경</option>
			<option value="NO REASON">단순 변심</option>
			<option value="QUANTITY CHANGE">수량 변경</option>
			<option value="EMPLOYEER MISS">직원 실수</option>
			<option value="ETC">기타</option>
		</select><br>
		<label>취소여부 :</label> 
		<select class="Nformh-control" name="canceledOrder">
			<option value="Y">Y</option>
		</select><br>
	</form>
	</div>
	<div class="col-xs-5 reserve_view">
	
	<table class="table Nhorder_item_table">
  	<thead>
  	<tr>
		<th>주문번호</th>
		<th>주문시간</th>
		<th>취소사유</th>
		<th>취소여부</th>
		<th>삭제</th>
	</tr>
  	
  	</thead>
  	
  	<tbody>
  	
  	</tbody>
  
	</table>
	</div>
	</div>
	</div>
=======
	//취소하기 function
	function ohcan_submit() {
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
		
<<<<<<< HEAD
	<div class="modal-footer">
		<button onclick="cancelN_form_submit()" type="button" class="btn btn-danger">등록</button>
		<button onclick="cancelN_item_add()" type="button" class="btn btn-primary">확인하기</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	</div>
	</div>
</div>


<!-- 취소Y Modal -->
<div id="cancelY_modal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
	
	<!-- Modal content-->
	<div id="cancelY-content" class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">복구 내역</h4>
		</div>
	<div class="modal-body">
	<div class="row">
	<div class="col-xs-7">
	<form align="center" name="cancelY_form" id="cancelY_form" style="border: 1 solid gray" action="${pageContext.request.contextPath}/cupdate">
		<label>주문번호 :</label><input type="text" class="Yformh-control" id="orderIdN" name="orderId" value=""><br>
	</form>
	
	<form align="center" action="" id="Yselect_item_formh">
		<label>취소여부 :</label> 
		<select class="Yformh-control" name="canceledOrder">
			<option value="N">N</option>
		</select><br>
	</form>
	</div>
	<div class="col-xs-5 reserve_view">
	
	<table class="table Yhorder_item_table">
  	<thead>
  	<tr>
		<th>주문번호</th>
		<th>취소여부</th>
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
		<button onclick="cancelY_form_submit()" type="button" class="btn btn-danger">등록</button>
		<button onclick="cancelY_item_add()" type="button" class="btn btn-primary">확인하기</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	</div>
	</div>
</div>

<!-- 여기서부터 예약입니다. --><!-- 여기서부터 예약입니다. --><!-- 여기서부터 예약입니다. --><!-- 여기서부터 예약입니다. --><!-- 여기서부터 예약입니다. -->


<!-- 예약N Modal -->
<div id="cancelRN_modal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
	
	<!-- Modal content-->
	<div id="cancelRN-content" class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">예약 상세 정보</h4>
		</div>
	<div class="modal-body">
	<div class="row">
	<div class="col-xs-7">
	<form align="center" name="cancelRN_form" id="cancelRN_form" style="border: 1 solid gray" action="${pageContext.request.contextPath}/rinsert">
		<label>주문번호 :</label><input type="text" class="RNformh-control" id="orderIdRY" name="orderId" value=""><br>
		<label>예약자 명 :</label><input type="text" class="RNformh-control" id="reserver" name="reserver" value=""><br>
		<label>수령인 명 :</label><input type="text" class="RNformh-control" id="receipter" name="receipter" value=""><br>
		<label>예약일자 :</label><input type="date" class="RNformh-control" id="receiptDate" name="receiptDate" value=""><br>
	</form>
	<form align="center" action="" id="RNselect_item_formh">
		<label>예약여부 :</label> 
		<select class="RNformh-control" name="reservation">
			<option value="Y">Y</option>
		</select><br>
	</form>
	</div>
	<div class="col-xs-5 reserve_view">
	
	<table class="table RNhorder_item_table">
  	<thead>
  	<tr>
		<th>주문번호</th>
		<th>예약자 명</th>
		<th>수령인 명</th>
		<th>예약일자</th>
		<th>예약여부</th>
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
		<button onclick="cancelRN_form_submit()" type="button" class="btn btn-danger">등록</button>
		<button onclick="cancelRN_item_add()" type="button" class="btn btn-primary">확인하기</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	</div>
	</div>
</div>


<!-- 예약Y Modal -->
<div id="cancelRY_modal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
	
	<!-- Modal content-->
	<div id="cancelRY-content" class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">예약주문 취소하기</h4>
		</div>
	<div class="modal-body">
	<div class="row">
	<div class="col-xs-7">
	<form align="center" name="cancelRY_form" id="cancelRY_form" style="border: 1 solid gray" action="${pageContext.request.contextPath}/rupdate">
		<label>주문번호 :</label><input type="text" class="RYformh-control" id="orderIdRN" name="orderId" value=""><br>
	</form>
	
	<form align="center" action="" id="RYselect_item_formh">
		<label>예약여부 :</label> 
		<select class="RYformh-control" name="reservation">
			<option value="N">N</option>
		</select><br>
	</form>
	</div>
	<div class="col-xs-5 reserve_view">
	
	<table class="table RYhorder_item_table">
  	<thead>
  	<tr>
		<th>주문번호</th>
		<th>예약여부</th>
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
		<button onclick="cancelRY_form_submit()" type="button" class="btn btn-danger">등록</button>
		<button onclick="cancelRY_item_add()" type="button" class="btn btn-primary">확인하기</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	</div>
	</div>
</div>
=======
		var formh = $(document).find("#formh");
		var ohcan_submit_formh =  $('<form>');
		ohcan_submit_formh.attr('action',"/kanu/hdelete");	//delete 실행
		ohcan_submit_formh.attr('method','post');	//전송방법 post
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
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
</body>
</html>