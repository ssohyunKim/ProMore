<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 임시 ID : 둘 중 하나는 주석 처리하고 사용 -->
<!-- 사용자용 ID -->
<%-- <c:set var = "id" value="user" scope="session"/> --%>
<!-- 사용자용 회원 번호 -->
<c:set var = "num" value="1" scope="session"/>
<c:set var = "pass" value="1234" scope="session"/>

<!-- 매니저용 ID -->
<c:set var="id" value="manager" scope="session" />

<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">
	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${root}/index.jsp">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			PROMORE <sup></sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">
	<!-- Divider -->
	<hr class="sidebar-divider">
	<!-- Heading -->
	<div class="sidebar-heading">Interface</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item active"><a class="nav-link"
		href="${root}/project/main.do"> <i class="fas fa-fw fa-folder"></i>
			<span>프로젝트</span>
	</a></li>

	<!-- 마이페이지 -->

	<c:if test="${id=='user'}">
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item active"><a class="nav-link collapsed"
			href="#" data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-cog"></i> <span>마이페이지</span>
		</a>
			<div id="collapsePages" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">My Page</h6>
					<a class="collapse-item" href="${root}/member/memberUpdate.do?memNum=${num}&memPassword=${memPassword}">회원 수정</a>
					<a class="collapse-item" href="#">회원 탈퇴</a>
					<div class="collapse-divider"></div>
				</div>
			</div></li>
	</c:if>

	<c:if test="${id=='manager'}">
		<!-- Nav Item - Manager Collapse Menu -->
		<li class="nav-item active"><a class="nav-link collapsed"
			href="#" data-toggle="collapse" data-target="#collapseManager"
			aria-expanded="true" aria-controls="collapseManager"> <i
				class="fas fa-fw fa-cog"></i> <span>관리자 페이지</span>
		</a>
			<div id="collapseManager" class="collapse"
				aria-labelledby="headingManager" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Manager Page</h6>
					<a class="collapse-item" href="${root}/manager/memberList.do">회원
						관리</a> <a class="collapse-item" href="${root}/manager/noticeList.do">공지사항
						관리</a> <a class="collapse-item" href="${root}/manager/reportList.do">고객게시판
						관리</a>
					<div class="collapse-divider"></div>
				</div>
			</div></li>
	</c:if>
	
	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item active"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-wrench"></i> <span>고객게시판</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Customer Service</h6>
				<a class="collapse-item" href="${root}/customer/inquireList.do">1:1
					문의하기</a> <a class="collapse-item" href="${root}/customer/noticeList.do">공지사항</a>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<c:if test="${id=='user'}">
	<!-- Heading -->
	<div class="sidebar-heading">Addons</div>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link"
		href="${root}/calendar.do"> <i class="fas fa-fw fa-table"></i> <span>일정
				관리</span></a></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link"
		href="${root}/project/pjtState.do"> <i
			class="fas fa-fw fa-chart-area"></i> <span>프로젝트 현황</span></a></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link"
		href="${root}/project/workState.do"> <i
			class="fas fa-fw fa-chart-area"></i> <span>일감 현황</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	</c:if>

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!-- End of Sidebar -->