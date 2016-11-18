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
    </style>

</head>

<body>

   <%@include file="/WEB-INF/inc/admin_topbar.jsp"%>
    <!-- 컨테이너 영역 -->
    <div class="container">
       <%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
<div class="row pos">
	<h1 class="page-header">회원 상세 보기</h1>
	
	<table class="table table-bordered">
	<tbody>
		<tr>
			<th class="info text-center" width="130">회원번호</th>
			<td>${view.id}</td>		
		</tr>
		<tr>
			<th class="info text-center">이름</th>
			<td>${view.name}</td>		
		</tr>
		<tr>
			<th class="info text-center">아이디</th>
			<td>${view.user_id}</td>		
		</tr>
		<tr>
			<th class="info text-center" >이메일</th>
			<td>${view.email}</td>		
		</tr>
		<tr>
			<th class="info text-center" >생년월일</th>
			<td>${view.birthdate}</td>		
		</tr>
		<tr>
			<th class="info text-center" >전화번호</th>
			<td>${view.tel}</td>		
		</tr>
		<tr>
			<th class="info text-center" >주소</th>
			<td>${view.postcode}&nbsp; ${view.addr1} ${view.addr2}</td>		
		</tr>
		
		<tr>
			<th class="info text-center" >가입날짜</th>
			<td>${view.join_date}</td>		
		</tr>
		<tr>
			<th class="info text-center" >수정날짜</th>
			<td>${view.join_edit}</td>		
		</tr>
	</tbody>
	</table>
		
		<div class="text-center">
		<a href="${pageContext.request.contextPath}/admin/member/user_manage.do" class="btn btn-primary">목록</a>
		<a href="${pageContext.request.contextPath}/admin/member/member_edit.do?id=${view.id}" class="btn btn-warning">수정</a>
		<a href="${pageContext.request.contextPath}/admin/member/member_out.do?id=${view.id}" class="btn btn-danger" >삭제</a>
		</div>
	</div>
	
	</div>

        </body>
        </html>
       