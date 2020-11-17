<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">

	<br><br><br><br>

<%-- ---------------------------------- [게시판 영역] ---------------------------------------- --%>

	<c:choose>
		<c:when test="${sessionScope.email == null}">
			<script type="text/javascript">
				alert("로그인 시 사용 가능한 페이지입니다.");
				location.href="Sign-in.me";
			</script>
		</c:when>
		
		<c:when test="${sessionScope.email != readList.writer}">
			<script type="text/javascript">
				alert("다른 회원이 작성한 글은 수정할 수 없습니다.");
				location.href="Board.bd";
			</script>
		</c:when>
	
		<c:otherwise>
	
	<section>
 	  <div class="container">
		<div class="row">
			<div class="col-md-6 mr-md-auto ml-md-auto">
				<div class="head_title_1 text-center">
					<h2>Foundation</h2>
						<div class="separator_auto"></div>
				</div>
					
					<form action="board/modify.post" name="modify" method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">글번호</label> 
								<input type="text" name="bno" class="form-control" value="${readList.bno}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">글제목</label> 
								<input type="text" name='title' class="form-control" value="${readList.title}">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">글내용</label>
								<textarea class="form-control" name="content" rows="5">${readList.content}</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">작성자</label> 
								<input type="text" name="writer" class="form-control" value="${readList.writer}" readonly="readonly">
							</div>
						</div>

						<div class="box-footer">
							<input type="submit" class="btn btn-primary" value="수정">
							<button type="button" class="btn btn-primary" onclick="location.href='Board.bd'">목록</button>
						</div>
							
					</form>
					
					<br>
	
				</div>
			</div>
		</div>
	</section>
		
		</c:otherwise>
	</c:choose>
<%-- ---------------------------------- [게시판 영역] ---------------------------------------- --%>

</body>
</html>