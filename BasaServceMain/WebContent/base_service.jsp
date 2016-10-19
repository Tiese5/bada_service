<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>

<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<div class="container">

		<!-- Grid Row 시작 -->
		<div class="row">

			<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header" style="">
					<h1>제목</h1>
				</div>
			</div>
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>



</body>

</html>
