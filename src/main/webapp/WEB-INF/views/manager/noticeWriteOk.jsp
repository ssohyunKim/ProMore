<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:set var="root" value="${pageContext.request.contextPath}"/>

<html>
	<head>
	<meta charset="UTF-8">
	<title>공지사항 작성 확인</title>
	</head>
<body>
	${check}
	
	<c:if test = "${check > 0}">
		<script type = "text/javascript">
			alert("새로운 공지사항을 작성했습니다.");
			location.href = "${root}/manager/noticeList.do";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type = "text/javascript">
			alert("공지사항 작성을 실패하였습니다.");
			location.href = "${root}/manager/noticeList.do";
		</script>
	</c:if>
</body>
</html>