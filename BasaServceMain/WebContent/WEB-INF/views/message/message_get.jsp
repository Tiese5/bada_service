<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
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
					            <td class="text-center">${messenger.senderName}</td>
					            <%-- <td>
					            	<c:url var="readUrl" value="/bbs/document_read.do">
					            		<c:param name="category" value="${document.category}" />
					            		<c:param name="document_id" value="${document.id}" />
					            	</c:url>
					            	<a href="${readUrl}">${document.subject}</a>
					            </td> --%>
					            <td class="small text-center">${messenger.content}</td>
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
                           	
                            <tr>
                                <td colspan="2" class="text-center" style="border-right: none;">
                                    <nav aria-label="Page navigation" class="bor">
                                      <ul class="pagination">
                                        <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> 이전</a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li class="next"><a href="#">다음 <span aria-hidden="true">&rarr;</span></a></li>
                                          
                                      </ul>
                                    </nav>
                                </td>
                                <td class="text-center">
                                    <a href="#" class="mar btn btn-primary">삭제</a>
                                </td>
                            </tr>
                           
                        </tfoot>
                    </table>
                </div>
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->

        </div>
        <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>

</body>

</html>
