<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 	${projectCnt}
	${id}
	${projectList}
	 --%>
	 
	 <!-- 프로젝트를 신청한 팀장, 팀원 부분 -->
	<c:set var="loop_flag" value="false"/>
	<c:forEach var="projectCnt" items="${projectCnt}">
		<c:if test="${not loop_flag and projectCnt==proNum}">
				<c:set var="loop_flag" value="true"/>
				<script>
				location.href = "${root}/workspace/workspace.do?proNum=${proNum}";
				</script>
		</c:if>
	</c:forEach>
	
	<!-- 프로젝트를 아무것도 신청하지 않은 사람  && 신청하지 않은 사람-->
	<c:if test="${empty projectCnt}">
		<script>
			location.href ="${root}/project/projectRead.do?proNum=${proNum}";
		</script>						
	</c:if>
	
	<!-- 프로젝트를 신청했지만 이것을 신청하지 않은 사람 -->
	<c:if test="${not loop_flag}">
		<script>
			location.href ="${root}/project/projectRead.do?proNum=${proNum}";
		</script>
	</c:if>
	
	
</body>
</html>