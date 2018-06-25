<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>getMenu.jsp</title>
<script	src="${pageContext.request.contextPath}/resources/scripts/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		//ajax로 게시글 로딩
		function getMenuList() {
			var requestData = {
				"boardSeq" : "${board.seq}"
			};
	
			
			//json으로 받아오는것
		/* 	$.ajax({
						url : "../getCommentsList",
						data : requestData,
						dataType : 'json',
						success : function(data) {
							for (i = 0; i < data.length; i++) {
								var html = '<div class="article" id="'
                        + data[i].seq + '">'
										+ data[i].name
										+ data[i].content
										+ '</div>';
								$("#commentsList").append(html);
							}
						}
					}); */
					
					
					//xml로 바꾸기
					
			$.ajax({
				url : "../getCommentsXml",
				data : requestData,
				dataType : 'xml',		//xml로 설정
				success : function(data) {
						var commentList = $(data).find("comment");
					for (i = 0; i < commentList.length; i++) {
						var name = $(commentList[i]).find("name").html(); //name 태그찾아라
						var content = $(commentList[i]).find("content").html();
						var seq =  $(commentList[i]).attr("seq");
						var html = '<div class="article" id="'
             				    + seq + '">'
								+ name+'&nbsp;&nbsp;&nbsp;&nbsp;'
								+ content
								+ '</div>';
						$("#commentsList").append(html);
					}
				}
			});
					
		}
	//댓글 등록
	$("#btnCommentAdd").click(function(){
		var requestData = {name:$("[name=name]").val() ,
							content:$("[name=content]").val(), 
							boardSeq : "${board.seq}"};
	/* 	requestData= $("#commentFrm").serialzie();
		requestData.boardSeq = "${board.seq}"; */
		$.ajax({
			url : "../insertComments",
			data : requestData,
			dataType : 'json',
			success : function(data) {
					var html = '<div class="article" id="'
            				+ data.seq + '">'
							+ data.name
							+ data.content
							+ '</div>';
					$("#commentsList").append(html);
			}
		});
	});
		getCommentsList();
	});
</script>
</head>
<body>
 
	<hr>
	제목 : ${vo.title}<br>
	  작성자 : ${vo.writer}<br>
	  내용 : ${vo.content}<br>
	첨부파일 : <a href="downloadBoard?seq=${vo.seq}">${vo.uploadfile}</a><br>
						<!--해당하는 게시글 번호(${vo.seq}) 넘겨서다운로드받기  -->

	<a href="../updateBoard">수정</a>

	<hr>
	<div style="border: 1px solid pink">
		<form id="commentFrm">
			<input name="name" size="10"> 
			<input name="content" size="50">
			<input type="button" id="btnCommentAdd" value="댓글 등록" />

		</form>
	</div>
	<div id="commentsList"></div>
</body>
</html>