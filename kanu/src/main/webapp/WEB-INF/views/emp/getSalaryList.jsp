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
 
	}

}
</script>

<script type="text/javascript">

 
function popupOpen(){

var popUrl = "/kanu/getEmpList2";	//팝업창에 출력될 페이지 URL

var popOption = "width=900, height=900, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

window.open(popUrl,"",popOption);

}


 

</script>
</head>
<body>

<div align="center">
<H2>급여:급여계산</H2>
<hr>
			<form action="./insertSalary" method="post" > 
		
	<%-- 	직원 <select	name="employee_name"><option value="">선택</option> 
		
		<c:forEach items="${employee_nameList}" var="emp" varStatus="i">
		<option value="${emp.EMPLOYEE_NAME}">${emp.EMPLOYEE_NAME}</option>
		</c:forEach> 
		
			</select> --%>
			
	<!-- 	고용형태<select name="hire_type">
			<option value="">직업분류</option>
			<option value="REGULAR">REGULAR</option>
			<option value="PARTTIME">PARTTIME</option>

			</select>  -->
		<!-- 월급수령월<input type="date" name="salary_date" />
		근무월<input type="text" name="month_work" placeholder='일한날 yyyymm입력' /><input type="submit" value="추가" />  -->
	
		월급여계산<input type="text" id="month_cal" name="month_cal" placeholder='계산 희망하는 yyyymm입력' />
		<input type="button" value="급여계산" onClick="cal('${salary.duringTime}')">
		
		
		<%-- <input type="button" value="선택삭제"
								onClick="SelectDel('${salary.employeeId}','${salary.salaryDate}')"> --%>
		 
		<input type="button" value="직원 선택" onClick="popupOpen('${emp.employeeId}')">  
	



		
		<%-- <input type="button" value="직원선택" onClick="cal('${salary.duringTime}')"> --%>
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

						<tr><%-- <td align="center">${salary.employeeId}</td> --%>
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