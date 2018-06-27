<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>updateSalary.jsp</title></head>
<body>
<h3>급여 수정</h3>

<form action="./updateSalary" method="post">
	<input type="text" name="employeeId" value="${salary.employeeId}">
	<input type="text" name="hireType" value="${salary.hireType}">
	<input type="text" name="salaryDate" value="${salary.salaryDate}">
	<input type="text" name="monthWork" value="${salary.monthWork}">
	<input type="text" name="duringTime" value="${salary.duringTime}">
	<input type="text" name="monthSalary" value="${salary.monthSalary}">
	<input type="submit" value="등록"/>
</form>
</body>
</html>