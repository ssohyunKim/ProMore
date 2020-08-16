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

	<c:remove var="memberDto" scope="session"/>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("회원 정보가 삭제되었습니다.");
			location.href = "${root}/index.jsp";
		</script>
	</c:if>

	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("회원 정보 삭제 실패");
			location.href = "${root}/member/memberDelete.do?memNum=${memberDto.memNum}";
		</script>
	</c:if>

</body>
</html>