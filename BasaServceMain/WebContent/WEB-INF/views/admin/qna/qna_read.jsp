<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<style type="text/css">
.main-content{
margin-left: 150px;
}
</style>

<title>BaDa Admin</title>

<%@include file="/WEB-INF/inc/admin_head.jsp"%>



</head>

<body>

	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/admin_topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->

	<!-- 컨테이너 영역 -->
	<div class="container">
		<!-- 사이드 네비게이션 바 -->
		<%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
		<!-- 사이트 네비게이션 바 끝 -->
		<div class="row">
			<!-- 메인 컨텐츠 영역 -->
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1>1:1문의 질문(상세보기)</h1>
				</div>
				<br />
				<form class="form-horizontal" id="myform">
					<div class="form-group">
						<label for="send_people" class="col-md-6">제목:
						${readQna.title}</label>
					</div>

					<div class="form-group">
					<label for="send_people" class="col-md-6">
						<c:choose>
							<c:when test="${readQna.category== '1' }">카테고리:판매관련</c:when>
							<c:when test="${readQna.category== '2' }">카테고리:배송</c:when>
							<c:when test="${readQna.category== '3' }">카테고리:환불</c:when>
							<c:when test="${readQna.category== '4' }">카테고리:기타</c:when>
						</c:choose>
					</label>	
					</div>

					<div class="form-group">
						<label for="qContent" class="col-md-6">문의
							내용:${readQna.qContent }</label>
					</div>
					<hr />
					<div class="form-group">
					<div class="pad col-md-6">
					<c:choose>
						<c:when test="${readQna.aContent == null}">미답변</c:when>
						<c:otherwise>
							${readQna.aContent}
						</c:otherwise>		
					</c:choose>
					</div>
					</div>
			
					<div class="pull-right">
						<a
							href="${pageContext.request.contextPath}/admin/qna.do"
							class="btn btn-info">목록</a> <a
							href="${pageContext.request.contextPath}/admin/qna_add.do?qna_id=${readQna.id}&writer_id=${readQna.writerId}"
							class="btn btn-primary">답변</a>
							<a
							href="${pageContext.request.contextPath}/admin/qna_edit.do?qna_id=${readQna.id}&writer_id=${readQna.writerId}"
							class="btn btn-success">수정</a>
							<a
							href="${pageContext.request.contextPath}/admin/qna_delete.do?qna_id=${readQna.id}"
							class="btn btn-danger">삭제</a>
					</div>
				</form>
			</div>
		</div>

		<!--수정내용 끝-->
	</div>
	<!-- 컨테이너 끝 -->


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
