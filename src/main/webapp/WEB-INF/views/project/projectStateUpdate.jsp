<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check>0}">
      <script type="text/javascript">
         alert("수정되었습니다.");
      </script>
   </c:if>
   
   <c:if test="${check==0}">
      <script type="text/javascript">
         alert("수정되지 않았습니다.")
      </script>
   </c:if>
    
    
    <script type="text/javascript">
    	location.href = "${root}/project/pjtState.do";
    </script>
  

</body>
</html>