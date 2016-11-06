<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<title>BaDa</title>
<%@include file="/WEB-INF/inc/head.jsp"%>

<script type="text/javascript">
	$(document.body).on(
			'click',
			'.dropdown-menu li',
			function(event) {
				var $target = $(event.currentTarget);
				$target.closest('.input-group-btn').find('[data-bind="label"]')
						.text($target.text()).end()
						.children('.dropdown-toggle').dropdown('toggle');
				return false;
			});
</script>
<style media="screen" type="text/css">
.test {
	color: #EEB10A;
}

.namefont {
	font-weight: bold;
}

.none {
	padding-top: 50px;
}

.btnpadding {
	padding-top: 20px;
	margin-left: 320px;
}

.nametext1 {
	font-weight: bold;
}

.nametext {
	margin-top: 50px;
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
	margin-left: 20px;
}

.none {
	margin-top: -30px;
}
/*상단바 끝*/
</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->
	<div class="container">
		<!-- Grid Row 시작 -->
		<div class="row">
			<!-- 좌측 사이드 네비게이션 바 -->
			<%@include file="/WEB-INF/inc/my_sidebar.jsp"%>
			<!-- 좌측 사이드 네비게이션 바 끝 -->
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1 class="nametext1 ">1:1 문의</h1>
					<p class="test col-sm-offset-10">*은 필수 입력 입니다</p>
				</div>
				<!--제목라인-->
				<form class="form-horizontal" method="post"
					action="${pageContext.request.contextPath }/qna/qna_ok.do">
					<div class="form-group nametext">
						<label for="title" class="col-md-offset-2 col-md-2">제목* </label>
						<div class="col-md-8">
							<input type="text" name="title" id="title" class="form-control"
								placeholder="제목을 입력해주세요">
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
							<textarea class="form-control " rows="3" name="qContent"
								id="qContent" placeholder="내용을 입력해 주세요"></textarea>
							<div class="btnpadding">
								<button type="submit" id="com1" class="btn btn-info">작성완료</button>
							</div>
						</div>
					</div>
				</form>
				<!--문의내용 끝-->
				<!--문의내역-->
				<div>
					<h2 class="nametext1">문의내역</h2>
					<hr />
				</div>
				<!--문의내역 테이블-->
				<div>
					<div class="">
						<table class="table table-hover">
							<thead style="background-color: #efe;">
								<tr>
									<th class="text-center" width="10%">문의종류</th>
									<th class="text-center" width="40%">제목</th>
									<th class="text-center" width="20%">문의일시</th>
								</tr>
							</thead>
							<tbody style="height: 50px;">
								<c:choose>
									<c:when test="${fn:length(qnaList) > 0}">
										<c:forEach var="qna" items="${qnaList}">
											<tr>
												<td class="text-center"><c:choose>
														<c:when test="${qna.category== '1' }">판매관련</c:when>
														<c:when test="${qna.category== '2' }">배송</c:when>
														<c:when test="${qna.category== '3' }">환불</c:when>
														<c:when test="${qna.category== '4' }">기타</c:when>
													</c:choose></td>
												<td>
													<c:url var="readUrl" value="/qna/qna_read.do">
														<c:param name="qna_id" value="${qna.id }"></c:param>
													</c:url> <a href="${readUrl}">${qna.title}</a></td>
												<td class="text-center">${qna.regDate }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" class="text-center"
												style="line-height: 100px;">조회된 글이 없습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="5" class="text-center">
										<nav class="text-center">
											<ul class="pagination">
												<!-- 이전 그룹으로이동 -->
												<c:choose>
													<c:when test="${pageHelper.prevPage > 0 }">
														<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
														<!-- 이전 그룹으로 이동하기 위해 URL을 생성해서 prevUrl에 저장 -->
														<c:url var="prevUrl" value="/qna/qna.do">
															<c:param name="page" value="${pageHelper.prevPage}"></c:param>
														</c:url>
														<li><a href="${prevUrl}">&laquo;</a></li>
													</c:when>
													<c:otherwise>
														<li class="disabled"><a href="#">&laquo;</a></li>
													</c:otherwise>
												</c:choose>

												<!-- 페이지 번호 -->
												<!-- 현재 그룹의 시작페이지~ 끝페이지 사이의 1씩 증가하면서 반복 -->
												<c:forEach var="i" begin="${pageHelper.startPage}"
													end="${pageHelper.endPage}" step="1">
													<!-- 페이지 번호로 이동할수 있는 URL을 생성하겨 url에 저장 -->
													<c:url var="pageUrl" value="/qna/qna.do">
														<c:param name="page" value="${i}"></c:param>
													</c:url>
													<!-- 반족중의 페이지 번호와 현재 페이지 번호가 갗은 경우에 대한 분기 -->
													<c:choose>
														<c:when test="${pageHelper.page==i})">
															<li class="active"><a href="#">${i}</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageUrl}">${i}</a></li>
														</c:otherwise>
													</c:choose>


												</c:forEach>


												<!-- 다음 그룹으로 이동-->
												<c:choose>
													<c:when test="${pageHelper.nextPage > 0}">
														<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
														<!-- 이전 그룹으로 이동하기 위해 URL을 생성해서 prevUrl에 저장 -->
														<c:url var="nextUrl" value="/qna/qna.do">
															<c:param name="page" value="${pageHelper.nextPage}"></c:param>
														</c:url>
														<li><a href="${nextUrl}">&raquo;</a></li>
													</c:when>
													<c:otherwise>
														<li class="disabled"><a href="#">&raquo;</a></li>
													</c:otherwise>
												</c:choose>
											</ul>

										</nav>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<!--문의내역 테이블 끝-->
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 영역 끝 -->
		<!-- Grid Row 끝 -->
		<!-- Footer 영역 시작 -->

		<%@include file="/WEB-INF/inc/footer.jsp"%>
		<!-- Footer 영역 끝 -->
	</div>
</body>
</html>