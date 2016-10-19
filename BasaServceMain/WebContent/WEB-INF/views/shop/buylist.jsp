<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
    <style media="screen" type="text/css">
        .three {
            margin-left: 10px;
        }

        .size {
            padding-bottom: 20px;
        }

         .table > tbody > tr > td {
            text-align: center;
            vertical-align: middle !important;
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
                    <h1>구매내역</h1>
                </div>
                <div class="size col-md-6">
                    <a href="#">최근 3개월</a>
                    <a href="#" class="three">3개월 이전(최장 6개월)</a>
                </div>
                <table class="table table-hover">
                    <thead  style="background-color : #eee;">
                        <tr>
                            <th class="text-center" width="20%">표지</th>
                            <th class="text-center" width="20%">책 제목</th>
                            <th class="text-center" width="20%">판매자</th>
                            <th class="text-center" width="20%">가격</th>
                            <th class="text-center" width="20%">구입일시</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="kjm_detail_infomation.html"><img src="${pageContext.request.contextPath}/assets/img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">자바의 정석</a></td>
                            <td>홍길동</td>
                            <td><span class="text-danger">20,000</span> 원</td>
                            <td>2016.09.10 12:00:00</td>
                        </tr>
                        <tr>
                            <td><a href="kjm_detail_infomation.html"><img src="${pageContext.request.contextPath}/assets/img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">에디톨로지</a></td>
                            <td>홍길동</td>
                            <td><span class="text-danger">18,000</span> 원</td>
                            <td>2016.09.07 14:32:00</td>
                        </tr>
                    </tbody>
                    <tfoot>
                            <tr>
                                <td colspan="5" class="text-center">
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
                            </tr>
                        </tfoot>
                </table>

            </div>
            <!-- 메인 컨텐츠 영역 끝 -->

        </div>
        <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>

</body>

</html>
