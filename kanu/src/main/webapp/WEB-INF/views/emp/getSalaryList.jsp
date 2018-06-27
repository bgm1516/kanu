<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#c1 {
	margin: auto;
	width: 40%;
	border: 0.5px solid #000000;
	padding: 10px;
	text-align: center;
}
</style>
<title>getSalaryList.jsp</title>
<script type="text/javascript">
function cal(employeeId) {//아이디빼야하나?

	var a=document.getElementById("month_cal").value;

	location.href = "salary_control.jsp?action=update&month_cal="+a;
}
</script>
</head>
<body>
	<div align="center">
		<H2>급여:급여목록</H2>
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
							<td align="center">${salary.employeeId}<br></td>
							<th align="center">${salary.hireType}</th>
							<th align="center">${salary.salaryDate}</th>
							<th align="center">${salary.duringTime}</th>
							<th align="center">${salary.monthSalary}</th>
							<th align="center">${salary.monthWork}</th>
							
							<th><input type="button" value="급여계산"
								onClick="cal('${salary.}')"></th>
						</tr>
						
					</c:forEach>
		</table>
		</div>
		<HR>
		</form>
		</div>
</body>
</html>