<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- Side bar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- PROMORE 로고 홈 버튼 -->

	<!-- Side bar - Brand -->
	<li><a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${root}/project/main.do"> <span
			class="sidebar-brand-icon rotate-n-15"> <i
				class="fas fa-laugh-wink"></i>
		</span> <span class="sidebar-brand-text mx-3"> PROMORE<sup></sup>
		</span>
	</a></li>

	<!-- Divider -->
	<li>
		<hr class="sidebar-divider my-0">
		<hr class="sidebar-divider">
	</li>

	<!-- Heading -->
	<li>
		<div class="sidebar-heading">Interface</div>
	</li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item active"><a class="nav-link"
		href="${root}/project/main.do"> <i class="fas fa-fw fa-folder"></i>
			<span>프로젝트</span>
	</a></li>

	<!-- 마이페이지 -->

	<c:if test="${memberDto.memLevel=='팀원' || memberDto.memLevel=='팀장'}">
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
						<a class="collapse-item" href="${root}/member/memberUpdate.do?memNum=${memberDto.memNum}">회원 정보 수정</a>
						<a class="collapse-item" href="${root}/member/memberDelete.do?memNum=${memberDto.memNum}">회원 탈퇴</a>
					<div class="collapse-divider"></div>
				</div>
			</div>
		</li>
	</c:if>

	<!-- 관리자 페이지 -->

	<c:if test="${memberDto.memLevel=='관리자'}">
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

	<c:if test="${memberDto.memLevel!='관리자'}">
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

				<c:if test="${memberDto!=null}">
					<a class="collapse-item" href="${root}/customer/inquireList.do">1:1
						문의하기</a>
				</c:if>

				<a class="collapse-item" href="${root}/customer/noticeList.do">공지사항</a>
			</div>
		</div></li>
	</c:if>

	<!-- Divider -->
	<li>
		<hr class="sidebar-divider">
	</li>

	<c:if test="${memberDto.memLevel=='팀원' || memberDto.memLevel=='팀장'}">
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
			href="${root}/workspace/workState.do"> <i
				class="fas fa-fw fa-chart-area"></i> <span>일감 현황</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">
	</c:if>

	<!-- Side bar Toggle (Side bar) -->
	<li class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</li>
</ul>
<!-- End of Side bar -->