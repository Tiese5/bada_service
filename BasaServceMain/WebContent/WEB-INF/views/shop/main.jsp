<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
    <style media="screen" type="text/css">
        .drop {
            margin-top: -30px;
        }

        .thumbnail {
            width: 80%;
            height: 260px;
        }

        .color {
            color: #ff0000;
        }

        a > h5 {
            text-align: left;
            line-height: 20px;
        }

        .page {
            margin-left: 30%;
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
            <!-- 메인 컨텐츠 영역 시작 -->
            <div class="col-sm-9 col-md-10 main-content clearfix">
                    <div>
                        <h3>총 도서: 10,000권</h3>
                    </div>
                    <div class="drop pull-right">
                    <select name="telecom" id="telecom">
                        <option value="new">최신순</option>
                        <option value="top">인기순</option>
                        <option value="row">낮은 가격순</option>
                        <option value="range">가나다순</option>   
                    </select>
                    </div>
                    <hr/>
                <form class="form-horizontal" id="myform">

                    <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/effective_java.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>
                      <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/effective_java.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>
                      <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/complete.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>
                      <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/effective_java.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>
                      <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/effective_java.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>
                      <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/effective_java.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>
                      <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/effective_java.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>
                      <div class="col-md-3">
                        <a href="kjm_detail_infomation.html" class="thumbnail" >
                             <img src="img/effective_java.jpg" alt="이펙트 자바">
                             <p> 
                                <h5>Effective java<br />
                                <strong class="color">20,000원</strong></h5>
                             </p>
                         </a>
                    </div>

                    <div class="col-md-12">
                        <nav aria-label="Page navigation" class="page">
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
                    </div>
                </form>
            </div>
        </div>
            <!-- 메인 컨텐츠 영역 끝 -->

       
        <!-- Grid Row 끝 -->

<%@ include file="/WEB-INF/inc/footer.jsp" %>
         </div>
    </div>
</body>

</html>
