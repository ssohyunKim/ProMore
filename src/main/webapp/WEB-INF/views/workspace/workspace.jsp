<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
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
<!-- jQuery -->
<style>
textarea {
	background-color: #E9ECEF !important;
}
</style>
<script type="text/javascript" src="${root}/resources/jquery.js"></script>
</head>
<script type="text/javascript">
	var name = "";
	var content = "";
	var max = "";

	$(function() {
		$('#projectReadModal').on('show.bs.modal', function(event) {
			name = $(event.relatedTarget).data('name');
			$('input[name="proName"]').val(name);

			max = $(event.relatedTarget).data('max');
			$('select[name="proMax"]').val(max).attr("selected", "selected");
			$('select[name="proMax"] option').attr('disabled', true);

			content = $(event.relatedTarget).data('content');
			$('textarea[name="proContent"]').text(content);

		});

		$('#updateBtn').click(function() {
			$('#projectUpdateModal').modal();

			$('input[name="proName"]').val(name);

			$('select[name="proMax"]').val(max).prop("selected", true);
			$('select[name="proMax"] option').attr('disabled', false);

			$('textarea[name="proContent"]').text(content);

			$('#projectReadModal').modal().hide();
		});

		$('#deleteBtn').click(function() {
			$('#removeConfirmModal').modal();
		});

		$('.modal').on('hide.bs.modal', function(event) {
			location.reload();
		});
	});

	function projectDelete(root) {
		location.href = root + '/project/delete.do?proNum=' + $
		{
			proNum
		}
		;
	}
</script>

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
						<c:forEach var="projectDto" items="${projectDtoArray}">
							<c:if test="${projectDto.proNum eq proNum}">
								<a href="#" data-name="${projectDto.proName}"
									data-max="${projectDto.proMax}"
									data-content="${projectDto.proContent}" data-toggle="modal"
									data-target="#projectReadModal">
									<div
										class="alert alert-primary bg-primary p-3 rounded-lg text-center">
										<b class="text-white font-weight-bolder"> ProMore</b>
									</div>
								</a>
							</c:if>
						</c:forEach>

						<div class="card shadow mb-4 border-bottom-primary">

							<!-- Card Body -->
							<div class="card-body">

								<!-- 일감 생성 폼 -->
								<form id="work-form">
									<div class="o-hidden">
										<input id="pro-num" type="hidden" name="proNum"
											value="${proNum }" />

										<!-- sender, subject, state -->
										<div class="clearfix" style="border-bottom: 1px solid #aaa">
											<!-- sender -->
											<input class="work-sender" type="hidden" name="workSender"
												value="${sessionScope.memberDto.memId }" />

											<!-- subject -->
											<div class="float-left pb-2">
												<input type="text" class="work-subject form-control"
													name="workSubject" placeholder="업무명을 입력하세요" required
													value="더미데이터">
											</div>

											<!-- state -->
											<!-- 0: 요청, 1: 진행, 2: 완료 -->
											<div
												class="btn-group btn-group-toggle work-state float-right"
												data-toggle="buttons">
												<label class="btn btn-primary active"> <input
													type="radio" name="workState" checked value="0">요청
												</label> <label class="btn btn-primary"> <input type="radio"
													name="workState" value="1">진행
												</label> <label class="btn btn-primary"> <input type="radio"
													name="workState" value="2">완료
												</label>
											</div>
										</div>

										<!-- receiver, date picker -->
										<div class="clearfix pt-2"
											style="border-bottom: 1px solid #aaa">

											<!-- receiver -->
											<div class="work-receiver form-group float-left pt-1">
												<input class="form-control" type="text" name="workReceiver"
													placeholder="담당자 검색" required />
											</div>

											<!-- date picker -->
											<jsp:useBean id="now" class="java.util.Date" />
											<div class="float-right pt-1">
												<!-- start-date -->
												<div class="form-check-inline">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="form-control work-start-date"
														name="workStartDate" type="date" placeholder="시작일 추가"
														required
														value='<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" />' />
												</div>

												<!-- end-date -->
												<div class="form-check-inline m-0">
													<span class="icon"> <i
														class="fas fa-calendar-alt fa-lg mr-2"></i>
													</span> <input class="form-control work-end-date"
														name="workEndDate" type="date" placeholder="마감일 추가"
														required
														value='<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" />' />
												</div>
											</div>
										</div>

										<!-- content -->
										<textarea
											class="form-control mt-2 pt-2 pb-2 work-content autosize"
											name="workContent" placeholder="업무내용을 입력하세요" required>더미데이터</textarea>

										<!-- input-file -->
										<div class="input-group pt-2 pb-2 col-8">
											<span class="icon mt-2"> <i
												class="fas fa-paperclip fa-lg"></i>
											</span> <input type="file" class="input-file form-control mx-2"
												name="inputFile" />
										</div>

										<!-- save -->
										<div class="d-flex flex-row-reverse">
											<button type="submit" class="btn btn-primary">올리기</button>
										</div>
									</div>
								</form>
								<!-- End of 일감 생성 폼 -->
							</div>
						</div>

						<!-- 일감 리스트 -->
						<div id="work-list">
							<c:forEach var="item" items="${list }">
								<!-- 작성된 일감 템플릿 -->
								<div id="work-no-${item.workNum }"
									class="card shadow mb-4 border-bottom-primary">

									<!-- Card Body -->
									<div class="card-body">

										<form class="team-work-form">
											<div class="o-hidden">

												<!-- sender, write-date -->
												<div class="clearfix" style="border-bottom: 1px solid #aaa">
													<img class="left-column float-left"
														src="${root }/resources/img/avatar.png" width="50"
														height="50" />
													<div class="left-column float-left ml-2">
														<b class="work-sender m-0" style="font-size: 14px">
															${item.workSender }</b>
														<p class="work-write-date" style="font-size: 14px">
															<fmt:formatDate value="${item.workWriteDate }"
																pattern="yyyy.MM.dd (E)" />
														</p>
													</div>
													<input class="work-sender" type="hidden" name="workSender"
														value="${sessionScope.memberDto.memId }" />
												</div>
												<!-- subject, state -->
												<div class="clearfix pt-2 pb-2"
													style="border-bottom: 1px solid #aaa">
													<!-- subject -->
													<div class="float-left">
														<h5 class="work-subject pl-2 mt-2">${item.workSubject }</h5>
														<input type="text"
															class="form-control work-subject d-none"
															name="workSubject" placeholder="업무명을 입력하세요" required>
													</div>
													<!-- state -->
													<div
														class="work-state btn-group btn-group-toggle float-right"
														data-toggle="buttons">
														<label class="btn btn-primary"> <input
															type="radio" name="workState" value="0">요청
														</label> <label class="btn btn-primary"> <input
															type="radio" name="workState" value="1">진행
														</label> <label class="btn btn-primary"> <input
															type="radio" name="workState" value="2">완료
														</label>
														<script>
															var ws = document.querySelectorAll("[id^='work-no-${item.workNum}'] [name='workState']");
															ws[parseInt(${item.workState})].click();
														</script>
													</div>
												</div>

												<!-- receiver, start-date, end-date -->
												<div class="clearfix pt-2 pb-2"
													style="border-bottom: 1px solid #aaa">

													<!-- receiver -->
													<div class="work-receiver-wrap float-left p-2">
														<span class="mr-2" style="font-size: 18px;">담당자</span> <span
															class="work-receiver" style="font-size: 18px;">${item.workReceiver }</span>
													</div>
													<div
														class="work-receiver-wrap-2 float-left pt-1 pb-1 d-none">
														<input class="work-receiver form-control" type="text"
															name="workReceiver" placeholder="담당자 검색" required />
													</div>

													<!-- start-date, end-date -->
													<div class="float-right pt-1">
														<!-- start-date -->
														<div class="form-check-inline">
															<span class="icon"> <i
																class="fas fa-calendar-alt fa-lg mr-2"></i>
															</span> <input class="form-control work-start-date"
																name="workStartDate"
																value='<fmt:formatDate value="${item.workStartDate }" pattern="yyyy-MM-dd"/>'
																type="date" placeholder="시작일 추가" required disabled />
														</div>

														<!-- end-date -->
														<div class="form-check-inline m-0">
															<span class="icon"> <i
																class="fas fa-calendar-alt fa-lg mr-2"></i>
															</span> <input class="form-control work-end-date"
																name="workEndDate"
																value='<fmt:formatDate value="${item.workEndDate }" pattern="yyyy-MM-dd"/>'
																type="date" placeholder="마감일 추가" required disabled />
														</div>
													</div>
												</div>

												<!-- content -->
												<textarea name="workContent"
													class="work-content form-control mt-2 p-2 pb-3 autosize"
													style="white-space: pre-wrap;" placeholder="업무내용을 입력하세요"
													required disabled>${item.workContent }</textarea>

												<!-- file-down -->
												<div
													class="file-down p-1 rounded clearfix ${item.workFileSize == 0? 'd-none': '' }"
													style="background-color: #ddd">
													<span class="left-column float-left"> <i
														class="fas fa-file"></i> <span class="work-file-name">${fn:substringAfter(item.workFileName, "_") }</span>
													</span> <span class="right-column float-right"> <a
														class="download-file mr-2"
														href="${root }/workspace/download.do?workNum=${item.workNum }"><i
															class="fas fa-download">&nbsp;다운로드</i></a> <a
														class="delete-file d-none"
														href="${root }/workspace/delete-file.do?workNum=${item.workNum }"><i
															class="fas fa-trash">&nbsp;삭제</i></a>
													</span>
												</div>
												<!-- file-up -->
												<div class="file-up input-group pt-2 pb-2 col-8 d-none">
													<span class="icon mt-2"> <i
														class="fas fa-paperclip fa-lg"></i>
													</span> <input type="file" class="input-file form-control mx-2"
														name="inputFile" />
												</div>

												<c:if
													test="${item.workSender == sessionScope.memberDto.memId }">
													<!-- more -->
													<div class="more float-right mt-2">
														<a class="work-edit mr-2" href="#"><i
															class="fas fa-pen">&nbsp;일감 수정</i></a> <a class="work-delete"
															href="#"><i class="fas fa-trash">&nbsp;일감 삭제</i></a>
													</div>
													<!-- edit-more -->
													<div class="edit-more float-right mt-2 d-none">
														<button class="work-edit-ok btn btn-primary" type="submit">올리기</button>
														<button class="work-edit-cancel btn btn-warning"
															type="button">취소</button>
													</div>
												</c:if>
											</div>
										</form>

										<!-- 일감 댓글 리스트 -->
										<div class="work-reply-list card mb-4 m-4">

											<!-- Card Header -->
											<div class="card-header">
												<p>댓글</p>
											</div>

											<!-- Card Body -->
											<div class="card-body">

												<!-- 댓글 리스트 영역 -->
												<div class="container reply-list">
													<c:forEach var="reply" items="${item.workReplyDto }">
														<!-- 댓글 템플릿 -->
														<div id="reply-no-${reply.replyNum }"
															class="row clearfix mb-3 pb-1"
															style="border-bottom: 1px solid #aaa">
															<!-- avatar -->
															<div class="left-column float-left">
																<img src="${root }/resources/img/avatar.png" width="50"
																	height="50" />
															</div>
															<!-- writer, write-date, reply-like, reply-edit, reply-delete -->
															<div class="right-column ml-2"
																style="width: calc(100% - 85px);">
																<div class="writer-info clearfix">
																	<b class="reply-writer p-1 rounded float-left">${reply.replyId }</b>
																	<span class="float-right"> <span class="ml-3">
																			<i class="far fa-thumbs-up"></i> <span
																			class="like-cnt"
																			style="color: ${reply.canClickLike? '#000': '#f00'}">${reply.replyLike }</span>
																			<c:if test="${reply.canClickLike }">
																				<a class="reply-like" href="#">좋아요</a>
																			</c:if>
																	</span> <c:if
																			test="${sessionScope.memberDto.memId == reply.replyId }">
                                                                        |&nbsp;<a
																				class="reply-edit" href="#">수정</a> |&nbsp;<a
																				class="reply-delete" href="#">삭제</a>
																		</c:if> &nbsp;&nbsp;&nbsp; <span class="reply-write-date"><fmt:formatDate
																				value="${reply.replyDate }"
																				pattern="yyyy-MM-dd HH:mm:ss" /> </span>
																	</span>
																</div>
																<div class="reply-content p-2">${fn:replace(reply.replyContent, newLineChar, "
																			<br>") }</div>
																<!-- file-down(작성 폼에서 업로드한 파일이 있다면 d-none 제거) -->
																<div
																	class="file-down p-1 rounded clearfix ${reply.replyFileSize == 0? 'd-none': '' }"
																	style="background-color: #ddd">
																	<span class="left-column float-left"> <i
																		class="fas fa-file"></i> <span class="reply-file-name">${fn:substringAfter(reply.replyFileName, "_") }</span>
																	</span> <span class="right-column float-right"> <a
																		class="download-file mr-2"
																		href="${root }/workspace/download.do?replyNum=${reply.replyNum }"><i
																			class="fas fa-download">&nbsp;다운로드</i></a>
																	</span>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>

												<!-- reply-form -->
												<form class="reply-form"
													action="${root }/work-reply/add-reply.do"
													style="border-bottom: 1px solid #aaa">
													<!-- avatar, reply-form, submit(작성) -->
													<div class="row">
														<div class="input-group mb-3">
															<!-- avatar -->
															<div class="input-group-append">
																<img src="${root }/resources/img/avatar.png" width="50"
																	height="50" />
															</div>
															<!-- reply-form -->
															<textarea class="reply-content form-control autosize"
																placeholder="댓글을 작성하세요." name="replyContent" required></textarea>
															<!-- submit -->
															<div class="input-group-append">
																<button class="btn btn-outline-secondary" type="submit">작성</button>
															</div>
														</div>
													</div>
													<!-- file-down(댓글 수정 버튼, 수정하려는 댓글에 파일이 있다면 보이도록 d-none 제거) -->
													<div class="file-down p-1 mb-1 rounded clearfix d-none"
														style="background-color: #ddd">
														<span class="left-column float-left"> <i
															class="fas fa-file"></i> <span class="reply-file-name">파일명</span>
														</span> <span class="right-column float-right"> <a
															class="delete-file" href="#"><i class="fas fa-trash">&nbsp;삭제</i></a>
														</span>
													</div>

													<!-- input-file -->
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
												<!-- End of reply-form -->
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

	<!--Project Read Model -->
	<div class="modal fade" id="projectReadModal" tabindex="-1"
		role="dialog">
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

					<!-- 프로젝트 제목 && 인원수  -->
					<div class="form-group row">
						<div class="col-sm-10">
							<input type="text" class="form-control-plaintext" name="proName"
								style="display: inline;" placeholder="제목을 입력하세요." readonly>
						</div>
						<p style="margin: 6px 13px 0px 0px">인원수</p>
						<div class="col-sm-1.5" style="display: inline;">
							<select name="proMax" class="form-control-plaintext" readonly>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>

					<!-- 글 내용 -->
					<div class="form-group row">
						<div class="col-sm-12">
							<textarea class="form-control-plaintext" rows="20"
								name="proContent" placeholder="글을 입력하세요." readonly></textarea>
						</div>
					</div>

					<!-- 팀장이면 modal-footer -->
					<c:if test="${memberDto.memLevel=='팀장'}">
						<div class="modal-footer justify-content-right">
							<div>
								<button id="deleteBtn" type="button" class="btn btn-secondary">삭제</button>
								<button id="updateBtn" type="button" class="btn btn-primary">수정</button>
							</div>
						</div>
					</c:if>
					<!-- 팀원이면 modal-footer -->
					<c:if test="${memberDto.memLevel=='팀원'}">
						<div class="modal-footer justify-content-right">
							<div>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">확인</button>
							</div>
						</div>
					</c:if>

				</div>

			</div>
		</div>
	</div>


	<!--Project Update Model -->
	<div class="modal fade" id="projectUpdateModal" tabindex="-1"
		role="dialog">
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


				<form action="${root}/project/update.do" name="updateForm"
					method="post">
					<input id="proNum" type="hidden" name="proNum" value="${proNum}" />
					<!-- modal-body -->
					<div class="modal-body">

						<!-- 프로젝트 제목 && 인원수  -->
						<div class="form-group row">
							<div class="col-sm-10">
								<input type="text" class="form-control" name="proName"
									style="display: inline;" placeholder="제목을 입력하세요.">
							</div>
							<p style="margin: 6px 13px 0px 0px">인원수</p>
							<div class="col-sm-1.5" style="display: inline;">
								<select name="proMax" class="form-control">
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>

						<!-- 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea class="form-control-plaintext" rows="20"
									name="proContent" placeholder="글을 입력하세요."></textarea>
							</div>
						</div>


						<!-- modal-footer -->
						<div class="modal-footer justify-content-right">
							<div>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-primary">확인</button>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!--remove Confirm Model -->
	<div class="modal fade" id="removeConfirmModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">아니요</button>
					<button class="btn btn-primary" type="button"
						onclick="projectDelete('${root}')">네</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 댓글 템플릿 -->
	<div id="reply-tmpl" class="row clearfix d-none mb-3 pb-1"
		style="border-bottom: 1px solid #aaa">
		<!-- avatar -->
		<div class="left-column float-left">
			<img src="${root }/resources/img/avatar.png" width="50" height="50" />
		</div>
		<!-- writer, write-date, reply-like, reply-edit, reply-delete -->
		<div class="right-column ml-2" style="width: calc(100% - 85px);">
			<div class="writer-info clearfix">
				<b class="reply-writer p-1 rounded float-left">작성자</b> <span
					class="float-right"> <span class="ml-3"> <i
						class="far fa-thumbs-up">&nbsp;</i><span class="like-cnt"
						style="color: #000">0</span> <a class="reply-like" href="#">좋아요</a>
				</span> |&nbsp;<a class="reply-edit" href="#">수정</a> |&nbsp;<a
					class="reply-delete" href="#">삭제</a> &nbsp;&nbsp;&nbsp;<span
					class="reply-write-date">작성일</span>
				</span>
			</div>
			<div class="reply-content p-2">댓글 내용</div>

			<!-- file-down(작성 폼에서 업로드한 파일이 있다면 d-none 제거) -->
			<div class="file-down p-1 rounded clearfix d-none"
				style="background-color: #ddd">
				<span class="left-column float-left"> <i class="fas fa-file"></i>
					<span class="reply-file-name"></span> <!-- 파일명 공백으로 둘 것 -->
				</span> <span class="right-column float-right"> <a
					class="download-file mr-2" href="#"><i class="fas fa-download">&nbsp;다운로드</i></a>
				</span>
			</div>
		</div>
	</div>

	<!-- 일감 템플릿(올리기 버튼) -->
	<div id="work-tmpl"
		class="card shadow mb-4 border-bottom-primary d-none">
		<!-- Card Body -->
		<div class="card-body">
			<form class="team-work-form">
				<div class="o-hidden">
					<!-- sender, write-date -->
					<div class="clearfix" style="border-bottom: 1px solid #aaa">
						<img class="left-column float-left"
							src="${root }/resources/img/avatar.png" width="50" height="50" />
						<div class="left-column float-left ml-2">
							<b class="work-sender m-0" style="font-size: 14px">작성자</b>
							<p class="work-write-date" style="font-size: 14px">작성일</p>
						</div>
						<input class="work-sender" type="hidden" name="workSender"
							value="${sessionScope.memberDto.memId }" />
					</div>
					<!-- subject, state -->
					<div class="clearfix pt-2 pb-2"
						style="border-bottom: 1px solid #aaa">
						<!-- subject -->
						<div class="float-left">
							<h5 class="work-subject pl-2 mt-2">제목</h5>
							<input type="text" class="form-control work-subject d-none"
								name="workSubject" value="제목" placeholder="업무명을 입력하세요" required>
						</div>
						<!-- state -->
						<div class="work-state btn-group btn-group-toggle float-right"
							data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="workState" value="0">요청
							</label> <label class="btn btn-primary"> <input type="radio"
								name="workState" value="1">진행
							</label> <label class="btn btn-primary"> <input type="radio"
								name="workState" value="2">완료
							</label>
						</div>
					</div>

					<!-- receiver, start-date, end-date -->
					<div class="clearfix pt-2 pb-2"
						style="border-bottom: 1px solid #aaa">

						<!-- receiver -->
						<div class="work-receiver-wrap float-left p-2">
							<span class="mr-2" style="font-size: 18px;">담당자</span> <span
								class="work-receiver" style="font-size: 18px;"></span>
						</div>
						<div class="work-receiver-wrap-2 float-left pt-1 pb-1 d-none">
							<input class="work-receiver form-control" type="text"
								name="workReceiver" placeholder="담당자 검색" required />
						</div>

						<!-- start-date, end-date -->
						<div class="float-right pt-1">
							<!-- start-date -->
							<div class="form-check-inline">
								<span class="icon"> <i
									class="fas fa-calendar-alt fa-lg mr-2"></i>
								</span> <input class="form-control work-start-date"
									name="workStartDate" type="date" placeholder="시작일 추가" required
									disabled />
							</div>

							<!-- end-date -->
							<div class="form-check-inline m-0">
								<span class="icon"> <i
									class="fas fa-calendar-alt fa-lg mr-2"></i>
								</span> <input class="form-control work-end-date" name="workEndDate"
									type="date" placeholder="마감일 추가" required disabled />
							</div>
						</div>
					</div>

					<!-- content -->
					<textarea name="workContent"
						class="work-content form-control mt-2 p-2 pb-3 autosize"
						style="white-space: pre-wrap;" placeholder="업무내용을 입력하세요" required
						disabled>내용</textarea>

					<!-- file-down(작성 폼에서 업로드한 파일이 있다면 d-none 제거) -->
					<div class="file-down p-1 rounded clearfix d-none"
						style="background-color: #ddd">
						<span class="left-column float-left"> <i
							class="fas fa-file"></i> <span class="work-file-name">요구사항
								분석서.doc</span>
						</span> <span class="right-column float-right"> <a
							class="download-file mr-2" href="#"><i
								class="fas fa-download">&nbsp;다운로드</i></a> <a
							class="delete-file d-none" href=""><i class="fas fa-trash">&nbsp;삭제</i></a>
						</span>
					</div>

					<!-- file-up(일감 수정 버튼 누를 때 보일 파일 버튼을 위해 d-none 추가했음) -->
					<div class="file-up input-group pt-2 pb-2 col-8 d-none">
						<span class="icon mt-2"> <i class="fas fa-paperclip fa-lg"></i>
						</span> <input type="file" class="input-file form-control mx-2"
							name="inputFile" />
					</div>

					<!-- more -->
					<div class="more float-right mt-2">
						<a class="work-edit mr-2" href="#"><i class="fas fa-pen">&nbsp;일감
								수정</i></a> <a class="work-delete" href="#"><i class="fas fa-trash">&nbsp;일감
								삭제</i></a>
					</div>
					<!-- edit-more -->
					<div class="edit-more float-right mt-2 d-none">
						<button class="work-edit-ok btn btn-primary" type="submit">올리기</button>
						<button class="work-edit-cancel btn btn-warning" type="button">취소</button>
					</div>
				</div>
			</form>

			<!-- 일감 댓글 리스트 -->
			<div class="work-reply-list card mb-4 m-4">
				<!-- Card Header -->
				<div class="card-header">
					<p>댓글</p>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<!-- 댓글 리스트 영역 -->
					<div class="container reply-list"></div>

					<!-- reply-form -->
					<form class="reply-form" action="${root }/work-reply/add-reply.do"
						style="border-bottom: 1px solid #aaa">
						<!-- avatar, reply-form, submit(작성) -->
						<div class="row">
							<div class="input-group mb-3">
								<!-- avatar -->
								<div class="input-group-append">
									<img src="${root }/resources/img/avatar.png" width="50"
										height="50" />
								</div>
								<!-- reply-form -->
								<textarea class="reply-content form-control autosize"
									placeholder="댓글을 작성하세요." name="replyContent" required></textarea>
								<!-- submit -->
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="submit">작성</button>
								</div>
							</div>
						</div>
						<!-- file-down(작성 폼에서 업로드한 파일이 있다면 d-none 제거) -->
						<div class="file-down p-1 mb-1 rounded clearfix d-none"
							style="background-color: #ddd">
							<span class="left-column float-left"> <i
								class="fas fa-file"></i> <span class="reply-file-name">파일명</span>
							</span> <span class="right-column float-right"> <a
								class="delete-file" href="#"><i class="fas fa-trash">&nbsp;삭제</i></a>
							</span>
						</div>

						<!-- input-file -->
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
					<!-- End of reply-form -->
				</div>
				<!-- End of Card Body(댓글 리스트) -->
			</div>
			<!-- End of 일감 댓글 전체 -->
		</div>
		<!-- End of Card Body(일감 템플릿) -->
	</div>
	<!-- 일감 템플릿 -->

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
	<!-- moment(캘린더) -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<!-- 일감댓글 -->
	<script>
		var root = "${root }";
		var id = "${id }";
		var memId = "${memberDto.memId }";
		var memNickname = "${memberDto.memNickname }";
	</script>
	<script src="${root}/resources/js/workspace/reply.js"></script>
	<script src="${root}/resources/js/workspace/workspace.js"></script>
</body>
</html>