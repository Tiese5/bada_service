<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
<%@include file="/WEB-INF/inc/admin_head.jsp"%>
        <style type="text/css">
            /*전체 사이트 조정*/
            div.container{
                width: 500px;
                height: 300px;
                margin-top:110px; 
            }
            /*로고 크기 조정*/]
           div.logo{
            width: 100px;
            height: 100px;
           }
           /*로고 글씨 숨기기*/
           .logo>a>h1{
            text-indent: -10000px;
           }
            /*로고 위치조정*/
            a>img{
                margin-left: 150px;
        }
        /*로그인창 위치조정*/
        .control{
            margin-top: -50px;
        }   
        /*패스워드 아이디 날리기*/
        .hading{
            text-indent: -10000px;
       }
       /* 패스워드 아이디 위치 고정*/
       .hading{
        position: fixed;
       }

       .login {
        background-color: black;
       }
        .btn-coller{
        color: black;
        }
        .textcoller{
        color: #fff;
        }

        </style>
    </head>
    <body>
        <div class="container">
        <!--로고 태그 시작-->
            <div class="logo">
            <a href="#"><img src="${pageContext.request.contextPath }/assets/img/logo.png"><h1>로고</h1></a>
            </div>
            <!--로고 태그 끝-->
            <!--로그인폼 시작-->
            <form class="control form-horizontal" action="${pageContext.request.contextPath }/admin/admin_index_ok.do" method="post">
            <!--아이디 입력-->
                <div class="form-group">
                    <label for="inputEmail3" class=" col-sm-2 control-label ">
                   </label>
                    <div class="col-sm-10">
                    <p class="hading">아이디</p>
                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디">
                    </div>
                    
                </div>
                <!--아이디 END-->
                <!--비밀번호-->
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label ">
                    </label>
                    <div class="col-sm-10"> 
                    <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호">
                    </div>
                </div>
                <!--비밀번호 END-->
               <!--로그인 버튼-->
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="login btn btn-coller btn-block"><span class="textcoller">로그인</span></button>
                    </div>
                </div>
                <!--로그인 버튼END-->
            </form>
            <!--로그인폼 끝-->
        </div>
    </body>
</html>
