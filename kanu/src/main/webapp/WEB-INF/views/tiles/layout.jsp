<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>    
    <!-- meta tags 필요 -->   
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script type="text/javascript" src="./resources/scripts/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <style>
  

#content1 {
	margin: auto;
	text-align: center;
}


  div, article, section, header, footer, nav, li {
	position:relative;
}

 body{  
  /* position: fixed;  */
  	top: 0; 
  	left: 0; 
 
    
 	 /* Preserve aspet ratio */
 	min-width: 100%;
 	min-height: 100%; 
	
	color: #ffffff;
	font-size: 15px;
	font-weight:300; 
	font-family:"맑은고딕";     
  background-color: #ffffff; 

  background-image: url("${pageContext.request.contextPath}/resources/img/bg/MIDBG.png"); 
  background-repeat: no-repeat;
  background-size: cover;
}
.container{
	min-width: 80%;
}
  #footer {
   position:fixed;
   left:0px;
   bottom:5px;
   height:50px;
   width:100%;
   background:#343A40;
   color: white;
}

  
  
  </style>
  
  </head>

  <body>
	<div id="content1">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="/kanu/mainpage">KANU</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
<<<<<<< HEAD
            <a class="nav-link" href="/kanu/main">Home <span class="sr-only">(current)</span></a>
=======
            <a class="nav-link" href="/kanu/mainpage">Home <span class="sr-only">(current)</span></a>
>>>>>>> branch 'B' of https://github.com/bgm1516/kanu
          </li>
          
          
          <!-- <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li> -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" 
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Order</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
            <c:if test="${!empty empId}">
              <a class="dropdown-item" href="/kanu/getOrdersList">주문관리</a>
              <a class="dropdown-item" href="/kanu/getOrder_historyList">주문내역</a>
              <a class="dropdown-item" href="/kanu/getMenuList">메뉴관리</a>
              <a class="dropdown-item" href="/kanu/getMenuList">레시피관리</a>
              <a class="dropdown-item" href="/kanu/getReserve_historyList">예약내역</a>
              <a class="dropdown-item" href="/kanu/getCanceled_orderList">취소관리</a></c:if>
            </div>
          </li>
          
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" 
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Stock</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
           <c:if test="${!empty empId}">
               <a class="dropdown-item" href="/kanu/getInputList">입고내역</a>
              <a class="dropdown-item" href="/kanu/getStockList">재고관리</a></c:if>
              <a class="dropdown-item" href="/kanu/getSupplierList">공급사관리</a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" 
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Employee</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
            <c:if test="${sessionScope.masterId==sessionScope.empId}">
              <a class="dropdown-item" href="/kanu/getEmpList">직원관리</a>
              <a class="dropdown-item" href="/kanu/getSalaryList2">급여내역</a>
              <a class="dropdown-item" href="/kanu/getSalaryList">급여관리</a></c:if>
              <c:if test="${!empty empId}">
              <a class="dropdown-item" href="/kanu/getWorkList">근무관리</a></c:if>
            </div>
          </li>
          
           <li class="nav-item">
            <a class="nav-link" href="/kanu/getQnAList">QnA</a>
          </li>
          <c:if test="${empty sessionScope.empName}">
          <li class="nav-item">
            <a class="nav-link" href="/kanu/getLoginForm">LogIn</a>
          </li></c:if>
               <c:if test="${!empty sessionScope.empName}">
          <li class="nav-item">
            <a class="nav-link" href="/kanu/getlogout">LogOut</a>
          </li></c:if>
        </ul>
        <c:if test="${!empty empName}"><span> 
          <li>${empName}님 환영합니다</li></span></c:if>
       <!--  <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> -->
      </div>
    </nav>
	<div class="background">
    <main role="main" class="container">
		<br><br><br>
      <div class="starter-template">
        <h1></h1>
    </div>
    </main>
    <tiles:insertAttribute name="content"/>
	
	

	</div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	</div>
  </body>
</html>
