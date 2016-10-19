<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 로고, 상단 네비게이션 바 -->
<nav class="navbar navbar-topbar navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">메뉴 열기</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">BaDa</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">

			<form class="navbar-form navbar-left">
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-btn">
							<button type="button"
								class="btn btn-default dropdown-toggle dropdown-btn"
								data-toggle="dropdown">
								<span data-bind="label">전체</span>&nbsp;<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">전체</a></li>
								<li><a href="#">학문</a></li>
								<li><a href="#">소설</a></li>
								<li><a href="#">자기계발</a></li>
								<li><a href="#">정기 간행물</a></li>
								<li><a href="#">어린이 도서</a></li>
							</ul>
						</div>
						<!-- /btn-group -->
						<input type="text" class="form-control"
							placeholder="검색 할 도서명을 입력해주세요.">
					</div>
					<!-- /input-group -->
				</div>
			</form>
			<div class="btn-group navbar-right">
				<button class="btn btn-warning navbar-btn">
					<span class="glyphicon glyphicon-log-in"></span> 로그인
				</button>
				<button class="btn btn-info navbar-btn">
					<span class="glyphicon glyphicon-user"></span> 회원가입
				</button>
			</div>

			<!-- 모바일에서 보여질 메뉴 시작 -->
			<ul class="nav navbar-nav navbar-right navbar-menu">
				<li class="active"><a href="#">학문</a></li>
				<li><a href="#">소설</a></li>
				<li><a href="#">자기계발</a></li>
				<li><a href="#">정기 간행물</a></li>
				<li><a href="#">어린이 도서</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right navbar-menu">
				<li><a href="#">공지사항</a></li>
				<li><a href="#">자주묻는 질문</a></li>
				<li><a href="#">1:1 문의</a></li>
			</ul>
			<!-- 모바일에서 보여질 메뉴 끝 -->
		</div>
	</div>
</nav>
<!-- 로고, 상단 네비게이션 바 끝 -->