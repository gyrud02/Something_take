<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<style>

	#BoardList>th, #bdList{text-align: center;}
	#idx, #cnt{width: 50px;}
	#writer{width: 230px;}

</style>

<body data-spy="scroll" data-target=".navbar-collapse">

	<br><br><br><br>

<!------------------------------------ [게시판 영역] ------------------------------------------->

	<section id="notice">
		<div class="container">
			<div class="row">
				<div class="col-md-10 mr-md-auto ml-md-auto">
					<div class="head_title_1 text-center">
						<h2>Foundation</h2>
							<div class="separator_auto"></div>
							<p>썸띵테이크 프랜차이즈 창업에 관련된 문의 내용을 남겨주시면 신속한 답변 도와드리겠습니다.</p>
					</div>
					
					<br><br>
					
					<!-- general form elements -->
					<div class="box">
						<div class="box-body">
							<table class="table table-bordered">
								<tr id="BoardList">
									<th id="idx">번호</th>
									<th>제목</th>
									<th id="writer">글쓴이</th>
									<th>작성일자</th>
									<th id="cnt">조회</th>
								</tr>
								
								<c:forEach items="${boardList}" var="boardList">
								<tr>
									<td id="bdList">${boardList.bno}</td>
									<td><a href="Content.bd?bno=${boardList.bno}">${boardList.title}</a></td>
									<td>${boardList.writer}</td>
									<td id="bdList">${boardList.reg_date}</td>
									<td id="bdList">${boardList.viewcount}</td>
								</tr>
								</c:forEach>
				
							</table>
				
						</div>
						
						<!-- 로그인 유무에 따른 버튼 숨김 -->
						<c:if test="${sessionScope.email != null}">
							<div class="row align-items-center mb-5" style="float:right;">
								<div class="col-5 text-right">
									<button type="button" class="btn btn-primary" onclick="location.href='Write.bd'">글쓰기</button>
								</div>
	 				       </div>
						</c:if>
						
					</div>
				</div>
			</div> <!-- .row -->
		</div> <!-- .container -->
	</section>

<!------------------------------------ [게시판 영역] ------------------------------------------->
	
	<br><br>

</body>
</html>