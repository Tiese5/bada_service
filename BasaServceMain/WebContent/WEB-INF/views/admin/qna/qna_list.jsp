<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
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
			<div class="col-sm-offset-2 col-md-offset-2 main-content">

				<!-- 작성 영역 -->
				<div class="page-header">
					<h1>1:1문의</h1>
				</div>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead style="background-color: #eee;">
							<tr>
								<th class="text-center" width="20%">작성자</th>
								<th class="text-center" width="15%">문의종류</th>
								<th class="text-center" width="35%">문의내용</th>
								<th class="text-center" width="20%">작성일시</th>
								<th class="text-center" width="10%">답변</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>naver</td>
								<td>기타</td>
								<td><a href="#">거래는 어떤식으로 이루어 지나요</a></td>
								<td>2016.09.05</td>
								<td>O</td>

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

				<!-- 작성 영역 끝 -->

			</div>
			<!-- 메인 컨텐츠 영역 끝 -->
		</div>
	</div>
	<!-- 컨테이너 끝 -->


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
