<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form style="color: black;">
<c:forEach items="${empMan}" var="emp">

id :${emp.employeeId } <br>

name : ${emp.employeeName } <br>

e-mail : ${emp.empEmail}	<br>

</c:forEach>
</form>


</body>
</html>