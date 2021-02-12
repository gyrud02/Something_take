<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<!------------------------------------ [결제 내역 영역] ------------------------------------------->
<body>

	<br><br><br><br><br>

	<c:choose>
		<c:when test="${sessionScope.email == null}">
			<script type="text/javascript">
				alert("로그인 시 사용 가능한 페이지입니다.");
				location.href="sign-in";
			</script>
		</c:when>

		<c:when test="${pmList == null}">
	      <!-- Hero Area Start-->
	      <div class="slider-area ">
	          <div class="single-slider slider-height2 d-flex align-items-center">
	              <div class="container">
	                  <div class="row">
	                      <div class="col-xl-12">
                            <div class="wizard-header">
	                    		<div class="head_title_1 text-center">
								<h2>주문 내역</h2>
								<div class="separator_auto"></div>
								</div>
							</div>
	                      </div>
	                  </div>
	              </div>
	          </div>
	      </div>
		</c:when>

		<c:when test="${pmList != null}">
			<!-- Hero Area Start-->
	      <div class="slider-area ">
	          <div class="single-slider slider-height2 d-flex align-items-center">
	              <div class="container">
	                  <div class="row">
	                      <div class="col-xl-12">
                            <div class="wizard-header">
	                    		<div class="head_title_1 text-center">
								<h2>주문 내역</h2>
								<div class="separator_auto"></div>
								</div>
							</div>
	                      </div>
	                  </div>
	              </div>
	          </div>
	      </div>
	      
	      <br><br><br>
	      
	      <!--================ confirmation part start =================-->
	      <section class="confirmation_part section_padding">
	        <div class="container">    
	          <div class="row">
                <div class="col-lg-12 form-control">
	              <div class="order_details_iner">
	                <h3 class="text-center"> 주문 내역이 없습니다. </h3>
				  </div>
				</div>                  
              </div>
            </div>
          </section>
	          <!-- 
	          <div class="row">
	            <div class="col-lg-4 col-lx-4">
	              <div class="single_confirmation_details" style="border-color: lime;">
	                <h4>order info</h4>
	                <ul>
	                  <li>
	                    <p>order number<span>: 60235</span></p>
	                  </li>
	                  <li>
	                    <p>data<span>: Oct 03, 2017</span></p>
	                  </li>
	                  <li>
	                    <p>total<span>: USD 2210</span></p>
	                  </li>
	                  <li>
	                    <p>mayment methord<span>: Check payments</span></p>
	                  </li>
	                </ul>
	              </div>
	            </div>
	          </div> -->
	          
	      <!--================ confirmation part start =================-->
	      <section class="confirmation_part section_padding">
	        <div class="container">    
	          <div class="row">
                
                <br><br>
                
                <c:forEach items="${pmList}" var="pmList">	
	            <div class="col-lg-12 form-control">
	              <div class="order_details_iner">
	                <h3>${pmList.order_date}</h3>
	                <table class="table table-borderless">
	                  <thead>
	                    <tr>
	                      <th scope="col" colspan="2">Product</th>
	                      <th scope="col">Amount</th>
	                      <th scope="col">Total</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	                    <tr>
	                      <th colspan="2"><span>${pmList.menu}</span></th>
	                      <th>${pmList.amount}</th>
	                      <th> <span>￦ ${pmList.price}</span></th>
	                    </tr>
	                  </tbody>
	                  <tfoot>
	                    <tr>
	                      <th scope="col" colspan="2">Message :</th>
	                      <th scope="col"> ${pmList.message}</th>
	                      <th scope="col">Menutype : ￦ ${pmList.menutype}</th>
	                    </tr>
	                  </tfoot>
	                </table>
	              </div>
	            </div>
                </c:forEach>
                
	          </div>
	        </div>
	      </section>
	      <!--================ confirmation part end =================-->
		</c:when>
		  
	</c:choose>						

	<br><br>

</body>
<!------------------------------------ [결제 내역 영역] ------------------------------------------->
</html>