<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <c:set var="root" value="${pageContext.request.contextPath}" />	
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>일감현황</title>
  
  <!-- Custom fonts for this template-->
  <link href="${root}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  
  <link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
 
  <!-- Custom styles for this page -->
   <link href="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
   <link rel="stylesheet" href="${root}/resources/css/tabbar.css">
</head>

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
           <h1 class="h3 mb-0 text-gray-800">일감 현황</h1>
        </div>

        <!-- 코드 입력하기!!!! -->
        	<!-- 여기에 코드를 넣어주세요!! -->
					
					<!-- css tabs -->
					<h2>CSS Tabs</h2>
					<input id="tab1" type="radio" name="tabs" checked> <label
						for="tab1">나의 일감 현황</label> <input id="tab2" type="radio"
						name="tabs"> <label for="tab2">Away</label>

					
					<section id="content1">

						<div class="card shadow mb-4">
							<div class="card-header py-3">
								 <h6 class="m-0 font-weight-bold text-primary">나의 일감 현황</h6>
							</div>
							
							<!-- 일감 리스트 -->
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">		
									<thead>
										<tr>
											<th>name</th>
											<th>sender</th>
											<th>state</th>
											<th>start-date</th>
											<th>end-date</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>name</th>
											<th>sender</th>
											<th>state</th>
											<th>start-date</th>
											<th>end-date</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td>프로젝트이름</td>
											<td>최정윤</td>
											<td>요청</td>
											<td>2020/08/10</td>
											<td>2020/08/20</td>
										</tr>
										<tr>
											<td>프로젝트이름</td>
											<td>최정윤</td>
											<td>진행중</td>
											<td>2020/08/15</td>
											<td>2020/08/20</td>
										</tr>
										<tr>
											<td>프로젝트이름</td>
											<td>최정윤</td>
											<td>진행중</td>
											<td>2020/08/15</td>
											<td>2020/08/20</td>
										</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>	
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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${root}/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${root}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>