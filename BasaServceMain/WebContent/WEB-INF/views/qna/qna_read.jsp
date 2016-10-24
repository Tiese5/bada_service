<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>


<head>
<title>BaDa</title>
<%@include file="/WEB-INF/inc/head.jsp"%>
<body>

	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->

	<div class="container">

		<!-- Grid Row 시작 -->
		<div class="row">

			<!-- 좌측 사이드 네비게이션 바 -->
			<%@include file="/WEB-INF/inc/sidebar.jsp"%>
			<!-- 좌측 사이드 네비게이션 바 끝 -->

			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1>1:1문의 질문(상세보기)</h1>
				</div>
				<br />
				<form class="form-horizontal" id="myform">
					<div class="form-group">
						<label for="send_people" class="col-md-6">제목:${readQna.title}</label>
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
						<div class="pad col-md-6">답변 내용:${readQNA.aContent}</div>
					</div>

					<div class="pull-right">
						<a
							href="${pageContext.request.contextPath}/qna/qna.do?qna_id=${readQna.id}"
							class="btn btn-info">목록</a> <a
							href="${pageContext.request.contextPath}/qna/qna_edit.do?qna_id=${readQna.id}"
							class="btn btn-primary">수정</a> <a
							href="${pageContext.request.contextPath}/qna/qna_delete.do?qna_id=${readQna.id}"
							class="btn btn-danger">삭제</a>
					</div>
				</form>
			</div>
		</div>
		<!-- 메인 컨텐츠 영역 끝 -->

		<!-- Grid Row 끝 -->

		<!-- Footer 영역 시작 -->
		<%@include file="/WEB-INF/inc/footer.jsp"%>
		<!-- Footer 영역 끝 -->
	</div>


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document.body).on(
				'click',
				'.dropdown-menu li',
				function(event) {

					var $target = $(event.currentTarget);

					$target.closest('.input-group-btn').find(
							'[data-bind="label"]').text($target.text()).end()
							.children('.dropdown-toggle').dropdown('toggle');

					return false;

				});
	</script>
</body>

</html>
