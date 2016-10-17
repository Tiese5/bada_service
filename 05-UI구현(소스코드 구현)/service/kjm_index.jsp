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
        <title>index</title>

        <style type="text/css">

            div.container{
                width: auto;
                margin: auto;
                height: 200px;
             
            }

            .move>a>h1{
                text-indent: -10000px;
            }
         
            .imgimg {
                margin-left: 50%;
            }

            .move {
                position: absolute;
                right: 50%;
                bottom: 50%;
            }
         

            .control {
                width: 600px;
                position: absolute;
                right: 30%;
                bottom: 50%;
                
            }

            #text {
                display: inline;
            }
            
            .test {
                width: 600px;
                background-color: #ff0000;
            }

            .text2 {
                font-size: 1.2em;
                margin-top: 30px;
                margin-right: 50px;
            }

        </style>
    </head>
    <body>
        <div class="container clearfix">
            <div class="text2 pull-right">
                <a href="kjm_main.html">메인페이지</a> | <a href="lmg_login.html">로그인</a>
            </div>
            <div class="move">
            <a href="kjm_main.html" class="image"><img src="logo.png" class="imgimg"><h1>로고</h1></a>
            </div>
            <form class="control form-horizontal" action="lmg_suchpage.html">
                <div class="form-group">
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="text" placeholder="찾으시는 도서명 또는 작가를 입력해주세요.">
                    </div>
                    <div class="col-md-4">
                         <a class="btn btn-primary" type="submit" href="lmg_suchpage.html">검색</a>
                    </div>
            </form>

        </div>
    </body>
</html>