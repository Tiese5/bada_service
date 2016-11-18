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
        td, th {
            border-right: 1px solid #ccc;
        }
        td:last-child, th:last-child {
            border: 0;
        }

        .delete-btn {
            display: inline;

            margin-left:78%; 
        }


        #button {
            margin-left: 80px;
        }
        
        .mar {
        	margin-top: 18px;
        }
        
        .smaller {
        	white-space: nowrap;
        	overflow: hidden;
        	text-overflow: ellipsis;
        }
        
    </style>

</head>

<body>

	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/admin_topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->

	<div class="container">
		<%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
		<!-- Grid Row 시작 -->
		<div class="row">
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
								<th class="text-center" width="30%">제목</th>
								<th class="text-center" width="15%">작성일</th>
							</tr>
						</thead>
						<tbody>
						 	<c:choose>
					    		<c:when test="${fn:length(documentList) > 0}">
					    			<c:forEach var="document" items="${documentList}">
					    				<tr>
								            <td class="text-center">${document.id}</td>
								             <td class="text-center" style='max-width: 100px;'><p class="smaller">
								            	<c:url var="readUrl" value="/admin_document_view.do">
								            		<c:param name="category" value="${document.category}" />
								            		<c:param name="document_id" value="${document.id}" />
								            	</c:url>
								            	<a class="smaller" href="${readUrl}">${document.title}</a></p>
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
						<!-- 페이지 번호 시작 -->
							<nav class="text-center">
								<ul class="pagination">
									<!-- 이전 그룹으로 이동 -->
									<c:choose>
										<c:when test="${pageHelper.prevPage > 0}">
											<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
											<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
											<c:url var="prevUrl" value="/admin_document_list.do">
												<c:param name="category" value="${category}"></c:param>
												<c:param name="keyword" value="${keyword}"></c:param>
												<c:param name="page" value="${pageHeler.prevPage}"></c:param>
											</c:url>
											
											<li><a href="${prevUrl}">&laquo;</a></li>
										</c:when>
										
										<c:otherwise>
											<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
											<li class="disabled"><a href="#">&laquo;</a></li>
										</c:otherwise>
									</c:choose>
									
									<!-- 페이지 번호 -->
									<!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
									<c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage}" step="1">
										<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url 에 저장 -->
										<c:url var="pageUrl" value="/admin_document_list.do">
											<c:param name="category" value="${category}"></c:param>
											<c:param name="keyword" value="${keyword}"></c:param>
											<c:param name="page" value="${i}"></c:param>
										</c:url>
										
									<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
										<c:choose>
											<c:when test="${pageHelper.page == i}">
												<li class="active"><a href="#">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${pageUrl}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<!-- 다음 그룹으로 이동 -->
									<c:choose>
										<c:when test="${pageHelper.nextPage > 0}">
											<!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
											<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
											<c:url var="nextUrl" value="/admin_document_list.do">
												<c:param name="category" value="${category}"></c:param>
												<c:param name="keyword" value="${keyword}"></c:param>
												<c:param name="page" value="${pageHelper.nextPage}"></c:param>
											</c:url>
											
											<li><a href="${nextUrl}">&raquo;</a></li>		
										</c:when>
										
										<c:otherwise>
											<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
											<li class="disabled"><a href="#">&raquo;</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
								<a href="${pageContext.request.contextPath}/admin_document_write.do?category=${category}" 
								   class="mar btn btn-primary pull-right">
								   <i class="glyphicon glyphicon-pencil"></i>글쓰기
								   </a>
							</nav>
							
							
						<!-- // 페이지 번호 끝 -->

						
				
					
				</div>
				
			</div>
			
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->

	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
