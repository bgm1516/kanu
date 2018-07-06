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
<a href="./insertEmp" class="btn btn-primary" role="button" aria-pressed="true">근무조회</a>
<a href="./updateEmp" class="btn btn-secondary" role="button" aria-pressed="true">출근확인</a>
<a href="./deleteEmp" class="btn btn-success" role="button" aria-pressed="true">퇴근확인</a>

</div>
<br>
<br>

<table class="table table-striped">
<tr>
<th>CHK</th><th>직원번호</th><th>출근시간</th><th>퇴근시간</th><th>일일근무시간</th></tr>
<c:forEach items="${workMan}" var="work">
<tr>
<td width="5"><input type="checkbox" name="employeeId" value="${work.employeeId}"/></td> 
<td>${work.employeeId}</td> 
<td>${work.workStart}</td> 
<td>${work.workEnd}</td>	
<td>${work.dayWorktime}</td>
</tr>

</c:forEach>
</table>
</form>


</body>
</html>