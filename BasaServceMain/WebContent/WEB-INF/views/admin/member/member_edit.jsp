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
	<h1 class="page-header">수정하기</h1>
	
	
	
	<form class="form-horizontal" id="myform" method="post" name="myform" 
					action="${pageContext.request.contextPath}/admin/member/member_edit_ok.do">
			
					<input type="hidden" name="id" id="id" value="${view.id}" />
					<input type="hidden" name="join_date" id="join_date" value="${view.join_date}" />
				
					
					<div class="form-group">
						<label for="user_id" class="col-md-2 col-md-2">아이디</label>
						<div class="col-md-8">
							<input type="text" name="user_id" id="user_id"
								class="form-control" readonly value="${view.user_id}">
						</div>
					</div>
					<div class="form-group">
						<label for="postcode" class="col-md-2 col-md-2">우편번호*</label>
						<div class="col-md-8 clearfix">
							<input type="text" name="postcode" id="postcode"
								class="form-control pull-left" readonly
								style="width: 120px; margin-right: 5px;"
								value="${view.postcode}"> <input type="button"
								value="우편번호 찾기" class="btn btn-warning"
								onclick='execDaumPostcode("postcode", "addr1", "addr2");'>
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-md-2 col-md-2">주소*</label>
						<div class="col-md-8">
							<input type="text" name="addr1" id="addr1" class="form-control"
								value="${view.addr1}">
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2 col-md-2">상세주소*</label>
						<div class="col-md-8">
							<input type="text" name="addr2" id="addr2" class="form-control"
								value="${view.addr2}">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2 col-md-2">이름*</label>
						<div class="col-md-8">
							<input type="text" name="name" id="name" class="form-control"
								value="${view.name}">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2 col-md-2">이메일*</label>
						<div class="col-md-8">
							<input type="email" name="email" id="email" class="form-control"
								value="${view.email}">
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2 col-md-2">연락처*</label>
						<div class="col-md-8">
							<input type="tel" name="tel" id="tel" class="form-control"
								value="${view.tel}">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2">생년월일*</label>
						<div class="col-md-8">
							<input type="text" name="birthdate" id="birthdate"
								class="form-control" readonly value="${view.birthdate}">
						</div>
					</div>
				
					<div class="form-group">
						<div class="col-md-offset-2 col-md-8">
							<button type="submit" class="btn btn-primary">작성완료</button>
							<a href="${pageContext.request.contextPath}/admin/member/user_manage.do" class="btn btn-success">목록</a>
							
		
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>