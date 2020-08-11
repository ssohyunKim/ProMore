<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ProMore-프로젝트를 모아모아</title>
<!-- Custom fonts for this template-->

<link href="${root}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="${root}/resources/css/workspace/jquery-ui.css" />
<link rel="stylesheet"
	href="${root}/resources/css/workspace/jquery-ui.structure.css" />
<link rel="stylesheet"
	href="${root}/resources/css/workspace/jquery-ui.theme.css" />
<%-- <link rel="stylesheet"
		href="${root}/resources/css/workspace/workspace.css" /> --%>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<!-- 일감댓글 -->
<link rel="stylesheet" href="${root}/resources/css/workspace/reply.css" />
<script>
	var root = "${root }";
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
						<h1 class="h3 mb-0 text-gray-800">일감 관리</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->

					<!-- 	<div class="toast">
						<div class="toast-header">Toast Header</div>
						<div class="toast-body">알람확인</div>
					</div> -->

					<!-- 일감 목록 -->
					<div class="card shadow p-4 col-xl-8 bg-light">

						<!-- 프로젝트명 들어가기 -->
						<a href="#" class="text-decoration-none" data-toggle="modal"
							data-target="#ReadModal">
							<div
								class="alert alert-primary bg-primary p-3 rounded-lg text-center">
								<b class="text-white font-weight-bolder">ProMore</b>
							</div>
						</a>

						<!-- 일감 생성 -->
						<div class="card shadow mb-4 border-bottom-primary">

							<!-- Card Body -->
							<div class="card-body">

								<form action="#" method="get" onsubmit="workPost()">
									<div class="o-hidden">

										<!-- writer, state -->
										<div
											class="form-check-inline col justify-content-between pb-4">
											<!-- 작성자 -->
											<b>작성자</b>

											<!-- 상태 -->
											<div class="btn-group btn-group-toggle my-1 workState"
												data-toggle="buttons">
												<label class="btn btn-primary active"> <input
													type="radio" name="options" id="option1" checked>
													요청
												</label> <label class="btn btn-primary"> <input type="radio"
													name="options" id="option2"> 진행
												</label> <label class="btn btn-primary"> <input type="radio"
													name="options" id="option3"> 완료
												</label>
											</div>


											<!-- <ul class="pl-3" id="secondUl">
												<li style="border-left: 1px solid #cccccc;">요청</li>
												<li>진행</li>
												<li>완료</li>
											</ul> -->
										</div>

										<!-- drop down, date picker -->
										<div
											class="form-check-inline col justify-content-between pb-4">

											<!-- drop down -->
											<div>
												<div class="btn-group">
													<button type="button"
														class="btn btn-primary dropdown-toggle"
														data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">담당자</button>
													<div class="dropdown-menu" id="manager">
														<a class="dropdown-item" href="#">이형은</a> <a
															class="dropdown-item" href="#">이다은</a> <a
															class="dropdown-item" href="#">김아름</a>
													</div>
												</div>

												<!-- 선택된 담당자 -->
												<label class="p-2" id="managerWho"></label>
											</div>

											<!-- date picker -->
											<div class="justify-content-between">
												<!-- 시작일 추가 -->
												<div class="form-check-inline">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="calenderInput" type="text" id="date1"
														value="시작일 추가" />
												</div>

												<!-- 마감일 추가 -->
												<div class="form-check-inline m-0">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="calenderInput" type="text" id="date2"
														value="마감일 추가" />
												</div>
											</div>

										</div>


										<!-- 일감 제목 -->
										<div class="pb-3">
											<input type="text" class="form-control"
												placeholder="업무명을 입력하세요">
										</div>

										<!-- 일감 내용 -->
										<div class="pb-3">
											<textarea class="form-control">업무내용을 입력하세요</textarea>
										</div>

										<!-- 파일 첨부 -->
										<div class="pb-3">
											<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
											</span> <input type="file" class="mx-2" id="inputFile" />
										</div>

										<!-- 올리기 -->
										<div class="d-flex flex-row-reverse">
											<button type="submit" class="btn btn-primary">올리기</button>
										</div>

									</div>

								</form>

							</div>
						</div>

						<!-- 	<div id="alarm" class="progress" style="width:800px; height: 16px; margin-left: 180px; margin-bottom: 10px; display: inline-block">
       					<div id ="alarm" class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">새글이 등록되었습니다.</div>
                        </div> -->
						<!-- 추가된 일감 3 -->
						<div class="card shadow mb-4 border-bottom-primary" id="workRead"
							style="display: none;">

							<!-- Card Body -->
							<div class="card-body">

								<form action="#" method="get" onsubmit="workPost()">
									<div class="o-hidden">

										<!-- writer, state -->
										<div
											class="form-check-inline col justify-content-between pb-4">
											<!-- 작성자 -->
											<b>작성자</b>

											<!-- 상태 -->
											<div class="btn-group btn-group-toggle my-1 workState"
												data-toggle="buttons">
												<label class="btn btn-primary active"> <input
													type="radio" name="options" id="option1" checked>
													요청
												</label> <label class="btn btn-primary"> <input type="radio"
													name="options" id="option2"> 진행
												</label> <label class="btn btn-primary"> <input type="radio"
													name="options" id="option3"> 완료
												</label>
											</div>


											<!-- <ul class="pl-3" id="secondUl">
												<li style="border-left: 1px solid #cccccc;">요청</li>
												<li>진행</li>
												<li>완료</li>
											</ul> -->
										</div>


										<!-- drop down, date picker -->
										<div
											class="form-check-inline col justify-content-between pb-4">

											<!-- drop down -->
											<div>
												<a>이형은</a> <a href="#" onclick="managerSelect('${root}')"
													class="text-decoration-none col-sm-3">담당자 변경</a>

												<!-- 선택된 담당자 -->
												<label class="p-2" id="managerWho"></label>
											</div>

											<!-- date picker -->
											<div class="justify-content-between">
												<!-- 시작일 추가 -->
												<div class="form-check-inline">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="calenderInput" type="text" id="date1"
														value="시작일 추가" />
												</div>

												<!-- 마감일 추가 -->
												<div class="form-check-inline m-0">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="calenderInput" type="text" id="date2"
														value="마감일 추가" />
												</div>
											</div>

										</div>


										<!-- 일감 제목 -->
										<div class="pb-3">
											<input type="text" class="form-control"
												placeholder="업무명을 입력하세요">
										</div>

										<!-- 일감 내용 -->
										<div class="pb-3">
											<textarea class="form-control">업무내용을 입력하세요</textarea>
										</div>

										<!-- 파일 첨부 -->
										<div class="pb-3">
											<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
											</span> <input type="file" class="mx-2" id="inputFile" />
										</div>

										<div id="updateDelete" class="d-flex flex-row-reverse">
											<a class="m-1 text-decoration-none" href="#">수정</a> <a
												class="m-1 text-decoration-none" href="#">삭제</a>
										</div>

									</div>

								</form>

								<!-- 일감 댓글 전체 -->
								<div class="card mb-4 m-4">

									<!-- Card Header -->
									<div class="card-header">
										<p>댓글</p>
									</div>

									<!-- Card Body -->
									<div class="card-body">

										<!-- 댓글 리스트 영역 -->
										<div class="container reply-list">
											<!-- 댓글 템플릿 -->
											<div id="reply-tmpl" class="row clearfix d-none mb-3">
												<div class="left-column float-left">
													<!-- 아바타 -->
													<img src="${root }/resources/img/avatar.png" width="50"
														height="50" />
												</div>
												<div class="right-column ml-2">
													<div class="writer-info">
														<span class="reply-writer">정한우</span> <span
															class="reply-write-date">2020-08-04 16:25</span> <span
															class="reply-like ml-3"> <i
															class="far fa-thumbs-up"></i> <a href="/work-reply/like">좋아요</a>
														</span> |&nbsp;<a href="#">수정</a> |&nbsp;<a href="#">삭제</a>
													</div>
													<div class="reply-content">Trust You</div>
													<!-- 파일 다운로드 템플릿 -->
													<div id="file-download-tmpl"
														class="reply-file clearfix bg-info d-none">
														<span class="left-column float-left"> <i
															class="fas fa-file"></i> <span class="reply-file-name">요구사항
																분석서.doc</span>
														</span> <span class="right-column float-right"> <a
															href="#">다운로드</a> |&nbsp;<a href="#">삭제</a>
														</span>
													</div>
												</div>
											</div>
										</div>

										<!-- 댓글 작성 폼 -->
										<div class="container">
											<form id="reply-form" action="/work-reply/write"
												method="post" enctype="multipart/form-data">
												<!-- 아바타, textarea, 작성버튼 -->
												<div class="row">
													<div class="input-group mb-3">
														<div class="input-group-append">
															<!-- 아바타 -->
															<img src="${root }/resources/img/avatar.png" width="50"
																height="50" />
														</div>
														<textarea id="reply-my-content" class="form-control"
															placeholder="댓글을 작성하세요." name="reply-content" required></textarea>
														<div class="input-group-append">
															<button class="btn btn-outline-secondary" type="submit">작성</button>
														</div>
													</div>
												</div>
												<!-- 업로드 -->
												<div class="row">
													<div class="right-column ml-2 col-lg-8 float-right">
														<div class="form-group clearfix position-relative">
															<span> <i class="fas fa-paperclip fa-lg mr-2"></i>
															</span> <input id="reply-file-select" type="file"
																name="reply-file">
														</div>
													</div>
												</div>
											</form>
										</div>
										<!-- End of 댓글 작성 폼 -->
									</div>
								</div>
								<!-- End of 일감 댓글 전체 -->
							</div>
						</div>
					</div>
					<!-- 추가된 일감 2 -->

					<!-- 추가된 일감 1 -->

				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->

	<!-- End of Main Content -->

	<!-- Footer -->
	<jsp:include page="/WEB-INF/template/footer.jsp" />
	<!-- End of Footer -->

	<!-- End of Content Wrapper -->

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<!-- Read Model -->
	<div class="modal fade" id="ReadModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">프로젝트 읽기</h5>
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
							<button type="button" class="btn btn-primary">수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Bootstrap core JavaScript-->
	<script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="${root }/resources/js/workspace/jquery-ui.js"></script>
	<script
		src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${root}/resources/js/sb-admin-2.min.js"></script>
	<script type="text/javascript"
		src="${root}/resources/js/workspace/workspace.js"></script>
	<!-- 일감댓글 -->
	<script src="${root}/resources/js/workspace/reply.js"></script>
</body>
</html>