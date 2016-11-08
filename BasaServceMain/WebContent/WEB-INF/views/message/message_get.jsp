<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
<script type="text/javascript"> 
		$(function () {
	   	 $('[data-toggle="popover"]').popover()
	    });
	</script>
    <style media="screen" type="text/css">
        td, th {
            border-right: 1px solid #ccc;
        }
        td:last-child, th:last-child {
            border: 0;
        }
  
        .bor {
            margin-left: 230px;
            
        }

        .mar {
            margin-top: 20px;
            margin-left: 230px;

        }
        
        .small {
        	white-space: nowrap;
        	overflow: hidden;
        	text-overflow: ellipsis;
        }
    </style>

</head>

<body>
<%@ include file="/WEB-INF/inc/topbar.jsp" %>
    <div class="container">
        <!-- Grid Row 시작 -->
        <div class="row">
<%@ include file="/WEB-INF/inc/my_sidebar.jsp" %>
            <!-- 메인 컨텐츠 영역 시작 -->
            <div class="col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h1>받은 쪽지함</h1>
                </div>
              
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead style="background-color : #eee;">
                            <tr>
                                <th class="text-center" width="20%">보낸이</th>
                                <th class="text-center" width="50%">내용</th>
                                <th class="text-center" width="30%">받은날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                           <c:choose>
		    		<c:when test="${fn:length(messengerList) > 0}">
		    			<c:forEach var="messenger" items="${messengerList}">
		    				<tr>
		    					<td class="small text-center">${messenger.senderName}</td>
					            <td class="text-center">
					            	<c:url var="readUrl" value="/message_view.do">
					            		<c:param name="message_id" value="${messenger.id}" />				     
					            	</c:url>
					            	<a data-toggle="popover"
					            	  data-placement="bottom"
					            	    data-content="<a href='${readUrl}'>쪽지보내기</a>">${messenger.content}</a>
					            </td>
					            <td class="text-center">${messenger.regDate}</td>
				        	</tr>
		    			</c:forEach>
		    		</c:when>
		    		<c:otherwise>
		    			<tr>
				            <td colspan="3" class="text-center" style="line-height: 100px;">
				                조회된 글이 없습니다.</td>
				        </tr>
		    		</c:otherwise>
		    	</c:choose>
                        </tbody>
                           <tfoot>
                            <tr><td colspan="3" class="text-center"></td></tr>
                        </tfoot>
                    </table>
	                    <!-- 페이지 번호 시작 -->
						<nav class="text-center">
							<ul class="pagination">
								<!-- 이전 그룹으로 이동 -->
								<c:choose>
									<c:when test="${pageHelper.prevPage > 0}">
										<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
										<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
										<c:url var="prevUrl" value="/message_get.do">											
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
									<c:url var="pageUrl" value="/message_get.do">										
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
										<c:url var="nextUrl" value="/message_get.do">											
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
						</nav>						
						<!-- // 페이지 번호 끝 -->
                </div>
            <!-- 메인 컨텐츠 영역 끝 -->
		</div>
    </div>
        <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>

</body>

</html>
