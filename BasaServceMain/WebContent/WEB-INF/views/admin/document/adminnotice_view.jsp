<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="/WEB-INF/inc/admin_head.jsp"%>
    <style media="screen" type="text/css">
     
        
    </style>
</head>

<body>

	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/admin_topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->

	<div class="container">

	<%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
		<!-- Grid Row 시작 -->
		<div class="row">

			<!-- 좌측 사이드 네비게이션 바 -->
			
			<!-- 좌측 사이드 네비게이션 바 끝 -->

			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1>${bbsName}(상세보기)</h1>
				</div>
				<br />
				<form class="form-horizontal" id="myform">
					<div class="form-group">
						<label for="writer_name" class="col-md-1">작성자:</label>
						<div class="col-md-11">
							<span>${readDocument.writerName} </span>
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-md-1">제목:</label>
						<div class="col-md-11">
							<span> ${readDocument.title} </span>
						</div>
					</div>
					
					
					<div class="form-group">
						<label for="content" class="col-md-1">내용:</label>
						<div class="col-md-11">
							<span> ${readDocument.content} </span>
						</div>
					</div>
					<div class="page-header"></div>
						<div class="form-group">
						<div class="col-md-7">
							<a href="${pageContext.request.contextPath}/admin_document_list.do?category=${category}" 
							class="btn btn-primary pull-left">목록</a>
							<a href="${pageContext.request.contextPath}/admin_document_edit.do?category=${category}&document_id=${readDocument.id}"
							class="btn btn-info pull-left" style='margin-left: 10px;'>수정</a>
							<a href="${pageContext.request.contextPath}/admin_document_delete_ok.do?category=${category}&document_id=${readDocument.id}" 
							class="btn btn-danger" style='margin-left: 10px;'>삭제</a>
						
						</div>
					</div>
				</form>
			</div>
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->

	
	</div>
		<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
