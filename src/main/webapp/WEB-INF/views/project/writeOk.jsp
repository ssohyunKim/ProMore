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
	<c:if test = "${check > 0}">
		<script type = "text/javascript">
			alert("새로운 프로젝트을 작성했습니다.");
			location.href = "${root}/project/main.do";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type = "text/javascript">
			alert("프로젝트 작성을 실패하였습니다.");
			location.href = "${root}/project/main.do";
		</script>
	</c:if>
</body>
</html>