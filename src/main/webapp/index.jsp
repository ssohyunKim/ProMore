<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var = "id" value="user" scope="session"/>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="google-signin-client_id" content="233392212481-rtrid3kc01hk4jhlhdv0o2jj33cvdi94.apps.googleusercontent.com">

  <title>로그인 페이지</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css?after" rel="stylesheet">
  <script type="text/javascript" src="${root}/resources/js/workspace/jquery-3.5.1.js"></script>
  <script type="text/javascript" src="${root}/resources/js/workspace/customCheck.js" ></script> 
  <script src="https://apis.google.com/js/platform.js" async defer></script>
 
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row justify-content-center">
   
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
                  </div>
                  <form class="user" action="${root}/member/loginOk.do" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="아이디를 입력하세요..." name="memId">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호" name="memPassword">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                      </div>
                    </div>
                    <input type="submit" class="btn btn-primary btn-user btn-block" value="로그인">      
                    <a href="${root}/project/main.do" class="btn btn-primary btn-user btn-block">
                                 	프로젝트메인
                    </a>
                    <hr>
                    <a href="index.html" onclick="${root}/resources/js/member/googlelogin.js"  class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Goolge계정으로 로그인하기
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw" ></i> Facebook계정으로 로그인하기
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="${root}/member/forgot-password.do">비밀번호를 잊어버렸나요?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="${root}/member/register.do">계정을 만드세요!</a>
                  </div>        
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>

</body>
</html>