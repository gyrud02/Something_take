<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/admin/css/nucleo-icons.css" rel="stylesheet" />
  <!-- Nucleo Icons -->
</head>
<style type="text/css">
	.amount{width:60px;} 
	.cart_product_id, .cart_icons, .cart_delete{width:65px;}
	.cart_price{width:120px;}
	.cart_product_image, .cart_product_name{width:120px;}
	section img{width:60px; height: 50px;} 
	tbody td{height:80px;} thead{height:100px;}
</style>
<script type="text/javascript">

	/* 주문하기 */
	function orderCheck(){
		var question = confirm("주문하시겠습니까?");
		if(question == true){
			var name = document.getElementById('').value;
			var amount = document.getElementById('').value;
			var email = document.getElementById('session').value;
			
			IMP.init('imp30100127');
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(), // 영수증번호
			    name : '금액 : '+ total,
			    amount : amount, // 판매 가격
			    buyer_email : email,
			    buyer_name : '',
			    buyer_tel : '',
			    buyer_addr : '',
			    buyer_postcode : ''
			}, function(rsp) {
			    if ( rsp.success ) {
			    	payment(event);
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        return false;
			    }
			    alert(msg);
			}); // request_pay

			function payment(){
				$.ajax({
						type: "POST",
						url: "payment/",
						dataType:"text",
						data:{ email: email.value,
							   membership_type: name.value,
							   membership_pay: amount.value },
						success:function(textStatus){
							alert("결제가 완료되었습니다.");
							location.href="membership.me";
						}, // success
						error:function(textStatus){
							alert("결제 진행 중 오류가 발생하였습니다.");
							return false;
						} // error
				}); // ajax
			} // payment()
		}else{
			alert("주문이 취소되었습니다.");
			return false;
		}
	} // orderCheck()

</script>
<body>
	
	<br><br><br><br>

	<c:choose>
		<c:when test="${sessionScope.email = null}">
			<script type="text/javascript">
				alert("로그인 시 사용가능한 페이지입니다.");
				location.href="sign-in.me";
			</script>
		</c:when>
	
		<c:otherwise>
			<section>
				<div class="container">
					<div class="row">
						<div class="col-md-12 mr-md-auto ml-md-auto">
							<div class="head_title_1 text-center">
								<h2>CartList</h2>
								<div class="separator_auto"></div>
							</div>
		
							<div class="head_title_1 text-left">
							
<%-------------------------------------------- [form태그 시작] -------------------------------------------------------%>
							
							<form onsubmit="return orderCheck();">
								<div class="table-responsive form-group text-center">
									<table class="table table-condensed">
										<thead>
											<tr class="cart_menu">
												<td class="icons"></td>
												<td class="numbers"></td>
												<td class="menu" colspan="2"><b>메뉴</b></td>
												<td class="price"><b>가격</b></td>
												<td class="amount"><b>갯수</b></td>
												<td class="delete"></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${productList}" var="productList">
											<tr class="text-center">
												<td class="cart_icons">
													<a class="cart_quantity" href="#"><i class="tim-icons icon-pin"></i></a>
												</td>
												<td class="cart_product_id">
													${productList.product_id}
												</td>
												<td class="cart_product_image">
													<img src="${pageContext.request.contextPath}/resources/images/${productList.picture_url}">
												</td>
												<td class="cart_product_name text-left">
													<b>${productList.product_name}</b>
												</td>
												<td class="cart_price">
													<p> ￦ ${productList.price}</p>
												</td>
												<td class="cart_amount amount">
													<input type="text" value="${productList.product_amount}" class="form-control" readonly="readonly">
												</td>
												<td class="cart_delete">
													<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-refresh-01"></i></a>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-md-12 text-right">
									<input type="submit" class="btn btn-primary" value="결제하기">
								</div>
							</form>
					
<%-------------------------------------------- [form태그 끝] -------------------------------------------------------%>
							
							</div>
						</div> <!-- class="col" -->
					</div> <!-- class="row" -->
				</div> <!-- class="container" -->
			</section>
		</c:otherwise>
	</c:choose>
		
	<br><br>
	
</body>
</html>