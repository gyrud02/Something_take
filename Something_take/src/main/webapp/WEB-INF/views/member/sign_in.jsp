<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>

<!----------- [jquery Cookie 관련 링크 ] ----------->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript">

	/* 쿠키 (아이디 가져오기) */
	$(document).ready(function(){
		var emailCK = $.cookie("emailck");
		if(emailCK != null){
			$("#email").val(emailCK);
			$("#rememberCk").prop("checked", true);
		}else{
			$("#rememberCk").prop("checked", false);
		}
	}); // ready()

	/* 유효성 체크 */
	$(function login_chk(){
		$(".btn-primary").click(function (){
			var regMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/) // 이메일
	
			// 이메일
			if($("#email").val() == ""){
				alert("이메일을 입력하세요."); $("#email").focus(); return false; }
	
			// 이메일 유효성 검사
			if( !(regMail.test( $("#email").val() )) ){
				alert("이메일 형식에 맞게 입력하세요."); $("#email").focus(); return false; }
			
			// 비밀번호
			if($("#pwd").val() == ""){
				alert("비밀번호를 입력하세요."); $("#pwd").focus(); return false; }
	
			/* 쿠키 (아이디 설정)  */
			if($("#rememberCk").is(":checked") == true){
				var email = $("#email").val();
				$.cookie('emailck', email, {expires: 7, path: 'http://localhost:8081/main/sign-in'}); // 7일 동안 기억하기
			}else{ $.removeCookie("emailck"); }
					
		}); // click()
	}); // login_chk()

</script>
<body class="lightbg">

	<br><br><br><br><br>

	<div class="container">
		<div class="row">
			<div class="col-md-4 mr-md-auto ml-md-auto">
				<div class="head_title_1 text-center">
					<h2>Sign-in</h2>
					<div class="separator_auto"></div>
						<p>반갑습니다. 로그인하고 시작해보세요.</p>
				</div>

				<div class="head_title_1 text-left"></div>
	
				<br><br>
				
			</div>
		</div>
	</div>
				
<!-------------------------------------------- [form태그 시작] -------------------------------------------------------->

	<!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h3> 처음 방문하셨나요? </h3>
                            
                            <br>
                            
                            <div class="col-md-12 form-group p_star text-center">
                           		<a href="sign-up" class="btn btn-secondary col-md-8" >회원가입</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <form class="row contact_form" action="member/signIn.post" method="post" id="login" onsubmit="login_chk()">
                                <div class="col-md-12 form-group p_star">
                                    <label class="form-label" for="email">이메일</label>
                                    <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요." 
						              		required data-msg="이메일을 입력해주세요."
						               		data-error-class="form-error" data-success-class="form-success">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                	<label class="form-label" for="pwd">
                                		<span class="d-flex justify-content-between align-items-center">비밀번호</span>
					        		</label>
					        		
					        		<span class="font-subhead text-muted mb-2 go_find_pwd">
							          	<a href="findPw"> (비밀번호를 잊으셨나요?)</a>
							        </span>
					        		
                                    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="****************"
							               aria-label="********" required data-msg="올바른 비밀번호를 입력해주세요."
							               data-error-class="form-error" data-success-class="form-success">
                                </div>
                                <div class="col-md-12 form-group">
                                	<div class="row align-items-center mb-4">
							          <div class="custom-control custom-checkbox d-flex align-items-mb-5 text-muted">
							            <input type="checkbox" id="rememberCk" name="rememberCk">
							            <label class="font-subhead custom-control-label" for="rememberCk">
							            &nbsp;이메일 기억하기</label>
							          </div>
							      	</div>
                                    <button type="submit" class="btn btn-primary">로그인</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
    
<!-------------------------------------------- [form태그 끝] -------------------------------------------------------->

</body>
</html>