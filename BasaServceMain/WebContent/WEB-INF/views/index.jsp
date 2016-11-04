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
			#keyword{
			margin-left: 30%;
			}
        </style>
    </head>
    <body>
        <div class="container clearfix">
        
        <c:choose>
         <c:when test="${loginInfo==null }">
            <div class="text2 pull-right">
                <a href="${pageContext.request.contextPath}/shop/main.do">메인페이지</a> <a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
            </div>
          </c:when>
         <c:otherwise>
         	<div class="text2 pull-right">
         		
                <a href="${pageContext.request.contextPath}/member/info.do">마이페이지</a> 
                <a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
                
            </div>
         </c:otherwise>
         </c:choose>
            <div class="move">
            <a href="${pageContext.request.contextPath}/shop/main.do?drop_down=${dropDown}" class="image">
            <img alt="" src="${pageContext.request.contextPath }/assets/img/logo.png" class="imgimg">
            	<h1>로고</h1></a>
            </div>
            <form class="control form-horizontal" name="sub"
            action="${pageContext.request.contextPath}/shop/main.do?keyword=${keyword}" method="get">
                <div class="form-group">
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="keyword" id="keyword" placeholder="찾으시는 도서명 또는 작가를 입력해주세요."
                        value="${keyword}">
        
                    </div>
                 </div>
            </form>

        </div>
    </body>
    <script>
function press(f){
    if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
    	sub.submit(); //submit에 사용자가 지정한 form의 name입력
    }
}
</script>
</html>