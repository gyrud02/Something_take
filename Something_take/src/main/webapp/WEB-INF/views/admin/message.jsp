<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
</head>
<style>

	#form_msg{padding-left: 20px;}
	#msg_no{text-align: center;}
	.actions_O>li{color:red;}

</style>

<body>

	<br><br><br>
	
	<section>
		<div class="content">
			<form method="post" action="answer.post" id="form_msg">
				<div class="fields">
				
					<div class="field half">
						<label for="name">상담번호 : </label>
						<input type="text" name="msg_no" id="msg_no" value="${vo.msg_no}" 
						readonly="readonly" size="2"/>
					</div>
					
					<div class="field half">
						<label for="name">고객명 : </label>
						<input type="text" name="msg_name" id="msg_name" value="${vo.msg_name}" 
						readonly="readonly" size="18"/>
					</div>
					
					<div class="field half">
						<label for="email">연락처 : </label>
						<input type="text" name="msg_phone" id="msg_phone" value="${vo.msg_phone}" 
						readonly="readonly" size="18"/>
					</div>
					
					<div class="field half">
						<label for="email">수신일 : </label>
						<input type="text" name="msg_send_date" id="msg_send_date" value="${vo.msg_send_date}" 
						readonly="readonly" size="18"/>
					</div>
					
					<br>
					
					<div class="field">
						<label for="message">문의 내용</label><br>
						<textarea name="msg_textarea" id="msg_textarea" rows="6" cols="53"
						readonly="readonly">${vo.msg_textarea}</textarea>
					</div>
					
					<br>
					
				</div>
				
				<c:choose>
					<c:when test="${vo.msg_answer == 'X'}">
						<ul class="actions_X">
							<li><input type="submit" name="submit" id="submit" value="답변 완료" /></li>
						</ul>
					</c:when>				
				
					<c:otherwise>
						<ul class="actions_O">
							<li>답변이 이미 완료된 내용입니다.</li>
						</ul>
					</c:otherwise>
				
				</c:choose>
			</form>

		</div>
	</section>
	
	<br>

</body>
</html>