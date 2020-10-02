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
$(function(){
	$('#noticeReadModal').on('show.bs.modal', function(event) {
		var notNum = $(event.relatedTarget).data('num');
		
		var title = $(event.relatedTarget).data('title');
		console.log(title);
		$('input[name="notTitle"]').val(title);
	
 		var content = $(event.relatedTarget).data('content');
 		console.log(content);
		$('textarea[name="notContent"]').text(content);
		
		var fileName = $(event.relatedTarget).data('file');
		if (fileName != "") {
	   		$('#fileName').text(fileName);
		    //a.attr("href", "#");
	    } else {
			$('#fileName').html("첨부파일 없음");
	    }
 		
 		//조회수 증가
 		$.ajax({
 		   	url: "${root}/customer/noticeUpdateCount.do",
 		   	type:"POST",
 		   	data: "notNum="+notNum,
 		   	dataType: "json",
 			success	: function(data){
 			},
 			error	: function(request, status, error){
 				alert("FAIL");
 			}
 		});
	});
	$('#noticeReadModal').on('hide.bs.modal', function(event){
		location.reload();
	});
});
</script>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	 
	<!-- Sidebar -->
	<jsp:include page="/WEB-INF/template/sidebar.jsp"/>
	 
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
						<h1 class="h3 mb-0 text-gray-800"></h1>
					</div>
	
					<div>
						<a href="#" class="btn btn-secondary btn-circle btn-lg" style="float: left; margin: 10px 20px 10px 10px;">
						<span class="icon"> 
							<i class="fas fa-info"></i>
						</span>
						</a>
						<p class="mb-4">
							<br />
							공지사항 확인 후 1:1 문의 게시판을 이용해주세요.<br />
							<br />
							
						</p>
					</div>
	
					<div class="card shadow mb-4">
						<!-- Card Header -->
						<div class="card-header py-3">
							<h5 class="m-0 font-weight-bold text-primary p-2">공지사항 글보기</h5>
						</div>
	
						<!-- Card Body -->
						<!-- 공지사항 리스트 -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${boardList.size()>0}">
										<c:forEach var="noticeDto" items="${boardList}">
												<tr>
													<td>
													<a href="#"
													data-num="${noticeDto.notNum}"  
													data-title="${noticeDto.notTitle}"
													data-content="${noticeDto.notContent}"
													data-file="${noticeDto.notFileName}"
													data-toggle="modal" 
													data-target="#noticeReadModal">
													${noticeDto.notTitle}</a></td>
													<td>관리자</td>
													<td><fmt:formatDate value="${noticeDto.notWriteDate}" pattern="yyyy-MM-dd"/></td>
													<td>${noticeDto.notReadCount}</td>
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
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
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

	<!-- Notice Read Model -->
	<div class="modal fade" id="noticeReadModal" tabindex="-1" role="dialog">
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
					<input type="hidden" name="readCount" value="">
					<!-- modal-body -->
					<div class="modal-body p-4">

						<!-- 공지사항 글 제목 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<h5 class="font-weight-bold">
								<input name="notTitle" type="text" class="form-control-plaintext" placeholder="" readonly>
								</h5>
							</div>
						</div>

						<!-- 공지사항 글 내용 -->
						<div class="form-group row">
							<div class="col-sm-12">
								<textarea name="notContent" class="form-control-plaintext" rows="20"  placeholder="" readonly></textarea>
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
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</form>
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