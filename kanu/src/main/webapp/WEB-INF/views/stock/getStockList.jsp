<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style>
#content1 {
	margin: auto;
	text-align: center;
}

* 
#insertfrm {
	/*  margin: auto; */
	width: 90%;
	padding: 0px;
	text-align: center;
}
/*  #tabcenter {
margin: auto;
    width: 60%;
    padding: 30px 0px 0px 0px;
    text-align : center; 
}  */
</style>
<title></title>
<%--삭제 function 추가 --%>
<script type="text/javascript">
	
	function delcheck(productId) {
		result = confirm("주의 ! 입고 내역과 레시피의 참조 행도 같이 삭제됩니다. 진행하시겠습니까?"
				+ productId);

		if (result == true) {
			/* document.stockForm.product_id.value = product_id;
			document.stockForm["action"].value = "delete";
			document.stockForm.submit(); */
			location.href = "deleteStock.do?productId=" + productId;

		}
	}
	
	
</script>

</head>
<body>
	<div id="content1">
		<h3>재고 현황</h3>
		<hr>
		<form id="stockForm" action="getStockList.do" method="get">
			<br> <input type="hidden" name="p" value="1"> 제품분류<input
				type="text" name="productId" />
			<!-- 제품명<input type="text" name="product_name" /> 
			상품위치<input type="text" name="product_location" />  -->
			<input type="submit" value="조회" /> <br> <br> <br>
			<!-- <input type="button" name="minjaego" value="위험재고검색"><br><br> -->

		</form>

		<hr>
		<br> <br> <br> <br>
		<div class="container">
			<div class="row">
				<div class="col">
					<form name="detail" method="post">
						<table border="1" width="500px" id="detail">
							<tr>

								<th>제품분류</th>
								<th>상품위치</th>
								<th>재고수량</th>
								<th>최소수량</th>
								<th>공급사ID</th>

 
							</tr>

							<!-- StockDAO dao = new StockDAO(); -->
							<!-- 	for (StockVO vo : dao.getStockList(searchVO))  -->
							<c:forEach items="${stockList}" var="vo">
								<tr
									<c:if test="${Integer.parseInt(vo.stockQuantity) lt Integer(vo.minimumQuantity) }"> style="color:red;" </c:if>
									<c:if test="${Integer(vo.stockQuantity) gt Integer(vo.minimumQuantity) }"> style="color:black;" </c:if>>

									<td align="center">${vo.productId }</td>
									<td align="center">${vo.productLocation}</td>
									<td align="right">${vo.stockQuantity}</td>
									<td align="right">${vo.minimumQuantity}</td>
									<td align="right">${vo.supplierId}</td>


								</tr>
							</c:forEach>

						</table>
						<div class="col-lg-12" id="ex1_Result1"></div>
						<div class="col-lg-12" id="ex1_Result2"></div>
						<br>
						<br>

						<script>
	$(document).ready(function(){
		$("#detail tr").click(function(){
			var str = ""
			var tdArr = new Array(); //배열선언
				
				//현재 클릭 된 Row(<tr>)
				var tr = $(this);
				var td = tr.children();
				//tr.text()는 클릭된 Row, 즉 tr에 있는 모든 값을 가져온다.
				/* console.log("클릭한 Row의 모든 데이터 :" + tr.text()); */
				
				 //반복문을 이용해서 배열에 값을 담아 사용할 수도 있다.
				td.each(function(i){
					tdArr.push(td.eq(i).text());
				});
				console.log("배열에 담긴 값  :" + tdArr);
				/* $("#detail").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());  */
				
				//td.eq(index)를 통해 값을 가져올 수도 있다.
				 // td.eq(index)를 통해 값을 가져올 수도 있다.
    var pId = td.eq(0).text();
    var pLocation = td.eq(1).text();
    var pQuantity = td.eq(2).text();
    var pMQuantity = td.eq(3).text();
    var supId = td.eq(4).text();
	$("#productId").val(pId)
	$("#productLocation").val(pLocation)
	$("#stockQuantity").val(pQuantity)
	$("#minimumQuantity").val(pMQuantity)
	$("#supplierId").val(supId)
	
	
    /* str +=    " * 클릭된 Row의 td값 = pId. : <font color='red'>" + pId + "</font>" +
    ", pLocation : <font color='red'>" + pLocation + "</font>" +
    ", pQuantity : <font color='red'>" + pQuantity + "</font>" +
    ", pMQuantity : <font color='red'>" + pMQuantity + "</font>" +
    ", supId : <font color='red'>" + supId + "</font>";         */
    

/* $("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());       */ 
/* $("#ex1_Result2").html(str); */
});	
	
	//sendWhere함수 (insert || update)
	$("#sendWhere").click(function(){
		var requestValue = $("#form1").serialize();
		$.ajax({
			type:"post",
			url:"./stock/getStocklist.do",
			data:requestValue,
			success:function(requestValue){
				if ($("#"))
			}
			
		})
		
	})
		});
</script>
					</form>
				</div>
				<!-- col-sm1 -->
				<div class="col"></div>
				<!-- 중간정렬 -->

				<form action="insertStock.do" id="form1" method="get">
					<input type="reset" value="추가"> 
					<input type="button" onclick="delcheck('${vo.productId}')" value="삭제"> 
					<input type="button" id="sendWhere" value="저장">
					<table border="1">
						<tr>
							<td>제품분류 :</td>
							<td><input type="text" name="productId" id="productId"></td>
						</tr>
						<tr>
							<td>보관위치 :</td>
							<td><input type="text" name="productLocation" id="productLocation"></td>
						</tr>
						<tr>
							<td>재고수량 :</td>
							<td><input type="text" name="stockQuantity" id="stockQuantity"></td>
						</tr>
						<tr>
							<td>최소재고 :</td>
							<td><input type="text" name="minimumQuantity" id="minimumQuantity"></td>
						</tr>
						
						<tr>
							<td>공급사ID :</td>
							<td><input type="text" name="supplierId" id="supplierId"></td>
						</tr>
						<tr>
							<td>입고수량 :</td>
							<td><input type="text" name="inputQuantity" value="0"
								readonly></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- col-sm2 -->
			<!-- </div> -->
			<!-- insertFrm -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->
</body>
</html>