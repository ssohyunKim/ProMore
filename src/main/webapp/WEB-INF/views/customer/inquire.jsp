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
          <h1 class="h3 mb-4 text-gray-800">1:1 문의하기</h1>
          <a href="#" class="btn btn-secondary btn-circle btn-lg" style="float: left; margin: 10px 20px 10px 10px;">
            <span class="icon">
              <i class="fas fa-question"></i>
            </span>
          </a>
          <p class="mb-4">공지사항을 확인 후 글작성 부탁드립니다.<br />
            욕설, 비방글, 회원신고는 신고하기로 작성해주세요.<br />
            (파일첨부는 1개만 가능합니다.)</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"></h6>
              <a href="#" class="btn btn-primary btn-icon-split" style="float: right;" data-toggle="modal" data-target="#WriteModal">
                <span class="icon text-white-50">
                  <i class="fas fa-pencil-alt"></i>
                </span>
                <span class="text">글쓰기</span>
              </a>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>제목</th>
                      <th>분류</th>
                      <th>작성자</th>
                      <th>날짜</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><a href="#">프로젝트 개설 문의드립니다.</a></td>
                      <td>일반문의</td>
                      <td>김땡땡</td>
                      <td>2020-08-04</td>
                    </tr>
                    <tr>
                      <td><a href="#">회원 등급 문의합니다.</a></td>
                      <td>일반문의</td>
                      <td>김땡땡</td>
                      <td>2020-08-07</td>
                    </tr>
                    <tr>
                      <td><a href="#">회원 신고합니다.</a></td>
                      <td>신고하기</td>
                      <td>김땡땡</td>
                      <td>2020-08-07</td>
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

  <!-- Write Model -->
  <div class="modal fade" id="WriteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">1:1 문의하기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="text" class="form-control bg-light border-0 small" placeholder="제목을 입력하세요." style="display: inline; width: 75%;"/>
          <div class="dropdown mb-4 bg-light" style="float: right;">
            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              일반문의
            </button>
            <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="#">신고하기</a>
              <a class="dropdown-item" href="#">기타문의</a>
            </div>
          </div>
          <textarea name="" id="" class="form-control bg-light border-0 small" cols="55" rows="10">글을 입력하세요.</textarea>
          <input type="file" name="" id="" class="form-control bg-light border-0 small"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary">글쓰기</button>
        </div>
      </div>
    </div>
  </div>

    <!-- Sample View Model -->
    <div class="modal fade" id="ViewModal" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">공지사항</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <input type="text" class="form-control bg-light border-0 small" placeholder="(공지) 쉽고 빠른 프로젝트 관리의 시작을 기대하세요!" style="display: inline; width: 75%;" readonly/>
            <div class="dropdown mb-4 bg-light" style="float: right;">
              <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                	공지사항
              </button>
            </div>
            <textarea name="" id="" class="form-control bg-light border-0 small" cols="55" rows="10" readonly>
           	   🎉   협업할때 어려웠던 프로젝트 관리, 이제 OOO과 함께하세요!

              - 서비스 오픈 기념으로 프로젝트 5개까지는 free로 이용이 가능합니다.
              - 사용방법은 블로그와 유투브를 통해 쉽게 확인하실 수 있습니다.
              - 개선할 부분이나 부족한 부분은 1:1문의게시판에 마구마구 의견을 남겨주세요.
              
              
              * 유투브 주소 [www.youtube.com/sample]
              * 블로그 주소 [blog.com/sample]
            </textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">삭제</button>
            <button type="button" class="btn btn-primary">수정</button>
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