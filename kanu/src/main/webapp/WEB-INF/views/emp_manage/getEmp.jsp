<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<c:if test="${!empty empOne}">
<form style="color: black;">
<table class="table table-striped">
<tr>
<th>ID</th><th>NAME</th><th>E-MAIL</th></tr>
<tr>
<td>${empOne.employeeId}</td> 
<td>${empOne.employeeName}</td> 
<td>${empOne.empEmail}</td>	
</tr>
</table>
</form>
</c:if>


</body>
</html>