<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BaDa Admin</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style media="screen" type="text/css">
/* Hide for mobile, show later */
.sidebar {
	display: none;
}

.main-content {
	margin-top: 70px;
}

@media ( min-width : 768px) {
	.sidebar {
		position: fixed;
		top: 51px;
		bottom: 0;
		left: 0;
		z-index: 1000;
		display: block;
		padding: 20px;
		overflow-x: hidden;
		overflow-y: auto;
		/* Scrollable contents if viewport is shorter than content. */
		background-color: #f5f5f5;
		border-right: 1px solid #eee;
	}
	.navbar-nav {
		display: none;
	}
}
/* Sidebar navigation */
.nav-sidebar {
	margin-right: -21px; /* 20px padding + 1px border */
	margin-bottom: 20px;
	margin-left: -20px;
}

.nav-sidebar>li>a {
	padding-right: 20px;
	padding-left: 20px;
}

.nav-sidebar>.active>a, .nav-sidebar>.active>a:hover, .nav-sidebar>.active>a:focus
	{
	color: #fff;
	background-color: #428bca;
}
/* Sidebar-inner navigation */
.nav-sidebar-inner {
	margin-right: -21px; /* 20px padding + 1px border */
	margin-left: -20px;
}

.nav-sidebar-inner>li>a {
	padding-right: 50px;
	padding-left: 20px;
	text-align: right;
	color: #0e348b;
}

.nav-sidebar-inner>li:first-child {
	border-top: 1px solid #eee;
}

.nav-sidebar-inner>li:last-child {
	border-bottom: 1px solid #eee;
}

.nav-sidebar-inner>.active>a, .nav-sidebar-inner>.active>a:hover,
	.nav-sidebar-inner>.active>a:focus {
	color: #fff;
	background-color: #428bca;
}

.navbar-nav-inner>li>a {
	padding-right: 50px;
	padding-left: 20px;
	text-align: right;
	color: #888;
}

.navbar-nav-inner>li:first-child {
	border-top: 1px solid #eee;
}

.navbar-nav-inner>li:last-child {
	border-bottom: 1px solid #eee;
}

.navbar-nav-inner>.active>a, .navbar-nav-inner>.active>a:hover,
	.navbar-nav-inner>.active>a:focus {
	color: #fff;
	background-color: #999;
}
</style>

</head>

<body>

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

	<!-- 컨테이너 영역 -->
	<div class="container">
		<!-- 사이드 네비게이션 바 -->
		<div class="col-sm-2 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active"><a href="#">대시보드</a></li>
				<li><a href="#collapse-item-shop" data-toggle="collapse">쇼핑몰
						관리</a>
					<ul class="nav nav-sidebar-inner collapse" id="collapse-item-shop">
						<li><a href="#">회원주문내역</a></li>
						<li><a href="#">거래내역</a></li>
						<li><a href="#">상품등록(바다)</a></li>
						<li><a href="#">승인요청관리</a></li>
						<li><a href="#">주문/입금/베송관리</a></li>
					</ul></li>
				<li><a href="#collapse-item-board" data-toggle="collapse">게시판
						관리</a>
					<ul class="nav nav-sidebar-inner collapse" id="collapse-item-board">
						<li><a href="#">1:1문의 관리</a></li>
						<li><a href="#">공지사항 관리</a></li>
						<li><a href="#">자주묻는 질문 관리</a></li>
					</ul></li>
				<li><a href="#collapse-item-user" data-toggle="collapse">회원
						관리</a>
					<ul class="nav nav-sidebar-inner collapse" id="collapse-item-user">
						<li><a href="#">회원 정보</a></li>
						<li><a href="#">판매자 평</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- 사이트 네비게이션 바 끝 -->
		<div class="row">
			<!-- 메인 컨텐츠 영역 -->
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-offset-2 col-md-offset-2 main-content">
				<div class="page-header">
					<h1 class="nametext1 ">1:1문의 답변</h1>
				</div>
				<form class="form-horizontal" id="myform">
					<div class="form-group">
						<label for="send_people" class="col-md-2">작성자:</label>
						<div class="col-md-10">
							<span> 아아 </span>
						</div>
					</div>
					<div class="form-group col-md-2">
						<label for="subject" class="col-md-1">제목:</label>
						<div class="com-md-10">
							<span> 아아 </span>
						</div>
					</div>

					<div class="form-group clearfix col-md-2 ">
						<label for="send_people">내용:</label>
						<div class="com-md-10">
							<span> 아아 </span>
						</div>
					</div>
					<hr />
				</form>
			</div>
			<!--수정내용-->
			<div class="form-group none">
				<label for="text" class="col-md-1 col-md-offset-1"> </label>
				<div class="col-md-6">
					<textarea class="form-control " rows="3">
					<!-- ${ } -->
                        </textarea>
					<div class="btnpadding">
						<button type="submit" id="com1" class="btn btn-info">수정완료
						</button>
						<button type="submit" id="com2" class="btn btn-danger">삭제하기
						</button>
					</div>
				</div>
			</div>
		</div>

		<!--수정내용 끝-->
	</div>
	<!-- 컨테이너 끝 -->


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
