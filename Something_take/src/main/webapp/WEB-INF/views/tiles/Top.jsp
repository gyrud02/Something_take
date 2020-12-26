<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-------------------------------------- HEAD [헤드 영역] ------------------------------------------>
<head>
	<!----------- [meta] ----------->
	<meta charset="utf-8">
	<title>Something take</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!----------- [meta] ----------->

	<!----------- [페이지 타이틀 로고] ----------->
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/Logo.ico">
	<!----------- [페이지 타이틀 로고] ----------->

	<!----------- [구글 글꼴 링크] ----------->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!----------- [구글 글꼴 링크] ----------->

	<!----------- [CSS 관련 링크 ] ----------->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/slick-theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fonticons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootsnav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/head_title_1.css">
	<!----------- [CSS 관련 링크 ] ----------->

	<!--For Plugins external css-->
	<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/plugins.css" />-->

	<!--Theme custom css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
	<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->
	<!--Theme custom css -->

	<!--Theme Responsive css-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/responsive.css" />
	<!--Theme Responsive css-->

	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	
	<!----------- [jquery 관련 링크 ] ----------->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<!----------- [jquery 관련 링크 ] ----------->
	
	<!----------- [i'mport(결제) 관련 링크 ] ----------->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!----------- [i'mport(결제) 관련 링크 ] ----------->
	
	
</head>
<!-------------------------------------- HEAD [헤드 영역] ------------------------------------------>


<!-------------------------------------- BODY [본문 영역] ------------------------------------------>
<body data-spy="scroll" data-target=".navbar-collapse" class="lightbg">
	<div class="culmn">
		<!--Home page style-->
																			<!-- no-background -->	
		<nav class="navbar navbar-light navbar-expand-lg  navbar-fixed white  					  bootsnav">
			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->

			<div class="container">
				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
                     
					<ul>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-shopping-bag"></i>
                                    <span class="badge">${total}</span>
                           	</a>
                            
	                    	<c:forEach items="${cartList}" var="cartList">
							<ul class="dropdown-menu cart-list">
									<li>
										<a href="#" class="photo"><img src="${pageContext.request.contextPath}/resources/images/Me-americano.jpg" class="cart-thumb" alt="" /></a>
										<h6><a href="#">${cartList.americano}</a></h6>
										<p class="m-top-10"><b>갯수 :  </b><span class="price">${cartList.cartStock1}</span></p>
									</li>
									<li>
										<a href="#" class="photo"><img src="${pageContext.request.contextPath}/resources/images/espresso.jpg" class="cart-thumb" alt="" /></a>
										<h6><a href="#">${cartList.espresso}</a></h6>
										<p class="m-top-10"><b>갯수 :  </b><span class="price">${cartList.cartStock2}</span></p>
									</li>
									<li>
										<a href="#" class="photo"><img src="${pageContext.request.contextPath}/resources/images/caffelatte.jpg" class="cart-thumb" alt="" /></a>
										<h6><a href="#">${cartList.caffelatte}</a></h6>
										<p class="m-top-10"><b>갯수 :  </b><span class="price">${cartList.cartStock3}</span></p>
									</li>
									<li>
										<a href="#" class="photo"><img src="${pageContext.request.contextPath}/resources/images/cappuccino.jpg" class="cart-thumb" alt="" /></a>
										<h6><a href="#">${cartList.cappuccino}</a></h6>
										<p class="m-top-10"><b>갯수 :  </b><span class="price">${cartList.cartStock4}</span></p>
									</li>
									<li>
										<a href="#" class="photo"><img src="${pageContext.request.contextPath}/resources/images/greentea_latte.jpg" class="cart-thumb" alt="" /></a>
										<h6><a href="#">${cartList.greentea_latte}</a></h6>
										<p class="m-top-10"><b>갯수 :  </b><span class="price">${cartList.cartStock5}</span></p>
									</li>
									<li>
										<a href="#" class="photo"><img src="${pageContext.request.contextPath}/resources/images/lemonade.jpg" class="cart-thumb" alt="" /></a>
										<h6><a href="#">${cartList.lemonade}</a></h6>
										<p class="m-top-10"><b>갯수 :  </b><span class="price">${cartList.cartStock6}</span></p>
									</li>
							
								<li class="total">
									<span class="pull-right"><strong>Total</strong>: $0.00</span>
									<a href="#" class="btn btn-cart">주문</a>
								</li>
							</ul>
							</c:forEach>
								
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
					</ul>
					
				</div>
				<!-- End Atribute Navigation -->

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>

					<a class="navbar-brand" href="index.do">
                            <img src="${pageContext.request.contextPath}/resources/assets/images/logo.png" class="logo logo-display m-top-10" alt="">
                            <img src="${pageContext.request.contextPath}/resources/assets/images/logo.jpg" class="logo logo-scrolled" alt="">
                    </a>
				</div>
				<!-- End Header Navigation -->

				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">

					<c:choose>
					<%-- 로그인 O--%>	
						<c:when test="${sessionScope.email != null}">
							<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
								<li><a href="index.do#contact">Contact</a></li>
								<li><a href="About.do">About</a></li>
								<li><a href="Sign-up.me">Sign-up</a></li>
								<li><a href="Board.bd">Foundation</a></li>
								<li><a href="Interior.bd">Interior</a></li>
								<li><a href="MemberShip.pm">MemberShip</a></li>
							</ul>
						</c:when>
					
					<%-- 로그인 X --%>	
						<c:otherwise>
							<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
								<li><a href="index.do#contact">Contact</a></li>
								<li><a href="About.do">About</a></li>
								<li><a href="Sign-up.me">Sign-up</a></li>
								<li><a href="Sign-in.me">Sign-in</a></li>
								<li><a href="Board.bd">Foundation</a></li>
								<li><a href="Interior.bd">Interior</a></li>
								<li><a href="MemberShip.pm">MemberShip</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
					
				</div>
				<!-- /.navbar-collapse -->
			</div>

			<!-- Start Side Menu -->
			<div class="side">
				
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>

				  <c:choose>
				  
					<%-- 로그인 X --%>
					<c:when test="${sessionScope.email == null}">
						<div class="widget">
							<h6 class="title"><a href="Sign-in.me">로그인</a> 후 사용 가능합니다.</h6>
							<ul class="link">
							</ul>
						</div>					
					</c:when>
							
					<%-- 로그인 O --%>
					<c:when test="${sessionScope.email != null}">
						<div class="widget">
							<h6 class="title">고객 페이지</h6>
							<ul class="link">
								<li><a href="Profile.me">회원정보</a></li>
								<li><a href="#">주문 내역</a></li>
								<li><a href="membership.me">멤버십 내역</a></li>
								<li><a href="member/sign-out.post">로그아웃</a></li>
								<li><a href="Drop-out.me">회원탈퇴</a></li>
							</ul>
						</div> <!-- .widget -->
		
							<%-- 관리자 페이지 --%>
							<c:if test="${sessionScope.email == 'admin@Something-take.com'}">
								<div class="widget">
								<h6 class="title">관리자 페이지</h6>
								<ul class="link">
									<li><a href="mem_manage.mng">회원 관리</a></li>
									<li><a href="pay_manage.mng">매출 관리</a></li>
									<li><a href="ord_manage.mng">주문 관리</a></li>
									<li><a href="msg_manage.mng">문의 관리</a></li>
								</ul>
								</div> <!-- .widget -->
							</c:if>
					</c:when>
				</c:choose>
				  
			</div>
			<!-- End Side Menu -->

		</nav>
	</div>
	
</body>
<!-------------------------------------- BODY [본문 영역] ------------------------------------------>

	
<!------------------------------- script [스크립트 영역] --------------------------->

 	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.collapse.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootsnav.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
	<!----------- [ck에디터 관련 링크 ] ----------->
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<!----------- [ck에디터 관련 링크 ] ----------->
	
	<!----------- [지도 관련 링크 ] ----------->
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/gmaps.min.js"></script>
	<!----------- [지도 관련 링크 ] ----------->

<!------------------------------- script [스크립트 영역] --------------------------->

</html>