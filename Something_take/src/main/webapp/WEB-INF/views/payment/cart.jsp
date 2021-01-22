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

	function cartCheck(){
		var question = confirm("결제하시겠습니까?");
	/*	if( $(".form-control").val() != 0 ){ */
			if(question == true){
				alert("결제 페이지로 이동합니다.");
				location.href="cartList";
			}else{
				alert("취소되었습니다.");
				return false;
			} // if
	/*	}else{
			alert("주문 내역을 확인하세요.");
			return false;
		} */
	} // cartCheck()

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
								<h2>Cart</h2>
								<div class="separator_auto"></div>
							</div>
		
							<div class="head_title_1 text-left">
							
<%-------------------------------------------- [form태그 시작] -------------------------------------------------------%>
							
							<form>
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
													<p> ${productList.product_id}</p>
												</td>
												<td class="cart_product_image">
													<img src="${pageContext.request.contextPath}/resources/images/${productList.picture_url}">
												</td>
												<td class="cart_product_name text-left">
													<p> ${productList.product_name}</p>
												</td>
												<td class="cart_price">
													<p> ￦ ${productList.price}</p>
												</td>
												<td class="cart_amount amount">
													<input type="number" min="0" value="${productList.product_amount}" class="form-control">
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