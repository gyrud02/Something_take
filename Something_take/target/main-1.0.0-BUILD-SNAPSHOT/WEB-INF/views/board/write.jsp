<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" class="lightbg">
<script type="text/javascript">

	$(function write_chk(){
		$("#reg_btn").click(function(){

			// 제목
			if($("#title").val() == ""){
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}

		}); // click()
	}); // write_chk()

	// 글 작성 중 목록 버튼 눌렀을 때
	function writing(){

		var ing = confirm("게시판 목록으로 돌아가시겠습니까? (작성중인 글은 저장되지않습니다.)");

		$("#list_btn").click(function(){
			if(false){

			}else if(true){
				location.href="Board.bd";
				alert("글 작성이 취소되었습니다.");
			}
		}); // click()
	}; // writing()

</script>
	
	<br><br><br><br>

<!------------------------------------ [게시판 영역] ------------------------------------------->
	<c:choose>
		<c:when test="${sessionScope.email == null}">
			<script type="text/javascript">
				alert("로그인 시 사용 가능한 페이지입니다.");
				location.href="Sign-in.me";
			</script>
		</c:when>

		<c:otherwise>
			<section>
			  <div class="container">
					<div class="row">
						<div class="col-md-6 mr-md-auto ml-md-auto">
							<div class="head_title_1 text-center">
								<h2>Foundation</h2>
								<div class="separator_auto"></div>
							</div>

							<form action="board/write.post" method="post" enctype="multipart/form-data" onsubmit="write_chk()">
				
									<div class="form-group">
										<label class="form-label" for="title">글제목</label> 
										<input type="text" name="title" id="title" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="form-label" for="content">글내용</label>
										<textarea class="form-control" name="content" id="content" rows="4" required></textarea>
					
										
<%------------------------------------ [ ck에디터 api ] ----------------------------------------%>									
										<script type="text/javascript">
										CKEDITOR.replace("content", {
											// <textarea name="content"></textarea>
											// ck에디터를 붙일 textarea태그에 name값을 content로 설정한다.

											height: 110,
				                		    removePlugins: 'resize',
					                			
					                		filebrowserBrowseUrl: '${pageContext.request.contextPath}/ckfinder/ckfinder.html',
					                		filebrowserFlashBrowseUrl: '${pageContext.request.contextPath}/ckfinder/ckfinder.html?type=Flash',
					                		filebrowserUploadUrl: '${pageContext.request.contextPath}/ckfinder/core/connector/java/connctor.java?command=QuickUpload&type=Files',
					                		filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
					                		filebrowserFlashUploadUrl: '${pageContext.request.contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
										});

										</script>
<%------------------------------------ [ ck에디터 api ] ----------------------------------------%>									
										
										
									</div>
									<div class="form-group">
										<label for="writer">작성자</label> 
										<input type="text" name="writer" class="form-control" value="${sessionScope.email}" readonly="readonly">
									</div>
		
								<input type="submit" class="btn btn-primary" id="reg_btn" value="등록">
								<button type="button" class="btn btn-primary" id="list_btn" onclick="writing()">목록</button>

							</form>
						</div>
					</div>
				</div>
			</section>
	
		</c:otherwise>
	</c:choose>
	
	<br>
	
</body>
<!------------------------------------ [게시판 영역] ------------------------------------------->
	
</html>