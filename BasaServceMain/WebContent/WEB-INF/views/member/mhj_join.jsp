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
    <title>BaDa | 회원가입</title>

    <style media="screen" type="text/css">
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
                    <a href="lmg_login.html" class="btn btn-warning navbar-btn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a>
                    <a href="mhj_join.html" class="btn btn-info navbar-btn"><span class="glyphicon glyphicon-user"></span> 회원가입</a>
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

    <div class="container">

        <div class="page-header col-md-offset-2 clearfix">
            <h1>회원가입</h1>
        </div>
        <p class="col-md-offset-4 text-warning">*은 필수 입력입니다.</p>
        <form class="form-horizontal" id="myform" action="kjm_index.html">
            <div class="form-group">
                <label for="user_id" class="col-md-offset-2 col-md-2">아이디*</label>
                <div class="col-md-8"><input type="text" name="user_id" id="user_id" class="form-control"></div>
            </div>
            <div class="form-group">
                <label for="user_pw" class="col-md-offset-2 col-md-2">비밀번호*</label>
                <div class="col-md-8"><input type="password" name="user_pw" id="user_pw" class="form-control"></div>
            </div>
            <div class="form-group">
                <label for="user_pw_re" class="col-md-offset-2 col-md-2">비밀번호 확인*</label>
                <div class="col-md-8"><input type="password" name="user_pw_re" id="user_pw_re" class="form-control"></div>
            </div>
            <div class="form-group">
                <label for="postcode" class="col-md-offset-2 col-md-2">우편번호*</label>
                <div class="col-md-8 clearfix">
                    <input type="text" name="postcode" id="postcode" class="form-control pull-left" style="width: 120px; margin-right: 5px;" disabled>
                    <input type="button" value="우편번호 찾기" class="btn btn-warning" onclick='execDaumPostcode("postcode", "addr1", "addr2");'>
                </div>
            </div>
            <div class="form-group">
                <label for="addr1" class="col-md-offset-2 col-md-2">주소*</label>
                <div class="col-md-8"><input type="text" name="addr1" id="addr1" class="form-control" disabled></div>
            </div>
            <div class="form-group">
                <label for="addr2" class="col-md-offset-2 col-md-2">상세주소*</label>
                <div class="col-md-8"><input type="text" name="addr2" id="addr2" class="form-control"></div>
            </div>
            <div class="form-group">
                <label for="name" class="col-md-offset-2 col-md-2">이름*</label>
                <div class="col-md-8"><input type="text" name="name" id="name" class="form-control"></div>
            </div>
            <div class="form-group">
                <label for="email" class="col-md-offset-2 col-md-2">이메일*</label>
                <div class="col-md-8"><input type="email" name="email" id="email" class="form-control"></div>
            </div>
            <div class="form-group">
                <label for="tel" class="col-md-offset-2 col-md-2">연락처*</label>
                <div class="col-md-8"><input type="tel" name="tel" id="tel" class="form-control"></div>
            </div>
            <div class="form-group">
                <label for="profile_img" class="col-md-offset-2 col-md-2">프로필 사진</label>
                <div class="col-md-8">
                    <img class="thumbnail" src="img/profile.png" alt="프로필 이미지" width="50px" />
                    <input type="file" name="profile_img" id="profile_img" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-4 col-md-8">
                    <button type="submit" class="btn btn-primary">가입하기</button>
                    <button type="reset" class="btn btn-danger">다시작성</button>
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
    <script src="plugins/validate/jquery.validate.min.js"></script>
    <script src="plugins/validate/additional-methods.min.js"></script>
    <script src="plugins/validate/localization/messages_ko.min.js"></script>
    <script src="plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function() {
            // 플러그인의 기본 설정 옵션 추가
            jQuery.validator.setDefaults({
                onkeyup : false,
                onclick : false,
                onfocusout : false,
                showErrors : function(errorMap, errorList){
                    if(this.numberOfInvalids()) {
                        swal({
                            title : "에러",
                            text : errorList[0].message,
                            type : "error"
                        }, function() {
                            setTimeout(function() {
                                $(errorList[0].element).focus();
                            },100);
                        });
                    }
                }
            });

            $.validator.addMethod( "kor", function( value, element ) {
            	return this.optional( element ) || /^[ㄱ-ㅎ가-힣]*$/i.test( value );
            });

            $.validator.addMethod( "phone", function( value, element ) {
            	return this.optional( element ) || /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test( value ) || /^\d{2,3}\d{3,4}\d{4}$/i.test( value );
            });

            $("#myform").validate({
                //입력검사 규칙
                rules : {
                    user_id : {
                        required :true,
                        alphanumeric : true
                    },
                    user_pw : {
                        required : true,
                        minlength : 4,
                        maxlength : 20
                    },
                    user_pw_re : {
                        required : true,
                        equalTo : "#user_pw"
                    },
                    name : {
                        required : true,
                        kor : true
                    },
                    email : {
                        required : true,
                        email : true
                    },
                    tel : {
                        required :true,
                        phone : true
                    },
                    birthdate : {
                        required : true,
                        date : true
                    },
                    gender : "required",
                    profile_img :{
                        extension : "jpg|gif|png"
                    }
                },
                //규칙이 맞지 않을 경우 표시 할 메시지
                messages : {
                    user_id : {
                        required :"아이디를 입력하세요.",
                        alphanumeric : "아이디는 영문과 숫자만 입력가능합니다."
                    },
                    user_pw : {
                        required : "비밀번호를 입력하세요.",
                        minlength : "비밀번호는 4글자 이상 입력하셔야 합니다.",
                        maxlength : "비밀번호는 20자를 넘을 수 없습니다."
                    },
                    user_pw_re : {
                        required : "비밀번호 확인값을 입력하세요.",
                        equalTo : "비밀번호 확인이 잘못되었습니다."
                    },
                    name : {
                        required : "이름을 입력하세요.",
                        kor : "한글만 입력하세요."
                    },
                    email : {
                        required : "이메일을 입력하세요.",
                        email : "이메일 형식이 잘못되었습니다."
                    },
                    tel : {
                        required : "전화번호를 입력하세요.",
                        phone : "전화번호 형식이 잘못되었습니다."
                    },
                    birthdate : {
                        required : "생년월일을 입력하세요.",
                        date : "생년월일 형식이 잘못되었습니다."
                    },
                    gender : "성별을 선택하세요.",
                    profile_img :{
                        extension : "프로필 사진은 jpg, png, gif 형식만 업로드 가능합니다."
                    }
                }
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
