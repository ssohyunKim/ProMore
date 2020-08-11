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
						<a href="${root}/project/read.do" class="text-decoration-none">
							<div class="alert alert-primary bg-primary p-3 rounded-lg text-center">
								<b class="text-white font-weight-bolder">ProMore</b>
							</div>
						</a>


						<!-- 일감 생성 -->
						<div class="card shadow mb-4 border-bottom-primary">

							<!-- Card Body -->
							<div class="card-body">

								<form action="#">
									<div class="o-hidden">

										<!-- writer, state -->
										<div
											class="form-check-inline col justify-content-between pb-4">
											<!-- 작성자 -->
											<b>작성자</b>

											<!-- 상태 -->
											<div class="btn-group btn-group-toggle my-1"
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
						
						<!-- 추가된 일감 3 -->
						
						<!-- 추가된 일감 2 -->
						
						<!-- 추가된 일감 1 -->
						
					</div>



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

					<!-- 글 등록 -->
					<div class="col-lg-6" id="workRead" style="display: none;">
						<form>
							<div class="card mb-4 py-3 border-left-primary">
								<div class="card-body">
									<div class="workLiDivRead">
										<div style="margin: 5px;"
											class="form-check-inline col justify-content-between">
											<b>작성자</b>

											<ul style="display: inline-block;" id="secondUl">
												<li style="border-left: 1px solid #cccccc;">요청</li>
												<li>진행</li>
												<li>완료</li>
											</ul>
										</div>
										<div style="margin: 5px;">
											<a>이형은</a> <a href="#" onclick="managerSelect('${root}')"
												class="col-sm-3">담당자 변경</a> <img id="calender"
												src="${root}/resources/img/calendar.png"> <input
												class="calenderInput col-sm-3" type="text" id="date3"
												value="시작일 추가" /> <img id="calender"
												src="${root}/resources/img/calendar.png"> <input
												class="calenderInput col-sm-3" type="text" id="date4"
												value="마감일 추가" />

										</div>

										<div class="addIndexDivRead">
											<div style="margin: 5px;" class=".col-lg-8">
												<input type="search" class="form-control" placeholder
													aria-controls="dataTable" value="업무명을 입력하세요">
											</div>



											<div style="margin: 5px;" class=".col-lg-8">
												<textarea type="search" class="form-control" placeholder
													aria-controls="dataTable">업무내용을 입력하세요</textarea>
											</div>

											<div class="fileUpLoad">
												<span class="one"> <img
													src="${root}/resources/img/upload.png"> <input
													class="content" type="file" name="file" />
												</span>
											</div>

											<div id="updateDelete" class="justify-content-between">
												<a href="#">수정</a> <a href="#">삭제</a>
											</div>
										</div>
										<!-- 
										<div style="margin-top: 28px; border-top: #6e707e">
											<a href="#" style="color: #6e707e; font-size: .875rem">댓글</a>
										</div>
										 -->
									</div>

								</div>
							</div>
						</form>
						<!-- 댓글 영역 -->
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
											class="reply-like ml-3"> <i class="far fa-thumbs-up"></i>
											<a href="/work-reply/like">좋아요</a>
										</span> |&nbsp;<a href="#">수정</a> |&nbsp;<a href="#">삭제</a>
									</div>
									<div class="reply-content">Trust You</div>
									<!-- 파일 다운로드 템플릿 -->
									<div id="file-download-tmpl"
										class="reply-file clearfix bg-info d-none">
										<span class="left-column float-left"> <i
											class="fas fa-file"></i> <span class="reply-file-name">요구사항
												분석서.doc</span>
										</span> <span class="right-column float-right"> <a href="#">다운로드</a>
											|&nbsp;<a href="#">삭제</a>
										</span>
									</div>
								</div>
							</div>
						</div>

						<!-- 댓글 작성 폼 -->
						<div class="container">
							<div class="row clearfix">
								<div class="left-column float-left position-relative">
									<!-- 아바타 -->
									<img src="${root }/resources/img/avatar.png" width="50"
										height="50" /> <b class="position-absolute"
										style="left: 0; top: 50px">정한우</b>
								</div>
								<div class="right-column ml-2">
									<form id="reply-form" action="/work-reply/write" method="post"
										enctype="multipart/form-data">
										<div class="form-group clearfix position-relative">
											<textarea id="reply-my-content"
												class="form-control float-left" name="reply-content"
												required></textarea>
											<button class="reply-btn btn btn-primary float-left ml-2"
												type="submit">&nbsp;작&nbsp;성&nbsp;</button>
											<img class="upload-progress position-absolute invisible"
												src="${root }/resources/img/progress.gif" />
										</div>
										<div class="form-group clearfix">
											<input id="reply-file-select" class="form-control float-left"
												type="file" name="reply-file">
										</div>
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