<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!--     Fonts and icons     -->
  
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/admin/css/nucleo-icons.css" rel="stylesheet" />
  <!-- Nucleo Icons -->

  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/admin/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Files -->
  
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/resources/admin/demo/demo.css" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
</head>
<style>
	#email{width: 135px;} #idx{width: 45px;} #name{width: 60px;} #reg_date{width: 100px;} #phone{width: 100px;}
	#navbar-menu{padding-left:137px;}
</style>

<!------------------------------------ [회원 목록 영역] ------------------------------------------->
<body class=" ">

	<br><br><br><br>

	<c:choose>
	
		<c:when test="${sessionScope.email == 'admin@Something-take.com'}">
		
	<!-- Table -->
	<div class="wrapper ">
	
<!---------------------------- [사이드바] ---------------------------->	
    <div class="sidebar">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="admin" class="simple-text logo-mini">
            Adm
          </a>
          <a href="admin" class="simple-text logo-normal">
            Something_take
          </a>
        </div>
        <ul class="nav">
          <li>
            <a href="admin">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
            <a href="ad_mem">
              <i class="tim-icons icon-atom"></i>
              <p>Members</p>
            </a>
          </li>
          <li class="active ">
            <a href="ad_pay">
              <i class="tim-icons icon-pin"></i>
              <p>Payments</p>
            </a>
          </li>
          <li>
            <a href="ad_order">
              <i class="tim-icons icon-align-center"></i>
              <p>Ordered</p>
            </a>
          </li>
          <li>
            <a href="ad_msg">
              <i class="tim-icons icon-bell-55"></i>
              <p>Messages</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="tim-icons icon-single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li>
            <a href="ad_board">
              <i class="tim-icons icon-puzzle-10"></i>
              <p>Board</p>
            </a>
          </li>
          <li>
            <a href="https://admin.iamport.kr/users/login" target="_blank">
              <i class="tim-icons icon-world"></i>
              <p>I'mport page</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
<!---------------------------- [사이드바] ---------------------------->	
   
<!---------------------------- [윗 테이블] ---------------------------->	
    <div class="main-panel">
      
      <!-- End Navbar -->
      <div class="content  ">
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 결제 내역</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
	                   <tr class="text-center">
	                      <th id="idx">
	                      	결제번호
	                      </th>
	                      <th id="name">
	                      	이메일
	                      </th>
	                      <th id="phone">
	                      	연락처
	                      </th>
	                      <th id="name">
	                      	메뉴
	                      </th>
	                      <th id="name">
	                      	ICE/HOT
	                      </th>
	                      <th id="name">
	                      	갯수
	                      </th>
	                      <th id="reg_date">
	                      	결제일자
	                      </th>
					  </tr> 
                    </thead>
                  
                  <c:forEach items="${pmList}" var="pmList">
                    <tbody>
                      <tr class="text-center">
                        <td id="idx">
                          ${pmList.order_id}
                        </td>
                        <td id="name">
                          ${pmList.email}
                        </td>
                        <td id="phone">
                          ${pmList.phone}
                        </td>
                        <td id="phone">
                          ${pmList.menu}
                        </td>
                        <td id="phone">
                          ${pmList.menutype}
                        </td>
                        <td id="name">
                          ${pmList.amount}
                        </td>
                        <td id="reg_date">
                       		<fmt:formatDate value="${pmList.order_date}" pattern="YY-MM-dd hh:mm:ss"/>
                        </td>
                      </tr>
                  	</tbody>
                  </c:forEach>	
                  
                  </table>
                </div>
              </div>
            </div>
          </div>
<!---------------------------- [윗 테이블] ---------------------------->	

<!---------------------------- [아래 테이블] ---------------------------->	
          <div class="col-md-12">
            <div class="card  card-plain">
              <div class="card-header">
                <h4 class="card-title"> 결제 테이블</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
						<tr class="text-center">
	                      <th id="idx">
	                      	결제번호
	                      </th>
	                      <th>
	                      	이메일
	                      </th>
	                      <th>
	                      	메뉴
	                      </th>
	                      <th id="name">
	                      	ICE/HOT
	                      </th>
	                      <th id="name">
	                      	갯수
	                      </th>
	                      <th>
	                      	전달메세지
	                      </th>
						</tr>   
                    </thead>

				<c:forEach items="${pmList}" var="pmList">	
                    <tbody>
                      <tr class="text-center">
                        <td style="width:80px;">
                          ${pmList.order_id}
                        </td>
                        <td id="name">
                          ${pmList.email}
                        </td>
                        <td id="phone">
                          ${pmList.menu}
                        </td>
                        <td id="phone">
                          ${pmList.menutype}
                        </td>
                        <td id="name">
                          ${pmList.amount}
                        </td>
                        <td class="text-center">
                        	<a href="#">${pmList.message}</a>
                        </td>
                      </tr>
                    </tbody>
                  </c:forEach> 
                   
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
    </div>
<!---------------------------- [아래 테이블] ---------------------------->	
    
    <div class="fixed-plugin"></div>

    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!--   Core JS Files   -->
    
    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/black-dashboard.min.js?v=1.0.0" type="text/javascript"></script>
    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->

	</c:when>
	
	<c:otherwise>
		<script>
			alert("관리자 전용 페이지입니다.");
			location.href="./index";
		</script>
	</c:otherwise>

</c:choose>	
<!------------------------------------ [회원 목록 영역] ------------------------------------------->	
	
</body>
</html>