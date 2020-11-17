<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<script type="text/javascript">

	$(function si_up_chk() {
	
		var regMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/) // 이메일
//		var regPwd = RegExp(/^[a-zA-Z0-9]{8,20}$/); // 비밀번호
		var regName = RegExp(/^[가-힣A-Za-z]{2,20}$/); // 이름
		
		$(".btn-primary").click(function() {
				
			// 이름
			if($("#name").val() == ""){
				alert("이름을 입력하세요.");
				$("#name").focus();
				return false;
			}
			
			// 이름 유효성 검사
		    if ( !(regName.test( $("#name").val() )) ){
				alert("이름을 올바르게 입력하세요.");
		    	$("#name").focus();
		    	$("#name").val("");
		    	return false;
		    }
			
			// 이메일
			if($("#email").val() == ""){
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}
			
			// 비밀번호
			if($("#pwd").val() == ""){
				alert("비밀번호를 입력하세요.");
				$("#pwd").focus();
				return false;
			}
/*		
			// 비밀번호 유효성 체크
			if( !(regPwd.test( $("#pwd").val() )) ){
				alert("8~20자 영문 대소문자, 숫자를 입력해 주세요.");
				$("#pwd").focus();
				return false;
			}
*/			
			// 이용약관 체크박스
			if(!($("#yackuan-check").is(":checked")) ){
				alert("이용 약관에 동의해주세요.")
				$("#yackuan-check").focus();
				return false;
			}
/*			
			// 인증 버튼 클릭여부 확인
			if(flag != true) {
		        alert("이메일 인증을 해주세요.");
				return false;
			}
			
			// 정확한 인증번호 입력여부 확인
			if( $("#fromIframe").val() != "success" ){
				alert("인증번호를 정확히 입력 후 인증버튼을 눌러주세요.");
				console.log($("#fromIframe").val());
				return false;
			}
*/	
		}); // click()	
	}); // si_up_chk()

</script>
<body data-spy="scroll" data-target=".navbar-collapse">

	<br><br><br><br>

	<section id="Sign_up">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mr-md-auto ml-md-auto">
					<div class="head_title_1 text-center">
						<h2>Sign-up</h2>
							<div class="separator_auto"></div>
							<p>아래 입력란에 데이터를 모두 입력해주세요.</p>
					</div>
					
					<br>
					
					<div class="head_title_1 text-left">
						
      <!-------------------------------------------- [form태그 시작] -------------------------------------------------------->
					
					<form action="member/signUp.post" class="sign_upClass" method="post" id="join" onsubmit="si_up_chk()">

	  
	  <!-------------------------------------------- 네이버 아이디로 로그인 버튼 노출 영역  --------------------------------------------------------> 
					<div class="text-center">
						<div id="naverIdLogin"></div>
					</div><br>
	  <!-------------------------------------------- 네이버 아이디로 로그인 버튼 노출 영역  -------------------------------------------------------->
					
  
	  <!-------------------------------------------- 네이버 아이디로 로그인 초기화 Script  -------------------------------------------->
	  <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	  
	  <script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "rU2ooEzY2CNR72wYidQf",
				callbackUrl: "http://localhost:8080/0Mangro_TeamProject-0.01/O_member/naverJoinCallBack.jsp",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정 정보를 초기화하고 연동을 준비 */
		naverLogin.init();
	  </script>
	  <!-------------------------------------------- 네이버 아이디로 로그인 초기화 Script  -------------------------------------------->
      			
      
      <!-------------------------------------------- [이름, 이메일, 비밀번호 입력창] -------------------------------------------->
					      <!-- 이름 -->
					      <div class="form-group">
					        <label class="form-label" for="name">이름</label>
					        <input type="text" class="form-control" name="name" id="name" 
					        		placeholder="이름을 입력하세요." aria-label="Email address" required>
					      </div>
					      
					      <!-- 이메일 -->
					      <div class="js-form-message form-group">
					        <label class="form-label" for="email">이메일 </label>
					        <input type="email" class="form-control" name="email" id="email" 
					        		placeholder="가입 시 사용할 이메일을 입력하세요." onkeyup="duplCheck(event)" required>
					        
					        <br>	
					        	
					        	 <div class="row align-items-center mb-5" style="float:right;">
						        	<div class="col-5 text-right">
						        		<button type="button" class="btn btn-primary" 
						        		onclick="emailCheck()">전송</button>
						        	</div>
								</div>
					      </div>
					               
					      <br><br>       
					               
					      <!-- 비밀번호 입력 & 비밀번호 확인 -->
					      <div class="js-form-message form-group">
					        <label class="form-label" for="pwd">비밀번호
					      	<input type="password" class="form-control" name="pwd" id="pwd" 
					      	placeholder="****************" size="18" required></label>
					      </div> 
					      
					               
					      <div class="js-form-message form-group">
					        <label class="form-label" for="pwd_chk">
					          <span class="d-flex justify-content-between align-items-center">비밀번호 확인</span>
					        </label>
					        <input type="password" class="form-control" name="pwd_chk" id="pwd_chk" 
					        	   placeholder="****************" required>
					      </div>
					        
					      <div class="row align-items-center">
					        <div class="text-center">
					          <div class="custom-control custom-checkbox d-flex align-items-mb-5 text-muted">
					            <input type="checkbox" class="" id="yackuan-check" name="termsCheckbox" onclick="checkBox(event)">
					            <label class="font-subhead custom-control-label" for="termsCheckbox">
					            
					              <p>
					                <a class="yackuan" href="javascript:void(window.open('Agree.me', '회원가입 약관','width=700, height=700'))">&nbsp;이용약관</a> 및
					                <a class="gaein" href="javascript:void(window.open('Agree.me', '회원가입 약관','width=700, height=700'))">개인정보취급방침</a>에 동의합니다.
								  </p>
																  				              
					            </label>
					          </div>
					        </div>

							<div class="row align-items-center" style="float:right;">
						        <p class="text-center">&nbsp;&nbsp;본 약관에는 광고성 정보 수신 동의가 포함되어있습니다.</p> <br>
							</div>

					      </div>
					
					      <div class="row align-items-center mb-5">
					        
					        <div class="col-7">
					          <span class="font-subhead text-muted mb-2">이미 계정이 있다면
					          	<a href="Sign-in.me">로그인</a>
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