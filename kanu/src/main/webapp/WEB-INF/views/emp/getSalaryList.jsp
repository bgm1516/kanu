<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#c1 {
	margin: auto;
	width: 50%;
	border: 0.5px solid #000000;
	padding: 10px;
	text-align: center;
}
</style>
<title>getSalaryList.jsp</title>
<script type="text/javascript">

function delcheck(employeeId,salaryDate) {
	result = confirm("정말로 삭제하시겠습니까 ?");

	if (result == true) {
 	location.href = "deleteSalary?employeeId="+employeeId + "&salaryDate="+salaryDate;
 	
 /* 	function delcheck(employeeId,monthSalary) {
 		result = confirm("정말로 삭제하시겠습니까 ?");

 		if (result == true) {
 	 	location.href = "deleteSalary?employeeId="+employeeId + "&monthWork="+monthSalary;
 	 	 */
		/*  location.href = "deleteSalary.do?employeeId=" + employeeId;  */

	}

}
function cal(duringTime) {//아이디빼야하나?

	var a=document.getElementById("month_cal").value;

	location.href = "salary_control.jsp?action=update&month_cal="+a;
}
 
 //체크박스 선택 삭제
function SelectDel() { 
	 var employee_id = document.userListForm.userid;
	 var frm = document.userListForm;
	 var cnt = 0;
	 var user_id = "";
	 if (employee_id.length > 1) {
	  for ( var i = 0; i < deluser_id.length; i++) {
	   if (employee_id[i].checked) {
	    cnt++;
	    user_id = user_id + "," + employee_id[i].value;
	   }
	  }
	  if (cnt == 0) {
	   return;
	  }
	 } else {
	 // 체크박스가 하나밖에 없을때 경우
	  if (employee_id.checked) {
	   cnt++;
	   user_id = employee_id.value;
	  }
	  if (cnt == 0) {
	   alert("선택하신 사용자가  없습니다.");
	   return;
	  }
	 }
	 frm.action = url //주소
	 frm.submit();


</script>
</head>
<body>

<div align="center">
<H2>급여:급여목록</H2>
<hr>
			<form action="./insertSalary" method="post" > 
		
		직원 <select	name="employee_name"><option value="">선택</option> 
		
		<c:forEach items="${employee_nameList}" var="emp" varStatus="i">
		<option value="${emp.EMPLOYEE_NAME}">${emp.EMPLOYEE_NAME}</option>
		</c:forEach>
		
			</select>
			
		고용형태<select name="hire_type">
			<option value="">직업분류</option>
			<option value="REGULAR">REGULAR</option>
			<option value="PARTTIME">PARTTIME</option>

			</select> 
		월급수령월<input type="date" name="salary_date" />
		 근무월<input type="text" name="month_work" placeholder='일한날 yyyymm입력' /><input type="submit" value="추가" /> 
		월급여계산<input type="text" id="month_cal" name="month_cal" placeholder='계산 희망하는 yyyymm입력' />
		<input type="button" value="급여계산" onClick="cal('${salary.duringTime}')">
		<input type="button" value="선택삭제"
								onClick="SelectDel('${salary.employeeId}','${salary.salaryDate}')">
		</form>
		

		
		<HR>
		<form>
			<P>
			<div id="c1">
				<table class="table table-striped">

					<tr>
						<th>직원이름(번호)</th>
						<th>고용형태</th>
						<th>월급수령월</th>
						<th>근무월</th>
						<th>월근무시간</th>
						<th>월급</th>
						<th>삭제</th>

					</tr>

					<c:forEach items="${salaryList}" var="salary">

						<tr>
							<td align="center"><input type="checkbox" name="checkRow"  
							value="${salary.employeeId}"/> ${salary.employeeId}<br></td>
							<th align="center">${salary.hireType}</th>
							<th align="center">${salary.salaryDate}</th>
							<th align="center">${salary.monthWork}</th>
							<th align="center">${salary.duringTime}</th>
							<th align="center">${salary.monthSalary}</th>
							<th><input type="button" value="삭제"
								onClick="delcheck('${salary.employeeId}','${salary.salaryDate}')"></th>

						</tr>

					</c:forEach>
				</table>
				</div>
				
				</form>
				</div>
		

			
		
	
</body>
</html>