<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ProMore-프로젝트를 모아모아</title>
<!-- Custom fonts for this template-->
<link href="${root}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="${root}/resources/css/workspace/jquery-ui.css" />
<link rel="stylesheet"
	href="${root}/resources/css/workspace/jquery-ui.structure.css" />
<link rel="stylesheet"
	href="${root}/resources/css/workspace/jquery-ui.theme.css" />

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<!-- 일감댓글 -->
<link rel="stylesheet" href="${root}/resources/css/workspace/reply.css" />


<!-- jQuery -->
 <script type="text/javascript" src="${root}/resources/jquery.js"></script>
</head>
<body>
	<c:if test="${check>0}">
      <script type="text/javascript">
         	alert("글을 삭제하였습니다.")
      </script>
   </c:if>
   
   <c:if test="${check==0}">
      <script type="text/javascript">
         alert("요청하신 작업이 처리되지 않았습니다.")
      </script>
   </c:if>

    <script type="text/javascript">
    	location.href = "${root}/project/main.do";
    </script>
  
</body>
</html>