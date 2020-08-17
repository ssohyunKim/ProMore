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
	
	<c:if test="${empty projectCnt}">
		<script>
			location.href ="${root}/project/projectRead.do?proNum=${proNum}";
		</script>
			<!-- 프로젝트정보를 띄워줌 -->
		<!-- 	Project Read Model -->
	<!-- <div class="modal fade" id="mainReadModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				modal-header
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">프로젝트 읽기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<input id="proNum" type="hidden" name="proNum" value="" />
				modal-body
				<div class="modal-body">

					프로젝트 제목 && 인원수 
			                  <div class="form-group row">
			                     <div class="col-sm-10">
			                        <input type="text" class="form-control-plaintext" name="proName" style="display: inline;"  placeholder="제목을 입력하세요." readonly>
			                     </div>
			                    <p style="margin: 6px 13px 0px 0px">인원수</p>
			                     <div class="col-sm-1.5" style="display: inline;">
			                        <select name="proMax" class="form-control-plaintext" readonly>
			                            <option value="2">2</option>
			                            <option value="3">3</option>
			                            <option value="4">4</option>
			                            <option value="5">5</option>
			                        </select>
			                     </div>
			                  </div>
	
							글 내용
							<div class="form-group row">
								<div class="col-sm-12">
									<textarea class="form-control-plaintext" rows="20" name="proContent" placeholder="글을 입력하세요." readonly></textarea>
								</div>
							</div>
								

							modal-footer
							<div class="modal-footer justify-content-right">
								<div>
									<button id="applyBtn" type="button" class="btn btn-secondary">신청</button>
									<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
								</div>
							</div>
				</div>

			</div> -->
		</div>
	</div>
										
	</c:if>
	
	
	
</body>

<!--Project Read Model -->
	<!-- <div class="modal fade" id="mainReadModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg mt-5" role="document">
			<div class="modal-content">

				modal-header
				<div class="modal-header">
					<h5 class="m-0 font-weight-bold text-primary p-2">프로젝트 읽기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<input id="proNum" type="hidden" name="proNum" value="" />
				modal-body
				<div class="modal-body">

					프로젝트 제목 && 인원수 
			                  <div class="form-group row">
			                     <div class="col-sm-10">
			                        <input type="text" class="form-control-plaintext" name="proName" style="display: inline;"  placeholder="제목을 입력하세요." readonly>
			                     </div>
			                    <p style="margin: 6px 13px 0px 0px">인원수</p>
			                     <div class="col-sm-1.5" style="display: inline;">
			                        <select name="proMax" class="form-control-plaintext" readonly>
			                            <option value="2">2</option>
			                            <option value="3">3</option>
			                            <option value="4">4</option>
			                            <option value="5">5</option>
			                        </select>
			                     </div>
			                  </div>
	
							글 내용
							<div class="form-group row">
								<div class="col-sm-12">
									<textarea class="form-control-plaintext" rows="20" name="proContent" placeholder="글을 입력하세요." readonly></textarea>
								</div>
							</div>
								

							modal-footer
							<div class="modal-footer justify-content-right">
								<div>
									<button id="applyBtn" type="button" class="btn btn-secondary">신청</button>
									<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
								</div>
							</div>
				</div>

			</div>
		</div>
	</div> -->
</html>