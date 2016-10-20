<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
    <link rel="stylesheet" href="plugins/pickadate/themes/classic.css">
    <link rel="stylesheet" href="plugins/pickadate/themes/classic.date.css">
    <link rel="stylesheet" href="plugins/pickadate/themes/classic.time.css">
    <link rel="stylesheet" href="plugins/sweetalert/sweetalert.css">

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
                    <h2>바다에 판매</h2>
                </div>
                <p class="col-md-offset-2 text-warning">*은 필수 입력입니다.</p>
                <form class="form-horizontal" id="myform">
                    <div class="form-group">
                        <label for="b_title" class="col-md-2">도서명*</label>
                        <div class="col-md-8"><input type="text" name="b_title" id="b_title" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label for="s_type" class="col-md-2">신청종류*</label>
                        <div class="col-md-8">
                            <label for="s_type"><input type="radio" name="sale_type" id="s_type"> 단품(5권 이하)</label> &nbsp;&nbsp;&nbsp;
                            <label for="m_type"><input type="radio" name="sale_type" id="m_type"> 대량(6권 이상)</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pickup_date" class="col-md-2">수거 가능일*</label>
                        <div class="col-md-4 input-group" style="padding-left : 15px">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input type="text" name="pickup_date" id="pickup_date" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="b_list" class="col-md-2">판매 도서 내역*</label>
                        <div class="col-md-8">
                            <textarea name="b_list" id="b_list" rows="8" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-md-5 col-md-offset-2">
                    		<label for="basic_ship" class="pull-left"><input type="checkbox" id="basic_ship" checked> 기본 주소 가져오기</label>
                    	</div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">배송지 주소*</label>
                        <div class="col-md-10 form-group">
                            <div class="col-md-12 clearfix" style="margin-bottom:15px;">
                            
                                <input type="text" name="postcode" id="postcode" class="form-control pull-left" style="width: 10px; margin-right: 5px;" disabled value="12345">
                                <input type="button" value="우편번호 찾기" class="btn btn-warning" onclick='execDaumPostcode("postcode", "addr1", "addr2");'>
                            </div>
                            <div class="col-md-8" style="margin-bottom:15px;"><input type="text" name="addr1" id="addr1" class="form-control" disabled value="서울시 강남구 역삼동"></div>
                            <div class="col-md-8"><input type="text" name="addr2" id="addr2" class="form-control" value="123-12"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-8">
                            <button type="button" class="btn btn-info btn-lg" id="sale_req">판매신청</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->
        </div>
        <!-- Grid Row 끝 -->

<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>


    <script src="plugins/pickadate/picker.js"></script>
    <script src="plugins/pickadate/picker.date.js"></script>
    <script src="plugins/pickadate/picker.time.js"></script>
    <script src="plugins/pickadate/translations/ko_KR.js"></script>
    <script src="plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#sale_req").click(function() {
                swal({
                    title: "판매 신청",
                    text: "바다에 판매 신청하시겠습니까?",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                },function() {
                    setTimeout(function(){
                        swal("신청되었습니다.");
                    }, 1000);
                });
            });
            $("#pickup_date").pickadate();
        });

    </script>
</body>

</html>
