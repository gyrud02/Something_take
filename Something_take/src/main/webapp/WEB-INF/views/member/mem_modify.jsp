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
			if($("#pwd").val() == "" || !(regPwd.test( $("#pwd").val() )) ){ 
				alert("8~20자 영문 대소문자, 숫자를 입력해 주세요."); $("#pwd").focus(); return false; } // 변경할 비밀번호
			if($("#pwd_chk").val() == "" || !(regPwd.test( $("#pwd_chk").val() )) ){ 
				alert("8~20자 영문 대소문자, 숫자를 입력해 주세요."); $("#pwd_chk").focus(); return false; } // 변경할 비밀번호 재입력
			if($("#pwd").val() != $("#pwd_chk").val()){ alert("비밀번호가 틀립니다."); $("#pwd_chk").focus(); return false; } // 비밀번호 일치
		}); // click()
	}); // modify_chk()

	/* span 태그 숨기기 */
	$(function modi_hide(){
		$(".spanModi_chkT").hide(); $(".spanModi_chkF").hide(); $(".spanModiF").hide(); $(".spanModiT").hide();
	}); // modi_hide()

	/* 비밀번호 유효성  */
	function modiAJAX(){
		var regPwd = RegExp(/^[a-zA-Z0-9]{8,20}$/); // 비밀번호
		$.ajax({
				type : "GET",
				dataType : "text",
				data : { pwd : $("#pwd").val(),
						 pwd_chk : $("#pwd_chk").val() },
				success:function(check, textStatus){
						if( !(regPwd.test($("#pwd").val()) ) ){
							$(".spanModi_chkT").hide(); $(".spanModi_chkF").hide(); $(".spanModiT").hide();
							$(".spanModiF").val("8~20자 영문 대소문자, 숫자를 입력해 주세요.").css("style", "display:none;");
							$(".spanModiF").css("color", "#ff4084"); $(".spanModiF").show();

							if(pwd.value.length == 0){
								$(".spanModiF").hide(); $(".spanModiT").hide(); return false;} // if
							return false;
						}else{
							$(".spanModiF").hide();
							$(".spanModiT").val("사용 가능한 비밀번호입니다.").css("style", "display:none;");
							$(".spanModiT").css("color", "#ff4084"); $(".spanModiT").show();

							if(pwd.value.length == 0){
								$(".spanModiF").hide(); $(".spanModiT").hide(); return false;} // if
						} // if
				}, // success
				error:function(check, textStatus){
					alert("회원정보 수정 중 오류가 발생하였습니다. ");
				} // error
		}); // ajax
	} // modiAJAX()
	
	/* 비밀번호 일치 확인 */
	function modichk(){
		$.ajax({
				type: "GET",
				dataType: "text",
				data: { pwd : $("#pwd").val(),
						pwd_chk : $("#pwd_chk").val() },
				success:function(){
					 	if(pwd.value == pwd_chk.value){
							$(".spanModi_chkF").hide();
							$(".spanModi_chkT").val("비밀번호가 일치합니다.").css("style", "display:none;");
							$(".spanModi_chkT").css("color", "#ff4084");
							$(".spanModi_chkT").show();
		
							if(pwd.value.length == 0 || pwd_chk.value.length == 0){
								$(".spanModi_chkT").hide(); $(".spanModi_chkF").hide(); return false;} // if
						}else{
							$(".spanModi_chkT").hide();
							$(".spanModi_chkF").val("비밀번호가 틀립니다.").css("style", "display:none;");
							$(".spanModi_chkF").css("color", "#ff4084");
							$(".spanModi_chkF").show();
		
							if(pwd.value.length == 0 || pwd_chk.value.length == 0){
								$(".spanModi_chkT").hide(); $(".spanModi_chkF").hide(); return false;} //if
							return false;
						} // if
				}, // success
				error:function(){
						alert("회원정보 수정 중 오류가 발생하였습니다.");
				} // error
		}); // ajax
	} // modichk()
</script>
<body>

 <br><br><br><br>

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
							        
							        
							        <input type="password" class="form-control" name="pwd" id="pwd" onkeyup="modiAJAX(event)"
							        	   required
							        	   placeholder="********"
							               aria-label="********" 
							               data-msg="올바른 비밀번호를 입력해주세요."
							               data-error-class="form-error"
							               data-success-class="form-success">
						      </div>
						     
						      <div class="js-form-message form-group">
						      	<span class="spanModiF">&nbsp;8~20자 영문 대소문자, 숫자를 입력해 주세요.</span>
						      </div>
						      <div class="js-form-message form-group">
						      	<span class="spanModiT">&nbsp;사용 가능한 비밀번호입니다.</span>
						      </div>

						      <br>
						      
						      <div class="js-form-message form-group">
						        <label class="form-label" for="pwd_chk">
						          <span class="d-flex justify-content-between align-items-center">변경할 비밀번호 확인</span>
						        </label>
							        
						        <input type="password" class="form-control" name="pwd_chk" id="pwd_chk" onkeyup="modichk(event)"
						        	   required
						        	   placeholder="********"
						               aria-label="********" 
						               data-msg="올바른 비밀번호를 입력해주세요."
						               data-error-class="form-error"
						               data-success-class="form-success">
						      </div>

						      <div class="js-form-message form-group">
						      	<span class="spanModi_chkT">&nbsp;비밀번호가 일치합니다.</span>
						      </div>
						      <div class="js-form-message form-group">
						      	<span class="spanModi_chkF">&nbsp;비밀번호가 틀립니다.</span>
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