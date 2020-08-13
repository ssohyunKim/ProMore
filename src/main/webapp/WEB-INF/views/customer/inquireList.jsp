<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <c:set var="root" value="${pageContext.request.contextPath}" />	
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>고객게시판</title>
  <!-- Custom fonts for this template-->
  <link href="${root}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <!-- jQuery -->
  <script type="text/javascript" src="${root}/resources/jquery.js"></script>
</head>
<script type="text/javascript">
var cusNum = "";
$(function(){
	$('#customerReadModal').on('show.bs.modal', function(event) {
		cusNum = $(event.relatedTarget).data('num');
		
		var title = $(event.relatedTarget).data('title');
		$('input[name="cusTitle"]').val(title);
		
		var cate = $(event.relatedTarget).data('cate');
		$('select[name="cusCate"] option').val(cate).attr("selected", "selected");
		$('select[name="cusCate"] option').attr('disabled', true);
		
		var content = $(event.relatedTarget).data('content');
		$('textarea[name="cusContent"]').text(content);
		
		var file = $(event.relatedTarget).data('file');
		console.log(file);
	});
	
	$('#deleteBtn').click(function(){
		$('#ConfirmModal').modal();
	});
/* 	$('.modal').on('shown.bs.modal', function () {
		  $(this).focus();
		  //console.log($(this).find('form'));
		  $(this).find('form')[0].reset()
	});
	
	$('#submitBtn').on('click', function(){
		$('#ConfirmModal').modal('show');
	});
	
	
	$('#yesBtn').on('click', function(){
		alert("ok");
		formSubmit();
	});
	
	function formSubmit(){
		var form = $('#createForm')[0];
		var formData = new FormData(form);
		
		$.ajax({
			url			: "${root}/customer/inquireWrite.do",
			type		: "POST",
			data		: formData,
			dataType	: "text",
			contentType : false,
	        processData : false,
			success	: function(data){
				alert("작성이 완료되었습니다.");
				
				$('#ConfirmModal').modal('hide');
				$('#customerWriteModal').modal('hide');
				
				//reload해서 추가된 화면 리스트 보여주기
				
			},
			error 	: function(xhr, status, error){
                alert(error);
            }
		});
	} */
});
function inquireDelete(root){
	location.href = root + '/customer/inquireDelete.do?cusNum=' +cusNum;
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
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">1:1 문의하기</h1>
					</div>
					
					<div>
						<a href="#" class="btn btn-secondary btn-circle btn-lg" style="float: left; margin: 10px 20px 10px 10px;">
						<span class="icon"> 
							<i class="fas fa-question"></i>
						</span>
						</a>
						<p class="mb-4">
							<br />
							욕설, 비방글, 회원신고는 신고하기로 작성해주세요.<br />
							(파일첨부는 1개만 가능합니다.)
						</p>
					</div>

					<div class="card shadow mb-4">
						<!-- Card Header -->
						<div class="card-header py-3 form-inline justify-content-between">
							<h5 class="m-0 font-weight-bold text-primary p-2">1:1 문의하기</h5>
							<a href="#" class="btn btn-primary btn-circle btn-md" data-toggle="modal" data-target="#customerWriteModal"> 
								<i class="fas fa-pen"></i>
							</a>
						</div>
						${cusNum}, ${cusGroupNumber}, ${cusSequenceNumber}, ${cusSequenceLevel}
						<!-- Card Body -->
						<!-- 문의사항 리스트 -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead>
										<tr>
											<th>제목</th>
											<th>분류</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${boardList.size()==0}">
											<div>작성하신 문의글이 없습니다.</div>
										</c:if>
										<c:if test="${boardList.size()>0}">
											<c:forEach var="customerDto" items="${boardList}">
												<tr>
													<td>
													<a href="#"
													data-num="${customerDto.cusNum}"  
													data-title="${customerDto.cusTitle}"
													data-cate="${customerDto.cusCate}"
													data-content="${customerDto.cusContent}"
													data-file="${customerDto.cusFileName}"
													data-toggle="modal" 
													data-target="#customerReadModal">
													
													${customerDto.cusTitle}</a></td>
													<td>${customerDto.cusCate}</td>
													<td>${customerDto.cusId}</td>
													<td><fmt:formatDate value="${customerDto.cusDate}" pattern="yyyy-MM-dd"/></td>
												</tr>
											</c:forEach>
										</c:if>
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

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Customer Write Model -->
	<div class="modal fade" id="customerWriteModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">문의글 작성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form action="${root}/customer/inquireWrite.do" name="createForm" method="post" enctype="multipart/form-data">
					<!-- 글번호, 그룹넘버, 시퀀스번호, 시퀀스레벨 -->
					<input type="hidden" name="cusNum" value="${cusNum}" /> 
					<input type="hidden" name="cusGroupNumber" value="${cusGroupNumber}" /> 
					<input type="hidden" name="cusSequenceNumber" value="${cusSequenceNumber}" /> 
					<input type="hidden" name="cusSequenceLevel" value="${cusSequenceLevel}" />
					
					<!-- modal-body -->
					<div class="modal-body">

						<!-- 문의글 제목 -->
						<div class="form-group row">
							<div class="col-sm-9">
								<input type="text" class="form-control" name="cusTitle" placeholder="제목을 입력하세요.">
							</div>
							
							<div class="col-sm-3">
			                    <select name="cusCate" class="form-control">
								    <option value="일반문의">일반문의</option>
								    <option value="신고하기">신고하기</option>
								</select>
							</div>
						</div>

						<!-- 문의글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea class="form-control" rows="20" name="cusContent" placeholder="글을 입력하세요."></textarea>
							</div>
						</div>

						<!-- 파일 첨부 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
								</span> <input type="file" name="file" class="mx-2"/>
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-between">
						<button type="reset" class="btn btn-warning">초기화</button>

						<div>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">작성 완료</button>
						</div>
					</div>

				</form>

			</div>
		</div>
	</div>
	<!-- Customer Read Model -->
	<div class="modal fade" id="customerReadModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">문의글 보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form action="#" name="createForm" method="post" enctype="multipart/form-data">
					<!-- 글번호, 그룹넘버, 시퀀스번호, 시퀀스레벨 -->
					<input type="hidden" name="cusNum" value="${cusNum}" /> 
					<input type="hidden" name="cusGroupNumber" value="${cusGroupNumber}" /> 
					<input type="hidden" name="cusSequenceNumber" value="${cusSequenceNumber}" /> 
					<input type="hidden" name="cusSequenceLevel" value="${cusSequenceLevel}" />
					
					<!-- modal-body -->
					<div class="modal-body">

						<!-- 문의글 제목 -->
						<div class="form-group row">
							<div class="col-sm-9">
								<input type="text" class="form-control" name="cusTitle" placeholder="제목을 입력하세요." readonly>
							</div>
							
							<div class="col-sm-3">
			                    <select name="cusCate" class="form-control" readonly>
								    <option value="일반문의">일반문의</option>
								    <option value="신고하기">신고하기</option>
								</select>
							</div>
						</div>

						<!-- 문의글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea class="form-control" rows="20" name="cusContent" placeholder="글을 입력하세요." readonly></textarea>
							</div>
						</div>

						<!-- 파일 첨부 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<span class="icon"> <i class="fas fa-paperclip fa-lg"></i>
								</span> <input type="file" name="file" class="mx-2" readonly/>
							</div>
						</div>

					</div>

					<!-- modal-footer -->
					<div class="modal-footer justify-content-right">
						<div>
							<button id="deleteBtn" type="button" class="btn btn-secondary">삭제</button>
							<button type="submit" class="btn btn-primary">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Confirm Modal-->
	<div class="modal fade" id="ConfirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">아니요</button>
					<button class="btn btn-primary" type="button" onclick="inquireDelete('${root}')">네</button>
				</div>
			</div>
		</div>
	</div>

  <!-- Bootstrap core JavaScript -->
  <script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript -->
  <script src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages -->
  <script src="${root}/resources/js/sb-admin-2.min.js"></script>
  
  <!-- Page level plugins -->
  <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${root}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>