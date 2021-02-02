<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- link -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
	<!-- link -->
	
	<!-- Nucleo Icons -->
	<link href="${pageContext.request.contextPath}/resources/admin/css/nucleo-icons.css" rel="stylesheet" />
	<!-- Nucleo Icons -->
</head>
<style type="text/css">

	.nav navbar-nav navbar-right{
		padding-left: 1em;
	}

</style>
<body class="image-container set-full-height" style="background-image: url('http://demos.creative-tim.com/material-bootstrap-wizard/assets/img/wizard-book.jpg')">

	<br><br><br><br>

    <!--   Big container   -->
    <div class="container">
        <div class="row">
        <!-- 
	        <div class="col-sm-8 col-sm-offset-2">
         -->
	        <div class="col-md-8 col-sm-offset-2">
	            <!-- Wizard container -->
	            <div class="wizard-container">
	                <div class="card wizard-card" data-color="blue" id="wizard">
	                
	                    <form action="" method="" novalidate="novalidate">
	                    	
	                    	<br><br>
	                    
	                    	<div class="wizard-header">
	                    		<div class="head_title_1 text-center">
								<h2>Ordered</h2>
								<div class="separator_auto"></div>
								<p>This information will let us know more about you.</p>
								</div>
							</div>
							
							<br>
							
							<div class="wizard-navigation">
								<ul>
		                            <li><a href="#details" data-toggle="tab"> 주문 정보 1 </a></li>
		                            <li><a href="#description" data-toggle="tab"> 주문 정보 2 </a></li>
		                        </ul>
							</div>

							<br>

	                        <div class="tab-content">
	                            <div class="tab-pane" id="details">
	                            	<div class="row">
	                                	<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">email</i>
												</span>
												<div class="form-group label-floating">
		                                          	<label class="control-label">Your Email</label>
		                                          	<input name="email" type="text" class="form-control" required>
		                                        </div>
											</div>
											
											<br>
											
											<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">phone</i>
												</span>
												<div class="form-group label-floating">
		                                          	<label class="control-label">Your Phone</label>
		                                          	<input name="phone" type="text" class="form-control" required>
		                                        </div>
											</div>

	                                	</div>
	                                	<div class="col-sm-6">
	                                    	<div class="form-group label-floating">
	                                        	<label class="control-label">Menu</label>
                                        		<select class="form-control">
													<option disabled="" selected="">메뉴를 선택하세요.</option>
                                                	<option value="Americano"> 아메리카노(Americano) </option>
                                                	<option value="Espresso"> 에스프레소(Espresso) </option>
                                                	<option value="Caffelatte"> 카페라떼(Caffelatte) </option>
                                                	<option value="Cappuccino"> 카푸치노(Cappuccino) </option>
                                                	<option value="GreenteaLatte"> 녹차라떼(GreenteaLatte) </option>
                                                	<option value="Lemonade"> 레모네이드(Lemonade) </option>
	                                        	</select>
	                                    	</div>
	                                    	<div class="form-group label-floating">
	                                        	<label class="control-label">type</label>
                                        		<select class="form-control">
													<option disabled="" selected="">타입을 선택하세요.</option>
                                                	<option value="ICE"> ICE </option>
                                                	<option value="HOT"> HOT </option>
	                                        	</select>
	                                    	</div>
	                                    	<div class="form-group label-floating">
	                                        	<label class="control-label">amount</label>
	                                        	<input name="amount" type="number" class="form-control" value="0">
	                                    	</div>
	                                	</div>
	                            	</div>
	                            </div>
	                            <div class="tab-pane" id="description">
	                                <div class="row">
	                                    <h4 class="info-text"> Drop us a small description.</h4>
	                                    <div class="col-sm-6 col-sm-offset-1">
                                    		<div class="form-group">
	                                            <label>Room description</label>
	                                            <textarea class="form-control" placeholder="" rows="6"></textarea>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-4">
	                                    	<div class="form-group">
	                                            <label class="control-label">Example</label>
	                                            <p class="description">"The room really nice name is recognized as being a really awesome room. We use it every sunday when we go fishing and we catch a lot. It has some kind of magic shield around it."</p>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            
	                            <br>
	                            
	                            <div class="footer-checkbox">
									<div class="col-sm-12">
									  <div class="checkbox">
										  <label>
											  <input type="checkbox" name="optionsCheckboxes"> 입력한 정보를 확인했습니다.
										  </label>
									  </div>
								  </div>
								</div>
	                        </div>
                        	<div class="wizard-footer">
                            	<div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-wd btn-primary' name='next' value='Next' />
                                    <input type='button' class='btn btn-finish btn-fill btn-wd btn-primary' name='finish' value='Finish' />
                                </div>
                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
								</div>
                                <div class="clearfix"></div>
                        	</div>
	                    </form>
	                </div>
	            </div> <!-- wizard container -->
	        </div>
    	</div> <!-- row -->
	</div> <!--  big container -->

	<br>

	<!-- script 영역 -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
	<!-- script 영역 -->

</body>
</html>