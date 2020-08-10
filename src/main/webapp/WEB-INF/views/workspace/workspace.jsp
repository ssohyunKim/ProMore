<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="resources/css/workspace/jquery-ui.css" />
<link rel="stylesheet" href="resources/css/workspace/jquery-ui.structure.css" />
<link rel="stylesheet" href="resources/css/workspace/jquery-ui.theme.css" />
<link rel="stylesheet" href="resources/css/workspace/workspace.css" />

</head>

<body id="page-top">
	<c:set var="root" value="${pageContext.request.contextPath}" />
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
						<!--   <h1 class="h3 mb-0 text-gray-800">메인페이지</h1>-->
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->
					<!--           	<div class="toast">
			  <div class="toast-header">
			    Toast Header
			  </div>
			  <div class="toast-body">
			   	알람확인
			  </div>
			</div> -->
					<form action="#">
						<div class="col-lg-6">

							<div class="card mb-4 py-3 border-left-primary">
								<div class="card-body">
									<div class="workLiDiv o-hidden">
										<div class="form-check-inline col justify-content-between">
											<b>작성자</b>
											<ul style="display: inline-block; padding-left: 10px;"
												id="secondUl">
												<li style="border-left: 1px solid #cccccc;">요청</li>
												<li>진행</li>
												<li>완료</li>
											</ul>
										</div>

										<div style="margin: 5px;">
											<!-- <input type="text"/> -->
											<!-- <input type="button" onclick="myFun()" value="담당자 추가"/> -->

											<div class="dropdown mb-4 form-check-inline">
												<button style="padding: 2px; font-size: .875rem;"
													class="btn btn-primary dropdown-toggle col-sm-3"
													type="button" id="dropdownMenuButton"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">담당자</button>
												<div class="dropdown-menu animated--fade-in"
													aria-labelledby="dropdownMenuButton" id="manager">
													<a class="dropdown-item" href="#">이형은</a> <a
														class="dropdown-item" href="#">이다은</a> <a
														class="dropdown-item" href="#">김아름</a>
												</div>
												<span class="col-sm-3 managerWho"></span>
													<img id="calender" src="resources/img/calendar.png">
													<input class="calenderInput col-sm-3" type="text" id="date1"
														value="시작일 추가" />
													<img id="calender" src="resources/img/calendar.png">
													<input class="calenderInput col-sm-3" type="text" id="date2"
														value="마감일 추가" />
											</div>
										</div>


										<div class="addIndexDiv">
											<div class="workDateDiv"></div>


											<div style="margin: 5px;" class=".col-lg-8">
												<input type="search" class="form-control form-control-sm"
													placeholder aria-controls="dataTable" value="업무명을 입력하세요">
											</div>



											<div style="margin: 5px;" class=".col-lg-8">
												<textarea type="search" class="form-control form-control-sm"
													placeholder aria-controls="dataTable">업무내용을 입력하세요</textarea>
												<!-- <textarea rows="2" cols="70" style ="margin-left: 13px;">업무내용을 입력해주세요</textarea> -->
											</div>

											<div class="fileUpLoad">
												<span class="one"> <img
													src="resources/img/upload.png"> <input
													class="content" type="file" name="file" />
												</span>
											</div>

										</div>



										<div>
											<!-- <input type="submit" value="올리기">	 -->
											<a href="#" class="btn btn-primary btn-icon-split btn-sm"
												style="float: right; margin-right: 20px;"> <span
												class="icon text-white-50"> <i class="fas fa-flag"></i>
											</span> <span class="text" onclick="workPost()">올리기</span>
											</a>
										</div>


									</div>
								</div>
							</div>
						</div>


					</form>



					<!-- 	<div id="alarm" class="progress" style="width:800px; height: 16px; margin-left: 180px; margin-bottom: 10px; display: inline-block">
       <div id ="alarm" class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">새글이 등록되었습니다.</div>
    </div> -->

					<%-- 	<div id="listAllDiv">
		<!-- 새로운 댓글 -->
		
		<!-- 기존 댓글 : 자바 스크립트에서 생성한 태그들과 동일한 형태로 작성한다. -->
		<c:forEach >
			<div class="replyDiv" id="${replyDTO.bunho}">
				<span class="cssBunho">${replyDTO.bunho}</span>
				<span class="cssReply">${replyDTO.line_reply}</span>
				<span class="cssUpDel">
					<a href="javascript:deleteToServer('${replyDTO.bunho}','${root}')">삭제&nbsp;</a>					
					<a href="javascript:selectToServer('${replyDTO.bunho}','${root}')">수정</a>
				</span>
			</div>
		</c:forEach>--%>
					<form>
					<div class="col-lg-6" id="workRead" style="display: none;">

						<div class="card mb-4 py-3 border-left-primary">
							<div class="card-body">
								<div class="workLiDivRead">
									<div style="margin: 5px;" class="form-check-inline col justify-content-between">
										<b>작성자</b>
								
										<ul style="display: inline-block;" id="secondUl">
											<li style="border-left: 1px solid #cccccc;">요청</li>
											<li>진행</li>
											<li>완료</li>
										</ul>
									</div>
									<div style="margin: 5px;">
										<a>이형은</a> <a href="#" onclick="myFun()" class="col-sm-3">담당자 변경</a>
										
											
												<img id="calender" src="resources/img/calendar.png"> <input
													class="calenderInput col-sm-3" type="text" id="date3" value="시작일 추가" />
											
												<img id="calender" src="resources/img/calendar.png"> <input
													class="calenderInput col-sm-3" type="text" id="date4" value="마감일 추가" />
											
									</div>

									<div class="addIndexDivRead">
										<div style="margin: 5px;" class=".col-lg-8">
											<input type="search" class="form-control"
												placeholder aria-controls="dataTable" value="업무명을 입력하세요">
										</div>



										<div style="margin: 5px;" class=".col-lg-8">
											<textarea type="search" class="form-control"
												placeholder aria-controls="dataTable">업무내용을 입력하세요</textarea>
										</div>

										<div class="fileUpLoad">
											<span class="one"> <img src="resources/img/upload.png">
												<input class="content" type="file" name="file" />
											</span>
										</div>

										<div id="updateDelete" class="justify-content-between">
											<a href="#">수정</a> <a href="#">삭제</a>
										</div>
									</div>

									<div style="margin-top: 28px; border-top: #6e707e">
										<a href="#" style="color: #6e707e; font-size: .875rem">댓글</a>
									</div>
								</div>

							</div>
						</div>
					</div>

					</form>
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
	<script type="text/javascript" src="resources/workspace/js/jquery-ui.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script type="text/javascript" src="resources/js/workspace/workspace.js"></script>
</body>
</html>