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
        
        </style>
    
    </head>
    <body>
     
        <div class="container">
         	 <div class="form-control">
            	<form method="post" action="${pageContext.request.contextPath}/member/login.do">
                <div class="textcon">
                    <p>입력하신 이메일주소로 찾은 아이디는 다음과 같습니다.</p>
                </div>
                    <hr/>
                 <div class="form-group">
						<div class="col-md-8">
							<input type="text" name="user_id" id="user_id" class="form-control"
								value="${user_id}">
						</div>
				</div>
				<div class="form-group">
                <button type="submit" class="btn btn-info">로그인 하기</button>
         		</div>
            </div>

        </div>
    </body>
</html>