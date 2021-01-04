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
<body class="lightbg">

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
						<!-- 로그인 유무에 따른 버튼 숨김 -->
					
<%---------------------------------- 페이징 처리 ----------------------------------%>				

					<div class="col-12 text-center">
						<c:set value="${requestScope.count}" var="total"/>
<%
	int total = Integer.parseInt(pageContext.getAttribute("total").toString());
	final int pageSize = 9; // 페이지 블록 크기
	final int startPage = 1; // 시작 페이지
	int currentPage = Integer.parseInt(request.getParameter("page")); // 현재 페이지
	int prevPage = currentPage - 1; // 이전 페이지
	double pageBlock = (double)total / (double)pageSize; // 블록 갯수
	int totalBlock = Integer.parseInt(String.valueOf(Math.round(Math.ceil(pageBlock)))); // 총 블록 수
	int nextPage = currentPage + 5; // 다음 페이지
	int endPage = totalBlock; // 페이지 끝
	int frontPage = currentPage - 5;
	int backPage = currentPage + 5;
	if(prevPage <= 0){ prevPage = 1; } // if
%>
					<c:if test="<%=currentPage != startPage%>">
						<a class="btn btn-default" href="Board?page=<%=startPage%>">[처음]</a>
						<a class="btn btn-default" href="Board?page=<%=prevPage%>">[이전]</a>
					</c:if>
<%
	for(int i=frontPage; i<currentPage; i++){
		if(i <= 0) i = 1;
%>
					<c:if test="<%=currentPage != 1%>">
						<a class="btn btn-default" href="Board?page=<%=i%>"><%=i%></a>
					</c:if>	
<%			
	} // while
	
	for(int i=currentPage; i<backPage; i++){
%>
						<a class="btn btn-default" href="Board?page=<%=i%>"><%=i%></a>
<%		
		if(i == endPage) break;
	} // for

	if(nextPage > totalBlock){ nextPage = endPage; } // if
%>		
					<c:if test="<%=currentPage != endPage || currentPage != totalBlock%>">
						<a class="btn btn-default" href="Board?page=<%=nextPage%>">[다음]</a>
						<a class="btn btn-default" href="Board?page=<%=endPage%>">[끝]</a>
					</c:if>
				
					</div>

<%---------------------------------- 페이징 처리 ----------------------------------%>				
					
					</div>
				</div>
			</div> <!-- .row -->
		</div> <!-- .container -->
	</section>

<!------------------------------------ [게시판 영역] ------------------------------------------->
	
	<br><br>

</body>
</html>