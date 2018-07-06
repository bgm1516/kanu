<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form>
<div align="right">
<a href="./insertEmp" class="btn btn-primary" role="button" aria-pressed="true">직원정보등록</a>
<a href="./updateEmp" class="btn btn-secondary" role="button" aria-pressed="true">직원정보수정</a>
<a href="./deleteEmp" class="btn btn-success" role="button" aria-pressed="true">직원정보삭제</a>
</div>
<br>
<br>

<table class="table table-striped">
<tr>
<th>CHK</th><th>ID</th><th>NAME</th><th>E-MAIL</th></tr>
<c:forEach items="${empMan}" var="emp">
<tr>
<td width="5"><input type="checkbox" name="employeeId" value="${emp.employeeId}"/></td> 
<td>${emp.employeeId}</td> 
<td>${emp.employeeName}</td> 
<td>${emp.empEmail}</td>	
</tr>

</c:forEach>
</table>
</form>


</body>
</html>