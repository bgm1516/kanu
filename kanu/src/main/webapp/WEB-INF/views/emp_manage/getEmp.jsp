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

id :${empOne.employeeId } <br>

name : ${empOne.employeeName } <br>

e-mail : ${empOne.empEmail}

</form>
</c:if>


</body>
</html>