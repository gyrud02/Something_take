<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<script type="text/javascript">

	/* 회원가입 유효성 체크 */
	$(function si_up_chk() {
		var regMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/) // 이메일
		var regPwd = RegExp(/^[a-zA-Z0-9]{8,20}$/); // 비밀번호
		var regName = RegExp(/^[가-힣A-Za-z]{2,20}$/); // 이름

		$(".btn-primary").click(function() {
			if($("#email").val() == "" || !(regMail.test( $("#email").val() )) ){
				return false; } // 이메일
			if($("#quote").val() == ""){
				return false; } // 인증번호
			if($("#pwd").val() == "" || !(regPwd.test( $("#pwd").val() )) ){ 
				return false; } // 비밀번호
			if($("#name").val() == "" || !(regName.test( $("#name").val() )) ){
				return false; } // 이름
			if($("#phone").val() == ""){ 
				return false; } // 전화번호
			if(!($("#yackuan-check").is(":checked")) ){ 
				return false; } // 이용약관 체크박스

			$("#quote").attr("disabled", false)
			
		}); // click()	
	}); // si_up_chk()

	/* span 태그 제거 */
	$(function removeTags(){
		$(".spanT").hide(); $(".spanF").hide(); $(".spanEmpty").hide();
		$(".spanPwdT").hide(); $(".spanPwdF").hide(); $(".spanPwd_ckT").hide(); $(".spanPwd_ckF").hide();
		$(".quoteF").hide(); $(".quoteT").hide(); $(".quote").hide();
	}); // removeTags()
	
	/* 이메일 중복 체크 */
	function emailCheck(event){
		var regMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/) // 이메일
		$.ajax({
			type: "GET",
			dataType: "text",
			data: { email:$("#email").val() },
			url: "member/emailDupl",
			success:function(check, textStatus){
					if( !(regMail.test( $("#email").val() )) ){
						$(".spanT").hide();
						$(".spanF").hide();
						$(".spanEmpty").val("이메일 형식에 맞게 입력하세요.").css("style", "display:none;");
						$(".spanEmpty").css("color", "#ff4084");
						$(".spanEmpty").show();

						if(email.value.length == 0){
							$(".spanT").hide(); $(".spanF").hide(); $(".spanEmpty").hide();
							return false;
						} // if
						return false;
					}else{
						if(check == 0){
							$(".spanEmpty").hide();
							$(".spanF").hide();
							$(".spanT").val("사용 가능한 이메일입니다.").css("style", "display:none;");
							$(".spanT").css("color", "#ff4084");
							$(".spanT").show();

							$("#sendBtn").click(function(){ sendMail(); }); // click

							if(email.value.length == 0){
								$(".spanT").hide(); $(".spanF").hide(); $(".spanEmpty").hide();
								return false;
							} // if
						}else{
							$(".spanEmpty").hide();
							$(".spanT").hide();
							$(".spanF").val("이미 사용 중인 이메일입니다.").css("style", "display:none;");
							$(".spanF").css("color", "#ff4084");
							$(".spanF").show();
							
							if(email.value.length == 0){
								$(".spanT").hide(); $(".spanF").hide(); $(".spanEmpty").hide();
								return false;
							} // if
							return false;
						} // if
					} // if
			}, // success
			error:function(textStatus){
					alert("회원 가입 중 오류가 발생하였습니다.");
			} // error
		}); // ajax
	} // emailCheck()
	
	/* 비밀번호 체크 */
	function pwdCheck(event){
		var regPwd = RegExp(/^[a-zA-Z0-9]{8,20}$/);
		$.ajax({
			type: "GET",
			dataType: "text",
			data: { pwd:$("#pwd").val() },
			success:function(check, textStatus){
					if( !(regPwd.test( $("#pwd").val() ))){
						$(".spanPwdT").hide();
						$(".spanPwdF").val("8~20자 영문 대소문자, 숫자를 입력해 주세요.").css("style", "display:none;");
						$(".spanPwdF").css("color", "#ff4084");
						$(".spanPwdF").show();
	
						if(pwd.value.length == 0){
							$(".spanPwdT").hide();
							$(".spanPwdF").hide();
							return false;}
						return false;
					}else{
						if(check == 0){
							$(".spanPwdT").hide();
							$(".spanPwdF").val("8~20자 영문 대소문자, 숫자를 입력해 주세요.").css("style", "display:none;");
							$(".spanPwdF").css("color", "#ff4084");
							$(".spanPwdF").show();
							return false;
						}else{
							$(".spanPwdF").hide();
							$(".spanPwdT").val("사용 가능합니다.").css("style", "display:none;");
							$(".spanPwdT").css("color", "#ff4084");
							$(".spanPwdT").show();
						}
					}
			}, // success
			error:function(textStatus){
					alert("회원 가입 중 오류가 발생하였습니다.");
			} // error
		}); // ajax
	} // pwdCheck()
	
	/* 비밀번호 동일 체크 */
	function pwdchk(event){
		$.ajax({
			type: "GET",
			dataType: "text",
			data: { pwd:$("#pwd").val(),
					pwd_chk:$("#pwd_chk").val() },
			success:function(check, textStatus){
					if(pwd.value == pwd_chk.value){
						$(".spanPwd_ckF").hide();
						$(".spanPwd_ckT").val("비밀번호가 일치합니다.").css("style", "display:none;");
						$(".spanPwd_ckT").css("color", "#ff4084");
						$(".spanPwd_ckT").show();

						if(pwd.value.length == 0 || pwd_chk.value.length == 0){
							$(".spanPwd_ckF").hide(); $(".spanPwd_ckT").hide(); return false;}
					}else{
						$(".spanPwd_ckT").hide();
						$(".spanPwd_ckF").val("비밀번호가 틀립니다.").css("style", "display:none;");
						$(".spanPwd_ckF").css("color", "#ff4084");
						$(".spanPwd_ckF").show();

						if(pwd.value.length == 0 || pwd_chk.value.length == 0){
							$(".spanPwd_ckF").hide(); $(".spanPwd_ckT").hide(); return false;}
						return false;
					}
			}, // success
			error:function(textStatus){
					alert("회원 가입 중 오류가 발생하였습니다.");
			} // error
		}); // ajax
	} // pwd_chk()
	
	/* 인증 메일 발송 시 입력창 생성  */
	function sendMail(){	
		if($("#email").val == ""){
			$(".quote").hide();
			return false;
		}else{
			$("#email").attr("disabled", true);
			alert("메일을 발송했습니다.\n잠시만 기다리시면 인증번호 입력창이 열립니다.");
			$.ajax({
					type:"GET",
					dataType:"text",
					data:{ email: $("#email").val() },
					url: "member/sendMail",
					success:function(textStatus){
						$(".quote").show();			
					}, // success
					error:function(textStatus){
						alert("메일 발송 중 오류가 발생했습니다.");
					} // error
			}); // ajax
		} // if	
	} // sendMail()
	
	/* 인증번호 일치 확인 */
	function quoteCheck(){
		$("#quoteBtn").on('click', function(){
			$.ajax({
					type:"GET",
					dataType:"text",
					data:{ quote: $("#quote").val() },
					url:"member/authCheck",
					success:function(result, textStatus){
						if(result == 1){
							alert("인증되었습니다.");
							$("#quote").attr("disabled", true);
						}else{
							alert("인증번호가 틀립니다.");
						} // if
					}, //success
					error:function(textStatus){
						alert("오류가 발생하였습니다.");
					} // error
			}); // ajax
		}); // on()
	} // quoteCheck()
	
	/* 약관동의 체크박스 새 창 */
	function yackuan(){
		if( $("#yackuan-check").is(":checked") ){
			window.open('agree.me', '회원가입 약관','width=700, height=700');
		} // if	
	} // yackuan()
	
</script>
<body>

	<br><br><br><br>

	<section id="Sign_up">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mr-md-auto ml-md-auto">
					<div class="head_title_1 text-center">
						<h2>Sign-up</h2>
							<div class="separator_auto"></div>
							<p>아래 입력란을 모두 입력해주세요.</p>
					</div>
					
					<br>
					
					<div class="head_title_1 text-left">
						
<!-------------------------------------------- [form태그 시작] -------------------------------------------------------->
					
					<form action="member/signUp.post" class="sign_upClass" method="post" id="join" onsubmit="return si_up_chk()">

<!-------------------------------------------- [이름, 이메일, 비밀번호 입력창] -------------------------------------------->
					      <!-- 이메일 -->
					      <div class="js-form-message form-group">
					        <label class="form-label" for="email">이메일 </label>
					        <input type="email" class="form-control" name="email" id="email" 
					        		placeholder="가입 시 사용할 이메일을 입력하세요." onkeyup="emailCheck(event)" required>
					        		
					        <div class="row align-items-center" style="float:right;">
					        	<div class="col-12 text-right">	
					       			<input type="button" class="btn btn-primary" value="전송" id="sendBtn">
						    	</div>
						    </div>
					      
					      </div>
					      <div class="js-form-message form-group">
					      		<span class="spanEmpty">&nbsp;이메일 형식에 맞게 입력하세요.</span>
					      </div>
					      <div class="js-form-message form-group">
					      		<span class="spanT">&nbsp;사용 가능한 이메일입니다.</span>
					      </div>
					      <div class="js-form-message form-group">
					      		<span class="spanF">&nbsp;이미 사용 중인 이메일입니다.</span>
					      </div>
					      		
					      					      
					      <!-- 인증번호 확인 -->
					      <div class="form-group quote">
					        <label class="form-label" for="quote">인증번호</label>
					      	<input type="text" class="form-control" name="quote" id="quote" required>
					      		
				      		<div class="row align-items-center" style="float:right;">
				        		<div class="col-12 text-right">
					      			<input type="button" class="btn btn-primary" id="quoteBtn" value="인증" onclick="quoteCheck()">  
					      		</div>
					      	</div>
					      	
					      </div>
					      
					      <div class="js-form-message form-group">
					      		<span class="quoteF">&nbsp;인증번호가 틀립니다.</span>
					      </div>
				      		<div class="js-form-message form-group">
					      		<span class="quoteT">&nbsp;인증되었습니다.</span>
					      </div>
					      		
					      <br>
					      
					      <!-- 비밀번호 입력 & 비밀번호 확인 -->
					      <div class="form-group">
					        <label class="form-label" for="pwd">비밀번호</label>
					      	<input type="password" class="form-control" name="pwd" id="pwd" onkeyup="pwdCheck(event)"
					      		   placeholder="****************" required>
					      </div>

					      <div class="js-form-message form-group">
					      		<span class="spanPwdT">&nbsp;사용 가능한 비밀번호입니다.</span>
					      </div>
					      <div class="js-form-message form-group">
					      		<span class="spanPwdF">&nbsp;8~20자 영문 대소문자, 숫자를 입력해 주세요.</span>
					      </div>
					      
					      <div class="form-group">
					        <label class="form-label" for="pwd_chk">비밀번호 확인</label>
					        <input type="password" class="form-control" name="pwd_chk" id="pwd_chk" onkeyup="pwdchk(event)"
					        	   placeholder="****************" required>
					      </div>
					      
					      <div class="js-form-message form-group">
					      		<span class="spanPwd_ckT">&nbsp;비밀번호가 일치합니다.</span>
					      </div>
					      <div class="js-form-message form-group">
					      		<span class="spanPwd_ckF">&nbsp;비밀번호가 틀립니다.</span>
					      </div>
					      
					      
					      <!-- 이름 -->
					      <div class="form-group">
					        <label class="form-label" for="name">이름</label>
					        <input type="text" class="form-control" name="name" id="name" 
					        		placeholder="이름을 입력하세요." required>
					      </div>
					      
					      
					      <!-- 전화번호 -->
					      <div class="form-group">
					        <label class="form-label" for="phone">전화번호</label>
					        <input type="text" class="form-control" name="phone" id="phone" 
					        		placeholder=" '-'없이 입력하세요." required>
					      </div>
					               
					        
					        <div class="js-form-message form-group text-center">
					            <input type="checkbox" class="custom-checkbox" id="yackuan-check" name="termsCheckbox" onclick="yackuan(event)">
					            <label class="font-subhead custom-control-label" for="termsCheckbox">
					              <p>
					                <a class="yackuan" href="javascript:void(window.open('agree.me', '회원가입 약관','width=700, height=700'))">&nbsp;이용약관</a> 및
					                <a class="gaein" href="javascript:void(window.open('agree.me', '회원가입 약관','width=700, height=700'))">개인정보취급방침</a>에 동의합니다.
								  </p>
					            </label>
					        </div>
<!-------------------------------------------- [이름, 이메일, 비밀번호 입력창] -------------------------------------------->

							<div class="js-form-message form-group">
						        <p class="text-center">* 본 약관에는 광고성 정보 수신 동의가 <br>포함되어있습니다.</p>
							</div>
					
					      <div class="row align-items-center mb-5">
					        <div class="col-7">
					          <span class="font-subhead text-muted mb-2">이미 계정이 있다면
					          	<a href="sign-in.me">로그인</a>
					          </span>	
					        </div>
					        
							<div class="row align-items-center" style="float:right;">
						        <div class="col-12 text-right">
						          <input type="submit" class="btn btn-primary" value="가입하기">
						        </div>										   
							</div>
					
					      </div>
					      
				      </form>
<!-------------------------------------------- [form태그 끝] -------------------------------------------------------->
					 </div>
				</div> <!--col -->
			</div> <!-- row -->
		</div> <!-- container -->
	</section>
</body>
</html>