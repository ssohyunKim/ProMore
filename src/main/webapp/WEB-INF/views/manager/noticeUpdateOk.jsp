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
			alert("공지사항이 수정되었습니다.");
			location.href = "${root}/manager/noticeList.do";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type = "text/javascript">
			alert("공지사항 수정 실패");
			location.href = "${root}/manager/noticeList.do";
		</script>
	</c:if>
</body>
</html>