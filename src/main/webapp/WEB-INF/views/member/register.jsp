<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <c:set var="root" value="${pageContext.request.contextPath}" />	
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=crome">
  <title>가입</title>
  <!-- Custom fonts for this template-->
  <link href="${root}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
      
        <!-- Nested Row within Card Body -->
        <div class="row justify-content-center">
          <div class="p-5">
            
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회원 가입</h1>
              </div>
              <!--   -->
              <!-- 회원 가입 -->
              <form action="${root}/member/registerOk.do" method="post" class="user">
				
				<!-- 아이디 -->
                <div class="form-group">
					<input type="text" class="form-control form-control-user" id="mem_id" name="mem_id" placeholder="아이디">
                	<div class="check_font" id="id_check"></div>
                </div>
                
                <!-- 이름/닉네임 -->
				<div class="form-group row">
					<div class="col-sm-6 mb-3 mb-sm-0">
						<input type="text" class="form-control form-control-user" id="mem_name" name="mem_name" placeholder="이름" required>
						<div class="check_font" id="name_check"></div>
				</div>
	                 
	                 <div class="col-sm-6">
	                   <input type="text" class="form-control form-control-user" id="mem_nickname" name="mem_nickname" placeholder="닉네임" required>
	                 </div>
                </div>
                
                <!-- 비밀번호/확인 -->
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="mem_pass" name="mem_password" placeholder="비밀번호" required>
                  	<div class="check_font" id="pass_check"></div>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="mem_pass2" name="mem_password2" placeholder="비밀번호 확인" required>
                    <div class="check_font" id="pass2_check"></div>
                  </div>
                </div>
                  
                <div>
				회원등급
					<input type="radio" name="memLevel" value="팀장" required/>
					<label for="">팀장</label>
					<input type="radio" name="memLevel" value="팀원" required/>
					<label for="">팀원</label>
				</div>
                
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="mem_phone" name="mem_phone" placeholder="휴대폰 번호 (-) 없이 입력하세요." required>
                	<div class="check_font" id="phone_check"></div>                	
                </div>
                
				<div class="form-group">
					<input type="email" class="form-control form-control-user" id="mem_email" name="mem_email" placeholder="이메일" required>
				</div>
<!--                 	<input type="text" style="margin-top: 5px; margin-left:15px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
						<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
							<i class="fa fa-envelope"></i>&nbsp;인증
						</button>&nbsp;
						<button type="button" class="btn btn-outline-info btn-sm px-3">
							<i class="fa fa-envelope"></i>&nbsp;확인
						</button>&nbsp;
					<div class="check_font" id="email_check"></div>               	
                </div> --> 
                
			<div style="font-size:15px;">
				이메일 수신여부 
				<input type="radio" name="mailcheck" value="yes"/>
				<label for="yes">수신</label>
				<input type="radio" name="mailcheck" value="no"/>
				<label for="no">수신 안함</label>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control form-control-user" id="Skill" name="Skill" style="height:300px; weight:350px; border-radius:20px" 
				placeholder="보유기술 : 프로젝트 참여시 어필하고싶은 본인의 보유 스킬을 자유롭게 기술해주세요. ex. ooo 경력(n년), 프로그래밍(C++, java 사용가능) ... etc" required>
            </div>
                
                <input type="submit" class="btn btn-primary btn-user btn-block" value="확인">
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Google 아이디 사용하기
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Facebook 아이디 사용하기
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">비밀번호를 잊으셨나요?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">이미 회원이신가요? 로그인!</a>
              </div>              
            </div>
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