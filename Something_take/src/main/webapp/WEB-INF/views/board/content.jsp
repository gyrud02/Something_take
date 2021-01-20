<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<style>
	#reply_email {font-weight: bold;}
</style>
<body class="lightbg">

	<br><br><br><br>

<%------------------------------------ [게시판 영역] -------------------------------------------%>
	<c:choose>
		<c:when test="${sessionScope.email == null || sessionScope.email != readList.writer || sessionScope.email == 'admin@Something_take.com'}">
			<script type="text/javascript">
				alert("작성자만 볼 수 있습니다.");
				window.history.back();
			</script>
		</c:when>

		<c:otherwise>
			<section>
		 	  <div class="container">
				<div class="row">
					<div class="col-md-8 mr-md-auto ml-md-auto">
						<div class="head_title_1 text-center">
							<h2>Foundation</h2>
								<div class="separator_auto"></div>
						</div>
							
							<form>
								<div class="box-body">
									<div class="form-group">
										<label for="bno">글번호</label> 
										<input type="text" name="bno" class="form-control" value="${readList.bno}" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="title">글제목</label> 
										<input type="text" name='title' class="form-control" value="${readList.title}" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="content">글내용</label>
										<textarea class="form-control" name="content" rows="5" readonly="readonly">${readList.content}</textarea>
									</div>
									<div class="form-group">
										<label for="writer">작성자</label> 
										<input type="text" name="writer" class="form-control" value="${readList.writer}" readonly="readonly">
									</div>
									<div class="form-group" hidden="hidden">
										<label for="viewcount">조회수</label> 
										<input type="text" name="viewcount" class="form-control" value="${readList.viewcount}" readonly="readonly">
									</div>
								</div>
								<%-- /.box-body --%>
								
								<c:choose>
									<c:when test="${sessionScope.email ==  readList.writer}">						
										<div class="box-footer text-right">
											<button type="button" class="btn btn-primary" id="revBtn" onclick="location.href='Modify.bd?bno=${readList.bno}'">수정</button>
											<button type="button" class="btn btn-primary" id="delBtn" onclick="btnClick()">삭제</button>
											<button type="button" class="btn btn-primary" onclick="location.href='Board.bd'">목록</button>
										</div>
									</c:when>
									
									<c:otherwise>
										<div class="box-footer text-right">
											<button type="button" class="btn btn-primary" onclick="location.href='Board.bd'">목록</button>
										</div>
									</c:otherwise>
								</c:choose>
			
							</form>
							
							<br>
		
<%------------------------------------ [ 댓글 목록  ] ------------------------------------%>			
							
							<div class="form-group">
							<label>댓글</label>
							
							<c:forEach var="replyList" items="${replyList}">
								<div class="form-control">
								<c:choose>
									<c:when test="${replyList.writer == 'admin@Something-take.com'}">
										<input type="text" name="reply_email" id="reply_email" size="10" style="border:none;" 
												readonly="readonly" value="운영자">
									</c:when>
									<c:otherwise>
										<input type="text" name="reply_email" id="reply_email" size="10" style="border:none;" 
												readonly="readonly" value="익명">
									</c:otherwise>
								</c:choose>
									<input type="text" name="reply_content" id="reply_content" readonly="readonly" size="63" 
											style="border:none;" readonly="readonly" value="${replyList.content}">
									<fmt:formatDate value="${replyList.re_reg_date}" pattern="YYYY/MM/dd"/>
								</div>
							</c:forEach>
		
<%------------------------------------ [ 댓글 목록  ] ------------------------------------%>			


<%------------------------------------ [ 댓글 등록  ] ------------------------------------%>			

							<form method="post" name="replyForm">
								<div class="form-group" hidden="hidden">
								<label for="bno">글번호</label> 
									<input type="text" name="bno" id="re_bno" class="form-control" value="${readList.bno}" readonly="readonly">
								</div>
		
								<div class="form-group" hidden="hidden">
								<label for="writer">작성자</label> 
									<input type="text" name="writer" id="re_writer" class="form-control" value="${sessionScope.email}" readonly="readonly">
								</div>
							
								<div class="form-group">
									<input type="text" size="55" name="content" id="re_content" class="form-control" placeholder="내용을 입력해주세요." required>
								</div>
								
								<input type="button" class="btn btn-primary" id="replyBtn" value="등록" onclick="reply_chk()">
							</form>
							
							</div>
		
<%------------------------------------ [ 댓글 등록  ] ------------------------------------%>					
							
							<br>
						</div><!-- /.box -->
					</div><!--/.col (left) -->
				</div><!-- /.row -->
			</section>
		</c:otherwise>
	</c:choose>

<%------------------------------------ [게시판 영역] -------------------------------------------%>

<script type="text/javascript">

	/* 댓글 등록 버튼 클릭 시 작동 */
	$(function reply_chk(){
		$("#replyBtn").click(function(){
			if($("#re_content").val() == ""){
				alert("댓글 내용을 입력하세요.");
				$("#re_content").focus();
				return false;
			}else{
				replyAdd();
			} // if
		}); // click()
	}); // reply_chk()

	/* 삭제 버튼 클릭 시 작동  */
	function btnClick(){
		var del = confirm("해당 글을 삭제하시겠습니까?");
		$("#delBtn").click(function(){
			if(del == true){
				location.href="./board/delete.post?bno=${readList.bno}";
			} // if
		}) // click()
	} // btnClick()

	/* 댓글 등록 메서드 */
	function replyAdd(){
		$.ajax({
				type: "GET",
				dataType: "text",
				data: { bno:$("#re_bno").val(),
						writer:$("#re_writer").val(),
						content:$("#re_content").val() },
				url: "board/reply.get",
				success:function(check, textStatus){
						if(check == 1){
							$("#re_content").val("");
							alert("댓글이 등록되었습니다.");
							location.reload();
						}else{
							alert("댓글 등록 중 오류가 발생하였습니다.");
							$("#re_content").val("");
							location.reload();
						} // if
				}, // success
				error:function(check, textStatus){
						alert("댓글 등록 중 오류가 발생하였습니다.");
				} // error
		}); // ajax
	} // replyAdd()
	
</script>
</body>
</html>