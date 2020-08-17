<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>일감현황</title>

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
<link rel="stylesheet" href="${root}/resources/css/tabbar.css">

<!-- Toast UI Calendar -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<link rel="stylesheet"
	href="${root }/resources/css/work-calendar/cal.css" />
<script>
	var root = "${root}";
</script>
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
						<h1 class="h3 mb-0 text-gray-800">일감 현황</h1>
					</div>

					<!-- 코드 입력하기!!!! -->
					<!-- 여기에 코드를 넣어주세요!! -->

					<!-- css tabs -->
					<h2>CSS Tabs</h2>
					<input id="tab1" type="radio" name="tabs" checked> <label
						for="tab1">나의 일감 현황</label> <input id="tab2" type="radio"
						name="tabs"> <label for="tab2">나의 일감 일정</label>


					<section id="content1">

						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">나의 일감 현황</h6>
							</div>

							<!-- 일감 리스트 -->
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>프로젝트 이름</th>
												<th>보내는 사람</th>
												<th>상태</th>
												<th>시작날짜</th>
												<th>마감날짜</th>
											</tr>
										</thead>
										
										<tfoot>
											<tr>
												<th>프로젝트 이름</th>
												<th>보내는 사람</th>
												<th>상태</th>
												<th>시작날짜</th>
												<th>마감날짜</th>
											</tr>
										</tfoot>
									<tbody>
									<c:if test="${workCount>0}">
											<c:forEach var="workspaceDto" items="${workDtoArray}">
											<c:set var="loop_flag" value="false" />
												<tr>
												 
												<c:forEach var="projectDto" items="${projectDtoArray}">
													 <c:if test="${not loop_flag }">
														<c:set var="worknum" value="${projectDto.proNum}"/>
														<c:if test="${workspaceDto.proNum eq worknum}">
																 <c:set var="loop_flag" value="true" />
																<td>${projectDto.proName}</td>
														</c:if>
													</c:if>
												</c:forEach>
													<td>${workspaceDto.workSender}</td>
													<td>${workspaceDto.workState}</td>
													<td>${workspaceDto.workStartDate}</td>
													<td>${workspaceDto.workEndDate}</td>
												</tr>
											</c:forEach>
										</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</section>
					<!-- 일감 일정 탭 -->
					<section id="content2">

						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">나의 일감 일정</h6>
							</div>

							<!-- 일감 일정 -->
							<div class="card-body">
								<div class="container">
									<div class="row">
										<div class="calendar-left-bar">
											<!-- 업무 -->
											<div>
												<h6 class="mb-3">업무</h6>
												<ul class="category-list list-unstyled">
													<li class="category-item"><input id="take-work-cb"
														type="checkbox" /> <label for="take-work-cb">요청받은
															업무</label></li>
													<li class="category-item"><input id="give-work-cb"
														type="checkbox" /> <label for="give-work-cb">요청한
															업무</label></li>
												</ul>
											</div>
										</div>

										<div class="calender-main col-lg-8 col-sm-12">
											<!-- 업무 간단히 보기 -->
											<div id=work-view class="modal fade" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-header">
															<div class="left-column clearfix">
																<div class="left-column float-left">
																	<span id="work-state" class="float-left p-1 rounded text-light">요청</span>
																</div>
																<div class="right-column float-left ml-2">
																	<h5 class="modal-title" id="exampleModalLabel">CSS
																		디자인 초안 작성</h5>
																	<div class="left-column mt-1"
																		style="font-size: 12px; clear: both">
																		<i class="fas fa-user-alt"></i> <span id="work-giver">나에게
																			요청한 팀원</span> <span id="work-taker">요청받은 팀원</span> <span
																			id="work-team-id" class="ml-2"></span>
																	</div>
																</div>
															</div>
															<div class="right-column">
																<!-- 해당 일감 링크로 이동하기 -->
																<a id="work-detail" href="#"><i class="fas fa-info">&nbsp;자세히
																		보기</i></a>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
														</div>
														<div class="modal-body">
															<div class="container">
																<div class="row">
																	<div id="work-content" class="right-column ml-2">
																		인덱스 페이지 디자인 완성해주세요.</div>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<div class="container" style="font-size: 14px;">
																<div class="row">
																	<span id="work-start-date"></span>&nbsp;부터
																</div>
																<div class="row">
																	<span id="work-end-date"></span>&nbsp;까지
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="calender-topbar clearfix">
												<div class="calendar-topbar-nav">
													<button class="calendar-prev btn btn-secondary btn-sm">
														<i class="fas fa-caret-left"></i>
													</button>
													<span class="calendar-ym-header"></span>
													<button class="calendar-next btn btn-secondary btn-sm">
														<i class="fas fa-caret-right"></i>
													</button>
												</div>
												<div class="btn-group float-right">
													<button class="calendar-today btn btn-sm btn-secondary">오늘</button>
												</div>
											</div>
											<div id="calendar" style="height: 600px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</section>
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

	<!-- Toast UI Calendar -->
	<script
		src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<!-- moment -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<script src="${root }/resources/js/work-calendar/cal.js"></script>
</body>
</html>