<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<c:set var="root" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 확인</title>
</head>
<body>
	${check}
	
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("회원 정보가 수정되었습니다.");
			location.href = "${root}/member/memberUpdate.do?memNum=" + ;
		</script>
	</c:if>

	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("회원 정보 수정 실패");
			location.href = "${root}/member/memberUpdate.do?memNum=" + ;
		</script>
	</c:if>
</body>
</html>