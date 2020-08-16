<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원 정보 수정</title>

<!-- Custom fonts for this template-->
<link href="${root}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
						<h1 class="h3 mb-0 text-gray-800">회원 탈퇴</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->

					<!-- 회원 정보 삭제 -->
					<div
						class="d-sm-flex align-items-center justify-content-center mb-4">
						<div class="col-lg-8">
							<div class="card shadow-lg my-5">

								<!-- Card Header -->
								<div class="card-header">
									<div style="text-align: center; align-content: center;">
										<a href="${root}/customer/notice.do" class="btn btn-lg"
											style="float: left; margin-left: 0px; padding-left: 0px;">
											<span class="icon"> <i class="fas fa-arrow-left"></i>
										</span>
										</a>
										<h4 class="m-0 font-weight-bold text-primary p-2">회원 탈퇴</h4>
									</div>
								</div>

								<!-- Card Body -->
								<div class="card-body">
									<form name="updateForm" action="${root}/member/memberDeleteOk.do" method="post" onsubmit="return memberDelete(this,'${memberDto.memPassword}');">
									
										<input type="hidden" name = "memNum" value="${memberDto.memNum}" />
										<input type="hidden" name = "memNickname" value="${memberDto.memNickname}" />
									
										<!-- 아이디 -->
										<div class="form-group row">
											<label for="staticId" class="col-sm-3 col-form-label">아이디</label>
											<div class="col-sm-9">
												<input type="text" readonly class="form-control-plaintext"
													id="staticId" value="${memberDto.memId}">
											</div>
										</div>

										<!-- 비밀번호 -->
										<div class="form-group row">
											<label for="inputPassword3" class="col-sm-3 col-form-label">비밀번호</label>
											<div class="col-sm-9">
												<input type="password" class="form-control"
													id="inputPassword3" placeholder="비밀번호를 입력하세요." name="password">
													
											</div>
										</div>

										<!-- 취소 -->
										<button type="reset" class="btn btn-secondary mb-2 col-sm-12">
											<span class="text">취소</span>
										</button>
										<br />

										<!-- 탈퇴 완료 -->
										<button type="submit" class="btn btn-primary col-sm-12">
											<span class="text">회원 탈퇴</span>
										</button>

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

			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
 <!-- Delete Modal-->
  <div class="modal fade" id="memberDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">정말 탈퇴 하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">탈퇴를 누르면 정말 탈퇴가 됩니다.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="${root}/member/memberDeleteOk.do">탈퇴</a>
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
	
	<!-- Member JavaScript-->
	<script src="${root}/resources/js/member/member.js"></script>
	
</body>
</html>