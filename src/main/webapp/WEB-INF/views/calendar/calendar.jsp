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

<!-- Toast UI Calendar(고용순-캘린더) -->
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
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					PROMORE <sup></sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-folder"></i> <span>프로젝트</span>
			</a></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item active"><a class="nav-link collapsed"
				href="#" data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-cog"></i> <span>마이페이지</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">My Page</h6>
						<a class="collapse-item" href="#">프로필 관리</a> <a
							class="collapse-item" href="#">회원 수정</a> <a class="collapse-item"
							href="#">회원 탈퇴</a>
						<div class="collapse-divider"></div>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item active"><a class="nav-link collapsed"
				href="#" data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>고객게시판</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Customer Service</h6>
						<a class="collapse-item" href="utilities-color.html">1:1 문의하기</a>
						<a class="collapse-item" href="utilities-border.html">공지사항</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>일정 관리</span>
			</a></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>프로젝트 현황</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>일감 현황</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">August 7, 2020</div>
										<span class="font-weight-bold">팀원 확정이 완료되었습니다.</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">August 2, 2020</div>
										<span class="font-weight-bold">새로운 프로젝트가 개설되었습니다.</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">August 1, 2020</div>
										김소현님, 회원가입을 축하합니다!
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a></li>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span> <img
								class="img-profile rounded-circle"
								src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필 관리
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 회원 수정
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">메인페이지</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->


					<!-- ------------------------------------------------------- -->


					<div class="container">
						<div class="row">
							<div class="calendar-left-bar">
								<!-- 일정 -->
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
											type="checkbox" /> <label for="schedule-cb">스케쥴</label></li>
										<li class="category-item"><input id="holiday-cb"
											type="checkbox" /> <label for="holiday-cb">공휴일</label></li>
									</ul>
								</div>
							</div>

							<div class="calender-main col-lg-8 col-sm-12">
								<!-- 일정 추가/수정 -->
								<div id=schedule-modal-container class="modal"
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
												<form id="schedule-form" action="/" method="post">
													<div class="form-group clearfix">
														<div class="left-column">
															<label>카테고리</label>
														</div>
														<div class="right-column">
															<select class="form-control">
																<option>스케쥴</option>
															</select>
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label for="schedule-title">제목</label>
														</div>
														<div class="right-column">
															<input class="form-control" type="text"
																id="schedule-title" name="schedule-title" required />
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label>시작일</label>
														</div>
														<div class="right-column">
															<input id="schedule-start-date" class="form-control"
																type="date" name="schedule-start-date" required />
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label>종료일</label>
														</div>
														<div class="right-column">
															<input id="schedule-end-date" class="form-control"
																type="date" name="schedule-end-date" required />
														</div>
													</div>
													<div class="form-group clearfix">
														<div class="left-column">
															<label for="schedule-content">내용</label>
														</div>
														<div class="right-column">
															<textarea id="schedule-content" class="form-control"
																name="schedule-content" required></textarea>
														</div>
													</div>
													<div class="form-group clearfix">
														<input class="form-control btn-success" type="submit"
															value="저장" />
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>

								<!-- 일정 간단히 보기 -->
								<div id=schedule-view class="modal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<div class="left-column">
													<h5 class="modal-title" id="exampleModalLabel">기업 세미나</h5>
												</div>
												<div class="right-column">
													<a id="schedule-edit" data-toggle="modal" data-from="edit"
														href="#schedule-modal-container"><i class="fas fa-pen"></i>&nbsp;수정</a>
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
												<div class="container">
													<div class="row schedule-when">2020.08.04 (화), 오후
														1:30 ~ 2020.08.05 (수), 오후 2:30</div>
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



					<!-- ------------------------------------------------------- -->


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
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
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>
	더
	<!-- Toast UI Calendar(고용순-캘린더) -->
	<script
		src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<!-- moment(고용순-캘린더) -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<script src="${root }/resources/js/calendar/cal.js"></script>

</body>

</html>