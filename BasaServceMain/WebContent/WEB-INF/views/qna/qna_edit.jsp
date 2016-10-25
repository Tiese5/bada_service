<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<title>BaDa</title>
<style media="screen" type="text/css">
.test {
	color: #EEB10A;
}

.namefont {
	font-weight: bold;
}

.none {
	padding-top: 45px;
}

.btnpadding {
	padding-top: 20px;
	margin-left: 230px;
}

.nametext1 {
	font-weight: bold;
}

.nametext {
	padding-top: 50px;
}
/*텍스트 중앙정렬*/
tr td {
	text-align: center;
}
/*좌우 구분선*/
td, th {
	border-right: 1px solid #ccc;
}
/*좌우 선 지우기*/
td:last-child, th:last-child {
	border: 0;
}
/*마지막 선 만들기*/
table:last-child {
	border-bottom: 1px solid #ccc;
}
/*테이블 크기 조정*/
table {
	width: 100%;
	height: 300px;
	margin-left: 20px;
}

.none {
	margin-top: -30px;
}

/*상단바 끝*/
</style>


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
					<h1 class="nametext1 ">1:1 문의</h1>
					<p class="test col-sm-offset-10">*은 필수 입력 입니다</p>
				</div>
				<!--제목라인-->
				<form class="form-horizontal" method="post"
					action="${pageContext.request.contextPath }/qna/qna_edit_ok.do">
					<!-- 게시판 수정에 대한 상태유지 -->
					<input type="hidden" name="qna_id" value="${readQna.id}" />

					<div class="form-group nametext">
						<label for="title" class="col-md-offset-2 col-md-2">제목* </label>
						<div class="col-md-8">
							<input type="text" name="title" id="title" class="form-control"
								value="${readQna.title}">
						</div>
					</div>
					<!--제목끝-->
					<!--문의종류-->
					<div class="none">
						<div class="form-group padding">
							<label for="category" class="col-md-offset-2 col-md-2">문의종류*</label>
							<div class="col-md-8">
								<select class="form-control" name="category" id="category">
									<option value="">선택해주세요</option>
									<option value="1">판매관련</option>
									<option value="2">배송</option>
									<option value="3">환불</option>
									<option value="4">기타</option>
								</select>
							</div>
						</div>
					</div>
					<!--문의중류 긑-->
					<!--문의내용-->
					<div class="form-group none">
						<label for="qContent" class="col-md-offset-2 col-md-2">문의내용*</label>
						<div class="col-md-8">
							<textarea class="form-control" rows="3" name="qContent"
								id="qContent">${readQna.qContent}</textarea>

							<div class="btnpadding">
								<button type="submit" class="btn btn-primary">수정하기</button>
								<button type="button" class="btn btn-danger"
									onclick="history.back();">수정취소</button>
							</div>
						</div>
					</div>
				</form>
				<!--문의내용 끝-->


			</div>
		</div>


		<!--수정내용 끝-->
		<!-- 메인 컨텐츠 영역 끝 -->
		<!-- Grid Row 끝 -->
		<!-- Footer 영역 시작 -->
		<%@include file="/WEB-INF/inc/footer.jsp"%>
	</div>
</body>
</html>