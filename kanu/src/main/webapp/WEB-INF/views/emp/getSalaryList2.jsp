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
<title>getSalaryList2.jsp</title>

</head>
<body>

<div align="center">
<H2>급여:급여이력</H2>
 
		<form> 
			<P>
			<div id="c1">
				<table class="table table-striped">

					<tr>
						<th>직원이름(번호)</th>
						<th>고용형태</th>
						<th>월급수령월</th>
						<th>월근무시간</th>
						<th>월급</th>
	 					<th>근무한날</th>

					</tr>

					<c:forEach items="${salaryList2}" var="salary">

						<tr>
							<td align="center">${salary.employeeId}</td>
							<th align="center">${salary.hireType}</th>
							<th align="center">${salary.salaryDate}</th>
							<th align="center">${salary.duringTime}</th>
							<th align="center">${salary.monthSalary}</th>
							<th align="center">${salary.monthWork}</th>
					<%-- 		<th><input type="button" value="삭제"
								onClick="delcheck('${salary.employeeId}','${salary.salaryDate}')"></th> --%>

						</tr>

					</c:forEach>
				</table>
				</div>
				
				</form>
				</div>
		

			
		
	
</body>
</html>