<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
        
        <script src="http://code.jquery.com/jquery.min.js"></script>
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>로그인</title>

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

        </style>
 	<%@ include file="/WEB-INF/inc/head.jsp"%>
    </head>
    <body>
        <div class="container">
        <!--로고 태그 시작-->
            <div class="logo">
            <a href="${pageContext.request.contextPath}/index.do"><img src="${pageContext.request.contextPath}/assets/img/logo.png"><h1>로고</h1></a>
            </div>
            <!--로고 태그 끝--> 
            <!--로그인폼 시작-->
            <form class="control form-horizontal" action="${pageContext.request.contextPath}/member/login_ok.do">
            <!--아이디 입력-->
                <div class="form-group">
                    <label for="inputEmail3" class=" col-sm-2 control-label ">
                   </label>
                    <div class="col-sm-10">
                    <p class="hading">Id</p>
                        <input type="text" name="user_id" class="form-control" id="id" placeholder="id">
                    </div>
                    
                </div>
                <!--아이디 END-->
                <!--비밀번호-->
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label ">
                    </label>
                    <div class="col-sm-10"> 
                    <input type="password" name="user_pw" class="form-control" id="user_pw" placeholder="Password"> <p class="hading">Password</p>
                    </div>
                </div>
                <!--비밀번호 END-->
               <!--로그인 버튼-->
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="login btn btn-primary btn-block">로그인</button>
                    </div>
                </div>
                <!--로그인 버튼END-->
            </form>
            <div style="margin-left: 400px;">
            <a href="${pageContext.request.contextPath}/member/id.do">ID/</a><span></span><a href="${pageContext.request.contextPath}/member/pw.do">PW찾기</a>
            </div>

            <!--로그인폼 끝-->
        </div>
    </body>
</html>
