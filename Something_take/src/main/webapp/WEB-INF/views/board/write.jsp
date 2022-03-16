<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/demo/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
<body class="lightbg">
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">

	/* 유효성 검사 */
	$(function write_chk(){
		$("#reg_btn").click(function(){
			if($("#title").val() == ""){ // 제목
				alert("제목을 입력하세요."); 
				$("#title").focus(); 
				return false; 
			}
		/*
			if($("#content").val() == ""){ // 내용
		*/	
			if($('input[name=content]').val() == "" /* || $('input[name=content]').val() == null */){ // 내용
				alert("내용을 입력하세요."); 
				$("#content").focus(); 
				return false; 
			}

			var v = grecaptcha.getResponse();
			if(v.length == 0){
				alert("스팸방지 동의가 필요합니다.");
				return false;
			}else if(v.length != 0){
				// alert("통과");
				$.ajax({
		            url: 'board/VerifyRecaptcha',
		            type: 'post',
		            data: { recaptcha: $("#g-recaptcha-response").val() },
		            success: function(data) {
		                switch (data) {
		                    case 0:
		                        //alert("자동 가입 방지 봇 통과");
		                    	break;
		                    case 1:
		                        //alert("자동 가입 방지 봇을 확인 한 후 진행해주세요.");
		                        break;
		                    default:
		                        // alert("자동 가입 방지 봇을 실행하던 중 오류가 발생했습니다. [Error bot Code : " + Number(data) + "]");
								break;
		                } // switch */
		            } // success
				}); // ajax
			} // if
		}); // click()
	}); // write_chk()

	/* 목록 버튼 */
	$(function writing(event){
		$("#list_btn").click(function(){
			location.href="board.bd";
		}); // click()
	}); // writing()

/* ------------------------------------ [ 리캡챠 api ] ----------------------------------- */
	function recapCheck(){
		var v = grecaptcha.getResponse();
		if(v.length == 0){
			alert("스팸방지 동의가 필요합니다.");
			return false;
		} else if(v.length != 0){
			// alert("통과");
			$.ajax({
	            url: 'board/VerifyRecaptcha',
	            type: 'post',
	            data: { recaptcha: $("#g-recaptcha-response").val() },
	            success: function(data) {
	                switch (data) {
	                    case 0:
	                        alert("자동 가입 방지 봇 통과");
	                    	break;
	                    case 1:
	                        alert("자동 가입 방지 봇을 확인 한 후 진행해주세요.");
	                        break;
	                    default:
	                        alert("자동 가입 방지 봇을 실행하던 중 오류가 발생했습니다. [Error bot Code : " + Number(data) + "]");
							break;
	                } // switch */
	            } // success
			}); // ajax
		} // if
	}; // recaptchaCheck() 

/* ------------------------------------ [ 리캡챠 api ] ----------------------------------- */

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
							
							<c:if test="${sessionScope.email != 'admin@Something-take.com'}">
								 <div class="form-group">스팸방지를 위한 동의사항입니다. 확인체크바랍니다.
									<div class="g-recaptcha" data-sitekey="6LeX4tkeAAAAADIhY2mz10xTKShV-c9V8_e_CqA0">
									</div>
								</div>
							</c:if>
	
							<input type="submit" class="btn btn-primary" id="reg_btn" value="등록"> <%-- onclick="return recapCheck();" --%> 
							
							<c:if test="${sessionScope.email == 'admin@Something-take.com'}">
								<button type="button" class="btn btn-primary" id="list_btn" onclick="return writing();">목록</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
	
		</c:otherwise>
	</c:choose>
	
	<br>
	
</body>
<!------------------------------------ [게시판 영역] ------------------------------------------->
	
</html>