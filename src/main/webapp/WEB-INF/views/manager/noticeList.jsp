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
<title>공지사항 관리</title>

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
						<h1 class="h3 mb-0 text-gray-800">공지사항 관리</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->
					<!--  style="width: 80%;" -->
					<div class="card shadow mb-4">
						<!-- Card Header -->
						<div class="card-header py-3 form-inline justify-content-between">
							<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 글 목록</h5>
							<a href="#" class="btn btn-primary btn-circle btn-md"
								data-toggle="modal" data-target="#noticeCreateModal"> <i
								class="fas fa-pen"></i>
							</a>
						</div>

						<!-- Card Body -->
						<!-- 공지사항 리스트 -->
						<div class="card-body">
							<div class="table-responsive">
								<form id="dataForm">
									<table class="table table-bordered" id="dataTable">
										<thead class="text-center">
											<tr>
												<th>공지 번호</th>
												<th>조회수</th>
												<th>제목</th>
												<th>작성 일자</th>
												<th>첨부 파일</th>
												<th>관리</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${noticeCount>0}">
												<c:forEach var="noticeDto" items="${noticeDtoArray}">
													<tr>
														<!-- 공지사항 글 번호 -->
														<td width="10%" class="text-center"><label>${noticeDto.notNum}</label></td>
														
														<!-- 공지사항 조회수 -->
														<td width="10%" class="text-center">${noticeDto.notReadCount}</td>
														
														<!-- 공지사항 글 제목 -->
														<td width="30%"><a href="#" data-toggle="modal"
															data-target="#noticeReadModal"
															data-num="${noticeDto.notNum}"
															data-title="${noticeDto.notTitle}"
															data-content="${noticeDto.notContent}"
															data-file="${noticeDto.notFileName}"
															data-root="${root}">
															${noticeDto.notTitle}
															</a>
														</td>
														
														<!-- 공지사항 작성일 -->
														<td width="15%" class="text-center">
															<fmt:formatDate value="${noticeDto.notWriteDate}" pattern="yyyy-MM-dd" />
														</td>

														<!-- 공지사항 첨부파일 -->
														<c:if test="${noticeDto.notFileSize>0}">
															<td width="25%"><a href="${root}/manager/noticeFileDownload.do?notNum=${noticeDto.notNum}">${noticeDto.notFileName}</a></td>
														</c:if>

														<c:if test="${noticeDto.notFileSize==0}">
															<td width="25%"><a>첨부파일 없음</a></td>
														</c:if>

														<!-- 공지사항 삭제 버튼 -->
														<td width="10%" class="text-center"><a href="#" data-toggle="modal"
															data-target="#noticeDeleteModal"
															data-num="${noticeDto.notNum}">
															삭제
															</a>
														</td>
													</tr>

												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</form>
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

	<!-- Notice Write Model -->
	<div class="modal fade" id="noticeCreateModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 작성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form action="${root}/manager/noticeWriteOk.do" method="post"
					enctype="multipart/form-data">

					<!-- modal-body -->
					<div class="modal-body">

						<!-- 공지사항 글 제목 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<input type="text" class="form-control" placeholder="제목을 입력하세요."
									name="notTitle">
							</div>
						</div>

						<!-- 공지사항 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea class="form-control" rows="20" id="inputContent"
									placeholder="글을 입력하세요." name="notContent"></textarea>
							</div>
						</div>

						<!-- 파일 첨부 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
								</span> <input type="file" class="mx-2" id="inputFile" name="file" />
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-between">
						<button type="reset" class="btn btn-warning">초기화</button>

						<div>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">작성 완료</button>
						</div>
					</div>

				</form>

			</div>
		</div>
	</div>

	<!-- Notice Read Model -->
	<div class="modal fade" id="noticeReadModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 읽기</h5>
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
								</span> <a id="fileName"></a>
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-dismiss="modal" data-target="#noticeUpdateModal">수정하기</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>

				</form>

			</div>
		</div>
	</div>

	<!-- Notice Update Model -->
	<div class="modal fade" id="noticeUpdateModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form id="updateForm" action="${root}/manager/noticeUpdateOk.do" method="post" enctype="multipart/form-data">
				
				<input type="hidden" id="updateNum" name="notNum" value="">

					<!-- modal-body -->
					<div class="modal-body p-4">

						<!-- 공지사항 글 제목 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<input type="text" class="form-control" id="updateTitle" name="notTitle"
									placeholder="제목을 입력하세요.">
							</div>
						</div>

						<!-- 공지사항 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea class="form-control" rows="20" id="updateContent" name="notContent"
									placeholder="내용을 입력하세요."></textarea>
							</div>
						</div>

						<!-- 파일 첨부 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
								</span> <label for="fileupload" class="btn btn-secondary btn-sm">파일
									선택</label> <input type="file" id="fileupload" name="file"
									style="display: none;"> <a
									class="fileName">첨부파일 없음</a>
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-between">
						<button type="reset" class="btn btn-warning">내용 전체 삭제</button>

						<div>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">수정 완료</button>
						</div>
					</div>

				</form>

			</div>
		</div>
	</div>

	<!-- Notice Delete Model -->
	<div class="modal fade" id="noticeDeleteModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			
				<!-- modal-body -->
				<div class="modal-body">
					<h5 class="modal-title">공지사항을 삭제하시겠습니까?</h5>
				</div>
				
				<!-- modal-footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="noticeDelete('${root}');">삭제</button>
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
	<script src="${root}/resources/js/manager/notice.js"></script>

</body>
</html>