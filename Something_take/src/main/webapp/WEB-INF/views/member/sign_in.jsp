<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<script type="text/javascript">

	$(function login_chk(){
		
		$(".btn-primary").click(function (){

			var regMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/) // 이메일

			// 이메일
			if($("#email").val() == ""){
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}

			// 이메일 유효성 검사
			if( !(regMail.test( $("#email").val() )) ){
				alert("이메일 형식에 맞게 입력하세요.");
				$("#email").focus();
				return false;
			}
			
			// 비밀번호
			if($("#pwd").val() == ""){
				alert("비밀번호를 입력하세요.");
				$("#pwd").focus();
				return false;
			}

		}); // click()
	}); // modify_chk()
	
</script>
<body data-spy="scroll" data-target=".navbar-collapse">

	<br><br><br><br>

	<div class="container">
		<div class="row">
			<div class="col-md-4 mr-md-auto ml-md-auto">
				<div class="head_title_1 text-center">
					<h2>Sign-in</h2>
					<div class="separator_auto"></div>
						<p>반갑습니다. 로그인하고 시작해보세요.</p>
				</div>

				<div class="head_title_1 text-left">
	
				<br>
				
<!-------------------------------------------- [form태그 시작] -------------------------------------------------------->

			     <form class="sign_upClass" action="member/signIn.post" method="post" id="login" onsubmit="login_chk()">

				      
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
							callbackUrl: "http://192.168.6.222:8080/0Mangro_TeamProject-0.01/O_member/naverLoginCallBack.jsp",
							isPopup: false, /* 팝업을 통한 연동처리 여부 */
							loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
						}
					);
					
					naverLogin.init();
					
				  </script>
<!-------------------------------------------- 네이버 아이디로 로그인 초기화 Script  -------------------------------------------->

    
<!-------------------------------------------- [이름, 이메일, 비밀번호 입력창] -------------------------------------------->

				      <div class="js-form-message form-group">
					        <label class="form-label" for="email">이메일</label>
					        <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요." 
					               required
					               data-msg="이메일을 입력해주세요."
					               data-error-class="form-error"
					               data-success-class="form-success">
				        
				      </div>
				      <div class="js-form-message form-group">
					        <label class="form-label" for="pwd">
					          <span class="d-flex justify-content-between align-items-center">비밀번호</span>
					        </label>
					        
					          <span class="font-subhead text-muted mb-2 go_find_pwd">
					          	<a href="findPw.me"> (비밀번호를 잊으셨나요?)</a>
					          </span>
					        
					        <input type="password" class="form-control" name="pwd" id="pwd" placeholder="****************"
					               aria-label="********" required
					               data-msg="올바른 비밀번호를 입력해주세요."
					               data-error-class="form-error"
					               data-success-class="form-success">
				      </div>
					
					
				    	  <div class="row align-items-center mb-4">
					          <div class="custom-control custom-checkbox d-flex align-items-mb-5 text-muted">
					            <input type="checkbox" class="" id="rememberCheck" name="rememberCheck">
					            <label class="font-subhead custom-control-label" for="termsCheckbox" id="">
					            &nbsp;이메일 기억하기</label>
					          </div>
					      </div>
					
					
					      <div class="row align-items-center mb-5">
					        <div class="col-7">
					          <span class="font-subhead text-muted mb-2">계정이 없으시다면</span>
					          	<a href="Sign-up.me">회원가입</a>
					        </div>
							
							<div class="row align-items-center" style="float:right;">
						        <div class="col-12 text-right">
						          <button type="submit" class="btn btn-primary">로그인</button>
						        </div>
							</div>

						 </div>
					      
			      </form>
<!-------------------------------------------- [form태그 끝] -------------------------------------------------------->
				  </div>
			</div>
		</div> <!-- class="row" -->
	</div> <!-- class="container" -->

	<br>

</body>
</html>