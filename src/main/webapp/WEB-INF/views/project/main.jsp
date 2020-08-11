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

		<!-- 글 작성 버틍 -->
		<div>
			<a href="#" class="btn btn-primary btn-circle btn-md"
							data-toggle="modal" data-target="#WriteModal" style="float:right"> <!-- <a href="${root}/manager/noticeCreate.do" class="btn btn-primary btn-circle btn-md"> -->
							<i class="fas fa-pen"></i>
			</a>
		</div>	
				
						
			<div class="flip-card">
				<div class="flip-card-inner">
					<div class="flip-card-front1">
						<p>웹사이트 프로젝트</p>
						</br>
						<p>최대인원 : n명</p>

					</div>
					<a href="${root}/workspace/workspace.do">
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

	<!-- Write Model -->
	<div class="modal fade" id="WriteModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">프로젝트 생성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- modal-body -->
				<div class="modal-body">


					<!--프로젝트 제목 && 인원수 -->
					<div class="form-group row">
						<div class="col-sm-12">
							<input type="text" class="form-control" id="inputTitle"
								style="display: inline; width: 85%;" rows="20"
								margin-right:30px; placeholder="제목을 입력하세요."> &ensp;인원수
							<div class="dropdown mb-4 bg-light"
								style="float: right; width: 100">
								<button class="btn dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">1</button>
								<div class="dropdown-menu animated--fade-in"
									aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="#">2</a> <a
										class="dropdown-item" href="#">3</a> <a class="dropdown-item"
										href="#">4</a> <a class="dropdown-item" href="#">5</a>
								</div>

							</div>
						</div>
					
					<!-- 글 내용 -->
					</div>
					<div class="form-group row">
						<div class="col-sm-12">
							<textarea class="form-control" rows="20" id="inputContent"
								placeholder="글을 입력하세요."></textarea>
						</div>
					</div>
				
				<!-- modal-footer -->
				<div class="modal-footer justify-content-between">
						<button type="reset" class="btn btn-warning">초기화</button>

						<div>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">작성 완료</button>
				</div>
			</div>
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