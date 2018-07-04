<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <style>
#c1 {
	margin: auto;
	width: 40%;
	border: 0.5px solid #000000;
	padding: 10px;
	text-align: center;
}
</style>
 -->
</head>
<body>


	<div class="container-fluid bg-1 text-center">
  		<div class="login">
				<h1>로그인</h1>

				<form action="./Emp_control.jsp" method="post">
				<input type="hidden" name="action" value="login">
					<label id="label">ID: </label> 
					<input id="textfield1" name="employee_id" type="text">
					<label id="label"> 
					Password:</label> <input id="textfield1" name="password" type="password"><br>
				<input type="submit" value="로그인">
				</form>
			</div>
	</div>

			

</body>
</html>

