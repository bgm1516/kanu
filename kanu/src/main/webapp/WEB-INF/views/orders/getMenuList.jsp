<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.c1 {
	margin: auto;
	width: 40%;
	/* border: 0.5px solid #000000; */
	padding: 10px;
	text-align: center;
}
.c2 {
	margin: auto;
	width: 40%;
 	border: 0.5px solid #000000; 
	padding: 10px;
	text-align: center;
}

.label {
	display:block; 
	width:x; 
	height:y; 
	text-align:center;
	}
	
</style>
<title>getMenuList.jsp</title>
<script type="text/javascript">

//모달

$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});




//메뉴 수정
function update_menu(a) {
    var check = confirm("메뉴 정보를 수정하시겠습니까?");
    if (check == true) {
       window.location.href = "./updateMenu?menuId="+a 
    }
 } 

 //중복 함수 
 
	function overlapcheck() {
		var menuName=document.menuForm.menuName.value;
		result=$('td:contains('+menuName+')')/* td태그 안의 메뉴 이름 과 동일한 값 */
		if (result.length>0) {//0보다 크면 중복 된 것
			alert("이미 존재 하는 메뉴입니다 .");
			return false;
		} else {
			return true;
		}
	}

	//삭제 함수
	function delcheck(menuId) {
		result = confirm("정말로 삭제하시겠습니까 ?");
		if (result == true) {
			location.href = "deleteMenu?menuId=" + menuId;
		}
	}

	// 숫자 값만 받는 함수	
	function onlyNumber(obj) {
		$(obj).keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
	}
	
	
	
	
</script>
</head>
<body>

	
<div class="row">
<div class="col">
		<H2 align="center">메뉴</H2>
		<HR>
		
		<form>
		 
			<div class="c1">
				<table class="table table-striped" >

					<tr>
						<th>메뉴번호</th>
						<th>메뉴명</th>
						<th>가격</th>
						<th>삭제</th>

					</tr>
					<c:forEach items="${menuList}" var="menu">
						<tr>
						<%--  <td><button type="button" class="btn btn-primary"
						 onclick="update_menu('${menu.menuId}')">${menu.menuId}</button></td> --%>
						 
							<%-- <td align="center">${menu.menuId}<br></td> --%>
							
							
						<!-- 모달 버튼 --><td><button type="button" class="btn btn-primary btn-lg" 
						data-toggle="modal" data-target="#myModal" > ${menu.menuId}</button></td>
							<td align="center">${menu.menuName}</td>
							<td align="center">${menu.price}</td>
							<td><input type="button" value="삭제"
								onClick="delcheck('${menu.menuId}')"></td>
						</tr>
					</c:forEach>

				</table>
				
	
			</div>
			<HR>
		</form>
		<div class=c2>
			<form action="./insertMenu" method="post" onsubmit="return overlapcheck()" name="menuForm">
					<label>메뉴명</label><input type="text" name="menuName"><br>
					<!-- <label>가격</label><input type="text" name="price"> -->
					<label>가격</label><input onkeydown="onlyNumber(this)" name="price" placeholder='숫자만 입력하세요'>
					<label><input type="submit" value="등록"/></label>
				</form>
				

				</div>
	</div>
	<div class="col">
	
	<H2 align="center">레시피</H2>
	<hr>  
</div> 
</div>
   
 
<!-- Modal 내용 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">메뉴 수정</h4>
      </div>
      <div class="modal-body">
    
 <table class="table table-striped">
			
			<c:forEach items="${menuList}" var="menu">
				<tr>
					<td>${menu.menuId}</td>
					<td>${menu.menuName}</td>
					<td>${menu.price}</td>
				</tr>
 
			</c:forEach>
		</table>
 
 
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-primary">수정 완료</button>
        
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>



 


</body>
</html>