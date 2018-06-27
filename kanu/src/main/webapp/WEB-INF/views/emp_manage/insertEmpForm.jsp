<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<form action="./insertEmp" method="post">
		<div class="form-group">
			<label for="empName">직원 이름 </label> 
			<input type="text" class="form-control" name="employeeName" placeholder="성함을 입력하세요">
			<small id="nameNotice" class="form-text text-muted">공백없이 적어주세요</small>
		</div>
		
		<div class="form-group">
			<label for="empAddr">직원 주소</label> <input type="text" class="form-control" name="employeeAddress"
				placeholder="시/도/군">
		</div>
		<div class="form-group">
			<label for="empPwd">비밀번호</label> <input type="text" class="form-control" name="password"
				placeholder="비밀번호">
		</div>
	  	<div class="form-group">
   			 <label for="exampleInputEmail1">Email address</label>
  			 <input type="email" class="form-control" name="empEmail" aria-describedby="emailHelp" placeholder="@를 포함하세요">
 		     <small id="emailHelp" class="form-text text-muted">이메일을 입력해 주세요</small>
 		</div>
		
		<div class="form-group">
			<label for="empHire">채용일자</label> <input type="date" name="hireDate" /> 
			<small id="hireD" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
	
		
		<div class="form-group">
			<label for="empRetire">퇴직일자</label> <input type="date" name="retireDate" /> 
			<small id="retireD" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
		<div class="form-group">
			<label for="empHire">생년월일</label> <input type="date" name="employeeBirth" /> 
			<small id="empB" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
		<div class="form-group">
			<label for="empHire">보건증 유효기간</label> <input type="date" name="certificatedExpiredDate" /> 
			<small id="empCED" class="form-text text-muted">정확한 날짜를 입력하세요</small>
		</div>
		<input type="submit" class="btn btn-primary" value="등록">
		<input type="reset" class="btn btn-primary" value="초기화">
	</form>



</body>
</html>