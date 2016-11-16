<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/head.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp" %>
	<div class="container">
		<h1><small>글 삭제하기</small></h1>
	
		<form action="${pageContext.request.contextPath }/shop/item_delete_ok.do"
		method="post" name="myform">
		<!-- 카테고리와 게시글 번호 상태유지 -->
		<input type="hidden" name="item_id" value="${itemId}" />
		<!-- 자신의 글인 경우와 아닌 경우에 대한 분기 -->
		<div style='width:300px; margin:50px auto'>
		<c:choose>
			<c:when test="${myDocument==true }">
			<!-- 자신의 글에 대한 삭제 -->
			<p>정말 이 게시물을 삭제 하시겠습니까??</p>
			</c:when>
			<c:otherwise>
			<p>글 작성시 설정한 비밀번호를 입력하셔야 합니다</p>
			<div class="form-group">
				<label for="user_pw">비밀번호</label>
			</div>
			</c:otherwise>
		</c:choose>
		<div class="form-group">
			<button type="submit" class="btn btn-danger btn-block">삭제하기</button>
			<button type="button" class="btn btn-primary btn-block"  
			onclick="history.back()">삭제 취소</button>	
		</div>
		<%@ include file="/WEB-INF/inc/footer.jsp"%>
		</div>
		</form>			
	</div>
</body>
</html>
