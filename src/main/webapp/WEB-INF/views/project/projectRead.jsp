<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>

<!-- Custom fonts for this template-->
<link href="${root}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
 <script type="text/javascript" src="${root}/resources/jquery.js"></script>
</head>
<script type="text/javascript">
var proNum="";

$(function(){
	$('#applyConfirmModal').on('show.bs.modal', function(event){
		proNum = $(event.relatedTarget).data('num');
	});
	
});

function projectApply(root){
	$('#proNum').val(proNum);
	location.href= root + '/project/projectApply.do?proNum='+proNum;
}


</script>

<body>
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
						<h1 class="h3 mb-0 text-gray-800">프로젝트 읽기</h1>
					</div>

					<!-- 여기에 코드를 넣어주세요!! -->

					<!-- 프로젝트 신청 -->
					<c:if test="${projectDto.proMax==projectDto.proCnt}">
					<div class="d-sm-flex align-items-center justify-content-center mb-4">
						<div class="col-lg-8">
							<div class="card shadow-lg my-5">
								<!-- Card Header -->
								<div class="card-header">
									<div style="text-align: center; align-content: center;">
										<a href="${root}/project/main.do" class="btn btn-lg"
											style="float: left; margin-left: 0px; padding-left: 0px;">
											<span class="icon"> <i class="fas fa-arrow-left"></i>
										</span>
										</a>
										<h4 class="m-0 font-weight-bold text-primary p-2">마감된 프로젝트</h4>
									</div>
								</div>

								<form id="applyForm" action="${root}/project/projectApplyOk.do" method="GET">
								<div class="card-body">
									<div class="form-group row">
									 <div class="col-sm-10">
			                        	<input type="text" class="form-control-plaintext" name="proName" style="display: inline;" value=" ${projectDto.proName}"readonly>
			                   		 </div>
								
						                   
					                    <p style="margin: 6px 5px 0px 0px">인원수</p>
					                     <div class="col-sm-1.5" style="display: inline;">
					                      <select name="proMax" class="form-control">
					                            <option value="${projectDto.proMax}">${projectDto.proMax}</option>
					                        </select>
					                     </div>
					                  </div>
			
									<div class="form-group row">
										<div class="col-sm-12">
											<textarea class="form-control-plaintext" rows="20" name="proContent" readonly>${projectDto.proContent}</textarea>
										</div>
									</div>
										
									<div class="modal-footer justify-content-right">
										<div> 
											<button type="button" class="btn btn-primary" onclick="location.href='${root}/project/main.do'">확인</button>
										</div>
									</div>
							</div>
							</form>
								</div>
								<!-- /.container-fluid -->
				
							</div>
							<!-- End of Main Content -->
				
							<!-- Footer -->
						</div>
					</c:if>
					
					<!-- 신청할 수 있는 프로젝트 -->
					
					<c:if test="${projectDto.proMax>projectDto.proCnt}">
					<div class="d-sm-flex align-items-center justify-content-center mb-4">
						<div class="col-lg-8">
							<div class="card shadow-lg my-5">
								<!-- Card Header -->
								<div class="card-header">
									<div style="text-align: center; align-content: center;">
										<a href="${root}/project/main.do" class="btn btn-lg"
											style="float: left; margin-left: 0px; padding-left: 0px;">
											<span class="icon"> <i class="fas fa-arrow-left"></i>
										</span>
										</a>
										<h4 class="m-0 font-weight-bold text-primary p-2">프로젝트 신청</h4>
									</div>
								</div>

								<form id="applyForm" action="${root}/project/projectApplyOk.do" method="GET">
								<div class="card-body">
									<div class="form-group row">
									 <div class="col-sm-10">
			                        	<input type="text" class="form-control-plaintext" name="proName" style="display: inline;" value=" ${projectDto.proName}"readonly>
			                   		 </div>
								
						                   
					                    <p style="margin: 6px 13px 0px 0px">인원수</p>
					                     <div class="col-sm-1.5" style="display: inline;">
					                      <select name="proMax" class="form-control">
					                            <option value="${projectDto.proMax}">${projectDto.proMax}</option>
					                        </select>
					                     </div>
					                  </div>
			
									<div class="form-group row">
										<div class="col-sm-12">
											<textarea class="form-control-plaintext" rows="20" name="proContent" readonly>${projectDto.proContent}</textarea>
										</div>
									</div>
										
									<div class="modal-footer justify-content-right">
										<div> 
											<button 
											data-num = "${projectDto.proNum}"
											data-toggle="modal"
											data-target= "#applyConfirmModal"
											type="button" class="btn btn-secondary">신청</button>
											<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
										</div>
									</div>
							</div>
							</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
		</div>
	</c:if>
	
	
</div>
			<!-- End of Footer -->
</div>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


<!--apply Confirm Model -->
<div class="modal fade" id="applyConfirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신청</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">정말 신청하시겠습니까?</div>
				<div class="modal-footer">
					<input type="hidden" id="proNum" name="proNum" value=""/> 
					<button class="btn btn-secondary" type="button" data-dismiss="modal">아니요</button>
					<button class="btn btn-primary" type="button" onclick="projectApply('${root}')">네</button>
				</div>
			</div>
		</div>

</div>




<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${root}/resources/js/sb-admin-2.min.js"></script>
	

</body>
</html>