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
  <link rel="stylesheet" href="${root}/resources/css/pjtmain.css">
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
           <h1 class="h3 mb-0 text-gray-800">공지사항 글보기</h1>
        </div>

   			 <div>
				  <a href="${root}/project/pjtWrite.do" class="btn btn-primary btn-icon-split" style="float: right;" data-toggle="modal" data-target="#WriteModal">
	                <span class="icon text-white-50">
		                  <i class="fas fa-pencil-alt"></i>
		             </span>
		             <span class="text">프로젝트 생성</span>
		          </a>
			</div>
				
						
			<div class="flip-card">
				<div class="flip-card-inner">
					<div class="flip-card-front1">
						<p>웹사이트 프로젝트</p>
						</br>
						<p>최대인원 : n명</p>

					</div>
					<a href="${root}/project/read.do">
					<div class="flip-card-back1">
						<p>팀장</p>
						</br>
						<p>현재인원 : n명</p>

					</div>
					</a>
				</div>
			</div>

		
				<div class="flip-card">
				<div class="flip-card-inner">
					<div class="flip-card-front2">
						<p>웹사이트 프로젝트</p>
						</br>
						<p>최대인원 : n명</p>

					</div>
					<div class="flip-card-back2">
						<a href="${root}/project/read.do"></a>
						<p>팀장</p>
						</br>
						<p>현재인원 : n명</p>

					</div>
				</div>
			</div>
					
         <!-- /.container-fluid -->



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