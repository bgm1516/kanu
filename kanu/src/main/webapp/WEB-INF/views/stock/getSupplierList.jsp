<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="./scripts/datatable/datatables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>



<style>
#content1 {
	margin: auto;
	text-align: center;
}
</style>

<title>공급사 관리</title>

<!-- delcheck function -->
		<script type="text/javascript">
			function delcheck() {
				var supplierId = $("#supplierId").val()
				result = confirm("내용이 삭제됩니다. 진행하시겠습니까?"+supplierId);

				if (result == true) {
					/* document.stockForm.product_id.value = product_id;
					document.stockForm["action"].value = "delete";
					document.stockForm.submit(); */

					location.href = "deleteSupplier?supplierId=" + supplierId;

				}
			}
		</script>
<!-- /delcheck function -->
<script>
	$(document).ready(function() {
		$('.supplierList').DataTable({
		//paging : false , 
		//scrollY: 400 ,
		//ordering : false
		//ajax : ''
		});

	});
</script>

</head>
<body>

	<div id="content1">
	<!-- 전체 리스트 테이블 -->
		<h3>공급사 목록</h3>
			<table id="detail" class="supplierList">
			<thead>
				<tr>
					<th>공급사ID</th>
					<th>공급사명</th>
					<th>공급사연락처</th>
					<th>담당자명</th>
					<th>담당자연락처</th>
				</tr>
			</thead>
			<tbody id="list">
				<c:forEach items="${supplierList}" var="vo">

					<tr>
						<td>${vo.supplierId}</td>
						<td>${vo.supplierName}</td>
						<td>${vo.phoneNumber}</td>
						<td>${vo.managerName}</td>
						<td>${vo.managerPhone}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<!-- /전체 리스트 테이블 -->
		<br>
		<!-- insert, update mode 변환 script -->
		<script>
		var currentTr;
	$(document).ready(
		function() {
			$("#detail tbody").on("click", "tr" , function() {
			$("#mode").val("update");
				var str = ""
				var tdArr = new Array(); //배열선언
					//현재 클릭 된 Row(<tr>)
				var tr = $(this);
				currentTr = tr;
				var td = tr.children();
					//tr.text()는 클릭된 Row, 즉 tr에 있는 모든 값을 가져온다.
					/* console.log("클릭한 Row의 모든 데이터 :" + tr.text()); */

					//반복문을 이용해서 배열에 값을 담아 사용할 수도 있다.
					td.each(function(i) {
					tdArr.push(td.eq(i).text());
					});
						console.log("배열에 담긴 값  :" + tdArr);
						/* $("#detail").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());  */

						//td.eq(index)를 통해 값을 가져올 수도 있다.
						// td.eq(index)를 통해 값을 가져올 수도 있다.
						var supplierId = td.eq(0).text();
						var supplierName = td.eq(1).text();
						var phoneNumber = td.eq(2).text();
						var managerName = td.eq(3).text();
						var managerPhone = td.eq(4).text();
							$("#supplierId").val(supplierId)
							$("#supplierName").val(supplierName)
							$("#phoneNumber").val(phoneNumber)
							$("#managerName").val(managerName)
							$("#managerPhone").val(managerPhone)

							/* str +=    " * 클릭된 Row의 td값 = pId. : <font color='red'>" + pId + "</font>" +
							", pLocation : <font color='red'>" + pLocation + "</font>" +
							", pQuantity : <font color='red'>" + pQuantity + "</font>" +
							", pMQuantity : <font color='red'>" + pMQuantity + "</font>" +
							", supId : <font color='red'>" + supId + "</font>";         */

							/* $("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());       */
							/* $("#ex1_Result2").html(str); */
						});

						//sendWhere함수 (insert || update)
						$("#sendWhere").click(function() {
							var requestValue = $("#form1").serialize();
							$.ajax({
								//type : "json",
								url : "./insertSupplier",
								data : requestValue,
								method : "post",
								success : function(data) {
									alert("성공적으로 저장되었습니다!");							
									
									//currentTr.children(); = td 태그에 입력 받은 값
									//변수 td에 담아 인덱스를 이용해 각각 매칭되는 입력 값을 담는다 
									var td = currentTr.children();
									
						
		
									// td.eq(index)를 통해 값을 가져올 수도 있다.
										td.eq(0).text(data.supplierId);
										td.eq(1).text(data.supplierName);
										td.eq(2).text(data.phoneNumber);
										td.eq(3).text(data.managerName);
										td.eq(4).text(data.managerPhone);
								},
								error : function(data) {
									alert("Error!");}
								
								})

							})
							});
	</script>
	<!-- insert, update mode 변환 script -->
		
	<!-- 추가 삭제 저장 폼 테이블 -->
		<form id="form1" method="post">
		<input type="hidden" name="supplierId" id="supplierId">
			<table border="2" class="table table-hover">
			
				<tr>
					<td>공급사명 :</td>
					<td><input type="text" name="supplierName" id="supplierName"></td>
				</tr>
				<tr>
					<td>공급사연락처 :</td>
					<td><input type="text" name="phoneNumber" id="phoneNumber"></td>
				</tr>
				<tr>
					<td>담당자명 :</td>
					<td><input type="text" name="managerName" id="managerName"></td>
				</tr>
				<tr>
					<td>담당자연락처 :</td>
					<td><input type="text" name="managerPhone" id="managerPhone"></td>
				</tr>

			</table>
			<input type="hidden" name="mode" id="mode" value="insert"> 
			<input type="reset" value="추가" onclick="$('#mode').val('insert')" class="btn btn-default"> 
			<input type="button" onclick="delcheck()" value="삭제" class="btn btn-default"> 
			<input type="button" id="sendWhere" value="저장" class="btn btn-default"><br>
			<br>
		</form>
		<!-- /추가 삭제 저장 폼 테이블 -->
		
		

	</div>
</body>
</html>