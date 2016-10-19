<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BaDa</title>
        <style media="screen" type="text/css">
        body {
        padding-top: 50px;
        }
        .side-menu {
        position: fixed;
        margin-top: 30px;
        }
        .list-title {
        margin-top: 40px;
        }
        .dropdown-btn {
        width: 110px !important;
        }
        .dropdown-toggle .caret {
        position: absolute;
        right: 10px;
        top: calc(50% - 2px);
        }
        .side-menu .nav-side-menu>li>a:focus,
        .side-menu .nav-side-menu>li>a:hover {
        color: #fff;
        background: #2372b5;
        }
        .navbar-menu {
        border-top: 1px solid #fff;
        }
        .side-menu .nav-side-menu>.active>a,
        .side-menu .nav-side-menu>.active>a:focus,
        .side-menu .nav-side-menu>.active>a:hover {
        color: #fff;
        background: #2372b5;
        }
        .search-bar {
        width: 500px;
        }
        @media (max-width:767px) {
        .side-menu {
        display: none;
        }
        .form-control {
        width: auto;
        }
        }
        @media (min-width:768px) and (max-width:991px) {
        .form-control {
        width: 300px !important;
        }
        }
        @media (min-width:992px) {
        .form-control {
        width: 400px !important;
        }
        }
        @media (min-width:768px) {
        .navbar-nav {
        display: none;
        }
        }
        /*상단바 시작*/
        .navbar-topbar {
        background-color: #428bca;
        border-color: #2372b5;
        }
        .navbar-topbar .navbar-brand {
        color: #cdddeb;
        }
        .navbar-topbar .navbar-brand:focus,
        .navbar-topbar .navbar-brand:hover {
        color: #fff;
        background-color: transparent;
        }
        .navbar-topbar .navbar-text {
        color: #cdddeb;
        }
        .navbar-topbar .navbar-nav>li>a {
        color: #cdddeb;
        }
        .navbar-topbar .navbar-nav>li>a:focus,
        .navbar-topbar .navbar-nav>li>a:hover {
        color: #fff;
        background-color: #2372b5;
        }
        .navbar-topbar .navbar-nav>.active>a,
        .navbar-topbar .navbar-nav>.active>a:focus,
        .navbar-topbar .navbar-nav>.active>a:hover {
        color: #fff;
        background-color: #2372b5;
        }
        .navbar-topbar .navbar-nav>.disabled>a,
        .navbar-topbar .navbar-nav>.disabled>a:focus,
        .navbar-topbar .navbar-nav>.disabled>a:hover {
        color: #ddd;
        background-color: transparent;
        }
        .navbar-topbar .navbar-toggle {
        border-color: #fff;
        }
        .navbar-topbar .navbar-toggle:focus,
        .navbar-topbar .navbar-toggle:hover {
        background-color: #2372b5;
        }
        .navbar-topbar .navbar-toggle .icon-bar {
        background-color: #fff;
        }
        .navbar-topbar .navbar-collapse,
        .navbar-topbar .navbar-form {
        border-color: #fff;
        }
        .navbar-topbar .navbar-nav>.open>a,
        .navbar-topbar .navbar-nav>.open>a:focus,
        .navbar-topbar .navbar-nav>.open>a:hover {
        color: #fff;
        background-color: #2372b5;
        ;
        }
        @media (max-width:767px) {
        .navbar-topbar .navbar-nav .open .dropdown-menu>li>a {
        color: #cdddeb;
        }
        .navbar-topbar .navbar-nav .open .dropdown-menu>li>a:focus,
        .navbar-topbar .navbar-nav .open .dropdown-menu>li>a:hover {
        color: #fff;
        background-color: transparent;
        }
        .navbar-topbar .navbar-nav .open .dropdown-menu>.active>a,
        .navbar-topbar .navbar-nav .open .dropdown-menu>.active>a:focus,
        .navbar-topbar .navbar-nav .open .dropdown-menu>.active>a:hover {
        color: #555;
        background-color: #e7e7e7
        }
        .navbar-topbar .navbar-nav .open .dropdown-menu>.disabled>a,
        .navbar-topbar .navbar-nav .open .dropdown-menu>.disabled>a:focus,
        .navbar-topbar .navbar-nav .open .dropdown-menu>.disabled>a:hover {
        color: #ddd;
        background-color: transparent;
        }
        }
       /*상단 카테고리*/
        .main-content ul>li{
        list-style: none;
        display: inline;
        padding-right: 7%;
        text-align: center;
        }
        /*상단 카테고리 위치*/
        .category{
        padding-top: 70px;
        margin-left: 30px;
        }
        /*상단 카테고리*/
        .main-content ul>li a{
        text-decoration: none;
        font-weight: bold;
        font-size: 20px;
        }
        /*상단 메인 태그*/
        .textps{
        padding-left: 50px;
        padding-top: 50px;
        }
        /*드롭다운 넓이*/
        .btwidth{
        width: 100px;
        }
        /*사진 크기*/
        .img{
        width: 100px;
        height: 100px;

        }
        /*메인 위치*/
        .main{
        display: inline-block;
        padding-left: 100px;

        }
        /*책마다 효과*/
        .mainps{
        height: 250px;
        padding-top: 30px;
        box-shadow: 2px 2px 5px rgba(135,139,144,0.7);
        }
        .main-body h4,p{
            font-weight: bold;
        }
        /*페이저 위치*/
        .pageps{
            margin-left: 50%;
        /*드롭다운 위치조정*/
        }
        .dropps{
            margin-top: -30px;
        }
         .main-body>h4 a{
            text-decoration: none;
        }
        /*상단바 끝*/
        </style>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- 로고, 상단 네비게이션 바 -->
        <nav class="navbar navbar-topbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">메뉴 열기</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">BaDa</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <form class="navbar-form navbar-left" action="lmg_suchpage.html">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle dropdown-btn" data-toggle="dropdown"><span data-bind="label">전체</span>&nbsp;<span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="lmg_suchpage.html">전체</a></li>
                                        <li><a href="lmg_suchpage.html">학문</a></li>
                                        <li><a href="lmg_suchpage.html">소설</a></li>
                                        <li><a href="lmg_suchpage.html">자기계발</a></li>
                                        <li><a href="lmg_suchpage.html">정기 간행물</a></li>
                                        <li><a href="lmg_suchpage.html">어린이 도서</a></li>
                                    </ul>
                                </div>
                                <!-- /btn-group -->
                                <input type="text" class="form-control" placeholder="검색 할 도서명을 입력해주세요.">
                            </div>
                            <!-- /input-group -->
                        </div>
                    </form>
                    <div class="btn-group navbar-right">
                    <a href="lmg_login.html" class="btn btn-warning navbar-btn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a>
                    <a href="mhj_join.html" class="btn btn-info navbar-btn"><span class="glyphicon glyphicon-user"></span> 회원가입</a>
                    </div>
                    <!-- 모바일에서 보여질 메뉴 시작 -->
                    <ul class="nav navbar-nav navbar-right navbar-menu">
                        <li><a href="lmg_suchpage.html">학문</a></li>
                        <li><a href="lmg_suchpage.html">소설</a></li>
                        <li><a href="lmg_suchpage.html">자기계발</a></li>
                        <li><a href="lmg_suchpage.html">정기 간행물</a></li>
                        <li><a href="lmg_suchpage.html">어린이 도서</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right navbar-menu">
                        <li><a href="khk.notice.html">공지사항</a></li>
                        <li><a href="hyj_many_question(service).html">자주묻는 질문</a></li>
                        <li><a href="lmg_q&a.html">1:1 문의</a></li>
                    </ul>
                    <!-- 모바일에서 보여질 메뉴 끝 -->
                </div>
            </div>
        </nav>
        <!-- 로고, 상단 네비게이션 바 끝 -->
        <div class="container">
            <!-- Grid Row 시작 -->
            <div class="row">
                <!-- 좌측 사이드 네비게이션 바 -->
                <div class="col-sm-3 col-md-2 side-menu">
                    <h5 class="list-title text-info"> - 카테고리</h5>
                    <ul class="nav nav-side-menu">
                        <li><a href="lmg_suchpage.html">학문</a></li>
                        <li><a href="lmg_suchpage.html">소설</a></li>
                        <li><a href="lmg_suchpage.html">자기계발</a></li>
                        <li><a href="lmg_suchpage.html">정기 간행물</a></li>
                        <li><a href="lmg_suchpage.html">어린이 도서</a></li>
                    </ul>
                    <h5 class="list-title text-info"> - 사이트 관련</h5>
                    <ul class="nav nav-side-menu">
                        <li><a href="khk.notice.html">공지사항</a></li>
                        <li><a href="hyj_many_question(service).html">자주묻는 질문</a></li>
                        <li><a href="lmg_q&a.html">1:1 문의</a></li>
                    </ul>
                </div>
                <!-- 좌측 사이드 네비게이션 바 끝 -->
                <!-- 상단 컨텐츠 영역 시작 -->
                <div class="col-md-10 col-sm-9 main-content">
                    <div class="category col-md-12 hidden-sm hidden-xs ">
                        <ul>
                            <li><a href="lmg_suchpage.html">전체</a></li>
                            <li><a href="lmg_suchpage.html">학문</a></li>
                            <li><a href="lmg_suchpage.html">소설</a></li>
                            <li><a href="lmg_suchpage.html">자기계발</a></li>
                            <li><a href="lmg_suchpage.html">매거진</a></li>
                            <li><a href="lmg_suchpage.html">어린이 도서</a></li>
                        </ul>
                    </div>
                    <div>
                        <h4 class="textps">검색결과100건</h4>
                    </div>
                    <div class="dropps pull-right">
                    <select name="telecom" id="telecom">
                        <option value="new">최신순</option>
                        <option value="top">인기순</option>
                        <option value="row">낮은 가격순</option>
                        <option value="range">가나다순</option>   
                    </select>
                    </div>
                    <hr/>
                <!-- 상단 컨텐츠 영역 끝 -->
                <!--메인컨텐츠 시작-->
                <!--항목1-->
                    <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                    <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                     <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                     <div class="mainps col-sm-4 col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                     <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                      <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    </div>
                
                <!--페이저-->
                    <nav class="pageps">
                        <ul class="pagination">
                           <li>
                           <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            </a>
                            </li>
                            <li><a href="#">1</a>
                            </li>
                            <li><a href="#">2</a>
                            </li>
                            <li><a href="#">3</a>
                            </li>
                            <li><a href="#">4</a>
                            </li>
                            <li><a href="#">5</a>
                            </li>
                            <li><a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </ul>
                    </nav>
                
          </div>
    
        
  
    <!-- Grid Row 끝 -->
    <!-- Footer 영역 시작 -->
    <hr>
    <footer>
        <address>
            Copyright&copy; 2016 <strong class="text-primary">BaDa</strong> All rights reserved.
        </address>
    </footer>
    <!-- Footer 영역 끝 -->
        </div>
          </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document.body).on('click', '.dropdown-menu li', function(event) {
var $target = $(event.currentTarget);
$target.closest('.input-group-btn').find('[data-bind="label"]').text($target.text()).end().children('.dropdown-toggle').dropdown('toggle');
return false;
});
</script>
</body>
</html>