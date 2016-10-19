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

            border: none;
        }

        .mar {
            margin: 20px 0px 100px 0px;

        }
    </style>
</head>

<body>
<%@ include file="/WEB-INF/inc/topbar.jsp" %>
    <div class="container">
        <!-- Grid Row 시작 -->
        <div class="row">
<%@ include file="/WEB-INF/inc/sidebar.jsp" %>
            <!-- 메인 컨텐츠 영역 시작 -->
            <div class="col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h1>보낸 쪽지함</h1>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead style="background-color : #eee;">
                            <tr>
                                
                                <th class="text-center" width="20%">보낸이</th>
                                <th class="text-center" width="50%">제목</th>
                                <th class="text-center" width="30%">받은날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center"> 2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                             <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center"> 2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                 
                                <td class="text-center">유아인</td>
                                <td class="text-center"><a href="#">책을 사고싶습니다만?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                        </tbody>
                           <tfoot>
                            <tr>
                                <td colspan="3" class="bor text-center">
                                    <nav aria-label="Page navigation">
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
