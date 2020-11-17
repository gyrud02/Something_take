<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<style>

	#ManageList>th, #memList{text-align: center;}
	#idx{width: 50px;}

</style>

<!------------------------------------ [회원 목록 영역] ------------------------------------------->
<body>

	<br><br><br><br>

	<c:choose>
	
		<c:when test="${sessionScope.email == 'admin@Something-take.com'}">
		
		<!-- Table -->
		<section>
			<div class="container">
				<div class="row">
					<div class="col-md-12 mr-md-auto ml-md-auto">
						<div class="head_title_1 text-center">
							<h2>매출 관리</h2>
								<div class="separator_auto"></div>
						</div>
						
						<br><br>
						
						<div class="box">
							<div class="box-body">
								<table class="table table-bordered">
									<tr id="ManageList">
										<th id="idx">상담번호</th>
										<th>고객명</th>
										<th>고객 연락처</th>
										<th>문의 내용</th>
										<th>답변 상태</th>
										<th>수신일자</th>
									</tr>
								<%-- 	
									<c:forEach items="${msgList}" var="msgList">
										<tr>
											<td id="memList" name="msg_no">${msgList.msg_no}</td>
											<td id="memList" name="msg_name">${msgList.msg_name}</td>
											<td id="memList" name="msg_phone">${msgList.msg_phone}</td>
											<td id="memList" name="msg_textarea"><a href="javascript:void(0);"
											onclick="window.open('msg/message?msg_no='+${msgList.msg_no}, '_blank', 'width=500,height=420')">${msgList.msg_textarea}</a></td>
											<td id="memList" name="msg_answer">${msgList.msg_answer}</td>
											<td id="memList" name="msg_send_date">${msgList.msg_send_date}</td>
										</tr>
									</c:forEach>
								 --%>
								</table>
					
							</div>
						</div>
					</div>	
				</div>
			</div>
		</section>
		
		</c:when>
	
		<c:otherwise>
			<script>
				alert("관리자 전용 페이지입니다.");
				location.href="./index.do";
			</script>
		</c:otherwise>
	
	</c:choose>	
<!------------------------------------ [회원 목록 영역] ------------------------------------------->	
	
	<br><br>
	
</body>
</html>