<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그아웃 - 세션 종료</title>
</head>
<body>

	<c:if test="${memberDto.memLevel!=null}">
		<c:set var="memNum" value="${memberDto.memNum}" scope="session"/>
		<c:set var="memId" value="${memberDto.memId}" scope="session"/>
		<c:set var="memPassword" value="${memberDto.memPassword}" scope="session"/>
		<c:set var="memName" value="${memberDto.memName}" scope="session"/>
		<c:set var="memNickname" value="${memberDto.memNickname}" scope="session"/>
		<c:set var="memLevel" value="${memberDto.memLevel}" scope="session"/>
		<c:set var="memPhone" value="${memberDto.memPhone}" scope="session"/>
		<c:set var="memEmail" value="${memberDto.memEmail}" scope="session"/>
		<c:set var="memSkills" value="${memberDto.memSkills}" scope="session"/>
	
		<script type="text/javascript">
			alert("로그인 성공");
			location.href="${root}/project/main.do";
		</script>
	</c:if>
	
	<c:if test="${memLevel==null}">
		<script type="text/javascript">
			alert("비밀번호와 아이디를 확인하세요");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
</body>
</html>