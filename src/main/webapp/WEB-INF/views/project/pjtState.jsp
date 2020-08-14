<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <c:set var="root" value="${pageContext.request.contextPath}" />	
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>고객게시판</title>
  <!-- Custom fonts for this template-->
  <link href="${root}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
 <!-- Page Wrapper -->
  <div id="wrapper">
  
	<!-- Sidebar -->
	<jsp:include page="/WEB-INF/template/sidebar.jsp"/>
  
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
		<jsp:include page="/WEB-INF/template/topbar.jsp"/>

        <!-- Begin Page Content -->
        <div class="container-fluid">

        <!-- Page Heading -->
         <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Cards</h1>
          </div>


			<!-- 여기에 코드를 넣어주세요!! -->
		<c:forEach var="projectCnt" items="${projectCnt}">
				<c:set var="loop_flag" value="false" />
				<c:forEach var="projectDto" items="${projectDtoArray}">
				  <c:if test="${not loop_flag }">
				  		<c:set var="proname" value="${projectDto.proNum}"/>
				  			<c:if test="${projectCnt eq proname}">
				  			<c:set var="loop_flag" value="true" />
									<div class="row">
								
										<div class="col-xl-3 col-md-6 mb-4">
							              <div class="card border-left-info shadow h-100 py-2">
							                <div class="card-body">
							                  <div class="row no-gutters align-items-center">
							                    <div class="col mr-2">
							                      <div class="text-s font-weight-bold text-info text-uppercase mb-1">${projectDto.proName}</div>
							                      <div class="row no-gutters align-items-center">
							                        <div class="col-auto">
							                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${projectDto.proState}</div>
							                        </div>
							                        <div class="col">
							                          <div class="progress progress-sm mr-2">
							                            <div class="progress-bar bg-info" role="progressbar" style="width: ${projectDto.proState}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
							                          </div>
							                        </div>
							                      </div>
							                    </div>
							                    <div class="col-auto">
							                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
							                    </div>
							                  </div>
							                </div>
							              </div>
							            </div>
								</div>
								
							</c:if>
						</c:if>
					</c:forEach>
				</c:forEach>
			
		 
					
			</div>

      </div>
      
      <!-- End of Main Content -->

      <!-- Footer -->
      <jsp:include page="/WEB-INF/template/footer.jsp"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->
  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>


  <!-- Bootstrap core JavaScript -->
  <script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript -->
  <script src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages -->
  <script src="${root}/resources/js/sb-admin-2.min.js"></script>
</body>
</html>