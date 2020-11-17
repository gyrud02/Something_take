<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">

	<section>
		<div class="container">	
			<div class="row">
				<div class="col-md-4 mr-md-auto ml-md-auto">
					<div class="head_title_1 text-center">
						<div class="Errorjpg"><img src="${pageContext.request.contextPath}/resources/images/Err404.jpg" alt="Err"/></div>	
						<div class="Errbtn"><button class="btn btn-primary" onclick="location.href='./index.do'">돌아가기</button></div>
						<div class="ErrImg1">
							<div class="separator_auto">
							<h2 class="ErrMsg">404 Error</h2>
								<p class="ErrImg">페이지를 찾을 수 없습니다. <br><br>
								 존재하지 않는 주소를 입력하셨거나 요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다. <br>
								 궁금한 점이 있으시면 <a href="#">고객센터</a>를 통해 문의해 주시기 바랍니다.<br>
								 감사합니다.</p>
							</div>	 
						</div>
					</div>
				</div>
			</div>
		</div>		
	</section>
</body>

<style>

	.Errorjpg {position: relative;}
	.ErrImg {position: absolute;
			 left: -80px;
			 bottom: 132px;
			 width: 550px;
			 font-size: 5em;
			 font-weight: bold;}
	.ErrMsg {position: absolute;
			top: 190px;
			left: 41px;
			width: 300px;}
	.Errbtn {position: absolute;
			 bottom: 5px; 
			 left: 120px;}		
</style>
 
</html>