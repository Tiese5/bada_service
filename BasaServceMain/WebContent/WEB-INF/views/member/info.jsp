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
    <title>BaDa | 내 정보</title>

    <style media="screen" type="text/css">
        body {
            padding-top: 20px;
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
    
    <%@ include file="/WEB-INF/inc/head.jsp"%>
</head>

<body>

   <%@ include file="/WEB-INF/inc/topbar.jsp"%>

    <div class="container">

        <!-- Grid Row 시작 -->
        <div class="row">

           <%@ include file="/WEB-INF/inc/my_sidebar.jsp"%>

            <!-- 메인 컨텐츠 영역 시작 -->
            <div class="col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h2>내 정보</h2>
                </div>
                <form class="form-horizontal" id="myform">
                    <div class="form-group">
                        <label for="user_id" class="col-md-2">아이디</label>
                        <div class="col-md-8"><input type="text" name="user_id" id="user_id" class="form-control" disabled value="bada"></div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-md-2">이름</label>
                        <div class="col-md-8"><input type="text" name="name" id="name" class="form-control" disabled value="바다"></div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-md-2">이메일</label>
                        <div class="col-md-8"><input type="email" name="email" id="email" class="form-control" disabled value="bada@bada.com"></div>
                    </div>
                    <div class="form-group">
                        <label for="tel" class="col-md-2">연락처</label>
                        <div class="col-md-8"><input type="tel" name="tel" id="tel" class="form-control" disabled value="01067891234"></div>
                    </div>
                    <div class="form-group">
                        <label for="postcode" class="col-md-2">우편번호</label>
                        <div class="col-md-8 clearfix">
                            <input type="text" name="postcode" id="postcode" class="form-control pull-left" style="width: 120px; margin-right: 5px;" disabled value="12345">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addr1" class="col-md-2">주소</label>
                        <div class="col-md-8"><input type="text" name="addr1" id="addr1" class="form-control" disabled value="서울시 강남구 역삼동 123-12"></div>
                    </div>
                    <div class="form-group">
                        <label for="profile_img" class="col-md-2">프로필 사진</label>
                        <div class="col-md-8">
                            <img class="thumbnail" src="img/profile.png" alt="프로필 이미지" width="50px" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-8">
                            <button type="button" class="btn btn-warning" id="myinfo_update">수정하기</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->
        </div>
        <!-- Grid Row 끝 -->

        <%@ include file="/WEB-INF/inc/footer.jsp"%>
    </div>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#myinfo_update").click(function() {
                swal({
                    title: "정보 수정하기",
                    text: "내 정보를 수정하려면 비밀번호를 입력해야합니다.",
                    type: "input",
                    inputType : "password",
                    inputPlaceholder : "비밀번호를 입력해주세요.",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                },function(inputValue) {
                    if(inputValue === false) {
                        return false;
                    }
                    if(inputValue === ''){
                        swal.showInputError("비밀번호가 입력되지 않았습니다.");
                        return false;
                    }
                    setTimeout("location.href='mhj_info_update.html'", 3000);
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
