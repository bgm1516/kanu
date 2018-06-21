<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script src="//www.google.com/jsapi"></script>
<script>

	var options = {
		title : '부서별 사원정보',
		width : 400,
		height : 500,
		color : ['#e0440e']
	};
	google.load('visualization', '1.0', {'packages' : [ 'corechart' ]});
	google.setOnLoadCallback(function() {
		
		var chart_data=[['부서','사원수']];
		
		//(data (ajax))
		$.ajax({
			url : "${pageContext.request.contextPath}/emp/getDeptCnt",
			dataType : 'json',
			success : function(res_data){
				for(i=0 ; i <res_data.length ; i++){
					var deptName=res_data[i].DEPARTMENT_NAME;
					var cnt =res_data[i].CNT;
					var temp=[deptName, cnt];
					chart_data.push(temp);
				}
					var chart = new google.visualization.PieChart(document
							.querySelector('#chart_div'));
					chart.draw(google.visualization.arrayToDataTable(chart_data), options);
					
			}
			
		});

	});
</script>
</head>
<body>
	<h3>차트연습</h3>
	<div id="chart_div"></div>
</body>
</html>