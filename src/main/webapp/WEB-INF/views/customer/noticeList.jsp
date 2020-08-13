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
  <!-- Custom styles for this page -->
  <link href="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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
				<jsp:include page="/WEB-INF/template/topbar.jsp" />
	
				<!-- Begin Page Content -->
				<div class="container-fluid">
	
					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">공지사항</h1>
					</div>
	
					<div>
						<a href="#" class="btn btn-secondary btn-circle btn-lg" style="float: left; margin: 10px 20px 10px 10px;">
						<span class="icon"> 
							<i class="fas fa-info"></i>
						</span>
						</a>
						<p class="mb-4">
							<br />
							공지사항 확인 후 1:1 문의 게시판을 이용해주세요.<br />
							<br />
							
						</p>
					</div>
	
					<div class="card shadow mb-4">
						<!-- Card Header -->
						<div class="card-header py-3">
							<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 글보기</h5>
						</div>
	
						<!-- Card Body -->
						<!-- 공지사항 리스트 -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>제목</th>
											<th>분류</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>제목</th>
											<th>분류</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td><a href="#" data-toggle="modal" data-target="#noticeViewModal">[필독] 프로젝트 참여시 주의사항</a></td>
											<td>공지사항</td>
											<td>관리자</td>
											<td>2020-08-01</td>
										</tr>
										<tr>
											<td>[필독] 쉽고 빠른 프로젝트 관리의 시작</td>
											<td>공지사항</td>
											<td>관리자</td>
											<td>2020-08-02</td>
										</tr>
										<tr>
											<td>[필독] 프로젝트 참여시 주의사항</td>
											<td>공지사항</td>
											<td>관리자</td>
											<td>2020-08-03</td>
										</tr>
										<tr>
											<td>[필독] 프로젝트 신고시 주의사항</td>
											<td>공지사항</td>
											<td>관리자</td>
											<td>2020-08-03</td>
										</tr>
										<tr>
											<td>[필독] 문의 게시판 이용 방법</td>
											<td>공지사항</td>
											<td>관리자</td>
											<td>2020-08-03</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
		
			</div>
			<!-- End of Main Content -->
			
			<!-- Footer -->
			<jsp:include page="/WEB-INF/template/footer.jsp" />
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
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Notice Read Model -->
	<div class="modal fade" id="noticeViewModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 읽기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form>
					<!-- modal-body -->
					<div class="modal-body p-4">

						<!-- 공지사항 글 제목 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<h5 class="form-control-plaintext font-weight-bold"
									id="staticTitle">[필독] 프로젝트 참여시 주의사항</h5>
							</div>
						</div>

						<!-- 공지사항 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea readonly class="form-control-plaintext" rows="20"
									id="content"
									placeholder="안녕하세요.&#13;관리자입니다.&#13;&#13;프로젝트 진행 과정에서 다음과 같은 문제가 자주 발생하고 있습니다.&#13;1. ~~&#13;2. &#13;3. ~~&#13;&#13;우리 모두 매너있는 팀원/팀장으로서 즐겁게 프로젝트를 진행할 수 있도록 부탁드립니다. 잦은 신고 문의가 들어올 시 예고없이 탈퇴처리할 수 있음을 알려드립니다."></textarea>
							</div>
						</div>

						<!-- 파일 첨부 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
								</span> <a class="mx-2">첨부파일 없음</a>
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#noticeUpdateModal">수정하기</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</form>
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

	<!-- Page level plugins -->
	<script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${root}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>