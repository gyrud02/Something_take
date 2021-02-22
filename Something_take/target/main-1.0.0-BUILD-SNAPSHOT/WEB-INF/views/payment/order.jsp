<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!----------- [meta] ----------->
	<meta charset="utf-8">
	<title>Something take</title>
	<!----------- [meta] ----------->
	
	<!----------- [페이지 타이틀 로고] ----------->
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/Logo.ico">
	<!----------- [페이지 타이틀 로고] ----------->
	
	<!----------- [link] ----------->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
	<!----------- [link] ----------->
	
	<!----------- [jquery 관련 링크 ] ----------->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<!----------- [jquery 관련 링크 ] ----------->
	
	<!----------- [i'mport(결제) 관련 링크 ] ----------->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!----------- [i'mport(결제) 관련 링크 ] ----------->
</head>
<script type="text/javascript">

	$(document).ready(function(){
		$(".email-class").removeClass("has-error");
		$(".phone-class").removeClass("has-error");
		$(".date-class").removeClass("has-error");
		$(".menu-class").removeClass("has-error");
		$(".type-class").removeClass("has-error");
		$(".amount-class").removeClass("has-error");
		$(".span-price").hide();
	});

	/* 유효성 검사 */
	function check(){
			if( $("#email").val() == "" ){ // 이메일
				$(".email-class").addClass("has-error");
				return false;
			}else if( $("#phone").val() == "" ){ // 전화번호
				$(".phone-class").addClass("has-error");
				return false;
			}else if( $("#date").val() == "" ){ // 주문일자
				$(".date-class").addClass("has-error");
				return false;
			}else if( $("#menu option:selected").val() == 0 ){ // 메뉴
				$(".menu-class").addClass("has-error");
				return false;
			}else if( $("#menutype option:selected").val() == 0 ){ // 타입
				$(".type-class").addClass("has-error");
				return false;
			}else if( $("#amount").val() <= 0 ){ // 갯수
				$(".amount-class").addClass("has-error");
				return false;
			}else if( !($('input:checkbox[id="optionsCheckboxes"]').is(":checked")) ){ // 체크박스
				$(".checkbox").attr("style", "color:red;");
				return false;
			}else{
				return true;
			} // if
	} // check()

</script>
<body class="lightbg">

 <c:choose>
 
	<c:when test="${sessionScope.email == null}" >
	  <script type="text/javascript">
		alert("로그인 시 사용 가능한 페이지입니다.");
		location.href="sign-in";
	 </script>
	</c:when>
	 
	<c:otherwise>	  
    <!--   Big container   -->
    <div class="container">
        <div class="row">
	        <div class="col-sm-8 col-sm-offset-2">
	            <!-- Wizard container -->
	            <div class="wizard-container">
	                <div class="card wizard-card" data-color="red" id="wizard">
	                
	                    <form id="frm">
	                    	
	                    	<br><br>
	                    
	                    	<div class="wizard-header">
	                    		<div class="head_title_1 text-center">
								<h2>Ordered</h2>
								<div class="separator_auto"></div>
								<a href="index">메인 페이지로 가기</a></p>
								<p style="color:#ff6f6f"><b>주문 정보에 필요한 사항을 입력해주세요.</b><br>
								</div>
							</div>
							
							<br>
							
							<div style="float:left; width:100%; height:50px;">
								<ul>
		                            <li class="form-group"><a href="#details" data-toggle="tab"> 주문 정보 </a></li>
		                        </ul>
							</div>

							<br><br>

	                        <div class="tab-content">
	                            <div class="tab-pane" id="details">
	                            	<div class="row">
	                                	<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">email</i>
												</span>
												<div class="form-group label-floating has-error email-class">
		                                          	<label class="control-label">Your Email</label>
		                                          	<input name="email" type="text" class="form-control" value="${sessionScope.email}" id="email" required readonly>
		                                        </div>
											</div>
											
											<br>
											
											<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">phone</i>
												</span>
												<div class="form-group label-floating has-error phone-class">
		                                          	<label class="control-label">Your Phone</label>
		                                          	<input name="phone" type="text" class="form-control" id="phone" required>
		                                        </div>
											</div>
											
											<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">tag</i>
												</span>											
												<div class="form-group label-floating has-error date-class">
		                                          	<label class="control-label">Date</label>
		                                          	<input name="order_date" type="date" class="form-control" id="order_date" required>
		                                        </div>
	                                        	<script>
											  		document.getElementById('order_date').value= new Date().toISOString().substring(0, 10);
												</script>
		                                    </div> 
	                                	</div>
	                                	
	                                	<br> 
	                  
	                                	<div class="col-sm-6">
	                                    	<div class="form-group label-floating has-error menu-class">
	                                        	<label class="control-label">Menu</label>
                                        		<select class="form-control" id="menu" name="menu" required> <!-- onmouseup="spanAJAX(event)" -->
													<option value="0">메뉴를 선택하세요.</option>
                                                	<option value="Americano"> 아메리카노(Americano): ￦ 2,000 </option>
                                                	<option value="Espresso"> 에스프레소(Espresso): ￦ 1,500 </option>
                                                	<option value="Caffelatte"> 카페라떼(Caffelatte): ￦ 3,000 </option>
                                                	<option value="Cappuccino"> 카푸치노(Cappuccino): ￦ 3,000 </option>
                                                	<option value="GreenteaLatte"> 녹차라떼(GreenteaLatte): ￦ 3,500 </option>
                                                	<option value="Lemonade"> 레모네이드(Lemonade): ￦ 3,500 </option>
	                                        	</select>
	                                    	</div>
	                                    	
	                                    	<div class="form-group label-floating has-error type-class">
	                                        	<label class="control-label">type</label>
                                        		<select class="form-control" id="menutype" name="menutype" required>
													<option value="0">타입을 선택하세요.</option>
                                                	<option value="ICE"> ICE </option>
                                                	<option value="HOT"> HOT </option>
	                                        	</select>
	                                    	</div>
	                                    	
	                                    	<div class="form-group label-floating has-error amount-class">
	                                        	<label class="control-label">amount</label>
	                                        	<input name="amount" type="number" class="form-control" value="0" id="amount" required>
	                                    	</div>
	                                	</div>
	                                	
	                                    <div class="col-sm-12">
	                                    	<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">message</i>
												</span>
	                                    		<div class="form-group">
		                                            <label>전달할 메시지를 입력하세요.</label>
		                                            <textarea class="form-control" rows="3" name="description" id="description" maxlength="200"></textarea>
		                                        </div>
		                                    </div> 
	                                    </div>
	                            	</div>
	                            </div>
	                            <div class="tab-pane" id="description">
	                                <div class="row">
	                                </div>
	                            </div>
	                            
	                            <br>
	                            
	                            <div class="footer-checkbox">
									<div class="col-sm-12">
									  <div class="checkbox">
										  <label id="optionsCheckboxes"> 
											  <input type="checkbox" name="optionsCheckboxes" id="optionsCheckboxes" required> 입력한 정보를 확인했습니다.
										  </label>
									  </div>
								  </div>
								</div>
								
								<br>
								
								<div class="footer-span form-group text-right">
									<span class="span-price">총 : ￦</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
								
	                        </div>
                        	<div class="wizard-footer">
                            	<div class="pull-right">
                                    <input type='button' onclick="return paymentPOST();" class='btn btn-finish btn-fill btn-wd btn-primary' name='finish' value='결제하기'>
                                </div>
                                <div class="clearfix"></div>
                        	</div>
	                    </form>
	                </div>
	            </div> <!-- wizard container -->
	        </div>
    	</div> <!-- row -->
	</div> <!--  big container -->
	
	<!------------------------------ [ 결제 api ] ------------------------------->					
	<script type="text/javascript">

		/* 결제 메서드 */
		function paymentPOST(){
			var returnTF = check();
//			alert(returnTF);
			if(returnTF == true){
				alert("잠시만 기다리시면 결제창이 열립니다.");
				var menu = document.getElementById('menu').value;
				switch(menu){
					case "Americano": 
						menuprice = 2000;
						break;
					case "Espresso": 
						menuprice = 1500;
						break;
					case "Caffelatte": 
						menuprice = 3000;
						break;
					case "Cappuccino": 
						menuprice = 3000;
						break;
					case "GreenteaLatte": 
						menuprice = 3500;
						break;
					case "Lemonade": 
						menuprice = 3500;
						break;
					default:
						menuprice = 0;
						return false;
				} // switch

				var email = document.getElementById('email').value;
				var phone = document.getElementById('phone').value;
				var menutype = document.getElementById('menutype').value;
				var order_date = document.getElementById('order_date').value;
				var amount = document.getElementById('amount').value;
				var price = menuprice * amount;
				var message = document.getElementById('description').value;
				
				IMP.init('imp30100127');
				IMP.request_pay({
				    pg : 'inicis', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(), // 영수증번호
				    name : menu +': '+ price + "원",
				    amount : price, // 판매 가격
				    buyer_email : email,
				    buyer_name : '',
				    buyer_tel : phone,
				    buyer_addr : '',
				    buyer_postcode : ''
				}, function(rsp) {
				    if ( rsp.success ) {
						$.ajax({
								type:"POST",
								dataType:"text",
								url:"payment/payment",
								data:{ email: email, 
									   phone: phone,
									   order_date: order_date,
									   menu: menu,
									   menutype: menutype,
									   amount: amount,
									   price: price,
									   message: message },
								success:function(){
									alert("결제가 완료되었습니다.");
									location.href="./index";
								}, // success
								error:function(){
									alert("결제에 실패하였습니다.");
								} // error
						}); // ajax
					}else{
				        var msg = '결제에 실패하였습니다.';
				    }
				    alert(msg);
				}); // request_pay
			} // if
		} // paymentPOST()

	</script>
	<!------------------------------ [ 결제 api ] ------------------------------->					

	<!-- script 영역 -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
	<!-- script 영역 -->
	
	<jsp:include page="../tiles/bottom.jsp"/>

	</c:otherwise>

  </c:choose>
  
</body>
</html>