<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>

.member {
 font-size: 50px;
 text-shadow: 0 0 10px #666;
 color: #fff;
 margin: 0 auto;
 text-align: center;
 text-transform: capitalize;
 font-family: "맑은 고딕";
 font-style: italic;
}

body {
 font-family: "맑은 고딕";
 font-size: 12px;
}

.form {
 width:400px;
 height: 200px;
 border-radius: 25px;
 border: 5px double #999;
 margin: 30px auto;
}

.form2 {
 width: 380px;
 min-width: 320px;
 height: 200px;
 margin: 60px auto;
 margin-left:20px;
}

.form3 {
 float: left;
 /*   background:#f00;  */
}

/* 폼3 옆에 로그인 붙이기 */
.form3 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;
}
 

#wrap {
 width: 600px;
 height: 500px;
 margin: 0 auto;
}

.clear {
 clear: both;
}

input[type="submit"] {
 float: left;
 /*  display:block; */
 height: 50px;
 background: #FFBB00;
 border-radius: 5px;
 border: none;
 font-family: "맑은 고딕";
}
input[type="button"] {
 height: 30px;
 background: gray;
 border-radius: 5px;
/*  width: 140px; */
 font-family:"맑은 고딕";
 margin-top:10px;
 margin-right:20px;
}
input[type="checkbox"] {
 margin-top:20px;
}



/* input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 50px;
	background: #A52A2A;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
	color: white;
}

 */

</style>

</head>
<body>


	<div class="container-fluid bg-1 text-center">
		<div id="none">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div class="login">


			<form action="./getlogin" method="post">
				 <div class="form">
    			 <div class="form2">
					<input type="hidden" name="action" value="login"> 
					<div class="form3">
					<label id="label">ID:</label><input id="textfield1" name="employeeId"
						type="text">
					<div class="clear"></div>
					<label id="label">PW:</label><input id="textfield1" name="password"
						type="password"></div>
					
					<input type="submit" value="로그인"><div class="clear"></div>
				 </div></div>
			</form>

</div>
		
	</div>



</body>
</html>

