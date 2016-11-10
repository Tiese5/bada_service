<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="/WEB-INF/inc/admin_head.jsp" %>
<style type="text/css">
.btnpadding{
margin-left:  385px;
margin-top: 20px;
}
</style>
</head>

<body>
	
	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/admin_topbar.jsp" %>
	<!-- 로고, 상단 네비게이션 바 끝 -->

	<!-- 컨테이너 영역 -->
	<div class="container">
		<!-- 사이드 네비게이션 바 -->
		<%@include file="/WEB-INF/inc/admin_siderbar.jsp" %>
		<!-- 사이트 네비게이션 바 끝 -->
		<div class="row">

			<!-- 메인 컨텐츠 영역 -->
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-offset-2 col-md-offset-2 main-content">
				<div class="page-header">
					<h1 class="nametext1 ">1:1문의 수정</h1>
				</div>
				
					<div class="form-group">
						<label for="qContent">제목:
							${readQna.title }</label>
					</div>
					
					<div class="form-group">
						<label for="qContent">문의
							내용:${readQna.qContent}</label>
					</div>
					<hr />
					
			</div>
			<!--수정내용-->
			<form class="form-horizontal" id="myform" action="${pageContext.request.contextPath}/admin/qna_edit_ok.do?" method="post">
			<input type="hidden" value="${qnaId}" name="id" id="id"/>
			<input type="hidden" value="${readQna.title}" name="title" id="title"/>
			<input type="hidden" value="${readQna.category}" name="category" id="category"/>
			<input type="hidden" value="${readQna.qContent}" name="qContent" id="qContent"/>
			<div class="form-group none">
				<label for="text" class="col-md-1 col-md-offset-1"></label>
				<div class="col-md-6 col-sm-2">
					<textarea class="form-control" rows="3" name="aContent" id="aContent">${readQna.aContent}
                        </textarea>
					<div class="btnpadding">
						<button type="submit" id="com1" class="btn btn-info">수정완료
					</button>
						<a href="" type="button" id="com2" class="btn btn-danger">삭제하기
					</a>
					</div>
				</div>
			</div>
			</form>
		</div>

		<!--수정내용 끝-->
	</div>
	<!-- 컨테이너 끝 -->


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
