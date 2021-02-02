<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<!------------------------------------ [결제 영역] ------------------------------------------->
		
		<section id="pricing" class="pricing lightbg">
			<div class="container">
				<div class="row">
					<div class="main_pricing">
						<div class="col-md-8 ml-md-auto mr-md-auto">
							<div class="head_title_1 text-center">
								<h2>Membership</h2>
								<div class="separator_auto"></div>
								<div hidden>
									<input type="text" readonly="readonly" id="session" name="session" value="${sessionScope.email}">
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<br><br>
				
				<div class="row">
					<div class="col-md-4 col-sm-12">
						<div class="pricing_item">
							<div class="pricing_top_border"></div>
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">STARTER</h3>
								<div hidden>
									<input type="text" id="name_St" value="STARTER" readonly="readonly">
								</div>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h4 class="text-white">￦ 3,900</h4>
									<div hidden>
										<input type="text" id="amount_St" value="3900" readonly="readonly">
									</div>
									<p class="text-white">per month</p>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> <span>7%</span> 포인트 적립</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> 매 달 한번 음료 한 잔 무료</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> 매 달 쿠폰 1000원 지급</li>
								</ul>
								<div class="pricing_btn text-center m-top-40">
									
									<c:choose>
										<c:when test="${sessionScope.email != null}">
											<a href="javascript:void(event)" onclick="inicis_St(event)"
											   class="btn btn-primary">결제하기</a>
										</c:when>
										
										<c:otherwise>
											<a href="sign-in"
											   class="btn btn-primary">로그인하러가기</a>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>

						</div>
					</div><!-- End off col-md-4 -->
					
	<!------------------------------ [ 결제 api ] ------------------------------->					
					<script type="text/javascript">

						function inicis_St(){
							var name = document.getElementById('name_St').value;
							var amount = document.getElementById('amount_St').value;
							var email = document.getElementById('session').value;
							
							$(".btn-primary").click(function(){
								IMP.init('imp30100127');
								IMP.request_pay({
								    pg : 'inicis', // version 1.1.0부터 지원.
								    pay_method : 'card',
								    merchant_uid : 'merchant_' + new Date().getTime(), // 영수증번호
								    name : '멤버십 : '+ name,
								    amount : amount, // 판매 가격
								    buyer_email : email,
								    buyer_name : '',
								    buyer_tel : '',
								    buyer_addr : '',
								    buyer_postcode : ''
								}, function(rsp) {
								    if ( rsp.success ) {
								    	pay_STARTER(event);
								    } else {
								        var msg = '결제에 실패하였습니다.';
								    }
								    alert(msg);
								}); // request_pay
					
							}); // click()
						}; // inicis()

						/* 결제내역 DB에 송신 */
						function pay_STARTER(){
							var name = document.getElementById('name_St').value;
							var amount = document.getElementById('amount_St').value;
							var email = document.getElementById('session').value;
							
							$.ajax({
									type: "POST",
									url: "member/membership.post",
									dataType:"text",
									data:{ email: email.value,
										   membership_type: name.value,
										   membership_pay: amount.value },
									success:function(textStatus){
										alert(email + membership_type + membership_pay);
										alert("결제가 완료되었습니다.");
										location.href="membership";
									}, // success
									error:function(textStatus){
										alert(email + membership_type + membership_pay);
										alert("결제 진행 중 오류가 발생하였습니다.");
									} // error
							}); // ajax
						} // pay_STARTER
					
					</script>
	<!------------------------------ [ 결제 api ] ------------------------------->
					

					<div class="col-md-4 col-sm-12">
						<div class="pricing_item sm-m-top-30">
							<div class="pricing_top_border"></div>
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">PREMIUM</h3>
								<div hidden>
									<input type="text" id="name_Pre" value="PREMIUM" readonly="readonly">
								</div>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h4 class="text-white">￦ 9,900</h4>
									<div hidden>
										<input type="text" id="amount_Pre" value="9900" readonly="readonly">
									</div>
									<p class="text-white">per month</p>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> <span>10%</span> 포인트 적립</li>
									<li><i class="fa fa-check-circle text-primary"></i> 매 달 음료 한 잔 3번 무료</li>
									<li><i class="fa fa-check-circle text-primary"></i> 매 달 쿠폰 2000원 지급</li>
								</ul>
								<div class="pricing_btn text-center m-top-40">
								
									<c:choose>
										<c:when test="${sessionScope.email != null}">
											<a href="javascript:void(event);" onclick="inicis_Pre(event)"
											   class="btn btn-primary">결제하기</a>
										</c:when>
										
										<c:otherwise>
											<a href="sign-in"
											   class="btn btn-primary">로그인하러가기</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							
	<!------------------------------ [ 결제 api ] ------------------------------->					
							<script type="text/javascript">
							
							function inicis_Pre(){
								var name = document.getElementById('name_Pre').value;
								var amount = document.getElementById('amount_Pre').value;
								var email = document.getElementById('session').value;
							
								$(".btn-primary").click(function(){
									IMP.init('imp30100127');
									IMP.request_pay({
									    pg : 'inicis', // version 1.1.0부터 지원.
									    pay_method : 'card',
									    merchant_uid : 'merchant_' + new Date().getTime(),
									    name : '멤버십 : '+ name,
									    amount : amount, // 판매 가격
									    buyer_email : email,
									    buyer_name : '',
									    buyer_tel : '',
									    buyer_addr : '',
									    buyer_postcode : ''
									}, function(rsp) {
									    if ( rsp.success ) {
									    	pay_PREMIUM(event);
									    } else {
									        var msg = '결제에 실패하였습니다.';
									    }
									    alert(msg);
									});
							
								}); // click()
							}; // inicis()

							/* 결제내역 DB에 송신 */
							function pay_PREMIUM(){
								var name = document.getElementById('name_Pre').value;
								var amount = document.getElementById('amount_Pre').value;
								var email = document.getElementById('session').value;
								
								$.ajax({
										type: "POST",
										url: "member/membership.post",
										dataType:"text",
										data:{ email: email.value,
											   membership_type: name.value,
											   membership_pay: amount.value },
										success:function(textStatus){
											alert(email + membership_type + membership_pay);
											alert("결제가 완료되었습니다.");
											location.href="membership";
										}, // success
										error:function(textStatus){
											alert(email + membership_type + membership_pay);
											alert("결제 진행 중 오류가 발생하였습니다.");
										} // error
								}); // ajax
							} // pay_PREMIUM
							
							</script>
	<!------------------------------ [ 결제 api ] ------------------------------->
							
							
							
						</div>
					</div>
					<!-- End off col-md-4 -->

					<div class="col-md-4 col-sm-12">
						<div class="pricing_item sm-m-top-30">
							<div class="pricing_top_border"></div>
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">BUSINESS</h3>
								<div hidden>
									<input type="text" id="name_Bus" value="BUSINESS" readonly="readonly">
								</div>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h4 class="text-white">￦ 7,900</h4>
									<div hidden>
										<input type="text" id="amount_Bus" value="7900" readonly="readonly">
									</div>
									<p class="text-white">per month</p>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> <span>7%</span> 포인트 적립</li>
									<li><i class="fa fa-check-circle text-primary"></i> 매 달 음료 한 잔 2번 무료</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> 매 달 쿠폰 1500원 지급</li>
								</ul>
								<div class="pricing_btn text-center m-top-40">
									
									<c:choose>
										<c:when test="${sessionScope.email != null}">
											<a href="javascript:void(event);" onclick="inicis_Bus(event)"
											   class="btn btn-primary">결제하기</a>
										</c:when>
										
										<c:otherwise>
											<a href="sign-in"
											   class="btn btn-primary">로그인하러가기</a>
										</c:otherwise>
									</c:choose>
									
							   </div>
							</div>
						</div>
					</div><!-- End off col-md-4 -->
					
	<!------------------------------ [ 결제 api ] ------------------------------->					
					<script type="text/javascript">
							
							function inicis_Bus(){
								var name = document.getElementById('name_Bus').value;
								var amount = document.getElementById('amount_Bus').value;
								var email = document.getElementById('session').value;
							
								$(".btn-primary").click(function(){
									IMP.init('imp30100127');
									IMP.request_pay({
									    pg : 'inicis', // version 1.1.0부터 지원.
									    pay_method : 'card',
									    merchant_uid : 'merchant_' + new Date().getTime(),
									    name : '멤버십:'+ name,
									    amount : amount, // 판매 가격
									    buyer_email : email,
									    buyer_name : '',
									    buyer_tel : '',
									    buyer_addr : '',
									    buyer_postcode : ''
									}, function(rsp) {
									    if ( rsp.success ) {
									    	pay_BUSINESS(event);
									    } else {
									        var msg = '결제에 실패하였습니다.';
									    }
									    alert(msg);
									});
							
								}); // click()
							}; // inicis()

							/* 결제내역 DB에 송신 */
							function pay_BUSINESS(){
								var name = document.getElementById('name_Bus').value;
								var amount = document.getElementById('amount_Bus').value;
								var email = document.getElementById('session').value;
								
								$.ajax({
										type: "POST",
										url: "member/membership.post",
										dataType:"text",
										data:{ email: email.value,
											   membership_type: name.value,
											   membership_pay: amount.value },
										success:function(textStatus){
											alert(email + membership_type + membership_pay);
											alert("결제가 완료되었습니다.");
											location.href="membership";
										}, // success
										error:function(textStatus){
											alert(email + membership_type + membership_pay);
											alert("결제 진행 중 오류가 발생하였습니다.");
										} // error
								}); // ajax
							} // pay_BUSINESS
							
							</script>
	<!------------------------------ [ 결제 api ] ------------------------------->
				
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>

<!------------------------------------ [결제 영역] ------------------------------------------->

</body>
</html>