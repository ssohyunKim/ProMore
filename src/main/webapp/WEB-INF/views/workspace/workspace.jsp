<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
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

					<!--    
					<div class="toast">
                    	<div class="toast-header">Toast Header</div>
                    	<div class="toast-body">알람확인</div>
                    </div> 
                    -->

					<!-- 일감 목록 -->
					<div class="card shadow p-4 col-xl-8 bg-light">

						<!-- 프로젝트 상세 보기 -->
						<a href="#" class="text-decoration-none" data-toggle="modal"
							data-target="#ReadModal">
							<div
								class="alert alert-primary bg-primary p-3 rounded-lg text-center">
								<b class="text-white font-weight-bolder">ProMore</b>
							</div>
						</a>

						<!-- 일감 작성 폼 -->
						<div class="card shadow mb-4 border-bottom-primary">

							<!-- Card Body -->
							<div class="card-body">

								<form id="work-form" name="createWorkForm" method="post"
									onsubmit="return writeToServer(this);" class="writeForm">
									<div class="o-hidden">
										<input id="pro-num" type="hidden" name="proNum"
											value="${proNum }" />

										<!-- writer, state -->
										<div class="clearfix" style="border-bottom: 1px solid #aaa">
											<input class="work-sender" type="hidden" name="workSender"
												value="작성자" />
											<!-- 
											<input class="work-sender" type="hidden" name="workSender"
												value="${sessionScope.id }" />
											 -->

											<!-- 일감 제목 -->
											<div class="pb-2 float-left">
												<input type="text" class="form-control work-subject"
													name="workSubject" placeholder="업무명을 입력하세요" required>
											</div>

											<!-- 상태 -->
											<div class="btn-group btn-group-toggle workState float-right"
												data-toggle="buttons">
												<label class="btn btn-primary active"> <input
													type="radio" name="workState" checked value="요청">요청
												</label> <label class="btn btn-primary"> <input type="radio"
													name="workState" value="진행">진행
												</label> <label class="btn btn-primary"> <input type="radio"
													name="workState" value="완료">완료
												</label>
											</div>
										</div>

										<!-- modal, date picker -->
										<!-- 
										<div
											class="form-check-inline col justify-content-between pb-4">
											</div>
										 -->
										<div class="clearfix pt-2 pb-2"
											style="border-bottom: 1px solid #aaa">

											<!-- modal -->
											<div class="float-left">
												<div class="btn-group">
													<button type="button"
														class="receiver-search btn btn-primary"
														data-toggle="modal" data-target="#managerModal">담당자</button>
												</div>

												<!-- 선택된 담당자 -->
												<label class="p-2 work-receiver" name="workReceiver">이형은</label>
											</div>

											<!-- date picker -->
											<div class="float-right pt-1">
												<!-- 시작일 추가 -->
												<div class="form-check-inline">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="form-control work-start-date"
														name="workStartDate" type="date" id="date1"
														placeholder="시작일 추가" required />
												</div>

												<!-- 마감일 추가 -->
												<div class="form-check-inline m-0">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="form-control work-end-date"
														name="workEndDate" type="date" id="date2"
														placeholder="마감일 추가" required />
												</div>
											</div>
										</div>

										<!-- 일감 내용 -->
										<div class="pt-2 pb-2">
											<textarea class="form-control work-content"
												name="workContent" placeholder="업무내용을 입력하세요" required></textarea>
										</div>

										<!-- 파일 첨부 -->
										<div class="input-group pt-2 pb-2 col-8">
											<span class="icon mt-2"> <i
												class="fas fa-paperclip fa-lg"></i>
											</span> <input type="file" class="input-file form-control mx-2"
												name="inputFile" />
										</div>

										<!-- 올리기 -->
										<div class="d-flex flex-row-reverse">
											<button type="submit" class="btn btn-primary">올리기</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- End of 일감 생성 폼 -->

						<!--
						<div id="alarm" class="progress" style="width:800px; height: 16px; margin-left: 180px; margin-bottom: 10px; display: inline-block">
                        	<div id ="alarm" class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">새글이 등록되었습니다.</div>
                        </div> 
                        -->


						<!-- 일감 리스트 -->
						<div id="work-list">
							<c:forEach var="item" items="${list }">
								<!-- 작성된 일감 템플릿 -->
								<div id="work-no-${item.workNum }"
									class="card shadow mb-4 border-bottom-primary"
									style="display: ${list.size() == 0? 'none': 'block'};">

									<!-- Card Body -->
									<div class="card-body">

										<form>
											<div class="o-hidden">

												<!-- writer -->
												<div class="writer-row clearfix"
													style="border-bottom: 1px solid #aaa">
													<img class="left-column float-left"
														src="${root }/resources/img/avatar.png" width="50"
														height="50" />
													<div class="left-column float-left ml-2">
														<p class="work-sender m-0" style="font-size: 14px">
															${item.workSender }</p>
														<p class="work-write-date" style="font-size: 14px">
															<fmt:formatDate value="${item.workWriteDate }"
																pattern="yyyy.MM.dd (E)" />
														</p>
													</div>
													<!-- 작성자 -->
													<%-- 
                                                    // 이걸로 대체되야 함
                                                    <input id="workSender" type="hidden" value="${sessionScope.id}"/>
                                                    --%>
													<!-- tmpl에서 id로 변경 -->
													<input class="work-sender" type="hidden" name="workSender"
														value="작성자" />
												</div>
												<!-- subject, state -->
												<div class="clearfix pt-2 pb-2"
													style="border-bottom: 1px solid #aaa">
													<!-- subject -->
													<div class="float-left mt-2">
														<h5 class="work-subject pl-2">${item.workSubject }</h5>
														<input type="text"
															class="form-control work-subject d-none"
															name="workSubject" value="${item.workSubject }"
															placeholder="업무명을 입력하세요" required>
													</div>
													<!-- state -->
													<div
														class="work-state btn-group btn-group-toggle float-right"
														data-toggle="buttons">
														<label class="btn btn-primary active"> <input
															type="radio" name="workState" value="요청"
															${fn:trim(item.workState) == '0'? 'checked': 'disabled' }>요청
														</label> <label class="btn btn-primary"> <input
															type="radio" name="workState" value="진행"
															${fn:trim(item.workState) == '1'? 'checked': 'disabled' }>진행
														</label> <label class="btn btn-primary"> <input
															type="radio" name="workState" value="완료"
															${fn:trim(item.workState) == '2'? 'checked': 'disabled' }>완료
														</label>
													</div>
												</div>

												<!-- date -->
												<div class="clearfix pt-2 pb-2"
													style="border-bottom: 1px solid #aaa">

													<!-- modal -->
													<div class="float-left">
														<div class="btn-group">
															<button type="button"
																class="receiver-search btn btn-primary"
																data-toggle="modal" data-target="#managerModal" disabled>담당자</button>
														</div>

														<!-- 선택된 담당자 -->
														<label class="p-2 work-receiver" id="workReceiver"
															name="workReceiver">이형은</label>
													</div>

													<!-- date picker -->
													<div class="float-right pt-1">
														<!-- 시작일 추가 -->
														<div class="form-check-inline">
															<span class="icon"> <i
																class="fas fa-calendar-alt fa-lg mr-2"></i>
															</span> <input class="form-control work-start-date"
																name="workStartDate"
																value='<fmt:formatDate value="${item.workStartDate }" pattern="yyyy-MM-dd"/>'
																type="date" placeholder="시작일 추가" readonly required />
														</div>

														<!-- 마감일 추가 -->
														<div class="form-check-inline m-0">
															<span class="icon"> <i
																class="fas fa-calendar-alt fa-lg mr-2"></i>
															</span> <input class="form-control work-end-date"
																name="workEndDate"
																value='<fmt:formatDate value="${item.workEndDate }" pattern="yyyy-MM-dd"/>'
																type="date" placeholder="마감일 추가" readonly required />
														</div>
													</div>
												</div>

												<!-- content -->
												<div class="pb-3">
													<div class="work-content p-3">${item.workContent }</div>
													<textarea name="workContent"
														class="work-content form-control d-none"
														placeholder="업무내용을 입력하세요" required>${item.workContent }</textarea>
												</div>

												<!-- file-down -->
												<c:if test="${item.workFileSize > 0 }">
													<div class="file-down p-1 rounded clearfix"
														style="background-color: #ddd">
														<span class="left-column float-left"> <i
															class="fas fa-file"></i> <span class="work-file-name">${fn:substringAfter(item.workFileName, "_") }</span>
														</span> <span class="right-column float-right"> <a
															class="mr-2" href="${root }/workspace/download.do?workNum=${item.workNum }"><i class="fas fa-download">&nbsp;다운로드</i></a>
															<a class="delete-file" href="${root }/workspace/delete-file.do?workNum=${item.workNum }"><i class="fas fa-trash">&nbsp;삭제</i></a>
														</span>
													</div>
												</c:if>

												<!-- 더보기 -->
												<!-- 로그인 한 유저가 작성자인 경우만 보이게 -->
												<div class="more float-right mt-2">
													<a class="work-edit mr-2" href="#"><i
														class="fas fa-pen">&nbsp;일감 수정</i></a> <a class="work-delete"
														href="#"><i class="fas fa-trash">&nbsp;일감 삭제</i></a>
												</div>
												<div class="edit-more float-right mt-2 d-none">
													<button class="work-edit-ok btn btn-primary" type="submit">올리기</button>
													<button class="work-edit-cancel btn btn-warning"
														type="button">취소</button>
												</div>
											</div>
										</form>

										<!-- 일감 댓글 전체 -->
										<div class="work-reply-list card mb-4 m-4">

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
																	class="far fa-thumbs-up"></i> <a
																	href="/work-reply/like">좋아요</a>
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
													<form class="reply-form" action="/work-reply/write"
														method="post" enctype="multipart/form-data">
														<!-- 아바타, textarea, 작성버튼 -->
														<div class="row">
															<div class="input-group mb-3">
																<div class="input-group-append">
																	<!-- 아바타 -->
																	<img src="${root }/resources/img/avatar.png" width="50"
																		height="50" />
																</div>
																<textarea class="reply-my-content form-control"
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
																	<span class="float-left"> <i
																		class="fas fa-paperclip fa-lg mt-3 mr-2"></i>
																	</span> <input class="input-file form-control" type="file"
																		name="inputFile" style="width: calc(100% - 50px)">
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
									<!-- End of Card Body -->
								</div>
							</c:forEach>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Footer -->
	<jsp:include page="/WEB-INF/template/footer.jsp" />

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
								style="display: inline; width: 85%; margin-right: 30px;"
								placeholder="제목을 입력하세요."> &ensp;인원수
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

	<!-- 담당자 버튼 누를 시 뜨는 모달 -->
	<div class="modal fade" id="managerModal" tabindex="-1" role="dialog">
		<div class="modal-dialog col-sm-6" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">담당자 검색</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- modal-body -->
				<div class="modal-body">


					<!--담당자 리스트 -->
					<div class="form-group d-flex justify-content-center">
						<div class="form-check-inline">
							<input type="text"
								class="form-control form-check-inline input-title"
								placeholder="담당자를 검색하세요"> <input type="button"
								class="btn btn-primary" value="검색">
						</div>
					</div>
					<!-- 글 내용 -->
					<div class="form-group row">
						<div class="col-sm-12"></div>
					</div>

					<!-- modal-footer -->
					<div
						class="modal-footer justify-content-between d-flex flex-row-reverse">
						<button type="reset" class="btn btn-warning" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 실시간 템플릿 -->
	<div id="work-tmpl" class="card shadow mb-4 border-bottom-primary"
		style="display: none">

		<!-- Card Body -->
		<div class="card-body">

			<form>
				<div class="o-hidden">

					<!-- writer -->
					<div class="writer-row clearfix"
						style="border-bottom: 1px solid #aaa">
						<img class="left-column float-left"
							src="${root }/resources/img/avatar.png" width="50" height="50" />
						<div class="left-column float-left ml-2">
							<p class="work-sender m-0" style="font-size: 14px">작성자</p>
							<p class="work-write-date" style="font-size: 14px">작성일</p>
						</div>
						<input class="work-sender" type="hidden" name="workSender"
							value="${sessionScope.id }" />
					</div>
					<!-- subject, state -->
					<div class="clearfix pt-2 pb-2"
						style="border-bottom: 1px solid #aaa">
						<!-- subject -->
						<div class="float-left mt-2">
							<h5 class="work-subject pl-2">제목</h5>
							<input type="text" class="form-control work-subject d-none"
								name="workSubject" value="제목" placeholder="업무명을 입력하세요" required>
						</div>
						<!-- state -->
						<div class="work-state btn-group btn-group-toggle float-right"
							data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="workState" value="요청">요청
							</label> <label class="btn btn-primary"> <input type="radio"
								name="workState" value="진행">진행
							</label> <label class="btn btn-primary"> <input type="radio"
								name="workState" value="완료">완료
							</label>
						</div>
					</div>

					<!-- date -->
					<div class="clearfix pt-2 pb-2"
						style="border-bottom: 1px solid #aaa">

						<!-- modal -->
						<div class="float-left">
							<div class="btn-group">
								<button type="button" class="receiver-search btn btn-primary"
									data-toggle="modal" data-target="#managerModal">담당자</button>
							</div>

							<!-- 선택된 담당자 -->
							<label class="work-receiver p-2" name="workReceiver">이형은</label>
						</div>

						<!-- date picker -->
						<div class="float-right pt-1">
							<!-- 시작일 추가 -->
							<div class="form-check-inline">
								<span class="icon"> <i
									class="fas fa-calendar-alt fa-lg mr-2"></i>
								</span> <input class="form-control work-start-date"
									name="workStartDate" type="date" placeholder="시작일 추가" required />
							</div>

							<!-- 마감일 추가 -->
							<div class="form-check-inline m-0">
								<span class="icon"> <i
									class="fas fa-calendar-alt fa-lg mr-2"></i>
								</span> <input class="form-control work-end-date" name="workEndDate"
									type="date" placeholder="마감일 추가" required />
							</div>
						</div>
					</div>

					<!-- content -->
					<div class="pb-3">
						<div class="work-content p-3">내용</div>
						<textarea name="workContent"
							class="form-control work-content d-none"
							placeholder="업무내용을 입력하세요" required>내용</textarea>
					</div>

					<!-- file-down -->
					<div class="file-down p-1 rounded reply-file clearfix d-none"
						style="background-color: #ddd">
						<span class="left-column float-left"> <i
							class="fas fa-file"></i> <span class="reply-file-name">요구사항
								분석서.doc</span>
						</span> <span class="right-column float-right"> <a class="mr-2"
							href="#"><i class="fas fa-download">&nbsp;다운로드</i></a> <a
							href="#"><i class="fas fa-trash">&nbsp;삭제</i></a>
						</span>
					</div>

					<!-- 더보기 -->
					<!-- 로그인 한 유저가 작성자인 경우만 보이게 -->
					<div class="more float-right mt-2">
						<a class="work-edit mr-2" href="#"><i class="fas fa-pen">&nbsp;일감
								수정</i></a> <a class="work-delete" href="#"><i class="fas fa-trash">&nbsp;일감
								삭제</i></a>
					</div>
					<div class="edit-more float-right mt-2 d-none">
						<button class="work-edit-ok btn btn-primary" type="submit">올리기</button>
						<button class="work-edit-cancel btn btn-warning" type="button">취소</button>
					</div>

				</div>
			</form>

			<!-- 일감 댓글 전체 -->
			<div class="work-reply-list card mb-4 m-4">

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
						<form class="reply-form" action="/work-reply/write" method="post"
							enctype="multipart/form-data">
							<!-- 아바타, textarea, 작성버튼 -->
							<div class="row">
								<div class="input-group mb-3">
									<div class="input-group-append">
										<!-- 아바타 -->
										<img src="${root }/resources/img/avatar.png" width="50"
											height="50" />
									</div>
									<textarea class="reply-my-content form-control"
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
										<span class="float-left"> <i
											class="fas fa-paperclip fa-lg mr-2 mt-3"></i>
										</span> <input class="input-file form-control" type="file"
											name="inputFile" style="width: calc(100% - 50px)">
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
		<!-- End of Card Body -->
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
	<!-- moment(캘린더) -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<!-- 일감댓글 -->
	<script src="${root}/resources/js/workspace/reply.js"></script>
</body>
</html>