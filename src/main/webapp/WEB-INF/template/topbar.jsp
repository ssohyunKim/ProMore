<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- Top bar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Side bar Toggle (Top bar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Top bar Search -->
	<form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- Top bar - Nav bar -->
	<ul class="navbar-nav ml-auto">

		<!-- Nav Item - Search Drop down (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none">
			
			<a href="#" class="nav-link dropdown-toggle" 
				id="searchDropdown" role="button" data-toggle="dropdown" 
				aria-haspopup="true" aria-expanded="false"> 
				<i class="fas fa-search fa-fw"></i>
			</a> 
			
			<!-- Drop down - Messages -->
			<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</li>

		<!-- Nav Item - Alerts -->
		<li class="nav-item dropdown no-arrow mx-1">
			
			<!-- Button - Alerts -->
			<a href="#" class="nav-link dropdown-toggle"
				id="alertsDropdown" role="button" data-toggle="dropdown" 
				aria-haspopup="true" aria-expanded="false"> 
				
				<!-- Icon - Alerts -->
				<i class="fas fa-bell fa-fw"></i> 
				
				<!-- Counter - Alerts -->
				<span class="badge badge-danger badge-counter">1</span>
			</a> 
		
			<!-- Drop down - Alerts -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="alertsDropdown">
				
				<!-- 타이틀 -->
				<h6 class="dropdown-header">Alerts Center</h6>
				
				<!-- 정보 -->
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">August 7, 2020</div>
						<span class="font-weight-bold">팀원 확정이 완료되었습니다.</span>
					</div>
				</a> 
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">August 2, 2020</div>
						<span class="font-weight-bold">새로운 프로젝트가 개설되었습니다.</span>
					</div>
				</a> 
				
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-warning">
							<i class="fas fa-exclamation-triangle text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">August 1, 2020</div>
						김소현님, 회원가입을 축하합니다!
					</div>
				</a>
				<a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
			</div>
		</li>

		<!-- Nav Item - Messages -->
		<li class="nav-item dropdown no-arrow mx-1">
		
			<!-- Button - Messages -->
			<a href="#" class="nav-link dropdown-toggle" 
				id="messagesDropdown" role="button" data-toggle="dropdown" 
				aria-haspopup="true" aria-expanded="false"> 
				
				<i class="fas fa-envelope fa-fw"></i> 
				
				<!-- Counter - Messages -->
				<span class="badge badge-danger badge-counter">7</span>
			</a>

			<!-- Drop down - Messages -->
			
		</li>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> 
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">${memName}</span>
				<img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
			</a> 
		
			<!-- Drop down -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="alertsDropdown">
				
				<!-- 타이틀 -->
				<h6 class="dropdown-header">My Profile</h6>
				
				<!-- 정보 -->
				<div class="dropdown-item d-flex align-self-center py-3">
					<label class="small text-gray-500 m-0" style="width: 35% !important;">등급</label>
					<label class="font-weight m-0" style="width: 65% !important;">${memLevel}</label>
				</div> 
				<div class="dropdown-item d-flex align-self-center py-3">
					<label class="small text-gray-500 m-0" style="width: 35% !important;">이름</label>
					<label class="font-weight m-0" style="width: 65% !important;">${memName}</label>
				</div> 
				<div class="dropdown-item d-flex align-self-center py-3">
					<label class="small text-gray-500 m-0" style="width: 35% !important;">닉네임</label>
					<label class="font-weight m-0" style="width: 65% !important;">${memNickname}</label>
				</div> 
				<div class="dropdown-item d-flex align-self-center py-3">
					<label class="small text-gray-500 m-0" style="width: 35% !important;">휴대폰 번호</label>
					<label class="font-weight m-0" style="width: 65% !important;">${memPhone}</label>
				</div> 
				<div class="dropdown-item d-flex align-self-center py-3">
					<label class="small text-gray-500 m-0" style="width: 35% !important;">이메일 주소</label>
					<label class="font-weight m-0" style="width: 65% !important;">${memEmail}</label>
				</div>
				
				<a href="#" class="dropdown-item d-flex justify-content-center align-self-center py-3 "
					data-toggle="modal" data-target="#logoutModal"> 
					<i class="fas fa-sign-out-alt mt-1 mr-2 text-gray-400"></i>
					<label class="small text-gray-500 m-0">로그아웃</label>
				</a>
			</div>
		</li>
	</ul>
</nav>
