<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.css">
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
                    <h2>회원에게 판매</h2>
                </div>
                <p class="col-md-offset-2 text-warning">*은 필수 입력입니다.</p>
                <form class="form-horizontal" id="myform">
                    <div class="form-group">
                        <label for="b_title" class="col-md-2">도서명*</label>
                        <div class="col-md-8"><input type="text" name="b_title" id="b_title" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label for="p_price" class="col-md-2">정가*</label>
                        <div class="col-md-8"><input type="text" name="p_price" id="p_price" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label for="s_price" class="col-md-2">판매가*</label>
                        <div class="col-md-4">
                            <input type="text" name="s_price" id="s_price" class="form-control">
                        </div>
                        <div class="col-md-4 clearfix">
                            <span class="text-danger pull-right">-판매 수수료는 10%입니다.</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="profile_img" class="col-md-2">도서 이미지</label>
                        <div class="col-md-8">
                            <img class="thumbnail" src="${pageContext.request.contextPath}/assets/img/profile.png" alt="프로필 이미지" width="50px" />
                            <input type="file" name="profile_img" id="profile_img" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-8">
                            <button type="button" class="btn btn-info btn-lg" id="sale_reg">판매등록</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->
        </div>
        <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>
    <script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#sale_reg").click(function() {
                swal({
                    title: "상품 등록",
                    text: "상품을 등록하시겠습니까?",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                },function() {
                    setTimeout(function(){
                        swal("상품이 등록되었습니다.");
                    }, 1000);
                });
            });
        });
        $(document.body).on('click', '.dropdown-menu li', function(event) {

            var $target = $(event.currentTarget);

            $target.closest('.input-group-btn').find('[data-bind="label"]').text($target.text()).end().children('.dropdown-toggle').dropdown('toggle');

            return false;

        });
    </script>
</body>

</html>
