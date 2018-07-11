<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/resources/scripts/jquery-3.2.1.min.js"></script>
  
<script>


$(function() {
	 $("#updateBtn").click(function(){  
	var checklist= $("input[name=employeeId]:checked")
	if (checklist.length==0){
		alert("수정 할 사원을 선택하세요")
		return ;
	}
    window.location.href="updateEmp?employeeId="+$("input[name=employeeId]:checked").val();
	 });
    

 $("#deleteBtn").click(function(){  
			var checklist= $("input[name=employeeId]:checked")
			if (checklist.length==0){
				alert("삭제 할 사원을 선택하세요")
				return ;
			}
    window.location.href="deleteEmp?employeeId="+$("input[name=employeeId]:checked").val();
				 
	}); 
 

});



</script>

</head>
<body>
	
	
<form class="form-inline" action="./getEmp">
  <select name="selector"   >
  		<option selected="selected" value="employeeName">사원이름</option>
  		<option value="empEmail">이메일주소</option>
  </select>
  
  
  <div class="form-group mx-sm-3" align="right">
    <input type="text" class="form-control" name="empEmail">
  </div>
  	<button type="submit" class="btn btn-primary">조회</button>
</form>
	<form name="form2">
	
		<div align="right">  
		<a href="./getEmpList" class="btn btn-primary" role="button" aria-pressed="true">직원전체목록</a>
			<c:if test="${sessionScope.masterId==sessionScope.empId}">	
			<a href="./insertEmp" class="btn btn-info" role="button" aria-pressed="true" >직원정보등록</a> 
			<a href="#" class="btn btn-secondary" role="button" aria-pressed="true" id="updateBtn" >직원정보수정</a> 
			<a href="#" class="btn btn-danger" role="button" aria-pressed="true" id="deleteBtn" >직원정보삭제</a></c:if>
		</div>
		<br><br>
	
		<table class="table table-striped">
			<tr>
				<th>목록</th>
				<th>사원번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>주소</th>
				<th>보건증기간</th>
				<th>출생일자</th>
				<th>고용날자</th>
				<th>퇴직날자</th>
			</tr>
			<c:forEach items="${empMan}" var="emp">
				<tr>
					<td width="5"><input type="checkbox" name="employeeId" value="${emp.employeeId}" /></td>
					<td>${emp.employeeId}</td>
					<td>${emp.employeeName}</td>
					<td>${emp.empEmail}</td>
					<td>${emp.employeeAddress}</td>
	<c:if test="${date>emp.certificatedExpiredDate}">
					<td style="color: red">${emp.certificatedExpiredDate}</td></c:if>
		<c:if test="${date<emp.certificatedExpiredDate}">
					<td>${emp.certificatedExpiredDate}</td></c:if>				
					<td>${emp.employeeBirth}</td>
					<td>${emp.hireDate}</td>
					<td>${emp.retireDate}</td>
				</tr>

			</c:forEach>
		</table>
	</form>


</body>
</html>