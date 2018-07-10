<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
 
<body>
<form action="./insertSalary" method="post">
<div align="right"> 
<br>
월급수령월<input type="date" name="salaryDate" />
<button class="btn btn-primary" role="button" aria-pressed="true">월급등록</button>
 
</div>
<br>
<br>

<table class="table table-striped">
<tr>
<th>CHK</th><th>ID</th><th>NAME</th><th>E-MAIL</th></tr>
<c:forEach items="${empMan}" var="emp">
<tr>
<td width="5"><input type="checkbox" name="employeeIds" value="${emp.employeeId}"/></td> 
<td>${emp.employeeId}</td> 
<td>${emp.employeeName}</td> 
<td>${emp.empEmail}</td>	
</tr>

</c:forEach>
</table>

</form>


</body>
</html>