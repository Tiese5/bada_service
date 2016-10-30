<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 좌측 사이드 네비게이션 바 -->
<div class="col-sm-3 col-md-2 side-menu-container">
	<div class="side-menu">
		<h5 class="list-title text-info">- 카테고리</h5>
		<ul class="nav nav-side-menu">
			<li><a href="${pageContext.request.contextPath}/shop/shop/main.do?category=1">학문</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/shop/main.do?category=2">소설</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/shop/main.do?category=3">자기계발</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/shop/main.do?category=4">정기 간행물</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/shop/main.do?category=5">어린이 도서</a></li>
		</ul>
		<h5 class="list-title text-info">- 사이트 관련</h5>
		<ul class="nav nav-side-menu">
			<li><a href="${pageContext.request.contextPath}/document_list.do?category=n">공지사항</a></li>
			<li><a href="${pageContext.request.contextPath}/document_list.do?category=f">자주묻는질문</a></li>
			<li><a href="#">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 좌측 사이드 네비게이션 바 끝 -->


<script type="text/javascript">
	$(function() {
		$(window).scroll(function() {
			$(".side-menu").animate({"top": $(this).scrollTop()}, {queue: false, ducation: 50, easing: "swing"});
			
		});
	});
</script>
