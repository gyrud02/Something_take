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
	#quantity{width:25px;}
	section img{width:60px; height: 60px;}
	table td{height: 70px;}
</style>
<script type="text/javascript">

	function cartCheck(){
		var question = confirm("결제하시겠습니까?");
	/*	if( $("#quantity").val() != 0 ){ */
			if(question == true){
				alert("결제 페이지로 이동합니다.");
				location.href="cartList";
			}else{
				alert("취소되었습니다.");
				return false;
			} // if
		}else{
			return false;
	/*	} */
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
							
							<form onsubmit="return cartCheck();">
								<div class="table-responsive cart_info text-center">
									<table class="table table-condensed">
										<thead>
											<tr class="cart_menu">
												<td class="icons"></td>
												<td class="image" colspan="2"><b>상품</b></td>
												<td class="price"><b>가격</b></td>
												<td class="quantity"><b>갯수</b></td>
												<td class="delete"></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cartList}" var="cartList">
											<tr>
												<td class="cart_product_id">
													${cartList.product_id}
												</td>
												<td class="cart_product">
													<img src="${pageContext.request.contextPath}/resources/images/${cartList.picture_url}">
													${cartList.product_name}
												</td>
												<td class="cart_description">
													<p> ￦ ${cartList.price}</p>
												</td>
												<td class="cart_price">
													<b>${cartList.product_amount}</b>
												</td>
												<td class="cart_delete">
													<a class="cart_quantity_delete" href="#"><i class="tim-icons icon-simple-remove" href="#"></i></a>
												</td>
											</tr>
											<tr class="text-right">
												<td colspan="5">
													<p>총 : ${cartList.cart_amount}개</p>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<p> ￦${cartList.cart_money}</p>
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