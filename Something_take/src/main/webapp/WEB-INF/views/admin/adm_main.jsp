<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	#navbar-menu{padding-left:137px;}
</style>
<body class=" ">

	<br><br>

	<c:choose>
	
		<c:when test="${sessionScope.email == 'admin@Something-take.com'}">  	
  	
	  	<div class="wrapper ">
	    <div class="sidebar">
	      <!--
	        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
	    -->
	      <div class="sidebar-wrapper">
	        <div class="logo">
	          <a href="admin" class="simple-text logo-mini">
	            Admin
	          </a>
	          <a href="admin" class="simple-text logo-normal">
	            Something_take
	          </a>
	        </div>
	        <ul class="nav">
	          <li class="active ">
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
	    
	    <div class="main-panel">
	      
	      <!-- End Navbar -->
	      <div class="content">
	        <div class="row">
	          <div class="col-12">
	            <div class="card card-chart">
	              <div class="card-header ">
	                <div class="row">
	                  <div class="col-sm-6 text-left">
	                    <h5 class="card-category">Total Shipments</h5>
	                    <h2 class="card-title">Performance</h2>
	                  </div>
	                  <div class="col-sm-6">
	                    <div class="btn-group btn-group-toggle float-right" data-toggle="buttons">
	                      <label class="btn btn-sm btn-primary btn-simple active" id="0">
	                        <input type="radio" name="options" autocomplete="off" checked> Accounts
	                      </label>
	                      <label class="btn btn-sm btn-primary btn-simple " id="1">
	                        <input type="radio" name="options" autocomplete="off"> Purchases
	                      </label>
	                      <label class="btn btn-sm btn-primary btn-simple " id="2">
	                        <input type="radio" name="options" autocomplete="off"> Sessions
	                      </label>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              
	              <div class="card-body">
	                <div class="chart-area">
	                  <canvas id="chartBig1"></canvas>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-lg-4">
	            <div class="card card-chart">
	              <div class="card-header ">
	                <h5 class="card-category">Total Shipments</h5>
	                <h3 class="card-title"><i class="tim-icons icon-bell-55 text-primary "></i> 763,215</h3>
	              </div>
	              <div class="card-body ">
	                <div class="chart-area">
	                  <canvas id="chartLinePurple"></canvas>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="col-lg-4">
	            <div class="card card-chart">
	              <div class="card-header ">
	                <h5 class="card-category">Daily Sales</h5>
	                <h3 class="card-title"><i class="tim-icons icon-delivery-fast text-info "></i> 3,500€</h3>
	              </div>
	              <div class="card-body ">
	                <div class="chart-area">
	                  <canvas id="CountryChart"></canvas>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="col-lg-4">
	            <div class="card card-chart">
	              <div class="card-header ">
	                <h5 class="card-category">Completed Tasks</h5>
	                <h3 class="card-title"><i class="tim-icons icon-send text-success "></i> 12,100K</h3>
	              </div>
	              <div class="card-body ">
	                <div class="chart-area">
	                  <canvas id="chartLineGreen"></canvas>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="row">
	          <div class="col-lg-6 col-md-12">
	            <div class="card card-tasks">
	              <div class="card-header ">
	                <h6 class="title d-inline">Tasks(5)</h6>
	                <p class="card-category d-inline">today</p>
	                <div class="dropdown">
	                  <button type="button" class="btn btn-link dropdown-toggle btn-icon" data-toggle="dropdown">
	                    <i class="tim-icons icon-settings-gear-63"></i>
	                  </button>
	                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
	                    <a class="dropdown-item" href="#">Action</a>
	                    <a class="dropdown-item" href="#">Another action</a>
	                    <a class="dropdown-item" href="#">Something else</a>
	                  </div>
	                </div>
	              </div>
	              <div class="card-body ">
	                <div class="table-full-width table-responsive">
	                  <table class="table">
	                    <tbody>
	                      <tr>
	                        <td>
	                          <div class="form-check">
	                            <label class="form-check-label">
	                              <input class="form-check-input" type="checkbox" value="">
	                              <span class="form-check-sign">
	                                <span class="check"></span>
	                              </span>
	                            </label>
	                          </div>
	                        </td>
	                        <td>
	                          <p class="title">Update the Documentation</p>
	                          <p class="text-muted">Dwuamish Head, Seattle, WA 8:47 AM</p>
	                        </td>
	                        <td class="td-actions text-right">
	                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
	                            <i class="tim-icons icon-pencil"></i>
	                          </button>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <div class="form-check">
	                            <label class="form-check-label">
	                              <input class="form-check-input" type="checkbox" value="" checked="">
	                              <span class="form-check-sign">
	                                <span class="check"></span>
	                              </span>
	                            </label>
	                          </div>
	                        </td>
	                        <td>
	                          <p class="title">GDPR Compliance</p>
	                          <p class="text-muted">The GDPR is a regulation that requires businesses to protect the personal data and privacy of Europe citizens for transactions that occur within EU member states.</p>
	                        </td>
	                        <td class="td-actions text-right">
	                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
	                            <i class="tim-icons icon-pencil"></i>
	                          </button>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <div class="form-check">
	                            <label class="form-check-label">
	                              <input class="form-check-input" type="checkbox" value="">
	                              <span class="form-check-sign">
	                                <span class="check"></span>
	                              </span>
	                            </label>
	                          </div>
	                        </td>
	                        <td>
	                          <p class="title">Solve the issues</p>
	                          <p class="text-muted">Fifty percent of all respondents said they would be more likely to shop at a company </p>
	                        </td>
	                        <td class="td-actions text-right">
	                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
	                            <i class="tim-icons icon-pencil"></i>
	                          </button>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <div class="form-check">
	                            <label class="form-check-label">
	                              <input class="form-check-input" type="checkbox" value="">
	                              <span class="form-check-sign">
	                                <span class="check"></span>
	                              </span>
	                            </label>
	                          </div>
	                        </td>
	                        <td>
	                          <p class="title">Release v2.0.0</p>
	                          <p class="text-muted">Ra Ave SW, Seattle, WA 98116, SUA 11:19 AM</p>
	                        </td>
	                        <td class="td-actions text-right">
	                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
	                            <i class="tim-icons icon-pencil"></i>
	                          </button>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <div class="form-check">
	                            <label class="form-check-label">
	                              <input class="form-check-input" type="checkbox" value="">
	                              <span class="form-check-sign">
	                                <span class="check"></span>
	                              </span>
	                            </label>
	                          </div>
	                        </td>
	                        <td>
	                          <p class="title">Export the processed files</p>
	                          <p class="text-muted">The report also shows that consumers will not easily forgive a company once a breach exposing their personal data occurs. </p>
	                        </td>
	                        <td class="td-actions text-right">
	                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
	                            <i class="tim-icons icon-pencil"></i>
	                          </button>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <div class="form-check">
	                            <label class="form-check-label">
	                              <input class="form-check-input" type="checkbox" value="">
	                              <span class="form-check-sign">
	                                <span class="check"></span>
	                              </span>
	                            </label>
	                          </div>
	                        </td>
	                        <td>
	                          <p class="title">Arival at export process</p>
	                          <p class="text-muted">Capitol Hill, Seattle, WA 12:34 AM</p>
	                        </td>
	                        <td class="td-actions text-right">
	                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
	                            <i class="tim-icons icon-pencil"></i>
	                          </button>
	                        </td>
	                      </tr>
	                    </tbody>
	                  </table>
	                </div>
	              </div>
	            </div>
	          </div>
	          
	          <div class="col-lg-6 col-md-12">
	            <div class="card ">
	              <div class="card-header">
	                <h4 class="card-title"> Simple Table</h4>
	              </div>
	              <div class="card-body">
	                <div class="table-responsive">
	                  <table class="table tablesorter " id="">
	                    <thead class=" text-primary">
	                      <th>
	                        Name
	                      </th>
	                      <th>
	                        Country
	                      </th>
	                      <th>
	                        City
	                      </th>
	                      <th class="text-center">
	                        Salary
	                      </th>
	                    </thead>
	                    <tbody>
	                      <tr>
	                        <td>
	                          Dakota Rice
	                        </td>
	                        <td>
	                          Niger
	                        </td>
	                        <td>
	                          Oud-Turnhout
	                        </td>
	                        <td class="text-center">
	                          $36,738
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          Minerva Hooper
	                        </td>
	                        <td>
	                          Curaçao
	                        </td>
	                        <td>
	                          Sinaai-Waas
	                        </td>
	                        <td class="text-center">
	                          $23,789
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          Sage Rodriguez
	                        </td>
	                        <td>
	                          Netherlands
	                        </td>
	                        <td>
	                          Baileux
	                        </td>
	                        <td class="text-center">
	                          $56,142
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          Philip Chaney
	                        </td>
	                        <td>
	                          Korea, South
	                        </td>
	                        <td>
	                          Overland Park
	                        </td>
	                        <td class="text-center">
	                          $38,735
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          Doris Greene
	                        </td>
	                        <td>
	                          Malawi
	                        </td>
	                        <td>
	                          Feldkirchen in Kärnten
	                        </td>
	                        <td class="text-center">
	                          $63,542
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          Mason Porter
	                        </td>
	                        <td>
	                          Chile
	                        </td>
	                        <td>
	                          Gloucester
	                        </td>
	                        <td class="text-center">
	                          $78,615
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          Jon Porter
	                        </td>
	                        <td>
	                          Portugal
	                        </td>
	                        <td>
	                          Gloucester
	                        </td>
	                        <td class="text-center">
	                          $98,615
	                        </td>
	                     </tr>
	                   </tbody>
	                 </table>
	               </div>
	             </div>
	           </div>
	         </div>
	       </div>
	    </div>
	  </div>
	</div> 
	    
    <div class="fixed-plugin"></div>
	    
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!--   Core JS Files   -->
    
    <!-- Chart JS -->
    <script src="${pageContext.request.contextPath}/resources/admin//js/plugins/chartjs.min.js"></script>
    <!-- Chart JS -->
    
    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/black-dashboard.min.js?v=1.0.0" type="text/javascript"></script>
    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->

    <!-- Black Dashboard DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath}/resources/admin/demo/demo.js"></script>
    <!-- Black Dashboard DEMO methods, don't include it in your project! -->
    <script>
      $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

      });
    </script>
    </c:when>
	
	<c:otherwise>
		<script>
			alert("관리자 전용 페이지입니다.");
			location.href="./index";
		</script>
	</c:otherwise>
</c:choose>	
	
</body>
</html>