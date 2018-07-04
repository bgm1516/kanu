<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.master==sessionScope.staff}">
<form class="form-inline" action="./getWorker">
  
  <div class="form-group mx-sm-3" align="right">
    사원번호<input type="text" class="form-control" name="employeeId">
  </div>
  <div class="form-group mx-sm-3" align="right">
    출근시간<input type="time" class="form-control" name="workStart" >
  </div>
  <div class="form-group mx-sm-3" align="right">
   퇴근시간<input type="time" class="form-control" name="workEnd" >
  </div>
  <div class="form-group mx-sm-3" align="right">
    근무시간<input type="text" class="form-control" name="dayWorktime">
  </div>
  	<button type="submit" class="btn btn-primary">조회</button>
  <a href="./getWorkList" class="btn btn-secondary" role="button" aria-pressed="true">전체조회</a>
</form>
</c:if>
<c:if test="${sessionScope.master!=sessionScope.staff}">
<div align="right">

<a href="./insertEmp" class="btn btn-primary" role="button" aria-pressed="true">근무조회</a>
<a href="./updateEmp" class="btn btn-secondary" role="button" aria-pressed="true">출근확인</a>
<a href="./deleteEmp" class="btn btn-success" role="button" aria-pressed="true">퇴근확인</a>

</div>
</c:if>
<br>
<br>
<c:if test="${sessionScope.master==sessionScope.staff}">
<form>

<table class="table table-striped">
<tr>
<th>CHK</th><th>직원번호</th><th>직원이름</th><th>출근시간</th><th>퇴근시간</th><th>일일근무시간</th></tr>
<c:forEach items="${workManC}" var="workC">
<tr>
<td width="5"><input type="checkbox" name="employeeId" value="${workC.employeeId}"/></td> 
<td>${workC.employeeId}</td> 
<td>${workC.employeeName}</td> 
<td>${workC.workStart}</td> 
<td>${workC.workEnd}</td>	
<td>${workC.dayWorktime}</td>
</tr>

</c:forEach>
</table>
</form>
</c:if>

</body>
</html>