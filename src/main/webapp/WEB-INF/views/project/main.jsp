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
  <link rel="stylesheet" href="${root}/resources/css/pjtmain.css">
  <script type="text/javascript" src="${root}/resources/jquery.js"></script>

</head>
<script type="text/javascript">
var proNum="";
var name="";
var content="";
var max="";

$(function(){
	$('#mainReadModal').on('show.bs.modal', function(event) {
		proNum = $(event.relatedTarget).data('num');
		
		name = $(event.relatedTarget).data('name');
		$('input[name="proName"]').val(name);
		
		max = $(event.relatedTarget).data('max');
	 	$('select[name="proMax"]').val(max).attr("selected", "selected");
		$('select[name="proMax"] option').attr('disabled', true);
		
		content = $(event.relatedTarget).data('content');
		$('textarea[name="proContent"]').text(content);
		
	});
	
	$('#projectConfirmModal').on('show.bs.modal', function(event) {
		proNum = $(event.relatedTarget).data('num');
	});
	
	$('#applyBtn').click(function(){
		$('#applyConfirmModal').modal();
	});
	
	$('#fullApplyModal').click(function(){
		$('#fullConfirmModal').modal();
	});

	
});

function projectApply(root){
	 $('#proNum').val(proNum);
	location.href = root + '/project/projectApply.do?proNum='+proNum;
}

function projectSelect(root){
	 $('#proNum').val(proNum);
	location.href = root + '/project/projectSelect.do?proNum='+proNum;
}

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
		<jsp:include page="/WEB-INF/template/topbar.jsp"/>

        <!-- Begin Page Content -->
        <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
           <h1 class="h3 mb-0 text-gray-800">프로젝트 글보기</h1>
	    </div>

		<!--팀장만  글 작성 버튼 -->
		<c:if test= "${memberDto.memLevel eq'팀장'}"> 
			<div>
				<a href="#" class="btn btn-primary btn-circle btn-md" data-toggle="modal" data-target="#projectWriteModal" style="float:right">
					<i class="fas fa-pen"></i>
				</a>
			</div>	
		</c:if>

		<c:if test="${projectCount>=0}">		
		 	<c:forEach var="projectDto" items="${projectDtoArray}">		 	
				<div class="flip-card">
						<div class="flip-card-inner">
							<div class="flip-card-front1">
								<p class="projectName">${projectDto.proName}</p>
								<br/>
								<p>최대인원 : ${projectDto.proMax}명</p>
							</div>
						
						<!-- 프로젝트 팀장, 팀원, 신청 안한 사람 모두 페이지 이동-->
									<a href="#"
									data-num = "${projectDto.proNum}"							
									data-toggle="modal"
									data-target="#projectConfirmModal">
									<div class="flip-card-back1">
										<p>${projectDto.proManager}</p>
										<br/>
										<p>현재인원 : ${projectDto.proCnt}명</p>
									</div>
									</a>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>				
	</div>
</div>
	
         <!-- /.container-fluid -->

	</div>
	</div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <jsp:include page="/WEB-INF/template/footer.jsp"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

<!-- Write Model -->
<div class="modal fade" id="projectWriteModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg mt-5" role="document">
		<div class="modal-content">

				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">프로젝트 생성</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				</div>
					<form id="createform" action="${root}/project/writeOk.do" method="post">
				<!-- modal-body -->
						<div class="modal-body">
						
						      <!-- 프로젝트 제목 && 인원수  -->
			                  <div class="form-group row">
			                     <div class="col-sm-10">
			                        <input type="text" class="form-control" name="proName" style="display: inline;"  placeholder="제목을 입력하세요.">
			                     </div>
			                    		<p style="margin: 6px 13px 0px 0px">인원수</p>
			                     <div class="col-sm-1.5" style="display: inline;" >
			                     	              
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
									<textarea class="form-control" rows="20" name="proContent" placeholder="글을 입력하세요." ></textarea>
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
						</div>
					</form>
	</div>
</div>
</div>


	
	
<!-- #projectConfirmModal-->
	<div class="modal fade" id="projectConfirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">확인</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">프로젝트를 선택하시겠습니까?</div>
				<div class="modal-footer">
					<input type="hidden" id="proNum" name="proNum" value="" /> 
					<button class="btn btn-secondary" type="button" data-dismiss="modal">아니요</button>
					<button class="btn btn-primary" type="button" onclick="projectSelect('${root}')">네</button>
				</div>
			</div>
		</div>
	</div>	
	
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
					<button class="btn btn-secondary" type="button" data-dismiss="modal">아니요</button>
					<button class="btn btn-primary" type="button" onclick="projectApply('${root}')">네</button>
				</div>
			</div>
		</div>
	</div>

<!-- fullConfirmModal -->
<div class="modal fade" id="applyConfirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신청</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">신청이 마감되었습니다</div>
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
</body>
</html>