<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="/WEB-INF/inc/admin_head.jsp"%>
    <style media="screen" type="text/css">
  
        .pos{
        margin-left: 170px;
        margin-top: 80px;
        }
        td, th {
            border-right: 1px solid #ccc;
        }
        td:last-child, th:last-child {
            border: 0;
        }
        .table > tbody > tr > td {
            text-align: center;
            vertical-align: middle !important;
        }

        .bor {
            border: 1px;
        }
        
        .mar {
            margin-top: 20px;
        }
        #asd{
        	margin-left: 180px;
        }
    </style>

</head>

<body>

    <%@include file="/WEB-INF/inc/admin_topbar.jsp"%>
    <!-- 컨테이너 영역 -->
    <div class="container">
       <%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>

  <div class="container">
            <!-- Grid Row 시작 -->
            <div class="row">
         
                <!-- 메인 컨텐츠 영역 시작 -->
                <div id= "asd" class="col-sm-9 col-md-10 main-content">
                    <div class="page-header">
                        <h1>삭제하기</h1>
                    </div>
                      
                      <p>정말 삭제하시겠습니까?</p>
                      
                      	<div class="form-group" >
                      		<a href="${pageContext.request.contextPath}/admin/member/member_out_ok.do?id=${id}" class='btn btn-danger btn-block'>삭제하기</a>
                  			<button type='button' class='btn btn-primary btn-block' 
                      		onclick="history.back()">삭제취소</button>
                      	</div>
                      	
                         
                   
                </div>
                <!-- 메인 컨텐츠 영역 끝 -->
         
	</div>
	</div>
	</div>
	</body>
	</html>
	