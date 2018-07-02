<%@page import="com.kanu.web.orders.OrdersVO"%>
<%@page import="com.kanu.web.orders.impl.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<!DOCTYPE html>
<html>
<head>
<title>Orders_List</title>

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
<div>
<text align="center"><H2>주문 등록</H2></text>
<HR>
<form name="formo" id="order_form">
	<table border=1 cellspacing="1" cellpadding="5" align="center">
	<tr>
		<td>예약여부</td>
		<td>
			<label>
				<input type="radio" checked="checked" name="order_reserve"  value="true"/>일반 주문</label>
			
			<label>
				<input type="radio"  name="order_reserve" value="false"/>예약 주문</label>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="button"  onclick="order_form_submit()" value="주문하기">
		</td>
	</tr>
	</table>
</form>
</div>



<hr>
<text align="center"><H2>주문받은목록</H2></text>
<div align="center">
<form name="searchFrm" method="post" action="${pageContext.request.contextPath}/getOrdersList">
<%-- ${pageContext.request.contextPath}는 어떤 경로던간에 상위폴더를 자동적으로 연결 --%>
<input type="hidden" name="p" value="1"/>

주문번호<input type="text" name="orderId"/>
	  <input type="submit" value="검색"/><br/>
</form>
</div>
<form name="formd" id="formd" action="${pageContext.request.contextPath}/delete">
	<table border='1' width='350' height='100%' align='center' id='view'>
		<tr align="center">
			<th>주문번호</th>
			<th>메뉴이름</th>
			<th>개당가격</th>
			<th>주문수량</th>
			<th>총 가격</th>
			<th>삭제</th>
		</tr>
		
		<c:forEach items="${ordersList}" var="ordersList">
		
			<tr>
				<td>${ordersList.orderId}</td>
				<td>${ordersList.menuName}</td>
				
				<td>${ordersList.price}</td>
				
				<%-- <c:if test="N">
				
				<td background="bleck">${ordersList.price}</td>
				
				</c:if>
						
				<c:if test="Y">
				
				<td background="white">${ordersList.price}</td>
				
				</c:if>  --%>	<!-- 백그라운드 컬러 입히는법 (history) -->
				 
				<td>${ordersList.orderQuantity}</td>
				<td>${ordersList.orderTotalsum}</td>
				<td><input type="checkbox" name="delete_order" value="${ordersList.orderId}"/></td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="삭제" onclick="del_submit()" name="del">
</form>
<!-- 페이징 -->
<%-- <my:paging jsfunc="doList" paging="${paging}"/> --%>
<script>
	function doList(p) {
		document.searchFrm.p.value = p;
		document.searchFrm.submit();
	}
	//삭제하기 function
	function del_submit() {
		
	//	var is_del = $(document).find("#formd input[name='delete_order']").val();
		//var is_del = document.formd.delete_order.value	//is_del은 formd의 체크박스의 값
		var formd = $(document).find("#formd");
		var del_submit_form =  $('<form>');
		del_submit_form.attr('action',"/kanu/delete");
		del_submit_form.attr('method','post');
			if($("input[name=delete_order]:checked").length === 0){
				
				alert("삭제할 주문을 선택해주세요.")
			}else{
				$("input[name=delete_order]:checked").each(function() {
					var chdel = $(this).val();
					console.log(chdel);
					var input_del_order_id  = $('<input name="order_id">');
					input_del_order_id.val(chdel)
					del_submit_form.append(input_del_order_id);
				
				})
				$(document).find("body").append(del_submit_form)
				del_submit_form.submit();
				
			}
	}
	//예약 팝업
	//주문하기 버튼을 눌렀을 때 펑션
	function order_form_submit(){
	
		//is_reserve는 라디오 박스 선택 여부 값으로 비교한다
		var is_reserve = document.formo.order_reserve.value
		//= 대입  == 비교  === 완전한 비교
		
		//일반주문이면 normal_modal 팝업을 연다
		if(is_reserve==="true"){
			alert("일반주문");
			$("#normal_modal").modal("show");
		}else{	//그게 아니라면 reserve_modal 팝업을 연다
			alert("예약주문");
			$("#reserve_modal").modal("show");
			
		}
	}
	
	//예약 주문 장바구니 추가
	//펑션 이름 reserve_item_add
	function reserve_item_add(){
		//order_item에 select_item_form에서 선택된 menu_id의 text와 값을 담고, 수량도 담는다.
		var select_item_form = $(document).find("#select_item_form");
		var order_item = {};
		order_item.menuId = select_item_form.find("select[name='menuId'] option:selected").val();
		order_item.menuName = select_item_form.find("select[name='menuId'] option:selected").text();
		order_item.orderQuantity =select_item_form.find("input[name='orderQuantity']").val();
		
		console.log(order_item)	//order_item의 콘솔 로그를 남긴다. 무엇이 담겼는지
		
		var order_item_menuId = $("<input type='hidden' name='menuId'>");
		order_item_menuId.val(order_item.menuId)
		//order_item에 담긴 menu_id는 보이지 않게하고 이름은 menu_id이며 값은 menu_id가 담겼다.
		
		var order_item_menuName = $("<input type='hidden' name='menuName'>");
		order_item_menuName.val(order_item.menuName)
		//order_item에 담긴 menu_name는 보이지 않게하고 이름은 menu_name이며 값은 menu_name가 담겼다.
		
		var order_item_orderQuantity = $("<input type='hidden' name='orderQuantity'>");
		order_item_orderQuantity.val(order_item.orderQuantity)
		//order_item에 담긴 order_quantity는 보이지 않게하고 이름은  order_quantity이며 값은  order_quantity가 담겼다.
		
		var order_item_div= $("<div class='order_item_div'>");
		//order_item_div는 class이름이 order_item_div이다
		
		
		order_item_div.append(order_item_menuId);	//order_item_div의 자식으로 order_item에 담은 menu_id 값을 담는다
		order_item_div.append(order_item_menuName); //order_item_div의 자식으로 order_item에 담은 menu_name 값을 담는다
		order_item_div.append(order_item_orderQuantity); //order_item_div의 자식으로 order_item에 담은 order_quantity 값을 담는다
		order_item.receipter =$(document).find("#reserve_form").find("input[name='receipter']").val();	//order_item에 reserve_form에서 이름이 receipter인 input 박스의 값을 담는다
		order_item.receiptDate =$(document).find("#reserve_form").find("input[name='receiptDate']").val(); //order_item에 reserve_form에서 이름이 receipt_date인 input 박스의 값을 담는다
		var order_item_table = $(document).find("table.order_item_table tbody");	//order_item_table은 table중 order_item_table의 tbody를 갖는다.
		var order_item_tr = $("<tr>");	//위와 마찬가지로 order_item_tr은 tr태그를 담는다
		order_item_tr.append( $("<td>"+order_item.menuName+" </td>"))	//order_item_tr 태그의 자식으로 td태그를 쓰고 그 사이에 order_item에 담은 menu_name의 값을 뱉어낸다
		order_item_tr.append( $("<td>"+order_item.orderQuantity+" </td>"))	//order_quantity를 뱉어낸다.
		order_item_tr.append( $("<td>"+order_item.receipter+" </td>"))	//receipter를 뱉어낸다.
		order_item_tr.append( $("<td>"+order_item.receiptDate+" </td>"))	//recipt_date를 뱉어낸다.
		order_item_tr.append( $("<td>"+"<button onclick='delect_reserve_item(this)' class='btn btn-danger reserve_item_delete'>x</button>"+" </td>"));
		//삭제버튼인데 x 버튼을 만들고 그걸 클릭시 delect_reserve_item 펑션이 동작하고 reserve_item_delete를 주어서 클릭이 동작한 값만 삭제하도록 하였다.
		order_item_table.append(order_item_tr);	//order_item_table의 자식으로 order_item_tr을 주었다.
		$(document).find('#reserve_form').append(order_item_div);
		
	}
	
	//예약 장바구니 삭제
	function delect_reserve_item(obj){
		
		var order_item_div = $(document).find('#reserve_form .order_item_div');
	
		var index = $(".reserve_item_delete").index(this);
		
		var remove_obj = $(obj).closest('tr');
		
		remove_obj.remove();
		order_item_div.eq(index).remove();
		
	}
	
	//예약 주문 등록
 	function reserve_form_submit(){
		
		var order_item_div = $(document).find('#reserve_form .order_item_div');
		
		var order_length = order_item_div.length;
		
		if(order_length>0){
			$(document).find('#reserve_form').submit();
		}else{
			alert("장바구니에 물건이 없습니다.")
		}
	}
	
	
	
	
 	//일반 주문 장바구니 추가
	//펑션 이름 normal_item_add
	function normal_item_add(){
		//order_item에 select_item_form에서 선택된 menu_id의 text와 값을 담고, 수량도 담는다.
		var select_item_formN = $(document).find("#select_item_formN");
		var Norder_item = {};
		Norder_item.menuId = select_item_formN.find("select[name='menuId'] option:selected").val();
		Norder_item.menuName = select_item_formN.find("select[name='menuId'] option:selected").text();
		Norder_item.orderQuantity = select_item_formN.find("input[name='orderQuantity']").val();
		
		console.log(Norder_item)	//order_item의 콘솔 로그를 남긴다. 무엇이 담겼는지
		
		var Norder_item_menuId = $("<input type='hidden' name='menuId'>");
		Norder_item_menuId.val(Norder_item.menuId)
		//order_item에 담긴 menu_id는 보이지 않게하고 이름은 menu_id이며 값은 menu_id가 담겼다.
		
		var Norder_item_menuName = $("<input type='hidden' name='menuName'>");
		Norder_item_menuName.val(Norder_item.menuName)
		//order_item에 담긴 menu_name는 보이지 않게하고 이름은 menu_name이며 값은 menu_name가 담겼다.
		
		var Norder_item_orderQuantity = $("<input type='hidden' name='orderQuantity'>");
		Norder_item_orderQuantity.val(Norder_item.orderQuantity)
		//order_item에 담긴 order_quantity는 보이지 않게하고 이름은  order_quantity이며 값은  order_quantity가 담겼다.
		
		var Norder_item_div= $("<div class='Norder_item_div'>");
		//order_item_div는 class이름이 order_item_div이다
		
		
		Norder_item_div.append(Norder_item_menuId);	//order_item_div의 자식으로 order_item에 담은 menu_id 값을 담는다
		Norder_item_div.append(Norder_item_menuName); //order_item_div의 자식으로 order_item에 담은 menu_name 값을 담는다
		Norder_item_div.append(Norder_item_orderQuantity); //order_item_div의 자식으로 order_item에 담은 order_quantity 값을 담는다
		
		var Norder_item_table = $(document).find("table.Norder_item_table tbody");	//order_item_table은 table중 order_item_table의 tbody를 갖는다.
		var Norder_item_tr = $("<tr>");	//위와 마찬가지로 order_item_tr은 tr태그를 담는다
		Norder_item_tr.append( $("<td>"+Norder_item.menuName+" </td>"))	//order_item_tr 태그의 자식으로 td태그를 쓰고 그 사이에 order_item에 담은 menu_name의 값을 뱉어낸다
		Norder_item_tr.append( $("<td>"+Norder_item.orderQuantity+" </td>"))	//order_quantity를 뱉어낸다.
		Norder_item_tr.append( $("<td>"+"<button onclick='delect_normal_item(this)' class='btn btn-danger normal_item_delete'>x</button>"+" </td>"));
		//삭제버튼인데 x 버튼을 만들고 그걸 클릭시 delect_reserve_item 펑션이 동작하고 reserve_item_delete를 주어서 클릭이 동작한 값만 삭제하도록 하였다.
		Norder_item_table.append(Norder_item_tr);	//order_item_table의 자식으로 order_item_tr을 주었다.
		$(document).find('#normal_form').append(Norder_item_div);
		
	}
	
	//일반 장바구니 삭제
	function delect_normal_item(obj){
		
		var Norder_item_div = $(document).find('#normal_form .Norder_item_div');
	
		var index = $(".normal_item_delete").index(this);
		
		var remove_obj = $(obj).closest('tr');
		
		remove_obj.remove();
		Norder_item_div.eq(index).remove();
		
	}
	
	//일반 주문 등록
 	function normal_form_submit(){
		
		var Norder_item_div = $(document).find('#normal_form .Norder_item_div');
		
		var Norder_length = Norder_item_div.length;
		
		if(Norder_length>0){
			$(document).find('#normal_form').submit();
		}else{
			alert("장바구니에 물건이 없습니다.")
		}
	}
</script>

<!-- 예약 Modal -->
<div id="reserve_modal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div id="reserve-content" class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">예약 주문</h4>
      </div>
      <div class="modal-body">
      <div class="row">
	<div class="col-xs-7">
	<form align="left" action="" id="select_item_form">
	<label>메뉴 :</label>
	<select class="form-control" name="menuId">
			<option value="">선택</option>
		<c:forEach items="${column_List}" var="column" varStatus="status">
   			<option value="${menuId[status.index]}">${column}</option>
		</c:forEach>
	</select><br>
	<label>수량 :</label><input type="text" class="form-control" name="orderQuantity"><br>
	</form>
	
	<form align="left" name="reserve_form" id="reserve_form" style="border:1 solid gray" action="${pageContext.request.contextPath}/insertR">
	<label>담당직원 :</label><input type="text" class="form-control" name="employeeId"><br>
	<label>예약자 :</label><input type="text" class="form-control" name="reserver"><br>
	<label>수령자 :</label><input type="text" class="form-control" name="receipter"><br>
	<label>예약시간 :</label><input type="date" class="form-control" name="receiptDate"><br>
	</form>
	</div>
	<div class="col-xs-5 reserve_view">
	
	<table class="table order_item_table">
  	<thead>
  	<tr>
		<th>메뉴</th>
		<th>수량</th>
		<th>수령자</th>
		<th>예약시간</th>
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
      	<button onclick="reserve_form_submit()" type="button" class="btn btn-danger" >등록</button>
        <button onclick="reserve_item_add()" type="button" class="btn btn-primary" >장바구니에 담기</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 일반 Modal -->
<div id="normal_modal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
  
    <!-- Modal content-->
    <div id="normal-content" class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">일반 주문</h4>
      </div>
      <div class="modal-body">
      <div class="row">
	<div class="col-xs-7">
	<form align="left" action="" id="select_item_formN">
	<label>메뉴 :</label>
	<select class="form-control" name="menuId">
			<option value="">선택</option>
		<c:forEach items="${column_List}" var="column" varStatus="status">
   			<option value="${menuId[status.index]}">${column}</option>
		</c:forEach>
	</select><br>
	<label>수량 :</label><input type="text" class="form-control" name="orderQuantity"><br>
	</form>
	
	<form align="left" name="normal_form" id="normal_form" style="border:1 solid gray" action="${pageContext.request.contextPath}/insertN">
	<label>담당직원 :</label><input type="text" class="form-control" name="employeeId"><br>
	</form>
	</div>
	<div class="col-xs-5 reserve_view">
	
	<table class="table Norder_item_table">
  	<thead>
  	<tr>
		<th>메뉴</th>
		<th>수량</th>
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
      	<button onclick="normal_form_submit()" type="button" class="btn btn-danger" >등록</button>
        <button onclick="normal_item_add()" type="button" class="btn btn-primary" >장바구니에 담기</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>