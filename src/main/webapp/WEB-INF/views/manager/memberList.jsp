<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>회원 관리</title>
	
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
						<h1 class="h3 mb-0 text-gray-800">회원 관리</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->

					<div class="card shadow mb-4">
						<!-- Card Header -->
						<div class="card-header py-3">
							<h5 class="m-0 font-weight-bold text-primary p-2">회원 관리</h5>
						</div>
						
						<!-- Card Body -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>회원 번호</th>
											<th>회원 ID</th>
											<th>회원 이름</th>
											<th>회원 닉네임</th>
											<th>회원 이메일</th>
											<th>회원 등급</th>
											<th>회원 가입 날짜</th>
											<th>회원 관리</th>
										</tr>
									</thead>
									
									<tbody>
										<c:if test="${memberCount>0}">
												<c:forEach var="memberDto" items="${memberDtoArray}">
													<tr>
														<td>${memberDto.memNum}</td>
														<td>${memberDto.memId}</td>
														<td>${memberDto.memName}</td>	
														<td>${memberDto.memNickname}</td>	
														<td>${memberDto.memEmail}</td>	
														<td>${memberDto.memLevel}</td>	
														<td><fmt:formatDate value="${memberDto.memRegDate}"
																pattern="yyyy-MM-dd" /></td>
														<td><a href="#" data-toggle="modal"
															data-target="#memberDeleteModal" data-memnum="${memberDto.memNum}">탈퇴 처리</a></td>
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
	
		<!-- member Delete Model -->
	<div class="modal fade" id="memberDeleteModal" tabindex="-1" role="dialog" >
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<h5 class="modal-title">회원을 삭제하시겠습니까?</h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="memberDelete('${root}')">삭제</button>
				</div>
			</div>
		</div>
	</div>

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
	
	<!-- Modal JavaScript-->
	<script src="${root}/resources/js/manager/member.js"></script>
</body>
</html>