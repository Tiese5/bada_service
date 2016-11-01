<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<script
	src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.css">
<style media="screen" type="text/css">
.size {
	margin-left: 30%;
	list-style-type: none;
}

h3 {
	margin-left: 15px;
}

.color {
	color: #ff0000;
}

.line {
	text-decoration: line-through;
}

.btns {
	margin-top: 20px;
	margin-left: 30px;
}

#btnsiza {
	margin-right: 20px;
}

.marg {
	margin-top: 50px;
	padding-bottom: 50px;
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<!-- Grid Row 시작 -->
		<div class="row">
			<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="test col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1>제품 상세</h1>
				</div>
				<div class="image col-md-9 clearfix">
				
					<c:if test="${readItem.item_image != null }">
						<c:url var="downloadUrl" value="/download.do">
							<c:param name="file" value="${readItem.item_image}">
							</c:param>
						</c:url>
						<img src="${downloadUrl}" style="float: left" width="190px" height="200px" />
					</c:if>
					
					<ul class="size">
						<li><h2>
								<strong>${readItem.item_title}</strong>
							</h2></li>
						<li><h3>등록일: ${readItem.reg_date}</h3></li>
						<li><h3>
								판매자: <a
									href="${pageContext.request.contextPath}/message_send.do?user_id=${readMember.user_id}"
									id="nameid"> ${readItem.memberName}</a>
							</h3></li>
						<li><h3>
								<strong class="color">${readItem.price}</strong>원
							</h3></li>
					</ul>

					<a
						href="${pageContext.request.contextPath}/buy.do?id=${readItem.id}"
						class="btns btn btn-primary" id="buy">구매하기</a> <a
						href="${pageContext.request.contextPath}/shop/cart_ok.do?id=${readItem.id}"
						class="btns btn btn-warning" id="cart">장바구니</a>

				</div>
				<div class="marg col-md-12">
					<h1>책 정보</h1>
					<hr />
				</div>
			</div>
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>


	<script type="text/javascript">
		$(document.body).on(
				'click',
				'.dropdown-menu li',
				function(event) {

					var $target = $(event.currentTarget);

					$target.closest('.input-group-btn').find(
							'[data-bind="label"]').text($target.text()).end()
							.children('.dropdown-toggle').dropdown('toggle');

					return false;

				});
	</script>
</body>

</html>
