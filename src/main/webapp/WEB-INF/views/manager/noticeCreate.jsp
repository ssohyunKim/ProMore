<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>공지사항 관리</title>
	
	<!-- Custom fonts for this template-->
	<link href="${root}/resources/vendor/fontawesome-free/css/all.min.css"
		rel="stylesheet" type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet">
		
	<!-- Custom styles for this template-->
	<link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- Custom styles for this page -->
	<link href="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
</head>
<body id="page-top">
	
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/template/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/WEB-INF/template/topbar.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">공지사항 관리</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->

					<!-- 공지사항 작성 -->
					<div
						class="d-sm-flex align-items-center justify-content-center mb-4">
						<div class="col-lg-8">
							<div class="card shadow-lg my-5">

								<!-- Card Header -->
								<div class="card-header">
									<div style="text-align: center; align-content: center;">
										<a href="${root}/customer/notice.do" class="btn btn-lg"
											style="float: left; margin-left: 0px; padding-left: 0px;">
											<span class="icon"> <i class="fas fa-arrow-left"></i>
										</span>
										</a>
										<h4 class="m-0 font-weight-bold text-primary p-2">공지사항 작성</h4>
									</div>
								</div>

								<!-- Card Body -->
								<div class="card-body">
									<form>

										<!-- 공지사항 글 제목 -->
										<div class="form-group row">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="inputTitle"
													value="제목을 입력하세요.">
											</div>
										</div>

										<!-- 공지사항 글 내용 -->
										<div class="form-group row">
											<div class="col-sm-12">
												<textarea class="form-control" rows="15" id="inputContent"
													placeholder="글을 입력하세요."></textarea>
											</div>
										</div>

										<!-- 파일 첨부 -->
										<div class="form-group row">
											<div class="col-sm-12">
												<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
												</span>
												<input type="file" class="mx-2" id="inputFile" />
											</div>
										</div>

										<!-- 초기화 -->
										<button type="reset" class="btn btn-secondary mb-2 col-sm-12">
											<span class="text">초기화</span>
										</button>
										<br />

										<!-- 작성 완료 -->
										<button type="submit" class="btn btn-primary col-sm-12">
											<span class="text">작성 완료</span>
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${root}/resources/js/sb-admin-2.min.js"></script>
	
	<!-- Page level plugins -->
	<script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${root}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>