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
    <title>쪽지 확인</title>

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

        .from_people {
            text-align: right;
        }

        .message_content {
            text-align: right;
        }

        .mar {
            margin-left: 420px;
        }

        .pad {
            padding-bottom: 15px;
        }


        /*상단바 끝*/
    </style>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="plugins/sweetalert/sweetalert.css">

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

                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle dropdown-btn" data-toggle="dropdown"><span data-bind="label">전체</span>&nbsp;<span class="caret"></span></button>
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
                            <input type="text" class="form-control" placeholder="검색 할 도서명을 입력해주세요.">
                        </div>
                        <!-- /input-group -->
                    </div>
                </form>
                <div class="btn-group navbar-right">
                    <button class="btn btn-warning navbar-btn"><span class="glyphicon glyphicon-log-in"></span> 로그인</button>
                    <button class="btn btn-info navbar-btn"><span class="glyphicon glyphicon-user"></span> 회원가입</button>
                </div>

                <!-- 모바일에서 보여질 메뉴 시작 -->
                <ul class="nav navbar-nav navbar-right navbar-menu">
                    <li><a href="#">내정보</a></li>
                    <li><a href="#">정보수정</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">주문/배송 조회</a></li>
                    <li><a href="#">구매내역</a></li>
                    <li><a href="#">쪽지 쓰기</a></li>
                    <li><a href="#">보낸 쪽지함</a></li>
                    <li><a href="#">받은 쪽지함</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-menu">
                    <li><a href="#">회원에게 판매</a></li>
                    <li><a href="#">바다에 판매</a></li>
                    <li><a href="#">판매내역</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-menu">
                    <li><a href="#">1:1 문의</a></li>
                    <li><a href="#">탈퇴하기</a></li>
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
                <ul class="nav nav-side-menu list-title">
                    <li><a href="#">내정보</a></li>
                    <li><a href="#">정보수정</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">주문/배송 조회</a></li>
                    <li><a href="#">구매내역</a></li>
                    <li><a href="#">쪽지 쓰기</a></li>
                    <li><a href="#">보낸 쪽지함</a></li>
                    <li><a href="#">받은 쪽지함</a></li>
                </ul>
                <ul class="nav nav-side-menu list-title">
                    <li><a href="#">회원에게 판매</a></li>
                    <li><a href="#">바다에 판매</a></li>
                    <li><a href="#">판매내역</a></li>
                </ul>
                <ul class="nav nav-side-menu list-title">
                    <li><a href="#">1:1 문의</a></li>
                    <li><a href="#">탈퇴하기</a></li>
                </ul>
            </div>
            <!-- 좌측 사이드 네비게이션 바 끝 -->

            <!-- 메인 컨텐츠 영역 시작 -->
            <div class="col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h1>쪽지 확인</h1>
                </div>
                <br />
                <form class="form-horizontal" id="myform">
                    <div class="form-group">
                        <label for="send_people" class="col-md-1">보낸이:</label>
                        <div class="col-md-11">
                        <span> 아아 </span>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="subject" class="col-md-1">제목:</label>
                        <div class="col-md-11">
                        <span> 아아 </span>
                        </div>
                    </div>
                    <div class="page-header">
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <p>
                                중고책을 사고 싶어요
                                이메일은 tiese@naver.com입니다.
                                연락주세요.
                            </p>
                        </div>

                        <div class="pad col-md-12">
                            <br />
                            <textarea name="response" id="response" cols="80" rows="5"></textarea>
                        </div>
                        <div class="mar col-md-7">
                            <button class="btn btn-primary">답변달기</button>
                            <button class="btn btn-danger">삭제하기</button>
                        </div>

                    </div>
                </form>
               
              

            </div>
            <!-- 메인 컨텐츠 영역 끝 -->

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


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="plugins/sweetalert/sweetalert.min.js"></script>
    
    <script type="text/javascript">
         $(function() {
                $("#message_send").click(function() {
                    swal({
                        title: "작성완료",
                        text: "이대로 작성하시겠습니까?",
                        showCancelButton: true,
                        closeOnConfirm: false,
                        showLoaderOnConfirm: true
                    },function() {
                        setTimeout(function(){
                            swal("작성되었습니다.");
                        }, 1000);
                    });
                });
            });
        $(document.body).on('click', '.dropdown-menu li', function(event) {

            var $target = $(event.currentTarget);

            $target.closest('.input-group-btn').find('[data-bind="label"]').text($target.text()).end().children('.dropdown-toggle').dropdown('toggle');

            return false;

        });
    </script>

</body>

</html>
