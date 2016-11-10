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
	<%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
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
										<%-- <tr>
											<td>${trList.name}</td>
											<td>${trList.itemTitle}</td>
											<td>${buylist.sellerName}</td>
											<td>${buylist.regData}</td>
											<td><span class="text-danger">${buylist.price}</span> 원</td>
										</tr> --%>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p class="text-center">거래내역 이없습니다</p>
								</c:otherwise>
							</c:choose>
						
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
