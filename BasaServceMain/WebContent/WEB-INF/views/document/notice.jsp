<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<title>BaDa | 공지사항</title>
<%@include file="/WEB-INF/inc/head.jsp"%>
<style type="text/css">
/*상단바 끝*/
td, th {
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
</style>
</head>

<body>

	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->

	<div class="container">

		<!-- Grid Row 시작 -->
		<div class="row">

			<!-- 좌측 사이드 네비게이션 바 -->
			<%@include file="/WEB-INF/inc/sidebar.jsp"%>
			<!-- 좌측 사이드 네비게이션 바 끝 -->

			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1>${bbsName}</h1>
				</div>
				
				<div class="table-responsive">
					<table class="table table-hover">
						<thead style="background-color: #eee;">
							<tr>
								<th class="text-center" width="10%">No</th>
								<th class="text-center" width="20%">제목</th>
								<th class="text-center" width="50%">내용</th>
								<th class="text-center" width="20%">작성일</th>
							</tr>
						</thead>
						<tbody>
						 	<c:choose>
					    		<c:when test="${fn:length(documentList) > 0}">
					    			<c:forEach var="document" items="${documentList}">
					    				<tr>
								            <td class="text-center">${document.id}</td>
								            <td class="text-center">${document.title}</td>
								            <td class="text-center">
								            	<c:url var="readUrl" value="/document_view.do">
								            		<c:param name="category" value="${document.category}" />
								            		<c:param name="document_id" value="${document.id}" />
								            	</c:url>
								            	<a href="${readUrl}">${document.content}</a>
								            </td>
								            <td class="text-center">${document.regDate}</td>
							        	</tr>
					    			</c:forEach>
					    		</c:when>
					    		<c:otherwise>
					    			<tr>
							            <td colspan="4" class="text-center" style="line-height: 100px;">
							                조회된 글이 없습니다.</td>
							        </tr>
					    		</c:otherwise>
					    	</c:choose>
						</tbody>		
					</table>
					
					<%@ include file="/WEB-INF/inc/list_bottom.jsp" %>
				</div>
				
			</div>
			
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->
		
		<!-- Footer 영역 시작 -->
		<hr>
		<footer>
			<%@include file="/WEB-INF/inc/footer.jsp"%>
		</footer>
		<!-- Footer 영역 끝 -->
	</div>
</body>

</html>
