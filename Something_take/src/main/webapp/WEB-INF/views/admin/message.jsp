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
</style>

<body class=" ">

  <div class="wrapper ">
    <div class="main-panel">
      
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h5 class="title">Messages</h5>
              </div>
              <div class="card-body">
                <form method="post" action="msg/answer">
                  <div class="row">
                    <div class="col-md-5 pr-md-1">
                      <div class="form-group">
                        <label>접수번호</label>
                        <input type="text" class="form-control" value="${vo.msg_no}" readonly="readonly">
                      </div>
                    </div>
                    <div class="col-md-3 px-md-1">
                      <div class="form-group">
                        <label>고객명</label>
                        <input type="text" class="form-control" value="${vo.msg_name}" readonly="readonly">
                      </div>
                    </div>
                    <div class="col-md-4 pl-md-1">
                      <div class="form-group">
                        <label>연락처</label>
                        <input type="text" class="form-control" value="${vo.msg_phone}" readonly="readonly">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pl-md-1">
                      <div class="form-group">
                        <label>수신일자</label>
                        <input type="text" class="form-control" value="${vo.msg_send_date}" readonly="readonly">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4 pr-md-1">
                      <div class="form-group">
                        <label>답변 유무</label>
						<br>
						
                        <c:choose>
                        	<c:when test="${vo.msg_answer == 'O'}">
		                        <input type="radio" value="O" name="msg_answer" checked="checked"> <label> O </label>
		                        &nbsp;&nbsp;&nbsp;
		                        <input type="radio" value="X" name="msg_answer"> <label> X </label>
                        	</c:when>
                        	<c:otherwise>
		                        <input type="radio" value="O" name="msg_answer"> <label> O </label>
		                        &nbsp;&nbsp;&nbsp;
		                        <input type="radio" value="X" name="msg_answer" checked="checked"> <label> X </label>
                        	</c:otherwise>
                        </c:choose>

                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-8">
                      <div class="form-group">
                        <label>문의 내용</label>
                        <textarea rows="4" cols="80" class="form-control" readonly="readonly">
                        	${vo.msg_textarea}
                        </textarea>
                      </div>
                    </div>
                  </div>
                  
	              <div class="row card-footer col-md-4 pr-md-1">
	                <button type="submit" class="btn btn-fill btn-primary">답변</button>
	              </div>
	              
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	    
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/core/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!--   Core JS Files   -->
    
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
    
</body>
</html>