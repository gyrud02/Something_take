<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!--     Fonts and icons    -->
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

<body class=" ">

  <br><br>

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
          <li>
            <a href="ad_pay">
              <i class="tim-icons icon-pin"></i>
              <p>Payments</p>
            </a>
          </li>
          <li class="active ">
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
            <a href="#">
              <i class="tim-icons icon-world"></i>
              <p>RTL Support</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
<!---------------------------- [사이드바] ---------------------------->	
   
    <div class="main-panel">
      
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">Notifications Style</h4>
              </div>
              <div class="card-body">
                <div class="alert alert-info">
                  <span>This is a plain notification</span>
                </div>
                <div class="alert alert-info">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span>This is a notification with close button.</span>
                </div>
                <div class="alert alert-info alert-with-icon" data-notify="container">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span data-notify="icon" class="tim-icons icon-bell-55"></span>
                  <span data-notify="message">This is a notification with close button and icon.</span>
                </div>
                <div class="alert alert-info alert-with-icon" data-notify="container">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span data-notify="icon" class="tim-icons icon-bell-55"></span>
                  <span data-notify="message">This is a notification with close button and icon and have many lines. You can see that the icon and the close button are always vertically aligned. This is a beautiful notification. So you don't have to worry about the style.</span>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">Notification states</h4>
              </div>
              <div class="card-body">
                <div class="alert alert-primary">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span>
                    <b> Primary - </b> This is a regular notification made with ".alert-primary"</span>
                </div>
                <div class="alert alert-info">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span>
                    <b> Info - </b> This is a regular notification made with ".alert-info"</span>
                </div>
                <div class="alert alert-success">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span>
                    <b> Success - </b> This is a regular notification made with ".alert-success"</span>
                </div>
                <div class="alert alert-warning">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span>
                    <b> Warning - </b> This is a regular notification made with ".alert-warning"</span>
                </div>
                <div class="alert alert-danger">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span>
                    <b> Danger - </b> This is a regular notification made with ".alert-danger"</span>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="places-buttons">
                  <div class="row">
                    <div class="col-md-6 ml-auto mr-auto text-center">
                      <h4 class="card-title">
                        Notifications Places
                        <p class="category">Click to view notifications</p>
                      </h4>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-8 ml-auto mr-auto">
                      <div class="row">
                        <div class="col-md-4">
                          <button class="btn btn-primary btn-block" onclick="demo.showNotification('top','left')">Top Left</button>
                        </div>
                        <div class="col-md-4">
                          <button class="btn btn-primary btn-block" onclick="demo.showNotification('top','center')">Top Center</button>
                        </div>
                        <div class="col-md-4">
                          <button class="btn btn-primary btn-block" onclick="demo.showNotification('top','right')">Top Right</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-8 ml-auto mr-auto">
                      <div class="row">
                        <div class="col-md-4">
                          <button class="btn btn-primary btn-block" onclick="demo.showNotification('bottom','left')">Bottom Left</button>
                        </div>
                        <div class="col-md-4">
                          <button class="btn btn-primary btn-block" onclick="demo.showNotification('bottom','center')">Bottom Center</button>
                        </div>
                        <div class="col-md-4">
                          <button class="btn btn-primary btn-block" onclick="demo.showNotification('bottom','right')">Bottom Right</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    </div>

<!---------------------------- [스크립트 영역] ---------------------------->	
    
    <div class="fixed-plugin"></div>

    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!--   Core JS Files   -->
    
    <!--  Notifications Plugin    -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/bootstrap-notify.js"></script>
    <!--  Notifications Plugin    -->

	<!-- Black Dashboard DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath}/resources/admin/demo/demo.js"></script>
	<!-- Black Dashboard DEMO methods, don't include it in your project! -->

<!---------------------------- [스크립트 영역] ---------------------------->	

	</c:when>
	
	<c:otherwise>
		<script>
			alert("관리자 전용 페이지입니다.");
			location.href="./index.do";
		</script>
	</c:otherwise>

</c:choose>	
<!------------------------------------ [주문 목록 영역] ------------------------------------------->	

</html>