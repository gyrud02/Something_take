<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<!------------------------------------ [결제 내역 영역] ------------------------------------------->
<body>

	<c:choose>
		<c:when test="${sessionScope.email == null }">
			<script type="text/javascript">
				alert("로그인 시 사용 가능한 페이지입니다.");
				location.href="Sign-in.me";
			</script>
		</c:when>
		
		<c:when test="${sessionScope.email != null && membership.membership_type != null}">
			<section id="pricing" class="pricing lightbg">
				<div class="container">
					<div class="row">
						<div class="main_pricing">
							<div class="col-md-8 ml-md-auto mr-md-auto">
								<div class="head_title_1 text-center">
									<h3>멤버십 이용 내역</h3>
									<div class="separator_auto"></div>
								</div>
							</div>
						</div>
					</div>
					
					<br><br>
					
					<div class="row">
						<div class="col-md-7 col-sm-12 ml-md-auto mr-md-auto">
							<div class="pricing_item">
								<div class="pricing_top_border"></div><br>
								<div class="pricing_head p-top-30 p-bottom-100 text-center">
									<h3 class="text-uppercase">${membership.membership_type}</h3>
									<div hidden>
										<input type="text" readonly="readonly">
									</div>
								</div>
								
								<div class="pricing_price_border text-center">
									<div class="pricing_price">
										<h4 class="text-white">${membership.membership_pay}</h4>
										<div hidden>
											<input type="text" readonly="readonly">
										</div>
										<p class="text-white">per month</p>
									</div>
								</div>
	
								<div class="pricing_body bg-white p-top-110 p-bottom-60">
									<ul class="text-center">
										<li><i class="fa fa-check-circle text-primary"></i> <span>결제일 : </span> 
											<fmt:formatDate value="${membership.membership_reg_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
										</li>
										<li><i class="fa fa-check-circle text-primary"></i> <span>종료일 : </span> 
											<fmt:formatDate value="${membership.membership_end_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
										</li>
									</ul>
									
									<div class="pricing_btn text-center m-top-40">
										<a href="MemberShip.pm" class="btn btn-primary">멤버십 변경하기</a>
										<a href="#" class="btn btn-primary">멤버십 해지하기</a>
									</div>
								</div>
	
							</div>
						</div><!-- End off col-md-4 -->
					</div>
				</div>
			</section>
		</c:when>
					
		<c:otherwise>			
			<section class="pricing lightbg">
				<div class="container">
					<div class="row">
						<div class="main_pricing">
							<div class="col-md-8 ml-md-auto mr-md-auto">
								<div class="head_title_1 text-center">
									<h3>멤버십 이용 내역</h3>
									<div class="separator_auto"></div>
								</div>
							</div>
						</div>
					</div>
					
					<br><br>
					
					<div class="row">
						<div class="col-md-8 col-sm-12 ml-md-auto mr-md-auto">
							<div class="pricing_item">
								<div class="pricing_body bg-white p-top-110 p-bottom-60">
									<ul class="text-center">
										<li><i class="fa fa-check-circle text-primary"></i> <span>현재 이용 중인 멤버십이 없습니다.</span> </li>
									</ul>
									<div class="pricing_btn text-center m-top-40">
										<a href="MemberShip.pm" class="btn btn-primary">멤버십 신청하기</a>
									</div>
								</div>
	
							</div>
						</div><!-- End off col-md-4 -->
					</div>
				</div>
			</section>
		</c:otherwise>	

	</c:choose>						

</body>
<!------------------------------------ [결제 내역 영역] ------------------------------------------->
</html>