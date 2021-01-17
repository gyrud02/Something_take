<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/admin/css/nucleo-icons.css" rel="stylesheet" />
  <!-- Nucleo Icons -->
</head>
<style type="text/css">
	#quantity{width:25px;}
	section img{width:60px; height: 60px;}
	table td{height: 70px;}
</style>
<body>
	
	<br><br><br><br>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 mr-md-auto ml-md-auto">
					<div class="head_title_1 text-center">
						<h2>Cart</h2>
						<div class="separator_auto"></div>
					</div>

					<div class="head_title_1 text-left">
					
<!-------------------------------------------- [form태그 시작] -------------------------------------------------------->
					
					<form method="POST" onsubmit="">
						<div class="table-responsive cart_info text-center">
							<table class="table table-condensed">
								<thead>
									<tr class="cart_menu">
										<td class="icons"></td>
										<td class="image"><b>상품</b></td>
										<td class="price"><b>가격</b></td>
										<td class="quantity"><b>갯수</b></td>
										<td class="delete"></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cartList}" var="cartList">
									<tr>
										<td class="cart_product">
											<img src="${pageContext.request.contextPath}/resources/images/Me-americano.jpg">
										</td>
										<td class="cart_description">
											<b>${cartList.americano}</b>
										</td>
										<td class="cart_price">
											<p> ￦ 2,000</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href="#"><i class="tim-icons icon-simple-add"></i></a>
												<input type="text" name="quantity" id="quantity" value="${cartList.cartStock1}" autocomplete="off">
												<a class="cart_quantity_down" href="#"><i class="tim-icons icon-simple-delete"></i></a>
											</div>
										</td>
										<td class="cart_delete">
											<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-simple-remove" href="#"></i></a>
										</td>
									</tr>
									<tr>
										<td class="cart_product">
											<img src="${pageContext.request.contextPath}/resources/images/espresso.jpg">
										</td>
										<td class="cart_description">
											<b>${cartList.espresso}</b>
										</td>
										<td class="cart_price">
											<p> ￦ 1,500</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href="#"><i class="tim-icons icon-simple-add"></i></a>
												<input type="text" name="quantity" id="quantity" value="${cartList.cartStock2}" autocomplete="off">
												<a class="cart_quantity_down" href="#"><i class="tim-icons icon-simple-delete"></i></a>
											</div>
										</td>
										<td class="cart_delete">
											<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-simple-remove" href="#"></i></a>
										</td>
									</tr>
									<tr>
										<td class="cart_product">
											<img src="${pageContext.request.contextPath}/resources/images/caffelatte.jpg">
										</td>
										<td class="cart_description">
											<b>${cartList.caffelatte}</b>
										</td>
										<td class="cart_price">
											<p> ￦ 3,500</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href="#"><i class="tim-icons icon-simple-add"></i></a>
												<input type="text" name="quantity" id="quantity" value="${cartList.cartStock3}" autocomplete="off">
												<a class="cart_quantity_down" href="#"><i class="tim-icons icon-simple-delete"></i></a>
											</div>
										</td>
										<td class="cart_delete">
											<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-simple-remove" href="#"></i></a>
										</td>
									</tr>
									<tr>
										<td class="cart_product">
											<img src="${pageContext.request.contextPath}/resources/images/cappuccino.jpg">
										</td>
										<td class="cart_description">
											<b>${cartList.cappuccino}</b>
										</td>
										<td class="cart_price">
											<p> ￦ 3,800</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href="#"><i class="tim-icons icon-simple-add"></i></a>
												<input type="text" name="quantity" id="quantity" value="${cartList.cartStock4}" autocomplete="off">
												<a class="cart_quantity_down" href="#"><i class="tim-icons icon-simple-delete"></i></a>
											</div>
										</td>
										<td class="cart_delete">
											<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-simple-remove" href="#"></i></a>
										</td>
									</tr>
									<tr>
										<td class="cart_product">
											<img src="${pageContext.request.contextPath}/resources/images/greentea_latte.jpg">
										</td>
										<td class="cart_description">
											<b>${cartList.greentea_latte}</b>
										</td>
										<td class="cart_price">
											<p> ￦ 3,000</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href="#"><i class="tim-icons icon-simple-add"></i></a>
												<input type="text" name="quantity" id="quantity" value="${cartList.cartStock5}" autocomplete="off">
												<a class="cart_quantity_down" href="#"><i class="tim-icons icon-simple-delete"></i></a>
											</div>
										</td>
										<td class="cart_delete">
											<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-simple-remove" href="#"></i></a>
										</td>
									</tr>
									<tr>
										<td class="cart_product">
											<img src="${pageContext.request.contextPath}/resources/images/lemonade.jpg">
										</td>
										<td class="cart_description">
											<b>${cartList.lemonade}</b>
										</td>
										<td class="cart_price">
											<p> ￦ 4,000</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href="#"><i class="tim-icons icon-simple-add"></i></a>
												<input type="text" name="quantity" id="quantity" value="${cartList.cartStock6}" autocomplete="off">
												<a class="cart_quantity_down" href="#"><i class="tim-icons icon-simple-delete"></i></a>
											</div>
										</td>
										<td class="cart_delete">
											<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-simple-remove" href="#"></i></a>
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
			
<!-------------------------------------------- [form태그 끝] -------------------------------------------------------->
					
					</div>
				</div> <!-- class="col" -->
			</div> <!-- class="row" -->
		</div> <!-- class="container" -->
	</section>
	
	<br><br>
	
</body>
</html>