<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

					<div class="card shadow mb-4">
						<!-- Card Header -->
						<div class="card-header py-3 form-inline justify-content-between">
							<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 글 목록</h5>
							<a href="#" class="btn btn-primary btn-circle btn-md"
								data-toggle="modal" data-target="#noticeCreateModal"> <!-- <a href="${root}/manager/noticeCreate.do" class="btn btn-primary btn-circle btn-md"> -->
								<i class="fas fa-pen"></i>
							</a>
						</div>

						<!-- Card Body -->
						<!-- 공지사항 리스트 -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>글 번호</th>
											<th>글 제목</th>
											<th>조회수</th>
											<th>작성 일자</th>
											<th>첨부 파일</th>
											<th>게시글 관리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>58011</td>
											<td><a href="#" data-toggle="modal"
												data-target="#noticeReadModal">[필독] 프로젝트 참여시 주의사항</a></td>
											<td>61</td>
											<td>2012/03/29</td>
											<td>첨부파일 없음</td>
											<td><a href="#">삭제</a></td>
										</tr>
										<tr>
											<td>58012</td>
											<td>[필독] 신고시 주의사항</td>
											<td>63</td>
											<td>2011/07/25</td>
											<td>첨부파일 없음</td>
											<td><a href="#">삭제</a></td>
										</tr>
										<tr>
											<td>58013</td>
											<td>[필독] 고객 게시판 사용 방법</td>
											<td>66</td>
											<td>2011/04/25</td>
											<td>첨부파일 없음</td>
											<td><a href="#">삭제</a></td>
										</tr>
										<tr>
											<td>58014</td>
											<td>버그 수정이 완료되었습니다.</td>
											<td>22</td>
											<td>2009/01/12</td>
											<td>첨부파일 없음</td>
											<td><a href="#">삭제</a></td>
										</tr>
										<tr>
											<td>58016</td>
											<td>새로운 서비스 런칭</td>
											<td>33</td>
											<td>2008/11/28</td>
											<td><a href="#">영상.mp4</a></td>
											<td><a href="#">삭제</a></td>
										</tr>
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


	<!-- Notice Write Model -->
	<div class="modal fade" id="noticeCreateModal" tabindex="-1"
		role="dialog">
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

				<form action="${root}/manager/noticeWriteOk.do" method="post" enctype="multipart/form-data">

					<%-- <input type="hidden" name="notNum" value="${notNum}" /> --%>
					
					<!-- modal-body -->
					<div class="modal-body">

						<!-- 공지사항 글 제목 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<input type="text" class="form-control" 
									placeholder="제목을 입력하세요." name="notTitle">
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
								<h5 class="form-control-plaintext font-weight-bold"
									id="staticTitle">[필독] 프로젝트 참여시 주의사항</h5>
							</div>
						</div>

						<!-- 공지사항 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea readonly class="form-control-plaintext" rows="20"
									id="content"
									placeholder="안녕하세요.&#13;관리자입니다.&#13;&#13;프로젝트 진행 과정에서 다음과 같은 문제가 자주 발생하고 있습니다.&#13;1. ~~&#13;2. &#13;3. ~~&#13;&#13;우리 모두 매너있는 팀원/팀장으로서 즐겁게 프로젝트를 진행할 수 있도록 부탁드립니다. 잦은 신고 문의가 들어올 시 예고없이 탈퇴처리할 수 있음을 알려드립니다."></textarea>
							</div>
						</div>

						<!-- 파일 첨부 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
								</span> <a class="mx-2">첨부파일 없음</a>
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#noticeUpdateModal">수정하기</button>
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

				<form>

					<!-- modal-body -->
					<div class="modal-body p-4">

						<!-- 공지사항 글 제목 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<input type="text" class="form-control" id="inputTitle" value="기존 제목">
							</div>
						</div>

						<!-- 공지사항 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea class="form-control" rows="20" id="inputContent">기존 글 내용</textarea>
							</div>
						</div>

						<!-- 파일 첨부 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
								</span> <input type="file" class="mx-2" id="changeFile" value="첨부파일 없음" />
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-between">
						<button type="reset" class="btn btn-warning">초기화</button>

						<div>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">수정 완료</button>
						</div>
					</div>

				</form>

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
</body>
</html>