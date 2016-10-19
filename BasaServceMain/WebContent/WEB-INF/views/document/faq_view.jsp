<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<%@include file="/WEB-INF/inc/head.jsp"%>
</head>
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
					<h1>자주묻는 질문(상세보기)</h1>
				</div>
				<br />
				<form class="form-horizontal" id="myform">
					<div class="form-group">
						<label for="send_people" class="col-md-1">작성자:</label>
						<div class="col-md-11">
							<span> 아아 </span>
						</div>
					</div>
					<div class="form-group">
						<label for="subject" class="col-md-1">제목:</label>
						<div class="col-md-11">
							<span> 아아 </span>
						</div>
					</div>
					<div class="page-header"></div>
					<div class="form-group">
						<div class="pad col-md-6">
							<p>자주 묻는 질문 상세 보기 자주 묻는 질문 상세 보기 자주 묻는 질문 상세 보기 자주 묻는 질문 상세
								보기 자주 묻는 질문 상세 보기 자주 묻는 질문 상세 보기 자주 묻는 질문 상세 보기</p>
						</div>
					</div>
					<div class="pull-right">
						<a href="hyj_many_question(service).html" class="btn btn-primary">목록</a>
					</div>
				</form>
			</div>
		</div>
		<!-- 메인 컨텐츠 영역 끝 -->
		<!-- 메인 컨텐츠 영역 끝 -->
		<!-- Grid Row 끝 -->
		<!-- Footer 영역 시작 -->
		<%@include file="/WEB-INF/inc/footer.jsp"%>
		<!-- Footer 영역 끝 -->
	</div>
</body>

</html>
