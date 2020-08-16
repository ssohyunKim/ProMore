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

  <title>[ProMore] - 프로젝트를 모아모아</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css?after" rel="stylesheet">
  <script type="text/javascript" src="${root}/resources/js/workspace/jquery-3.5.1.js"></script>
  <script type="text/javascript" src="${root}/resources/js/workspace/customCheck.js" ></script> 
  <script>
   	 function checkLoginStatus(){
   		var loginBtn = document.querySelector('#googleloginBtn');
		if(gauth.isSignedIn.get()){
			console.log('logined');
			loginBtn.value = 'Google계정 로그아웃하기';
			var profile = gauth.currentUser.get().getBasicProfile();
			console.log('ID: '+ profile.getId());
			console.log('이름: ' + profile.getName());
			console.log('프로필사진: ' + profile.getImageUrl());
			console.log('이메일: ' + profile.getEmail());
			
			document.getElementById("snsEmail").value=profile.getEmail();
			
		}else{
			console.log('logouted');
			loginBtn.value = 'Goolge계정으로 로그인하기';
		}
   	 }
  
	 function init(){
	 	console.log('init');
	 	gapi.load('auth2', function() {
		gauth = gapi.auth2.init({
			client_id:'233392212481-5u4dtso80lluags0g8fk2gnag05frf3c.apps.googleusercontent.com'
		})
		gauth.then(function(){
			console.log('googleAuth success');
			checkLoginStatus();
		}, function(){
			console.log('googleAuth fail');
		});
	 	});
	 }
  </script>
  
  <script>
	  var checkLoginStatus2 = function(response){
			console.log(response);
			//statusChangeCallback(response);
			if(response.status === 'connected'){
				document.querySelector('#faceBtn').value='Facebook계정 로그아웃하기';
				FB.api('/me', {fields:'name,email'}, function(response) {
			        var fb_data = jQuery.parseJSON(JSON.stringify(response));
			        var email = fb_data.email;
			        
			        document.getElementById("snsEmail").value=email;
			    });
			}else{
				document.querySelector('#faceBtn').value='Facebook계정으로 로그인하기';
			}
		}
  
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '301300404268934',
	      cookie     : true,                    
	      xfbml      : true,                   
	      version    : 'v8.0'           
	    });
	
		
	    FB.getLoginStatus(checkLoginStatus2);
	    
	  };
  </script>
  
  <!-- favicon -->
 
</head>
<script type="text/javascript">
	function showLoginView(){
		document.getElementsByClassName('p-5')[0].style.display = "none";
		document.getElementsByClassName('p-5')[1].style.display = "block";
	}
	function showGuestView(){
		document.getElementsByClassName('p-5')[0].style.display = "none";
		document.getElementsByClassName('p-5')[2].style.display = "block";
	}
</script>
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
						<div><img alt="" src="${root}/resources/img/promore.png" style="max-width:100%; height:auto;">
						</div>&nbsp;
						<br/>
						<h2 class="h5 text-gray-900 mb-4">
							함께하고 싶은 프로젝트를 <br />
							쉽고 빠르게 개설하고, 협업해보세요!
						</h2>
						</div>&nbsp;
						<div>
							<img alt="" src="${root}/resources/img/main_photo.jpg" style="max-width:100%; height:auto;">
						</div><br /><br />
						<div class="form-group">
							<button class="btn btn-primary btn-block" type="button" onclick="showLoginView()">로그인하기</button>
							<button class="btn btn-secondary btn-block" type="button" onclick="javascript:location.href='${root}/project/main.do'">프로젝트 구경하기
							</button>
						</div>
					</div>
                <div class="p-5" style="display:none">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
                  </div>
                  <br/>
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
                    </form>
                    <hr>
                    <input type="button" id="googleloginBtn" class="btn btn-google btn-user btn-block" value="처리 중입니다..." onclick="
                    	if(this.value === 'Goolge계정으로 로그인하기'){
                    		gauth.signIn({
                    			scope:'https://www.googleapis.com/auth/calendar.readonly'
                    		}).then(function(){
                    			console.log('gauth.signIn()');
                    			checkLoginStatus();
                    		});
                    	}else{
                    		gauth.signOut().then(function(){
                    			console.log('gauth.signOut()');
                    			checkLoginStatus();
                    		});
                    	}
                    ">
                    <input type="button" id="faceBtn" class="btn btn-facebook btn-user btn-block" value="Facebook계정으로 로그인하기" onclick="
                    	if(this.value === 'Login'){
                    		FB.login(function(res){
                    			console.log('login =>', res);
                    			checkLoginStatus2(res);
                    		});
                    	}else{
							FB.login(function(res){
								console.log('logout =>', res);
								checkLoginStatus2(res);
                    		});
                    	}
                    ">
                     <br/>
                     <form class="user" action="${root}/member/snsLoginOk.do">
                     	<input type="hidden" id="snsEmail" name="memEmail">
                    	<input type="submit" class="btn btn-primary btn-user btn-block" value="소셜계정 로그인  버튼">
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
  
  <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	
  <script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>