<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<script type="text/javascript">

	$(function del_chk(){

		$(".btn-primary").click(function(){

			if($("#pwd").val() == ""){
				alert("비밀번호를 입력하세요.");
				$("#pwd").focus();
				return false;
			}

			if(!($("#del_ck").is(":checked"))){
				alert("탈퇴 동의를 확인해주세요.");
				$("#del_ck").focus();
				return false;
			}
			
			var del = confirm("회원 탈퇴를 진행하시겠습니까?");

			if(del == true){
				$("#dropout").submit();
			}else{
				alert("탈퇴가 취소되었습니다.");
				return false;
			}
			return false;
		}); // click()

	}); // del_chk()

</script>

 <br><br><br><br><br>

 <c:choose>
 
	 <c:when test="${sessionScope.email == null}" >
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
						<h2>Drop-Out</h2>
						<div class="separator_auto"></div>
						<p>회원탈퇴 후에는 작성된 요청서 및 제안서에 영구적으로 접근이 불가능합니다.
				        <br>최근에 작성된 요청서 또는 제안서가 있을 경우 최대 7일간 상대방이 열람 가능하며,
				        <br>탈퇴신청 시점으로부터 최대 28일까지 탈퇴가 유예될 수 있습니다.
				        <br>탈퇴 이후에는 개인정보와 관련된 정보가 일괄 삭제됩니다.</p>
					</div>
					
					<div class="head_title_1 text-left">

					<br>

				      <form class="sign_upClass" action="member/dropOut.post" method="post" id="dropout" onsubmit="del_chk()">
					      
					      <div hidden="hidden">
					      	<input type="email" name="email" value="${sessionScope.email}" readonly="readonly">
					      </div>
					      
					      <br>
					      
					      <div class="js-form-message form-group">
					        <label class="form-label" for="pwd">비밀번호</label>
					        <input type="password" class="form-control" name="pwd" id="pwd" 
					        	   placeholder="비밀번호를 입력하세요" 
					               required
					               data-error-class="form-error"
					               data-success-class="form-success">
					        
					      </div>
					      
					      <br>
					
					        <div class="col-12 text-center" >
						      <input type="checkbox" id="del_ck">&nbsp;상기 내용을 모두 확인했으며 회원 탈퇴 진행에 동의합니다.
					          
					          <br><br>
					          
					          <input type="submit" class="btn btn-primary" value="탈퇴하기">
					        </div>
					
				      </form>
				      
				    </div>
				</div> <!-- class="col" -->
			</div> <!-- class="row" -->
		</div> <!-- class="container" -->
	</c:otherwise>

 </c:choose>	
	
 <br><br>
	
</body>
</html>