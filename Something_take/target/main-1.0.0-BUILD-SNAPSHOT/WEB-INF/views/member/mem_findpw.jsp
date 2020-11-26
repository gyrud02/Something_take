<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<script type="text/javascript">

 $(function pw_chk(){

	var regMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/) // 이메일
	 
	$(".btn-primary").click(function(){

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
		
	}); // click()
 }); // pw_chk()

</script>
<body data-spy="scroll" data-target=".navbar-collapse">

	<br><br><br><br><br>
	
		<div class="container">
			<div class="row">
				<div class="col-md-4 mr-md-auto ml-md-auto">
					<div class="section_title_container text-center">
						<div class="head_title_1 text-center">
						<h2>Find-password</h2>
							<div class="separator_auto"></div>
							<p><b>비밀번호를 잊어버리셨나요?</b><br><br>
							가입 시 입력하신 이메일 주소로 <br>
							비밀번호 재설정 메일이 발송됩니다. <br>
					                메일을 입력 후 전송 버튼을 클릭하시고 <br>
					                가입 시 입력했던 메일을 확인해주세요. <br><br><br>
					        <b>[ <a href="Sign-up.me">회원가입</a> 페이지로 이동하기 ]</b></p>
						</div>	

					      <form class="sign_upClass" action="" method="post" onsubmit="pw_chk()">
							
					      <div class="js-form-message form-group text-left">
					        <label class="form-label" for="email">이메일</label>
					        <input type="email" class="form-control" name="email" id="email" placeholder="이메일" 
					               required
					               data-msg="이메일을 입력해주세요."
					               data-error-class="form-error"
					               data-success-class="form-success">
					      </div>
					
					      <div class="row align-items-center mb-5">
					        <div class="col-7 text-left">
					          <span class="font-subhead text-muted mb-2">기억나셨나요?</span>
					          	<a href="Sign-in.me">로그인</a>
					        </div> 
					        <div class="col-5 text-right">
					          <button type="submit" class="btn btn-primary">전송</button>
					        </div>
					
					      </div>
					      </form>
					    </div>

				</div> <!-- class="col" -->
			</div> <!-- class="row" -->
		</div> <!-- class="container" -->
	
</body>
</html>