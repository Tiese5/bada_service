<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<title>BaDa | 공지사항</title>
<%@include file="/WEB-INF/inc/head.jsp"%>
<style>
/*상단바 끝*/
td, th {
	border-right: 1px solid #ccc;
}

td:last-child, th:last-child {
	border: 0;
}
</style>
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
					<h1>공지사항</h1>
				</div>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead style="background-color: #eee;">
							<tr>
								<th class="text-center" width="10%">No</th>
								<th class="text-center" width="70%">제목</th>
								<th class="text-center" width="20%">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center">10</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">09</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">08</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">07</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">06</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">05</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">04</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">03</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">02</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
							<tr>
								<td class="text-center">01</td>
								<td class="text-center"><a href="#">서비스 점검 안내(2016년 8월
										29일)</a></td>
								<td class="text-center">2016.8.20 00:00:00</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" class="text-center">
									<nav aria-label="Page navigation">
										<ul class="pagination">
											<li class="previous disabled"><a href="#"><span
													aria-hidden="true">&larr;</span> 이전</a></li>
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li class="next"><a href="#">다음 <span
													aria-hidden="true">&rarr;</span></a></li>
										</ul>
									</nav>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->

		<!-- Footer 영역 시작 -->
		<hr>
		<footer>
			<%@include file="/WEB-INF/inc/footer.jsp"%>
		</footer>
		<!-- Footer 영역 끝 -->
	</div>
</body>

</html>
