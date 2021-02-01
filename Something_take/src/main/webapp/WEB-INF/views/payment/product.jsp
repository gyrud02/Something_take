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

	/* 결제 페이지로 이동 */
	function cartCheck(){
		var question = confirm("결제하시겠습니까?");
		if(question == true){
			alert("결제 페이지로 이동합니다.");
			location.href="cart";
		}else{
			alert("취소되었습니다.");
			return false;
		} // if
	} // cartCheck()
	
	/* 갯수 수정 메서드 */
	function cart(){
		var Q = confirm("추가하시겠습니까?");
		$(".cart_quantity_add").click(function(){
			if(Q == true){
				$.ajax({
					type:"GET",
					url:"member/updateCart",
					dataType:"text",
					data:{ cart_email:$("#session").val(),
						   product_id:$("#product_id").val(), 
						   product_name:$("#product_name").val(),
						   product_price:$("#product_price").val(),
						   product_amount:$("#product_amount").val() },
					success:function(textStatus){
						alert("추가되었습니다.");
						document.onload();
					}, // success
					error:function(textStatus){
						alert("오류가 발생하였습니다.");
					} // error
				}); // ajax
			}else{
				return false;
			}
		}); // click()
	} // cart()

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
								<h2>Product</h2>
								<input type="hidden" value="${email}" id="session">
								<div class="separator_auto"></div>
							</div>
		
							<div class="head_title_1 text-left">
							
<%-------------------------------------------- [form태그 시작] -------------------------------------------------------%>
							
							<form>
								<div class="table-responsive form-group text-center">
									<table class="table table-condensed">
										<thead>
											<tr class="cart_menu">
												<td class="cart_icons"></td>
												<td class="numbers"></td>
												<td class="menu" colspan="2"><b>메뉴</b></td>
												<td class="price"><b>가격</b></td>
												<td class="amount"><b>갯수</b></td>
												<td class="delete"></td>
												<td class="cart_icons"></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${productList}" var="productList">
											<tr class="text-center">
												<td class="cart_icons">
													<a class="cart_quantity_add" href="#"><i class="tim-icons icon-pin"></i></a>
												</td>
												<td class="cart_product_id">
													<input type="hidden" value="${productList.product_id}" id="product_id"> ${productList.product_id}
												</td>
												<td class="cart_product_image">
													<img src="${pageContext.request.contextPath}/resources/images/${productList.picture_url}">
												</td>
												<td class="cart_product_name text-left">
													<input type="hidden" value="${productList.product_name}" id="product_name"><b> ${productList.product_name}</b>
												</td>
												<td class="cart_price">
													<input type="hidden" value="${productList.price}" id="product_price"><p> ￦ ${productList.price}</p>
												</td>
												<td class="cart_amount amount">
													<input type="number" class="form-control" id="product_amount" value="0">
												</td>
												<td class="cart_delete">
													<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-refresh-01"></i></a>
												</td>
												<td class="cart_icons">
													<a class="cart_quantity_add" href="javascript:void(event);" onclick="return cart(event);"><i class="tim-icons icon-cart"></i></a>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-md-12 text-right">
									<input type="button" class="btn btn-primary" value="주문하기" onclick="return cartCheck();">
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