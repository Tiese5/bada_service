<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
</head>

<body>
<%@ include file="/WEB-INF/inc/topbar.jsp" %>
    <div class="container">

        <div class="page-header col-md-offset-1">
            <h1>상품구매</h1>
        </div>
        <div class="col-md-offset-1 row">
            <h4 class="col-md-2">구매상품 정보</h4>
            <div class="col-md-10 table-responsive">
                <table class="table table-hover">
                    <thead style="background-color : #eee;">
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
                            <td><a href="kjm_detail_infomation.html"><img src="img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">자바의 정석</a></td>
                            <td>바다</td>
                            <td><span class="text-danger">20,000</span> 원</td>
                            <td>2016.09.10 12:00:00</td>
                        </tr>
                        <tr>
                            <td><a href="kjm_detail_infomation.html"><img src="img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">자바의 정석</a></td>
                            <td>바다</td>
                            <td><span class="text-danger">20,000</span> 원</td>
                            <td>2016.09.10 12:00:00</td>
                        </tr>
                        <tr>
                            <td><a href="kjm_detail_infomation.html"><img src="img/effective_java.jpg" alt="" height="100px"></a></td>
                            <td><a href="kjm_detail_infomation.html">자바의 정석</a></td>
                            <td>바다</td>
                            <td><span class="text-danger">20,000</span> 원</td>
                            <td>2016.09.10 12:00:00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-offset-1 row">
            <h4 class="col-md-2">총 구매 금액</h4>
            <div class="col-md-10">
                <h4><span class="text-danger">60,000</span> 원</h4>
            </div>
        </div>
        <form class="form-horizontal" id="myform">
            <div class="row col-md-offset-1">
                <h4 class="col-md-2">배송지 주소</h4>
                <div class="col-md-10 form-group" style="margin-top:10px;">
                    <div class="col-md-8 clearfix" style="margin-bottom:15px;">
                        <label for="basic_ship" class="pull-right"><input type="checkbox" id="basic_ship" checked> 기본 주소 가져오기</label>
                        <input type="text" name="postcode" id="postcode" class="form-control pull-left" style="width: 120px; margin-right: 5px;" disabled value="12345">
                        <input type="button" value="우편번호 찾기" class="btn btn-warning" onclick='execDaumPostcode("postcode", "addr1", "addr2");'>
                    </div>
                    <div class="col-md-8" style="margin-bottom:15px;"><input type="text" name="addr1" id="addr1" class="form-control" disabled value="서울시 강남구 역삼동"></div>
                    <div class="col-md-8"><input type="text" name="addr2" id="addr2" class="form-control" value="123-12"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-5">
                    <button type="button" class="btn btn-primary btn-lg buy">구매하기</button>
                </div>
            </div>
        </form>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>



    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="plugins/postcode/postcode.js"></script>
    <script src="plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".buy").click(function(){
                swal({
                    title: "구매성공",
                    confirmButtonClass: "btn-info",
                    confirmButtonText: "확인"
                },function(isConfirm){
               window.location="kjm_buylist.html";

                });
            });
        })
    </script>
</body>

</html>
