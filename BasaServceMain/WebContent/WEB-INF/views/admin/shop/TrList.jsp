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
					<h1>최근 거래내역</h1>
				</div>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead style="background-color: #eee;">
							<tr>
								<th class="text-center" width="15%">구매자 ID</th>
								<th class="text-center" width="20%">판매자 ID</th>
								<th class="text-center" width="20%">거래일시</th>
								<th class="text-center" width="15%">금액</th>
								<th class="text-center" width="20%">거래상품</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${fn:length(trList)>0}">
									<c:forEach var="trList" items="${trList}">
										<tr>
											<td class="text-center">${trList.userId}</td>
											<td class="text-center">${trList.sellerId}</td>
											<td class="text-center">${trList.regData}</td>
											<td class="text-center">${trList.price}</td>
											<td class="text-center">${trList.itemTitle}</td>
										</tr> 
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p class="text-center">거래내역 이없습니다</p>
								</c:otherwise>
							</c:choose>
						
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
														<c:url var="prevUrl" value="/admin/shop/TrList">
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
													<c:url var="pageUrl" value="/admin/shop/TrList">
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
														<c:url var="nextUrl" value="/admin/shop/TrLists">
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
