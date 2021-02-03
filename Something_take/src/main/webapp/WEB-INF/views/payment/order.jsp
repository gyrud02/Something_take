<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</head>
<script type="text/javascript">

	$(document).ready(function(){
		$(".menu-class").removeClass("has-error");
		$(".type-class").removeClass("has-error");
		$(".amount-class").removeClass("has-error");
	});

	/* 유효성 검사 */
	function formCheck(){
		$("#next").click(function(){

			// 메뉴
			if( $("#menu option:selected").val() == 0 ){
				$(".menu-class").addClass("has-error");
				return false;
			}
			
			// 타입
			if( $("#type option:selected").val() == 0 ){
				$(".type-class").addClass("has-error");
				return false;
			}

			// 갯수
			if( $("#amount").val() == 0 ){
				$(".amount-class").addClass("has-error");
				return false;
			}
			
			// 체크박스
			if( !($(".checkbox").is(":checked")) ){
				$(".checkbox").attr("style", "color:red;");
				return false;
			}
			
		}); // click()
	} // formCheck()

</script>
<body class="lightbg" data-spy="scroll" data-target=".navbar-collapse">
	    
    <!--   Big container   -->
    <div class="container">
        <div class="row">
	        <div class="col-sm-8 col-sm-offset-2">
	            <!-- Wizard container -->
	            <div class="wizard-container">
	                <div class="card wizard-card" data-color="blue" id="wizard">
	                
	                    <form novalidate="novalidate" id="frm" onsubmit="return formCheck();">
	                    	
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
		                                          	<input name="email" type="text" class="form-control" value="${sessionScope.email}" id="email" readonly>
		                                        </div>
											</div>
											
											<br>
											
											<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">phone</i>
												</span>
												<div class="form-group label-floating">
		                                          	<label class="control-label">Your Phone</label>
		                                          	<input name="phone" type="text" class="form-control" id="phone" required>
		                                        </div>
											</div>

	                                	</div>
	                                	<div class="col-sm-6">
	                                    	<div class="form-group label-floating has-error menu-class">
	                                        	<label class="control-label">Menu</label>
                                        		<select class="form-control" id="menu" name="menu">
													<option value="0">메뉴를 선택하세요.</option>
                                                	<option value="Americano"> 아메리카노(Americano) </option>
                                                	<option value="Espresso"> 에스프레소(Espresso) </option>
                                                	<option value="Caffelatte"> 카페라떼(Caffelatte) </option>
                                                	<option value="Cappuccino"> 카푸치노(Cappuccino) </option>
                                                	<option value="GreenteaLatte"> 녹차라떼(GreenteaLatte) </option>
                                                	<option value="Lemonade"> 레모네이드(Lemonade) </option>
	                                        	</select>
	                                    	</div>
	                                    	<div class="form-group label-floating has-error type-class">
	                                        	<label class="control-label">type</label>
                                        		<select class="form-control" id="type" name="type">
													<option value="0">타입을 선택하세요.</option>
                                                	<option value="ICE"> ICE </option>
                                                	<option value="HOT"> HOT </option>
	                                        	</select>
	                                    	</div>
	                                    	<div class="form-group label-floating has-error amount-class">
	                                        	<label class="control-label">amount</label>
	                                        	<input name="amount" type="number" class="form-control" value="0" id="amount">
	                                    	</div>
	                                	</div>
	                            	</div>
	                            </div>
	                            <div class="tab-pane" id="description">
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                    	<div class="input-group">
												<span class="input-group-addon">
													<i class="material-icons">message</i>
												</span>
	                                    		<div class="form-group">
		                                            <label>전달할 메시지를 입력하세요.</label>
		                                            <textarea class="form-control" rows="6" name="description" id="description"></textarea>
		                                        </div>
		                                    </div> 
	                                    </div>
	                                    <div class="col-sm-4">
	                                    	<div class="form-group">
	                                            <label class="control-label">Example</label>
	                                            <p class="description">"ICE : 얼음 적게 넣어주세요.",<br>"HOT: 너무 뜨겁지 않게 해주세요."</p>
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

	<!-- script 영역 -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
	<!-- script 영역 -->
	
	<footer>
		<jsp:include page="../tiles/bottom.jsp"/>
	</footer>

</body>
</html>