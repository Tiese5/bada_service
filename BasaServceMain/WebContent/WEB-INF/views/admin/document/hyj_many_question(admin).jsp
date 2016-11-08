<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <%@include file="/WEB-INF/inc/admin_head.jsp"%>

</head>

<body>

    <!-- 로고, 상단 네비게이션 바 -->
   <%@include file="/WEB-INF/inc/admin_topbar.jsp"%>
    <!-- 로고, 상단 네비게이션 바 끝 -->

    <!-- 컨테이너 영역 -->
    <div class="container">
        <!-- 사이드 네비게이션 바 -->
      <%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
        <!-- 사이트 네비게이션 바 끝 -->
        <div class="row">
            <!-- 메인 컨텐츠 영역 -->
            <div class="col-sm-offset-2 col-md-offset-2 main-content">

                <!-- 작성 영역 -->
                <div class="page-header">
                  <h1>자주묻는질문</h1>
                </div>
                   <div class="table-responsive">
                    <table class="table table-hover">
                        <thead style="background-color : #eee;">
                            <tr>
                                <th class="text-center" width="10%">No</th>
                                <th class="text-center" width="70%">제목</th>
                                <th class="text-center" width="20%">작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">1</td>
                                <td class="text-center"><a href="#">중고상품 등급 판정 기준은 무엇입니까? </a>  </td>
                                <td class="text-center"> 2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                <td class="text-center">2</td>
                                <td class="text-center"><a href="#">바다 판매 신청 후 수거일 변경 가능합니까?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                <td class="text-center">3</td>
                                <td class="text-center"><a href="#">매입 가능 여부를 미리 알 수 있습니까?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                <td class="text-center">4</td>
                                <td class="text-center"><a href="#">매입 금액을 미리 알려주실 수 있습니까?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
                            </tr>
                            <tr>
                                <td class="text-center">5</td>
                                <td class="text-center"><a href="#">매입하지 않는 책이 있습니까?</a></td>
                                <td class="text-center">2016.8.20 00:00:00</td>
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
                 <button type="sumbmit" id="com1" class="btn btn-info">글작성
                                </button>
                     
                </div>


                <!-- 작성 영역 끝 -->

            </div>
            <!-- 메인 컨텐츠 영역 끝 -->
        </div>
    </div>
    <!-- 컨테이너 끝 -->


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
