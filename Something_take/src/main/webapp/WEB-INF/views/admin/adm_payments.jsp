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
	#membership_type{width: 80px;} #membership_reg_date{width: 100px;} #membership_end_date{width: 100px;}
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
            <a href="#">
              <i class="tim-icons icon-puzzle-10"></i>
              <p>Board</p>
            </a>
          </li>
          <li>
            <a href="ad_order">
              <i class="tim-icons icon-align-center"></i>
              <p>Ordered</p>
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
   
<!---------------------------- [윗 테이블] ---------------------------->	
    <div class="main-panel">
      
      <!-- End Navbar -->
      <div class="content  ">
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 회원 테이블</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
	                   <tr class="text-center">
	                      <th id="idx">
	                      	접수번호
	                      </th>
	                      <th id="name">
	                      	고객명
	                      </th>
	                      <th id="phone">
	                      	연락처
	                      </th>
	                      <th id="name">
	                      	답변
	                      </th>
	                      <th id="reg_date">
	                      	수신일자
	                      </th>
					  </tr> 
                    </thead>
                  
                  <c:forEach items="${msgList}" var="msgList">
                    <tbody>
                      <tr class="text-center">
                        <td id="idx">
                          ${msgList.msg_no}
                        </td>
                        <td id="name">
                          ${msgList.msg_name}
                        </td>
                        <td id="phone">
                          ${msgList.msg_phone}
                        </td>
                        <td id="name">
                          ${msgList.msg_answer}
                        </td>
                        <td id="reg_date">
                       		<fmt:formatDate value="${msgList.msg_send_date}" pattern="YY-MM-dd hh:mm:ss"/>
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
                <h4 class="card-title"> 멤버십 테이블</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
						<tr class="text-center">
	                      <th id="idx">
	                      	접수번호
	                      </th>
	                      <th>
	                      	내용
	                      </th>
						</tr>   
                    </thead>

				<c:forEach items="${msgList}" var="msgList">	
                    <tbody>
                      <tr class="text-center">
                        <td style="width:80px;">
                          ${msgList.msg_no}
                        </td>
                        <td class="text-left">
                        	<a href="msg/message?msg_no=${msgList.msg_no}">${msgList.msg_textarea}</a>
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
    
    <!--  Google Maps Plugin    -->
<%-- 
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
--%>    
    <!--  Google Maps Plugin    -->
    
    <!-- Chart JS -->
    <script src="${pageContext.request.contextPath}/resources/admin//js/plugins/chartjs.min.js"></script>
    <!-- Chart JS -->
    
    <!--  Notifications Plugin    -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/bootstrap-notify.js"></script>
    <!--  Notifications Plugin    -->

    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/black-dashboard.min.js?v=1.0.0" type="text/javascript"></script>
    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->

    <!-- Black Dashboard DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath}/resources/admin/demo/demo.js"></script>
    <!-- Black Dashboard DEMO methods, don't include it in your project! -->
    <script>
      $(document).ready(function() {
        $().ready(function() {
          $sidebar = $('.sidebar');
          $navbar = $('.navbar');

          $full_page = $('.full-page');

          $sidebar_responsive = $('body > .navbar-collapse');
          sidebar_mini_active = true;
          white_color = false;

          window_width = $(window).width();

          fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



          $('.fixed-plugin a').click(function(event) {
            // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
            if ($(this).hasClass('switch-trigger')) {
              if (event.stopPropagation) {
                event.stopPropagation();
              } else if (window.event) {
                window.event.cancelBubble = true;
              }
            }
          });

          $('.fixed-plugin .background-color span').click(function() {
            $(this).siblings().removeClass('active');
            $(this).addClass('active');

            var new_color = $(this).data('color');

            if ($sidebar.length != 0) {
              $sidebar.attr('data-color', new_color);
            }

            if ($navbar.length != 0) {
              $navbar.attr('data-color', new_color);
            }

            if ($full_page.length != 0) {
              $full_page.attr('filter-color', new_color);
            }

            if ($sidebar_responsive.length != 0) {
              $sidebar_responsive.attr('data-color', new_color);
            }
          });

          $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
            var $btn = $(this);

            if (sidebar_mini_active == true) {
              $('body').removeClass('sidebar-mini');
              sidebar_mini_active = false;
              blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
            } else {
              $('body').addClass('sidebar-mini');
              sidebar_mini_active = true;
              blackDashboard.showSidebarMessage('Sidebar mini activated...');
            }

            // we simulate the window Resize so the charts will get updated in realtime.
            var simulateWindowResize = setInterval(function() {
              window.dispatchEvent(new Event('resize'));
            }, 180);

            // we stop the simulation of Window Resize after the animations are completed
            setTimeout(function() {
              clearInterval(simulateWindowResize);
            }, 1000);
          });

          $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
            var $btn = $(this);

            if (white_color == true) {

              $('body').addClass('change-background');
              setTimeout(function() {
                $('body').removeClass('change-background');
                $('body').removeClass('white-content');
              }, 900);
              white_color = false;
            } else {

              $('body').addClass('change-background');
              setTimeout(function() {
                $('body').removeClass('change-background');
                $('body').addClass('white-content');
              }, 900);

              white_color = true;
            }


          });

          $('.light-badge').click(function() {
            $('body').addClass('white-content');
          });

          $('.dark-badge').click(function() {
            $('body').removeClass('white-content');
          });
        });
      });
    </script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("관리자 전용 페이지입니다.");
			location.href="./index.do";
		</script>
	</c:otherwise>

</c:choose>	
<!------------------------------------ [회원 목록 영역] ------------------------------------------->	
	
</body>
</html>