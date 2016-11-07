<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
        <style media="screen" type="text/css">
        /*테이블 크기*/
        .table>table{
        width: 100%;
        height: 50%;
        margin-top: 20px;
        }
        /*테이블 상단 글씨 굵기 위치*/
        .textheade{
        text-align: center;
        font-weight: bold;
        }
        /*목록정의 효과 끄기*/
        li{
        list-style: none;
        }
        /*글씨 표지그림 위치조정*/
        td li{
        text-align: center;
        
        }
         /*책 목록 텍스트 중앙정령*/
        
        /*마지막 빈곳에 선*/
        table:last-child{
        border-bottom: 1px solid #ccc;
        }
          /*좌우 구분선*/
        .tacle>tbody>tr {
            border-right: 1px solid #ccc;
        }
        /*텍스즈 중앙정령*/
        .table2 tr{
            text-align: center; 
        }
        .table2 td:first-child{
            border-right: 1px solid #ccc;
        }
        .table2 th:first-child{
            border-right: 1px solid #ccc;
        }
        /*드롭다운 위치*/
        .dropps{
            padding-bottom: 20px;
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
                        <h1>회원에게 판매한 내역</h1>
                    </div>
                    <!-- 버튼 끝-->
                    <div class="table">
                        <table class="table-hover table">
                            <thead style="background-color : #ddd;">
                                <tr>
                                	<th class="text-center" width="25%">제목</th>
                                	<th class="text-center" width="25%">가격</th>
                                	<th class="text-center" width="25%">판매일시</th>
                                	<th class="text-center" width="25%">구매자 아이디</th>
                            	</tr>
                            </thead>
                            <tbody>
                             <c:choose>
					    		<c:when test="${fn:length(shopList) > 0}">
					    			<c:forEach var="shop" items="${shopList}">
					    				<tr>
					    					<td class="small text-center">${shop.item_title}</td>
								            <td class="text-center">${shop.price}</td>
								            <td class="text-center">${shop.reg_date}</td>
								            <td class="text-center">${shop.userId}</td>
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
                        
                    </div>
                </div>
                <!-- 메인 컨텐츠 영역 끝 -->
            </div>
            <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
        </div>

    </body>
</html>