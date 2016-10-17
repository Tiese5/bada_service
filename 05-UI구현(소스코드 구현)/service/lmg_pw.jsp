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
        <title>아이디 찾기</title>
        <style type="text/css">
        /*전체 사이트 조정*/
        div.container{
        width: 400px;
        height: 500px;
        margin-top:110px;
        background: #efe;
        }
        /*로고 크기 조정*/]
        div.logo{
        width: 100px;
        height: 100px;
        }
        /*로고 글씨 숨기기*/
        .logo>a>h6{
        text-indent: -10000px;
        }
        /*로고 위치 크기조정*/
        a>img{
        margin-left: 100px;
        margin-bottom: -25px;
        width: 180px;
        height: 90px;
        }
        .title>h1{
        font-weight: bold;
        color: #6bb2ff;
        margin: 50px 0 -50px 400px;
        }
        /*이메일텍스트 위치조정*/
        .container>h3{
        font-weight: bold;
        margin-left: 25px;
        }
        /*이메일 입력란*/
        .textin{
        width: 300px;
        margin-left:25px;
        margin-bottom: 10px;
        }
        .textcon{
        font-weight: bold;
        text-align: center;
        padding-top:20px;
        }
        </style>
    </head>
    <body>
        <div class="title">
            <h1>BaDa</h1>
        </div>
        <div class="container">
            <!--로고 태그 시작-->
            <span class="logo">
                <a href="#"><img src="logo.png"><h6>로고</h6></a>
                <hr/>
            </span>
            <!--로고 태그 끝-->
            <!--이메일 주소 입력 타이틀-->
            <h3>이메일 주소</h3>
            <!--이메일 입력란-->
            <div>
                <input type="text" class="textin form-control" placeholder="아이디를 입력해주세요">
                 <input type="email" class="textin form-control" placeholder="이메일 주소를 입력해주세요">
                <div class="textcon">
                    <p>입력하신 이메일주소로 임시 <br/>비밀번호를 발송해 드립니다.</p>
                    </br>
                    <p>임시 비밀번호로 로그인<br/> 하신후 회원정보에서<br/> 정보를 수정해주세요.</p>
                </div>
                    <hr/>
                    <button type="button" class="btn btn-info btn-lg btn-block">아이디 찾기</button>
            </div>

        </div>
    </body>
</html>