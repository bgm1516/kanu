<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>insertSalary.jsp</title>
</head>
<body>
<form action="./insertSalary" method="post" >
	직원이름(번호)<input type="text" name="employeeId">
	고용형태<input type="text" name="hireType">
	월급수령월<input type="text" name="salaryDate">
	근무월<input type="text" name="monthWork">
	월근무시간<input type="text" name="duringTime">
	월급<input type="text" name="monthSalary">
	직원이름<input type="text" name="employeeName">
	<input type="submit" value="등록"/>
	</form>

</body>
</html>