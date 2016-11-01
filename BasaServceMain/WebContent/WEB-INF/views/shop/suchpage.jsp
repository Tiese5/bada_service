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
	$(function() {
		$("select[name='drop_down']")
				.change(
						function() {
							var dropdown = $("#drop_down").val();
							window.location = "http://localhost:8080/BadaServceMain/shop/suchpage.do?drop_down="
									+ dropdown + "&category=${category}";
						});
	});
</script>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style media="screen" type="text/css">
/*상단 카테고리*/
.main-content ul>li {
	list-style: none;
	display: inline;
	padding-right: 7%;
	text-align: center;
}
/*상단 카테고리 위치*/
.category {
	padding-top: 70px;
	margin-left: 30px;
}
/*상단 카테고리*/
.main-content ul>li a {
	text-decoration: none;
	font-weight: bold;
	font-size: 20px;
}
/*상단 메인 태그*/
.textps {
	padding-left: 50px;
	padding-top: 50px;
}
/*드롭다운 넓이*/
.btwidth {
	width: 100px;
}
/*사진 크기*/
.img {
	width: 100px;
	height: 100px;
}
/*메인 위치*/
.main {
	display: inline-block;
	padding-left: 100px;
}
/*책마다 효과*/
.mainps {
	height: 250px;
	padding-top: 30px;
	box-shadow: 2px 2px 5px rgba(135, 139, 144, 0.7);
}

.main-body h4, p {
	font-weight: bold;
}
/*페이저 위치*/
.pageps {
	margin-left: 50%;
	/*드롭다운 위치조정*/
}

.dropps {
	margin-top: -30px;
}

.main-body>h4 a {
	text-decoration: none;
}
/*상단바 끝*/
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<!-- Grid Row 시작 -->
		<div class="row">
			<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
			<!-- 상단 컨텐츠 영역 시작 -->
			<div class="col-md-10 col-sm-9 main-content">
				<div>
					<h4 class="textps">검색결과100건</h4>
				</div>
				<div class="dropps pull-right">
					<select name="drop_down" id="drop_down">
						<option value="1" <c:if test="${dropDown eq '1'}">selected</c:if>>최신순</option>
						<option value="2" <c:if test="${dropDown eq '2'}">selected</c:if>>인기순</option>
						<option value="3" <c:if test="${dropDown eq '3'}">selected</c:if>>낮은가격순</option>
						<option value="4" <c:if test="${dropDown eq '4'}">selected</c:if>>가나다순</option>
					</select>
				</div>
				<hr />
				<!-- 상단 컨텐츠 영역 끝 -->
				<!--메인컨텐츠 시작-->
				<!--항목1-->
				<form class="form-horizontal" id="myform">
					<c:choose>
						<c:when test="${fn:length(shopList)>0}">
							<c:forEach var="shop" items="${shopList}">
								<div class="col-md-3">
									<div class="col-md-4" style="width: 100%">
										<div class="thumbnail">
											<c:url var="readUrl" value="/shop/shop_read.do">
												<c:param name="category" value="${shop.category}"></c:param>
												<c:param name="shop_id" value="${shop.id}"></c:param>
											</c:url>
											<c:choose>
												<c:when test="${shop.item_image != null }">
													<c:url var="downloadUrl" value="/download.do">
														<c:param name="file" value="${shop.item_image}">
														</c:param>
													</c:url>
													<a href="${readUrl}"><img src="${downloadUrl}"
														class="img-responsive" style="height: 60%" width="100%" /></a>
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/assets/img/no_image.jpg"
														class="img-responsive" width="100px" />
												</c:otherwise>
											</c:choose>
											<div>
												<p>
													<img src="${shop.item_image}" style="height: 80%"> <a
														href="${readUrl}"> ${shop.item_title}<br /></a> <strong
														class="color">${shop.price}</strong>
												</p>
											</div>
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
					
					<div class="col-md-12">
						<nav class="text-center">
							<ul class="pagination">
								<!-- 이전 그룹으로이동 -->
								<c:choose>
									<c:when test="${pageHelper.prevPage > 0 }">
										<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
										<!-- 이전 그룹으로 이동하기 위해 URL을 생성해서 prevUrl에 저장 -->
										<c:url var="prevUrl" value="/shop/main.do">
											<c:param name="category" value="${category}"></c:param>
											<c:param name="keyword" value="${keyword}"></c:param>
											<c:param name="page" value="${pageHelper.prevPage}"></c:param>
										</c:url>
										<li><a href="${prevUrl }">&laquo;</a></li>
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
									<c:url var="pageUrl" value="/shop/main.do">
										<c:param name="categort" value="${category}"></c:param>
										<c:param name="keyword" value="${keyword}"></c:param>
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
										<c:url var="nextUrl" value="/shop/main.do">
											<c:param name="category" value="${category}"></c:param>
											<c:param name="keyword" value="${keyword}"></c:param>
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
					</div>
				</form>
			</div>
		</div>
		<!-- Grid Row 끝 -->
		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>


</body>
</html>