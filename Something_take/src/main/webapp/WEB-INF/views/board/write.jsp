<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/demo/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
<body class="lightbg">
<script type="text/javascript">

	/* 유효성 검사 */
	$(function write_chk(){
		$("#reg_btn").click(function(){
			if($("#title").val() == ""){ // 제목
				alert("제목을 입력하세요."); $("#title").focus(); return false; }

//			if($("#content").val() == ""  || $("#content").val() == null || $("#content").val() == '&nbsp;' || $("#content").val() == '<p>&nbsp;</p>')  {
//	             alert("내용을 입력하세요.");
//	             oEditors.getById["content"].exec("focus"); return false; }
//			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		}); // click()
	}); // write_chk()

	/* 작성 중 목록 버튼 */
	function writing(){
		var ing = confirm("게시판 목록으로 돌아가시겠습니까? (작성중인 글은 저장되지않습니다.)");
		$("#list_btn").click(function(){
			if(ing == false){
				return false;
			}else if(true){
				alert("글 작성이 취소되었습니다.");
				location.href="board.bd";
			}
		}); // click()
	}; // writing()

/* ------------------------------- [ 스마트 에디터 api ] ---------------------------------------- */
	
	$(document).ready(function() {
		var oEditors = [];
		    nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
		    elPlaceHolder: "content",
		    sSkinURI: "${pageContext.request.contextPath}/resources/demo/SmartEditor2Skin.html", // SmartEditor2Skin.html 파일이 존재하는 경로
		    htParams : {
		    	bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)  
		        bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		        bUseModeChanger : false, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		        fOnBeforeUnload : function(){
		        }
		    }, 
		    fOnAppLoad : function(){
		    	oEditors.getById["content"].exec("PASTE_HTML", [""]); // 내용초기화
			},
		    fCreator: "createSEditor2"
		    });

		// 저장버튼 클릭시 form 전송
	    $("#reg_btn").click(function(){
	        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	        $("#frm").submit();
	    });    
	});

/* ------------------------------------ [ 스마트 에디터 api ] ----------------------------------- */
	
	/* 게시판 등록 AJAX 
	function write_AJAX(){
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		var writer = document.getElementById('writer').value;
		$.ajax({
				type:"POST",
				dataType:"text",
				data:{ "title":title,
					   "content":content,
					   "writer":writer},
				url:"board/write.post",
				success:function(textStatus){
					alert("등록되었습니다.");
					location.href="board.bd";
				}, // success
				error:function(textStatus){
					alert("게시글 등록 중 오류가 발생하였습니다.");
				} // error
		}); // ajax
	} // write_AJAX() */
	
</script>
	
	<br><br><br><br>

<!------------------------------------ [게시판 영역] ------------------------------------------->
	<c:choose>
		<c:when test="${sessionScope.email == null}">
			<script type="text/javascript">
				alert("로그인 시 사용 가능한 페이지입니다.");
				location.href="sign-in.me";
			</script>
		</c:when>

		<c:otherwise>
			<section>
			  <div class="container">
					<div class="row">
						<div class="col-md-7 mr-md-auto ml-md-auto">
							<div class="head_title_1 text-center">
								<h2>Foundation</h2>
								<div class="separator_auto"></div>
							</div>

							<form action="board/write.post" method="post" enctype="multipart/form-data" onsubmit="return write_chk()" id="frm">
				
									<div class="form-group">
										<label class="form-label" for="title">글제목</label> 
										<input type="text" name="title" id="title" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="form-label" for="content">글내용</label>
										<textarea name="content" id="content" cols="76" required></textarea>
									</div>
									
									<div class="form-group">
										<label for="writer">작성자</label> 
										<input type="text" name="writer" class="form-control" value="${sessionScope.email}" readonly="readonly">
									</div>
		
								<input type="submit" class="btn btn-primary" id="reg_btn" value="등록">
								<button type="button" class="btn btn-primary" id="list_btn" onclick="return writing();">목록</button>

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