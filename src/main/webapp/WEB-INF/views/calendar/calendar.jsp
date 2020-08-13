<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ProMore-프로젝트를 모아모아</title>
<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Toast UI Calendar(캘린더) -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<link rel="stylesheet" href="${root }/resources/css/calender/cal.css" />
<script>
	var root = "${ root }";
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
						<h1 class="h3 mb-0 text-gray-800">일정관리</h1>
					</div>

					<!-- 캘린더 컨테이너 -->
					<div class="container">
						<!-- 사이드바 + 캘린더 메인 -->
						<div class="row">
							<!-- 사이드바 -->
							<div class="calendar-left-bar">
								<div>
									<div class="clearfix">
										<p class="float-left">일정</p>
										<a class="btn btn-sm float-right" type="button"
											style="margin: -5px 20px 0 0" data-toggle="modal"
											data-from="add" href="#schedule-modal-container"><i
											class="fas fa-plus-circle"
											style="color: orange; margin-right: 5px;"></i>일정추가</a>
									</div>
									<ul class="category-list list-unstyled">
										<li class="category-item"><input id="schedule-cb"
											type="checkbox" /> <label for="schedule-cb">팀 스케쥴</label></li>
										<li class="category-item"><input id="holiday-cb"
											type="checkbox" /> <label for="holiday-cb">공휴일</label></li>
									</ul>
								</div>
							</div>
							
							<!-- 캘린더 메인 -->
							<div class="calender-main col-lg-8 col-sm-12">
								<!-- 일정 추가/수정 모달 -->
								<div id=schedule-modal-container class="modal fade"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">일정추가</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form id="schedule-form" action="${root }/calendar/add-schedule.do" method="post">
													<div class="form-group clearfix">
														<div class="left-column">
															<label>카테고리</label>
														</div>
														<div class="right-column">
															<select class="form-control">
																<option>팀 스케쥴</option>
															</select>
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label for="schedule-titie">제목</label>
														</div>
														<div class="right-column">
															<input class="form-control" type="text"
																id="schedule-title" name="scheTitle" required />
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label>시작일</label>
														</div>
														<div class="right-column">
															<input id="schedule-start-date" class="form-control"
																type="date" name="scheStartDate" required />
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label>종료일</label>
														</div>
														<div class="right-column">
															<input id="schedule-end-date" class="form-control"
																type="date" name="scheEndDate" required />
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label for="schedule-content">내용</label>
														</div>
														<div class="right-column">
															<textarea id="schedule-content" class="form-control"
																name="scheContent" required></textarea>
														</div>
													</div>
													<!-- 프로젝트 번호 -->
													<input type="hidden" name="scheNum" />
													<input type="hidden" name="proNum" value="1"/>
													<div class="form-group clearfix">
														<input class="form-control btn-success" type="submit"
															value="저장" />
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- End of 일정 추가/수정 모달 -->

								<!-- 일정 간단히 보기 모달 -->
								<div id=schedule-view class="modal fade" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<div class="left-column">
													<h5 class="modal-title" id="exampleModalLabel">기업 세미나</h5>
												</div>
												<div class="right-column">
													<a id="schedule-edit" class="mr-2" data-toggle="modal" data-from="edit"
														href="#schedule-modal-container">
														<i class="fas fa-pen">&nbsp;수정</i>
													</a>
													<a id="schedule-delete"	 class="" href="#">
														<i class="fas fa-trash">&nbsp;삭제</i>
													</a>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
											</div>
											<div class="modal-body">
												<div class="container">
													<div class="row schedule-content">관련된 분들의 적극적인 참여
														부탁드립니다.</div>
												</div>
											</div>
											<div class="modal-footer">
												<div class="container" style="font-size:14px">
													<div class="row"><span id="schedule-start-date"></span>&nbsp;부터</div>
													<div class="row"><span id="schedule-end-date"></span>&nbsp;까지</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- End of 일정 간단히 보기 모달 -->


								<!-- 캘린더 헤더 -->
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
								<!-- 캘린더 본문 -->
								<div id="calendar" style="height: 600px;"></div>
							</div>
						</div>
					</div>
					<!-- End of 캘린더 컨테이너 -->

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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="${root }/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${root }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${root }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${root }/resources/js/sb-admin-2.min.js"></script>

	<!-- Toast UI Calendar(캘린더) -->
	<script
		src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<!-- moment(캘린더) -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<script src="${root }/resources/js/calendar/cal.js"></script>
</body>

</html>