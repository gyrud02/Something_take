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
							<h2>Members</h2>
								<div class="separator_auto"></div>
						</div>
						
						<br><br>
						
						<div class="box">
							<div class="box-body">
								<table class="table table-bordered">
									<tr id="ManageList">
										<th id="idx">회원번호</th>
										<th>이메일</th>
										<th>멤버십명</th>
										<th>멤버십 결제일자</th>
										<th>멤버십 종료일자</th>
										<th>가입일자</th>
									</tr>
									
									<c:forEach items="${memberList}" var="memberList">
										<tr>
											<td id="memList">${memberList.idx}</td>
											<td>${memberList.email}</td>
											<td id="memList">${memberList.membership_type}</td>
											<td id="memList"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${memberList.membership_reg_date}"/></td>
											<td id="memList"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${memberList.membership_end_date}"/></td>
											<td id="memList"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${memberList.reg_date}"/></td>
										</tr>
									</c:forEach>
					
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