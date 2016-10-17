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
    <title>BaDa | 상품구매</title>

    <style media="screen" type="text/css">
        body {
            padding-top: 20px;
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

        .navbar-menu {
            border-top: 1px solid #fff;
        }

        .search-bar {
            width: 500px;
        }

        @media (max-width:767px) {
            #navbar .form-control {
                width: auto;
            }
        }

        @media (min-width:768px) and (max-width:991px) {
            #navbar .form-control {
                width: 300px !important;
            }
        }
        @media (min-width:992px) {
            #navbar .form-control {
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
        .table > tbody > tr > td {
            text-align: center;
            vertical-align: middle !important;
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
                <a class="navbar-brand" href="kjm_index.html">BaDa</a>
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

        <div class="page-header col-md-offset-1">
            <h1>상품구매</h1>
        </div>
        <div class="col-md-offset-1 row">
            <h4 class="col-md-2">구매상품 정보</h4>
            <div class="col-md-10 table-responsive">
                <table class="table table-hover">
                    <thead style="background-color : #eee;">
                        <tr>
                            <th class="text-center" width="20%">표지</th>
                            <th class="text-center" width="20%">책 제목</th>
                            <th class="text-center" width="20%">판매자</th>
                            <th class="text-center" width="20%">가격</th>
                            <th class="text-center" width="20%">구입일시</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="kjm_detail_infomation.html"><img src="img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">자바의 정석</a></td>
                            <td>바다</td>
                            <td><span class="text-danger">20,000</span> 원</td>
                            <td>2016.09.10 12:00:00</td>
                        </tr>
                        <tr>
                            <td><a href="kjm_detail_infomation.html"><img src="img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">자바의 정석</a></td>
                            <td>바다</td>
                            <td><span class="text-danger">20,000</span> 원</td>
                            <td>2016.09.10 12:00:00</td>
                        </tr>
                        <tr>
                            <td><a href="kjm_detail_infomation.html"><img src="img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">자바의 정석</a></td>
                            <td>바다</td>
                            <td><span class="text-danger">20,000</span> 원</td>
                            <td>2016.09.10 12:00:00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-offset-1 row">
            <h4 class="col-md-2">총 구매 금액</h4>
            <div class="col-md-10">
                <h4><span class="text-danger">60,000</span> 원</h4>
            </div>
        </div>
        <form class="form-horizontal" id="myform">
            <div class="row col-md-offset-1">
                <h4 class="col-md-2">배송지 주소</h4>
                <div class="col-md-10 form-group" style="margin-top:10px;">
                    <div class="col-md-8 clearfix" style="margin-bottom:15px;">
                        <label for="basic_ship" class="pull-right"><input type="checkbox" id="basic_ship" checked> 기본 주소 가져오기</label>
                        <input type="text" name="postcode" id="postcode" class="form-control pull-left" style="width: 120px; margin-right: 5px;" disabled value="12345">
                        <input type="button" value="우편번호 찾기" class="btn btn-warning" onclick='execDaumPostcode("postcode", "addr1", "addr2");'>
                    </div>
                    <div class="col-md-8" style="margin-bottom:15px;"><input type="text" name="addr1" id="addr1" class="form-control" disabled value="서울시 강남구 역삼동"></div>
                    <div class="col-md-8"><input type="text" name="addr2" id="addr2" class="form-control" value="123-12"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-5">
                    <button type="button" class="btn btn-primary btn-lg buy">구매하기</button>
                </div>
            </div>
        </form>

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
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="plugins/postcode/postcode.js"></script>
    <script src="plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(document.body).on('click', '.dropdown-menu li', function(event) {

            var $target = $(event.currentTarget);

            $target.closest('.input-group-btn').find('[data-bind="label"]').text($target.text()).end().children('.dropdown-toggle').dropdown('toggle');

            return false;
        });
        $(function(){
            $(".buy").click(function(){
                swal({
                    title: "구매성공",
                    confirmButtonClass: "btn-info",
                    confirmButtonText: "확인"
                },function(isConfirm){
               window.location="kjm_buylist.html";

                });
            });
        })
    </script>
</body>

</html>
