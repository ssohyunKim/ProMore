<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
           <h1 class="h3 mb-0 text-gray-800">공지사항 글보기</h1>
        </div>

        <!-- 코드 입력하기!!!! -->
        	<!-- 여기에 코드를 넣어주세요!! -->
					<!-- 동적으로 띄워주기 -->
					
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

							<div class="card-body">
								<div class="table-responsive">
									<div id="dataTable_wrapper"
										class="dataTables_wrapper dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12 col-md-6">
												<div class="dataTables_length" id="dataTable_length">
													<label>Show <select name="dataTable_length"
														aria-controls="dataTable"
														class="custom-select custom-select-sm form-control form-control-sm">
															<option value="10">10</option>
															<option value="25">25</option>
															<option value="50">50</option>
															<option value="100">100</option>
													</select> entries
													</label>

												</div>
											</div>
											<div class="col-sm-12 col-md-6">
												<div id="dataTable_filter" class="dataTables_filter">
													<label>Search : <input type="search"
														class="form-control form-control-sm" placeholder
														aria-controls="dataTable">
													</label>
												</div>
											</div>
										</div>


										<div class="row">
											<div class="col-sm-12">
												<table class="table table-bordered dataTable" id="dataTable"
													width="100%" cellspacing="0" role="grid"
													aria-describedby="dataTable_info" style="width: 100%;">
													<thead>
														<tr role="row">
															<th class="sorting_asc" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-sort="ascending"
																aria-label="Name: activate to sort column descending"
																style="width: 72px;">Name</th>
															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="sender: activate to sort column ascending"
																style="width: 103px;">sender</th>


															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="state: activate to sort column ascending"
																style="width: 103px;">state</th>

															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="start-date: activate to sort column ascending"
																style="width: 103px;">start-date</th>

															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="start-date: activate to sort column ascending"
																style="width: 103px;">end-date</th>


														</tr>
													</thead>


													<tfoot>
														<tr>
															<th rowspan="1" colspan="1">Name</th>
															<th rowspan="1" colspan="1">state</th>
															<th rowspan="1" colspan="1">start-date</th>
															<th rowspan="1" colspan="1">end-date</th>
															<th rowspan="1" colspan="1">write-date</th>
														</tr>
													</tfoot>

													<tbody>
														<tr role="row" class="odd">
															<td class="sorting_1">프로젝트이름</td>
															<td>최정윤</td>
															<td>요청</td>
															<td>2020/08/10</td>
															<td>2020/08/20</td>
													</tbody>

													<tbody>
														<tr role="row" class="odd">
															<td class="sorting_1">프로젝트이름</td>
															<td>최정윤</td>
															<td>진행중</td>
															<td>2020/08/15</td>
															<td>2020/08/20</td>
													</tbody>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-5">
												<div class="dataTables_info" id="dataTable_info"
													role="status" aria-live="polite">Showing 1 to 10 of
													57 entries</div>
											</div>
											<div class="col-sm-12 col-md-7">
												<div class="dataTables_paginate paging_simple_numbers"
													id="dataTable_paginate">
													<ul class="pagination">
														<li class="paginate_button page-item previous disabled"
															id="dataTable_previous"><a href="#"
															aria-controls="dataTable" data-dt-idx="0" tabindex="0"
															class="page-link">Previous</a></li>

														<!-- 추가시키기 -->

														<li class="paginate_button page-item active"><a
															href="#" aria-controls="dataTable" data-dt-idx="1"
															tabindex="0" class="page-link"> 1</a></li>

														<li class="paginate_button page-item next"
															id="dataTable_paginate"><a href="#"
															aria-controls="dataTable" data-dt-idx="7" tabindex="0"
															class="page-link"> NEXT</a></li>

													</ul>
												</div>

											</div>

										</div>
									</div>
								</div>

							</div>
						</div>
					</section>



					<!-- /.container-fluid -->



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

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
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
</body>
</html>