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
    <title>BaDa Admin | 회원관리</title>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

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
        @media (min-width: 768px) {
            .sidebar {
                position: fixed;
                top: 51px;
                bottom: 0;
                left: 0;
                z-index: 1000;
                display: block;
                padding: 20px;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
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
        .nav-sidebar > li > a {
          padding-right: 20px;
          padding-left: 20px;
        }
        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
          color: #fff;
          background-color: #428bca;
        }
        /* Sidebar-inner navigation */
        .nav-sidebar-inner {
          margin-right: -21px; /* 20px padding + 1px border */
          margin-left: -20px;
        }
        .nav-sidebar-inner > li > a {
          padding-right: 50px;
          padding-left: 20px;
          text-align: right;
          color: #0e348b !important;
        }
        .nav-sidebar-inner > li:first-child {
            border-top: 1px solid #eee;
        }
        .nav-sidebar-inner > li:last-child {
            border-bottom: 1px solid #eee;
        }
        .nav-sidebar-inner > .active > a,
        .nav-sidebar-inner > .active > a:hover,
        .nav-sidebar-inner > .active > a:focus {
          color: #fff;
          background-color: #428bca;
        }

        .navbar-nav-inner > li > a {
          padding-right: 50px;
          padding-left: 20px;
          text-align: right;
          color: #888 !important;
        }
        .navbar-nav-inner > li:first-child {
            border-top: 1px solid #eee;
        }
        .navbar-nav-inner > li:last-child {
            border-bottom: 1px solid #eee;
        }
        .navbar-nav-inner > .active > a,
        .navbar-nav-inner > .active > a:hover,
        .navbar-nav-inner > .active > a:focus {
          color: #fff;
          background-color: #428bca;
        }
        
        .pos{
        margin-left: 170px;
        margin-top: 80px;
        }
        td, th {
            border-right: 1px solid #ccc;
        }
        td:last-child, th:last-child {
            border: 0;
        }
        .table > tbody > tr > td {
            text-align: center;
            vertical-align: middle !important;
        }

        .bor {
            border: 1px;
        }
        
        .mar {
            margin-top: 20px;
        }
   




    </style>

</head>

<body>

    <!-- 로고, 상단 네비게이션 바 -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">메뉴 열기</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
                <a class="navbar-brand" href="#">BaDa <span class="small">ADMIN</span></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">대시보드</a></li>
                    <li><a href="#collapse-nav-item-shop" data-toggle="collapse">쇼핑몰 관리</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-shop">
                            <li><a href="#">회원주문내역</a></li>
                            <li><a href="#">거래내역</a></li>
                            <li><a href="#">상품등록(바다)</a></li>
                            <li><a href="#">승인요청관리</a></li>
                        </ul>
                    </li>
                    <li><a href="#collapse-nav-item-board" data-toggle="collapse">게시판 관리</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-board">
                            <li><a href="#">1:1문의 관리</a></li>
                            <li><a href="#">공지사항 관리</a></li>
                            <li><a href="#">자주묻는 질문 관리</a></li>
                        </ul>
                    </li>
                    <li><a href="#collapse-nav-item-user" data-toggle="collapse">회원 관리</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-user">
                            <li><a href="#">회원 정보</a></li>
                            <li><a href="#">판매자 평</a></li>
                        </ul>
                    </li>
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
                <li><a href="${pageContext.request.contextPath}/admin/member/chart.do">대시보드</a></li>
                <li><a href="#collapse-item-shop" data-toggle="collapse">쇼핑몰 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-shop">
                        <li><a href="#">회원주문내역</a></li>
                        <li><a href="#">거래내역</a></li>
                        <li><a href="#">상품등록(바다)</a></li>
                        <li><a href="#">승인요청관리</a></li>
                    </ul>
                </li>
                <li><a href="#collapse-item-board" data-toggle="collapse">게시판 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-board">
                        <li><a href="#">1:1문의 관리</a></li>
                        <li><a href="#">공지사항 관리</a></li>
                        <li><a href="#">자주묻는 질문 관리</a></li>
                    </ul>
                </li>
                <li class="active"><a href="#collapse-item-user" data-toggle="collapse">회원 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-user">
                        <li><a href="${pageContext.request.contextPath}/admin/member/user_manage.do">회원 정보</a></li>
                        <li><a href="#">판매자 평</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- 사이트 네비게이션 바 끝 -->

<div class="row pos">
	<h1 class="page-header">수정하기</h1>
	
	
	
	<form class="form-horizontal" id="myform" method="post" name="myform" 
					action="${pageContext.request.contextPath}/admin/member/member_edit_ok.do">
			
					<input type="hidden" name="id" id="id" value="${view.id}" />
					<input type="hidden" name="join_date" id="join_date" value="${view.join_date}" />
				
					
					<div class="form-group">
						<label for="user_id" class="col-md-2 col-md-2">아이디</label>
						<div class="col-md-8">
							<input type="text" name="user_id" id="user_id"
								class="form-control" readonly value="${view.user_id}">
						</div>
					</div>
					<div class="form-group">
						<label for="postcode" class="col-md-2 col-md-2">우편번호*</label>
						<div class="col-md-8 clearfix">
							<input type="text" name="postcode" id="postcode"
								class="form-control pull-left" readonly
								style="width: 120px; margin-right: 5px;"
								value="${view.postcode}"> <input type="button"
								value="우편번호 찾기" class="btn btn-warning"
								onclick='execDaumPostcode("postcode", "addr1", "addr2");'>
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-md-2 col-md-2">주소*</label>
						<div class="col-md-8">
							<input type="text" name="addr1" id="addr1" class="form-control"
								value="${view.addr1}">
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2 col-md-2">상세주소*</label>
						<div class="col-md-8">
							<input type="text" name="addr2" id="addr2" class="form-control"
								value="${view.addr2}">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2 col-md-2">이름*</label>
						<div class="col-md-8">
							<input type="text" name="name" id="name" class="form-control"
								value="${view.name}">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2 col-md-2">이메일*</label>
						<div class="col-md-8">
							<input type="email" name="email" id="email" class="form-control"
								value="${view.email}">
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2 col-md-2">연락처*</label>
						<div class="col-md-8">
							<input type="tel" name="tel" id="tel" class="form-control"
								value="${view.tel}">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2">생년월일*</label>
						<div class="col-md-8">
							<input type="text" name="birthdate" id="birthdate"
								class="form-control" readonly value="${view.birthdate}">
						</div>
					</div>
				
					<div class="form-group">
						<div class="col-md-offset-2 col-md-8">
							<button type="submit" class="btn btn-primary">작성완료</button>
							<a href="${pageContext.request.contextPath}/admin/member/user_manage.do" class="btn btn-success">목록</a>
							
		
						</div>
					</div>
				</form>
	
		
		
	</div>
	</div>