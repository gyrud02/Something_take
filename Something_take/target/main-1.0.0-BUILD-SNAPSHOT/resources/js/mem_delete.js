 
 // [ 회원 탈퇴 페이지(mem_delete.jsp)에 호출하는 자바스크립트 모음 ]
 	
 	// 회원 탈퇴 필수 입력란 확인 
 	$(function del_chk(){
 	
 		$("#del_chk_btn").click(function (){
 		
 			// 비밀번호
 			if($("#pwd").val() == ""){
				alert("비밀번호를 입력하세요.");
				$("#pwd").focus();
				return false;
			}
			
			// 약관 동의
			if(!($("#del_ck").is(":checked")) ){
				alert("동의해주셔야 탈퇴가 가능합니다. ");
				$("#del_ck").focus();
				return false;
			}
		
	// 회원 탈퇴 페이지 확인 버튼 클릭 시 탈퇴 확인(예/아니오) 안내창 

			var del_chk = confirm("회원 탈퇴를 하시겠습니까?");
			
			if(del_chk == true){ // 예를 누를 경우
				$("#mem_del").submit();
				
			}else if(del_chk != true){ // 취소를 누를 경우
				history.back(-1); // 이전 페이지로 가기
				alert("회원 탈퇴가 취소되었습니다.");
			}
			
 		}); // click()
 	
 	}); 
 	