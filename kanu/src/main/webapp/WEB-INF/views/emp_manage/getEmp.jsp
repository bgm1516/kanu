<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<div align="right">
<a href="./getEmpList" class="btn btn-primary" role="button" aria-pressed="true">직원전체목록</a>
<a href="updateEmp" class="btn btn-secondary" role="button" aria-pressed="true">직원정보수정</a>
<a href="./deleteEmp" class="btn btn-success" role="button" aria-pressed="true">직원정보삭제</a>
</div>
<br><br>

<c:if test="${!empty empOne}">
<form style="color: black;">
<table class="table table-striped">
<tr>
<th>CHK</th><th>ID</th><th>NAME</th><th>E-MAIL</th></tr>
<tr>
<td width="5"><input type="checkbox" value="${emp.employeeId}"/></td> 
<td>${empOne.employeeId}</td> 
<td>${empOne.employeeName}</td> 
<td>${empOne.empEmail}</td>	
</tr>
</table>
</form>
</c:if>


</body>
</html>