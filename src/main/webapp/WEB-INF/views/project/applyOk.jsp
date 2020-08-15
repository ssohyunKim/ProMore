<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check>0}">
      <script type="text/javascript">
         alert("신청되었습니다.");
         location.href = "${root}/workspace/workspace.do?proNum="+${proNum};
      </script>
   </c:if>
   
   <c:if test="${check==0}">
      <script type="text/javascript">
         alert("신청되지 않았습니다.")
          location.href = "${root}/project/main.do";
      </script>
   </c:if>
   

</body>
</html>