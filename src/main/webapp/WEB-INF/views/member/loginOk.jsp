<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${mem_level!=null}">
		<c:set var="mem_id" value="${mem_id}" scope="session"/>
		<c:set var="mem_level" value="${mem_level}" scope="session"/>
	
		<script type="text/javascript">
			alert("로그인 성공");
			location.href="${root}/project/main.do";
		</script>
	</c:if>
	
	<c:if test="${mem_level==null}">
		<script type="text/javascript">
			alert("비밀번호와 아이디를 확인하세요");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
</body>
</html>