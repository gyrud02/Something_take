<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<style>
	.portfolio_item2{ width: 280px;
				      height: 280px;
				      border-radius: 70%;
					  overflow: hidden;
					  object-fit: cover; }
	.col-md-4{ padding-left: 60px; }
</style>
<script type="text/javascript">

	function orderAJAX(){

		$(".btn-primary").click(function(){

			var menu = document.getElementById.value;
			alert(menu);
				
			$.ajax({
					type: "GET",
					dataType: "json",
					data: {menu : menu},
					url: "order/addCart"
					success:function(result, textStatus){
						alert("@@ result : " + result);
					}, // success
					error:function(result, textStatus){
						alert("오류가 발생하였습니다.");
					} // error
				
			}); // ajax

		}); // click()
	} // orderAJAX()

</script>
<body>

<!------------------------------------ [갤러리 영역] ------------------------------------------->

		<section id="portfolio">
			<div class="container">
				<div class="row">
					<div class="main_portfolio roomy-100">
						<div class="col-md-8 mr-md-auto ml-md-auto">
							<div class="head_title_1 text-center">
								<h2>메뉴</h2>
								<div class="separator_auto"></div>
							</div>
						</div>
						
						<div class="row">
							<div class="portfolio_content">
								<div class="col-md-14 mr-md-auto ml-md-auto">
									<div class="row">
										<div class="col-md-4 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="${pageContext.request.contextPath}/resources/images/Me-americano.jpg" alt="Me-americano" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Americano</h6>
													<p class=" text-white"> ￦ 2,000 </p>
													<div class="portfolio_hover_icon">
														<a href="${pageContext.request.contextPath}/resources/images/Me-americano.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href="${pageContext.request.contextPath}/resources/images/Me-americano.jpg"></a>
													</div>
													<br>
													<button class="btn btn-default" id="americano">카트에 담기</button>
												</div>
											</div>
										</div>
										
										<div class="col-md-4 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="${pageContext.request.contextPath}/resources/images/espresso.jpg" alt="espresso" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Espresso</h6>
													<p class=" text-white"> ￦ 1,500 </p>
													<div class="portfolio_hover_icon">
														<a href="${pageContext.request.contextPath}/resources/images/espresso.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href="${pageContext.request.contextPath}/resources/images/espresso.jpg"></a>
													</div>
													<br>
													<button class="btn btn-default">카트에 담기</button>
												</div>
											</div>
										</div>
										
										<div class="col-md-4 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="${pageContext.request.contextPath}/resources/images/caffelatte.jpg" alt="caffelatte" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Caffelatte</h6>
													<p class=" text-white"> ￦ 3,500 </p>
													<div class="portfolio_hover_icon">
														<a href="${pageContext.request.contextPath}/resources/images/caffelatte.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href="${pageContext.request.contextPath}/resources/images/caffelatte.jpg"></a>
													</div>
													<br>
													<button class="btn btn-default">카트에 담기</button>
												</div>
											</div>
										</div>

										<div class="col-md-4 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="${pageContext.request.contextPath}/resources/images/cappuccino.jpg" alt="cappuccino" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Cappuccino</h6>
													<p class=" text-white"> ￦ 3,800 </p>
													<div class="portfolio_hover_icon">
														<a href="${pageContext.request.contextPath}/resources/images/cappuccino.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href="${pageContext.request.contextPath}/resources/images/cappuccino.jpg"></a>
													</div>
													<br>
													<button class="btn btn-default">카트에 담기</button>
												</div>
											</div>
										</div>
										
										<div class="col-md-4 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="${pageContext.request.contextPath}/resources/images/greentea_latte.jpg" alt="greentea_latte" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Greentea Latte</h6>
													<p class=" text-white"> ￦ 3,000 </p>
													<div class="portfolio_hover_icon">
														<a href="${pageContext.request.contextPath}/resources/images/greentea_latte.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href="${pageContext.request.contextPath}/resources/images/greentea_latte.jpg"></a>
													</div>
													<br>
													<button class="btn btn-default">카트에 담기</button>
												</div>
											</div>
										</div>	
										
										<div class="col-md-4 m-top-30">
											<div class="portfolio_item portfolio_item2">
												<img src="${pageContext.request.contextPath}/resources/images/lemonade.jpg" alt="lemonade" />
												<div class="portfolio_hover text-center">
													<h6 class="text-uppercase text-white">Lemonade</h6>
													<p class=" text-white"> ￦ 4,000</p>
													<div class="portfolio_hover_icon">
														<a href="${pageContext.request.contextPath}/resources/images/lemonade.jpg" class="popup-img"><i class="fa fa-expand"></i></a>
														<a href="${pageContext.request.contextPath}/resources/images/lemonade.jpg"></a>
													</div>
													<br>
													<button class="btn btn-default">카트에 담기</button>
												</div>
											</div>
										</div>
									</div> <!-- .row -->	
								</div> <!-- .col-md-8 -->
							</div> <!-- .portfolio_content -->
						</div> <!-- .row -->
					</div>
				</div><!--End off row -->
			</div> <!--End off container -->
		</section>
<!------------------------------------ [갤러리 영역] ------------------------------------------->

</body>
</html>