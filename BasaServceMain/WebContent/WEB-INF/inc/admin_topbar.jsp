<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 로고, 상단 네비게이션 바 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">메뉴 열기</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">BaDa <span class="small">ADMIN</span></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">대시보드</a></li>
				<li><a href="#collapse-nav-item-shop" data-toggle="collapse">쇼핑몰
						관리</a>
					<ul class="nav navbar-nav-inner collapse"
						id="collapse-nav-item-shop">
						<li><a href="#">회원주문내역</a></li>
						<li><a href="#">거래내역</a></li>
						<li><a href="#">상품등록(바다)</a></li>
						<li><a href="#">승인요청관리</a></li>
						<li><a href="#">주문/입금/베송관리</a></li>
					</ul></li>
				<li><a href="#collapse-nav-item-board" data-toggle="collapse">게시판
						관리</a>
					<ul class="nav navbar-nav-inner collapse"
						id="collapse-nav-item-board">
						<li><a href="#">1:1문의 관리</a></li>
						<li><a href="#">공지사항 관리</a></li>
						<li><a href="#">자주묻는 질문 관리</a></li>
					</ul></li>
				<li><a href="#collapse-nav-item-user" data-toggle="collapse">회원
						관리</a>
					<ul class="nav navbar-nav-inner collapse"
						id="collapse-nav-item-user">
						<li><a href="#">회원 정보</a></li>
						<li><a href="#">판매자 평</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
<!-- 로고, 상단 네비게이션 바 끝 -->