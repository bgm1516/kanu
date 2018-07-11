<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<form action="./updateEmp" method="post">
		<div>
		<input type="hidden" name="employeeId" value="${empStore[0].employeeId}"/>
		</div>
		<div class="form-group">
			<label for="empName">직원 이름 </label> 
			<input type="text" class="form-control" name="employeeName" placeholder="성함을 입력하세요" value="${empStore[0].employeeName}">
			<small id="nameNotice" class="form-text text-muted">공백없이 적어주세요</small>
		</div>
		
		<div class="form-group">
			<label for="empAddr">직원 주소</label> <input type="text" class="form-control" name="employeeAddress"
				placeholder="시/도/군" value="${empStore[0].employeeAddress}">
		</div>
		<div class="form-group">
			<label for="empPwd">비밀번호</label> <input type="text" class="form-control" name="password"
				placeholder="비밀번호" value="${empStore[0].password}">
		</div>
	  	<div class="form-group">
   			 <label for="exampleInputEmail1">Email address</label>
  			 <input type="email" class="form-control" name="empEmail" aria-describedby="emailHelp" placeholder="@를 포함하세요" value="${empStore[0].empEmail}">
 		     <small id="emailHelp" class="form-text text-muted">이메일을 입력해 주세요</small>
 		</div>
		
		<div class="form-group">
			<label for="empHire">채용일자</label> <input type="date" name="hireDate" value="${fn:substring(empStore[0].hireDate,0,10)}"/> 
			<small id="hireD" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
	
		
		<div class="form-group">
			<label for="empRetire">퇴직일자</label> <input type="date" name="retireDate" value="${fn:substring(empStore[0].retireDate,0,10)}" /> 
			<small id="retireD" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
		<div class="form-group">
			<label for="empHire">생년월일</label> <input type="date" name="employeeBirth" value="${fn:substring(empStore[0].employeeBirth,0,10)}" /> 
			<small id="empB" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
		<div class="form-group">
			<label for="empHire">보건증 유효기간</label> <input type="date" name="certificatedExpiredDate" value="${fn:substring(empStore[0].certificatedExpiredDate,0,10)}"/> 
			<small id="empCED" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
		<input type="submit" class="btn btn-primary" value="변경">
		<input type="reset" class="btn btn-primary" value="초기화">
	</form>




</body>
</html>