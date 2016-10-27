<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<script type="text/javascript">
$(function(){
$("select[name='drop_down']").change(function(){
	var dropdown = $("#drop_down").val();
	window.location="http://localhost:8080/BadaServceMain/shop/main.do?dorpdown="+ dropdown;
	
});
});


</script>
<style media="screen" type="text/css">
.drop {
	margin-top: -30px;
}

.thumbnail {
	width: 80%;
	height: 260px;
}

.color {
	color: #ff0000;
}

a>h5 {
	text-align: left;
	line-height: 20px;
}

.page {
	margin-left: 30%;
}
/*상단바 끝*/
</style>
</head>

<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<!-- Grid Row 시작 -->
		<div class="row multi-columns-row">
			<div class="row">
				<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
				<!-- 메인 컨텐츠 영역 시작 -->
				<div class="col-sm-9 col-md-10 main-content clearfix">
					<div>
						<h3>총 도서: 10,000권</h3>
					</div>
					<div class="drop pull-right">
						<select name="drop_down" id="drop_down">
							<option value="1">최신순</option>
							<option value="2">인기순</option>
							<option value="3">낮은 가격순</option>
							<option value="4">가나다순</option>
						</select>
					</div>
					<hr />
					<form class="form-horizontal" id="myform">
						<div class="col-md-3">
							<c:choose>
								<c:when test="${fn:length(shopList)>0}">
									<c:forEach var="shop" items="${shopList }">
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<div class="thumbnail">
												<c:url var="readUrl" value="/shop/itme_read.do">
													<c:param name="category" value="${shop.category}"></c:param>
													<c:param name="shop" value="${shop.id}"></c:param>
												</c:url>
												<a href="${readUrl}"> <c:choose>
														<c:when test="${shop.item_image != null }">
															<c:url var="downloadUrl" value="/download.do">
																<c:param name="file" value="${shop.item_image}"></c:param>
															</c:url>
															<img src="${downloadUrl}" class="img-responsive" />
														</c:when>
														<%-- <c:otherwise>
														<img
															src="${pageContext.request.contextPath}/asset/img/no_image.jpg"
															class="img-responsive" />
													</c:otherwise> --%>
													</c:choose>
												</a>
												<div>
													<p>
														<a
															href="${pageContext.request.contextPath}/shop/shop_read.do"
															class="thumbnail"> <img src="${shop.item_image}"
															alt=""> ${shop.item_title}<br /> <strong
															class="color">${shop.price}</strong>

														</a>
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="col-md-12">
										<p class="text-center">조회된 글이 없습니다</p>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-md-12">
							<nav aria-label="Page navigation" class="page">
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
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 영역 끝 -->


		<!-- Grid Row 끝 -->

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>

</body>

</html>
