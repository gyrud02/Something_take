<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<script type="text/javascript">

	$(function contact_chk(){

		var regName = RegExp(/^[가-힣A-Za-z]{2,20}$/); // 이름
		
		$("#send_message").click(function(){

			// 고객명
			if($("#msg_name").val() == ""){
				alert("이름을 입력하세요.");
				$("#msg_name").focus();
				return false;
			}

			// 고객명 유효성 검사
		    if ( !(regName.test( $("#msg_name").val() )) ){
				alert("이름을 올바르게 입력하세요.");
		    	$("#msg_name").focus();
		    	$("#msg_name").val("");
		    	return false;
		    }
			
			// 고객 전화번호
			if($("#msg_phone").val() == ""){
				alert("연락 받을 전화번호를 입력하세요.");
				$("#msg_phone").focus();
				return false;
			}

			// 고객 메세지
			if($("#msg_textarea").val() == ""){
				alert("메세지를 입력하세요.");
				$("#msg_textarea").focus();
				return false;
			}

		}); // click()
	}); // contact_chk()
	
</script>

<!-------------------------------------- BODY [본문 영역] ------------------------------------------>
<body data-spy="scroll" data-target=".navbar-collapse">

	<div class="culmn">

<!-------------------------------- [본문 상단 영역] ---------------------------------->

		<section id="hello" class="home bg-mega">
			<div class="overlay"><img alt="" src="${pageContext.request.contextPath}/resources/images/coffee2.jpg"></div>
			<div class="container">
				<div class="row">
					<div class="main_home">
						<div class="home_text">
							<h1 class="text-white">환영합니다! <br /> Something-take입니다.</h1>
						</div>

						<div class="home_btns m-top-40">
							<a href="Menu.pm" class="btn btn-primary m-top-20">주문하러가기</a>
							<a href="Sign-up.me" class="btn btn-default m-top-20">회원가입</a>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
<!-------------------------------- [본문 상단 영역] ---------------------------------->

		<br><br><br><br><br><br><br><br><br><br>

<!------------------------------- [슬라이더 영역] ----------------------------------->

		<div class="featured_slider">
			<div>
				<div class="featured_img">
					<img src="${pageContext.request.contextPath}/resources/images/_3.jpg" alt="_3" />
					<a href="${pageContext.request.contextPath}/resources/images/_3.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="${pageContext.request.contextPath}/resources/images/ade.jpg" alt="ade" />
					<a href="${pageContext.request.contextPath}/resources/images/ade.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="${pageContext.request.contextPath}/resources/images/latte.jpg" alt="latte" />
					<a href="${pageContext.request.contextPath}/resources/images/latte.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="${pageContext.request.contextPath}/resources/images/_4.jpg" alt="_4" />
					<a href="${pageContext.request.contextPath}/resources/images/_4.jpg" class="popup-img"></a>
				</div>
			</div>
			<div>
				<div class="featured_img">
					<img src="${pageContext.request.contextPath}/resources/images/ade2.jpg" alt="ade2" />
					<a href="${pageContext.request.contextPath}/resources/images/ade2.jpg" class="popup-img"></a>
				</div>
			</div>
		</div>
		
<!------------------------------- [슬라이더 영역] ----------------------------------->


<!------------------------------- Service ---------------------------------------->

		<section id="service" class="service">
			<div class="container">
				<div class="row">
					<div class="main_service roomy-100">
						<div class="col-md-8 col-sm-10 mr-md-auto ml-md-auto mr-sm-auto ml-sm-auto">
							<div class="head_title text-center">
								<h2> SERVICES</h2>
								<div class="separator_auto"></div>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
							</div>
						</div>
						<div class="row">


							<div class="col-md-4">
								<div class="service_item">
									<i class="icofont icofont-light-bulb"></i>
									<h6 class="m-top-30">BRANDING</h6>
									<div class="separator_small"></div>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="service_item">
									<i class="icofont icofont-imac"></i>
									<h6 class="m-top-30">BRANDING</h6>
									<div class="separator_small"></div>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="service_item">
									<i class="icofont icofont-video"></i>
									<h6 class="m-top-30">BRANDING</h6>
									<div class="separator_small"></div>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
								</div>
							</div>
						</div>
					</div>
					<!-- End off main_service roomy-100 -->
					
					<br><br><br>
					
					<div class="skill_bottom_content text-center">
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Projects Finished</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">4638</h2>
								<div class="separator_small"></div>
								<h5><em>Happy Clients</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Hs of work</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Cup of coffee</em></h5>
							</div>
						</div>
					</div>
					<!-- End off skill_bottom_content text-center -->
				</div>
				<!--End off row -->
			</div>
			<!--End off container -->
		</section>
		
<!------------------------------- Service ---------------------------------------->

		<br><br><br>

<!------------------------------- [지도 영역] --------------------------------------->

		<div class="main_maps text-center fix">
			<div class="overlay"></div>
			<div class="maps_text">
				<h3 class="text-white" onclick="showmap()">FIND US ON THE MAP <i class="fa fa-angle-down"></i></h3>
				<div id="map_canvas" class="mapheight"></div>
			</div>
		</div>

<!------------------------------- [지도 영역] -------------------------------------->


<!------------------------------- [이메일 발송 영역] --------------------------------->

		<section id="contact" class="contact bg-mega fix">
			<div class="container">
				<div class="row">
					<div class="main_contact roomy-100 text-white">
						<div class="col-md-4">
							<div class="rage_widget">
								<div class="widget_head">
									<h3 class="text-white">Something take</h3>
									<div class="separator_small"></div>
								</div>
								<p> [비회원] 창업과 관련하여 궁금한 사항이 있으시면 형식에 맞게 입력하신 후 메세지로 보내주시면 연락을 드리도록 하겠습니다.</p>

								<div class="widget_socail m-top-30">
									<ul class="list-inline-item">
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
										<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
										<li><a href="#"><i class="fa fa-instagram"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-8 sm-m-top-30">
							<form class="" action="msg/message.me" method="post" onsubmit="contact_chk()">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<input id="msg_name" name="msg_name" type="text" placeholder="고객명" class="form-control" required>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<input id="msg_phone" name="msg_phone" type="text" placeholder="고객 전화번호 ( '-'없이 입력하세요. )" class="form-control">
										</div>
									</div>

									<div class="col-sm-12">
										<div class="form-group">
											<textarea class="form-control" id="msg_textarea" name="msg_textarea"
											rows="6" placeholder="문의 내용을 입력하세요. (문의와 관련된 정보는 회사 측에 보관됩니다.)"></textarea>
										</div>
										<div class="form-group" hidden>
											<input type="text" value="X" name="msg_answer">
										</div>
										<div class="form-group text-center">
											<input type="submit" class="btn btn-primary col-sm-12" id="send_message" 
											   value="SEND MESSAGE">
										</div>
									</div>

								</div>
							</form>
						</div>
					</div>
				</div>
				<!--End off row -->
			</div>
			<!--End off container -->
		</section>
		
<!------------------------------- [이메일 발송 영역] --------------------------------->


<!------------------------------- Scroll_Up [스크롤업] ---------------------------->

		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>

<!------------------------------- Scroll_Up [스크롤업] ---------------------------->

	</div> <!-- class="culmn" -->

</body>
<!-------------------------------------- BODY [본문 영역] ------------------------------------------>

</html>