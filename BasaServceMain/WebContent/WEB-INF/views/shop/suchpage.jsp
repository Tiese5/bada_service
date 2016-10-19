<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
        <style media="screen" type="text/css">
       /*상단 카테고리*/
        .main-content ul>li{
        list-style: none;
        display: inline;
        padding-right: 7%;
        text-align: center;
        }
        /*상단 카테고리 위치*/
        .category{
        padding-top: 70px;
        margin-left: 30px;
        }
        /*상단 카테고리*/
        .main-content ul>li a{
        text-decoration: none;
        font-weight: bold;
        font-size: 20px;
        }
        /*상단 메인 태그*/
        .textps{
        padding-left: 50px;
        padding-top: 50px;
        }
        /*드롭다운 넓이*/
        .btwidth{
        width: 100px;
        }
        /*사진 크기*/
        .img{
        width: 100px;
        height: 100px;

        }
        /*메인 위치*/
        .main{
        display: inline-block;
        padding-left: 100px;

        }
        /*책마다 효과*/
        .mainps{
        height: 250px;
        padding-top: 30px;
        box-shadow: 2px 2px 5px rgba(135,139,144,0.7);
        }
        .main-body h4,p{
            font-weight: bold;
        }
        /*페이저 위치*/
        .pageps{
            margin-left: 50%;
        /*드롭다운 위치조정*/
        }
        .dropps{
            margin-top: -30px;
        }
         .main-body>h4 a{
            text-decoration: none;
        }
        /*상단바 끝*/
        </style>
    </head>
    <body>
<%@ include file="/WEB-INF/inc/topbar.jsp" %>
        <div class="container">
            <!-- Grid Row 시작 -->
            <div class="row">
<%@ include file="/WEB-INF/inc/sidebar.jsp" %>
                <!-- 상단 컨텐츠 영역 시작 -->
                <div class="col-md-10 col-sm-9 main-content">
                    <div class="category col-md-12 hidden-sm hidden-xs ">
                        <ul>
                            <li><a href="lmg_suchpage.html">전체</a></li>
                            <li><a href="lmg_suchpage.html">학문</a></li>
                            <li><a href="lmg_suchpage.html">소설</a></li>
                            <li><a href="lmg_suchpage.html">자기계발</a></li>
                            <li><a href="lmg_suchpage.html">매거진</a></li>
                            <li><a href="lmg_suchpage.html">어린이 도서</a></li>
                        </ul>
                    </div>
                    <div>
                        <h4 class="textps">검색결과100건</h4>
                    </div>
                    <div class="dropps pull-right">
                    <select name="telecom" id="telecom">
                        <option value="new">최신순</option>
                        <option value="top">인기순</option>
                        <option value="row">낮은 가격순</option>
                        <option value="range">가나다순</option>   
                    </select>
                    </div>
                    <hr/>
                <!-- 상단 컨텐츠 영역 끝 -->
                <!--메인컨텐츠 시작-->
                <!--항목1-->
                    <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                    <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                     <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                     <div class="mainps col-sm-4 col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                     <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    <!--항목1-->
                      <div class="mainps col-md-4 col-xs-4" align="center">
                        <a class="" href="kjm_detail_infomation.html">
                            <img class="media-object img" src="logo.png" alt="사진">
                        </a>
                        <div class="main-body">
                            <h4><a href="kjm_detail_infomation.html">고래의 정석</a></h4>
                            <p>정가:</p>
                            <p>판매가:</p>
                        </div>
                    </div>
                    </div>
                
                <!--페이저-->
                    <nav class="pageps">
                        <ul class="pagination">
                           <li>
                           <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            </a>
                            </li>
                            <li><a href="#">1</a>
                            </li>
                            <li><a href="#">2</a>
                            </li>
                            <li><a href="#">3</a>
                            </li>
                            <li><a href="#">4</a>
                            </li>
                            <li><a href="#">5</a>
                            </li>
                            <li><a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </ul>
                    </nav>
                
          </div>
    
        
  
    <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
        </div>
          </div>
</div>

</body>
</html>