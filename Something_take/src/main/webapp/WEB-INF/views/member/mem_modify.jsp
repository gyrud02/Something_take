<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<script type="text/javascript">
	$(function modify_chk(){
		var regPwd = RegExp(/^[a-zA-Z0-9]{8,20}$/); // 비밀번호
		$(".btn-primary").click(function (){

			// 변경할 비밀번호
			if($("#pwd").val() == ""){
				alert("변경할 비밀번호를 입력하세요."); $("#pwd").focus(); return false;}

			// 변경할 비밀번호 재입력
			if($("#pwd_chk").val() == ""){
				alert("변경할 비밀번호와 동일하게 입력하세요."); $("#pwd_chk").focus(); return false;}

 			// 비밀번호 일치 확인
			if( $("#pwd").val() != $("#pwd_chk").val() ){
				alert("비밀번호를 동일하게 입력하세요."); $("#pwd").focus(); return false;}

		}); // click()
	}); // modify_chk()

	/* span 태그 숨기기 */
	$(function modi_hide(){
		$(".spanModi_chkT").hide(); $(".spanModi_chkF").hide(); $(".spanModiF").hide();
	}); // modi_hide()

	/* 비밀번호 유효성  */
	function modiAJAX(){
		var regPwd = RegExp(/^[a-zA-Z0-9]{8,20}$/); // 비밀번호
		$.ajax({
				type : "GET",
				dataType : "text",
				data : {
						pwd : $("#pwd").val(),
						pwd_chk : $("#pwd_chk").val() },
				success:function(check, textStatus){
						alert(textStatus + check);
						if( !(regPwd.test($("#pwd").val()) ) ){
							$(".spanModi_chkT").hide(); $(".spanModi_chkF").hide();
							$(".spanModiF").val("8~20자 영문 대소문자, 숫자를 입력해 주세요.").css("style", "display:none;");
							$(".spanModiF").css("color", "#ff4084"); $(".spanModiF").show();

							if(pwd.value.length == 0){
								$(".spanModiF").hide(); $(".spanModiT").hide(); } // if
						}else{
							if(pwd.value == pwd_chk.value){
								$(".spanModi_chkF").hide();
								$(".spanModi_chkT").val("비밀번호가 일치합니다.").css("style", "display:none;");
								$(".spanModi_chkT").css("color", "#ff4084");
								$(".spanModi_chkT").show();

								if(pwd.value.length == 0){
									$(".spanModiF").hide(); $(".spanModiT").hide(); } // if
							}else{
								$(".spanModi_chkF").val("비밀번호가 틀립니다.").css("style", "display:none;");
								$(".spanModi_chkF").css("color", "#ff4084");
								$(".spanModi_chkF").show();

								if(pwd.value.length == 0){
									$(".spanModiF").hide(); $(".spanModiT").hide(); } //if
							} // else
						} // if
				}, // success
				error:function(check, textStatus){
					alert("오류가 발생하였습니다. " + textStatus);
				} // error
		}); // ajax
	} // modiAJAX()
</script>
<body data-spy="scroll" data-target=".navbar-collapse">

 <br><br><br><br><br>

 <c:choose>
 
	 <c:when test="${sessionScope.email == null}" >
	   <script type="text/javascript">
		 alert("로그인 시 사용 가능한 페이지입니다.");
		 location.href="Sign-in.me";
	  </script>
	 </c:when>
	 
	 <c:otherwise>
		<div class="container">
			<div class="row">
				<div class="col-md-5 mr-md-auto ml-md-auto">
					<div class="head_title_1 text-center">
						<h2>Profile</h2>
						<div class="separator_auto"></div>
					</div>	
					<div class="head_title_1 text-left">

	      <!-------------------------------------------- [form태그 시작] -------------------------------------------------------->
				      <form class="member_reFr" action="member/modify.post" method="post" id="modify" onsubmit="modify_chk()">
	
						      <div class="js-form-message form-group">
							        <label class="form-label" for="name">이름</label>
							        <input type="text" class="form-control" name="name" id="name" value="${sessionScope.MemberVO.name}"
							               data-msg="이름을 입력해주세요."
							               data-error-class="form-error"
							               data-success-class="form-success"
							               readonly="readonly">
						      </div>
						      
						      <br>
						      
						      <div class="js-form-message form-group">
							        <label class="form-label" for="email">이메일</label>
							        <input type="email" class="form-control" name="email" id="email" value="${sessionScope.email}"
							               readonly="readonly"
							               data-msg="이메일을 입력해주세요."
							               data-error-class="form-error"
							               data-success-class="form-success">
							        
						      </div>
						      
						      <br>
						      
						      <div class="js-form-message form-group">
							        <label class="form-label" for="pwd">
							          <span class="d-flex justify-content-between align-items-center">변경할 비밀번호</span>
							        </label>
							        
							        
							        <input type="password" class="form-control" name="pwd" id="pwd" onkeyup="modiAJAX()"
							        	   required
							        	   placeholder="********"
							               aria-label="********" 
							               data-msg="올바른 비밀번호를 입력해주세요."
							               data-error-class="form-error"
							               data-success-class="form-success">
						      </div>
						     
						      <div class="js-form-message form-group">
						      	<span class="spanModiF">8~20자 영문 대소문자, 숫자를 입력해 주세요.</span>
						      </div>

						      <br>
						      
						      <div class="js-form-message form-group">
						        <label class="form-label" for="pwd_chk">
						          <span class="d-flex justify-content-between align-items-center">변경할 비밀번호 확인</span>
						        </label>
							        
						        <input type="password" class="form-control" name="pwd_chk" id="pwd_chk" 
						        	   required
						        	   placeholder="********"
						               aria-label="********" 
						               data-msg="올바른 비밀번호를 입력해주세요."
						               data-error-class="form-error"
						               data-success-class="form-success">
						      </div>

						      <div class="js-form-message form-group">
						      	<span class="spanModi_chkT">비밀번호가 일치합니다.</span>
						      </div>
						      <div class="js-form-message form-group">
						      	<span class="spanModi_chkF">비밀번호가 틀립니다.</span>
						      </div>
						      		
						      <br>
						
						      <div class="row align-items-center mb-5" style="float:right;">
						        <div class="col-5 text-right">
						          <input type="submit" class="btn btn-primary" value="저장하기">
						        </div>
						      </div>
						      
				      </form>
	      <!-------------------------------------------- [form태그 끝] -------------------------------------------------------->
					</div>
	
					</div> <!-- class="col" -->
				</div> <!-- class="row" -->
			</div> <!-- class="container" -->
	 
	 </c:otherwise>
 </c:choose>
 
</body>
</html>