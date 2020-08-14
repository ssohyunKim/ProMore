<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>고객게시판 관리</title>

<!-- Custom fonts for this template-->
<link href="${root}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

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
						<h1 class="h3 mb-0 text-gray-800">고객게시판 관리</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->

					<div class="card shadow mb-4">
						<!-- Card Header -->
						<div class="card-header py-3">
							<h5 class="m-0 font-weight-bold text-primary p-2">고객게시판 관리</h5>
						</div>

						<!-- Card Body -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>글 번호</th>
											<th>글쓴이 ID</th>
											<th>글 제목</th>
											<th>글 내용</th>
											<th>첨부 파일</th>
											<th>접수 현황</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>글 번호</th>
											<th>글쓴이 ID</th>
											<th>글 제목</th>
											<th>글 내용</th>
											<th>첨부 파일</th>
											<th>접수 현황</th>
										</tr>
									</tfoot>
									<tbody>
										<c:if test="${reportCount>0}">
											<c:forEach var="reportDto" items="${reportArray}">
												<tr>
													<td><label>${reportDto.cusNum}</label></td>
													<td><label>${reportDto.cusId}</label></td>
													<td><a href="#" data-toggle="modal"
														data-target="#reportReadModal"
														data-custitle="${reportDto.cusTitle}"
														data-cuscontent="${reportDto.cusContent}">${reportDto.cusTitle}</a></td>
													<td>${reportDto.cusContent}</td>

													<c:if test="${reportDto.cusFileSize>0}">
														<td><a href="#">${reportDto.cusFileName}</a></td>
													</c:if>

													<c:if test="${reportDto.cusFileSize==0}">
														<td>첨부파일 없음</td>
													</c:if>

													<td><a id="state${reportDto.cusNum}" href="#" data-toggle="modal"
														data-target="#reportStateModal"
														data-cusnum="${reportDto.cusNum}">접수대기중</a></td>
												</tr>
											</c:forEach>
										</c:if>


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

			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	<!-- Report Read Model -->
	<div class="modal fade" id="reportReadModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">고객게시판 글 읽기</h5>
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
								<h5 class="modal-title form-control-plaintext font-weight-bold"
									id="staticTitle"></h5>
							</div>
						</div>

						<!-- 공지사항 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea readonly class="form-control-plaintext" rows="20"
									id="staticContent"></textarea>
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
					<div class="modal-footer justify-content-right">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>

				</form>

			</div>
		</div>
	</div>
	
	<!-- Report State Model -->
	<div class="modal fade" id="reportStateModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">접수 처리</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- modal-body -->
				<div class="modal-body p-4">

					<!-- 접수 완료 -->
					<div class="form-group row">
						<div class="col-sm-12">
							<h5 class="modal-title form-control-plaintext font-weight-bold">접수를 완료하세요.</h5>
						</div>
					</div>

				</div>

				<!-- modal-footer -->
				<div class="modal-footer justify-content-right">
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="reportStateChange();">확인</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${root}/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${root}/resources/js/demo/datatables-demo.js"></script>
	
	<!-- Modal JavaScript-->
	<script src="${root}/resources/js/manager/report.js"></script>
	
</body>
</html>