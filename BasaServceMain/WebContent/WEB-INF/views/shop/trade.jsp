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
<%@ include file="/WEB-INF/inc/sidebar.jsp" %>
                <!-- 메인 컨텐츠 영역 시작 -->
                <div class="col-sm-9 col-md-10 main-content">
                    <div class="page-header">
                        <h1>회원에게 판매한 내역</h1>
                    </div>
                    <!--버튼-->
                  <div class="dropps pull-right">
                    <select name="telecom" id="telecom">
                        <option value="new">최근 1개월</option>
                        <option value="top">최근 3개월</option>
                        <option value="row">최근 6개월</option>
                    </select>
                    </div>
                    <!-- 버튼 끝-->
                    <div class="table">
                        <table class="table-hover table">
                            <thead style="background-color : #ddd;">
                                <tr>
                                    <td class="textheade">제목</td>
                                    <td class="textheade">가격</td>
                                    <td class="textheade">판매일시</td>
                                    <td class="textheade">판매승인</td>
                                    <td class="textheade">구매자</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <ul>
                                        <td><li class="top"><a href="#">자바의 정석</a></li></td>
                                        <td><li class="top">20000원</li></td>
                                        <td><li class="top">2016.08.20</li></td>
                                        <td><li class="top">승인</li></td>
                                        <td><li class="top">책돌이</li></td>
                                    </ul>
                                </tr>
                                <tr>
                                    <ul>
                                        <td><li class="top"><a href="#">자바의 정석</a></li></td>
                                        <td><li class="top">20000원</li></td>
                                        <td><li class="top">2016.08.20</li></td>
                                        <td><li class="top">승인</li></td>
                                        <td><li class="top">책돌이</li></td>
                                    </ul>
                                </tr>
                                <tr>
                                    <ul>
                                        <td><li class="top"><a href="#">자바의 정석</a></li></td>
                                        <td><li class="top">20000원</li></td>
                                        <td><li class="top">2016.08.20</li></td>
                                        <td><li class="top">승인</li></td>
                                        <td><li class="top">책돌이</li></td>
                                    </ul>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <h1>바다에 판매 신청한 내역</h1>
                            <hr/>
                        </div>
                    </div>
                    <!--책목록정의-->
                    <div>
                        <table class="table table2 table-hover">
                            <thead style="background-color : #ddd;">
                                <tr height="30px">
                                    <th class="text-center" width="70%">제목</th>
                                    <th class="text-center" width="30%">신청일시</th>
                                </tr>
                            </thead>    
                                <tbody>
                                    <tr>
                                        <td>종류</td>
                                        <td>10,000</td>
                                    </tr>
                                    <tr>
                                        <td>종류</td>
                                        <td>10,000.</td>
                                    </tr>
                                    <tr>
                                        <td>종류</td>
                                        <td>10,000</td>
                                    </tr>
                                    <tr>
                                        <td>종류</td>
                                        <td>10,000</td>
                                    </tr>
                                    <tr>
                                        <td>종류</td>
                                        <td>10,000</td>
                                    </tr>
                             </tbody>
                            
                        </table>
                        <!--문의내역 테이블 끝-->
                    </div>
                </div>
                <!-- 메인 컨텐츠 영역 끝 -->
            </div>
            <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
        </div>

    </body>
</html>