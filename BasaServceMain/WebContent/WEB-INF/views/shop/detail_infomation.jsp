<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp" %>

    <script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.css">
    <style media="screen" type="text/css">
  

        .size {
            margin-left: 30%;
            list-style-type: none;
        }

        h3 {
            margin-left: 15px;
        }

        .color {
            color: #ff0000;
        }

        .line {
            text-decoration: line-through;
        }

        .btns {
            margin-top: 20px;
            margin-left: 30px;
        }

        #btnsiza {
            margin-right: 20px;
        }
        
        .marg {
            margin-top: 50px;
            padding-bottom: 50px;
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
            <div class="test col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h1>제품 상세</h1>
                </div>
                <div class="image col-md-9 clearfix">
                	<img src="${pageContext.request.contextPath}/assets/img/original.jpg" style="float: left" />
                    <ul class="size">
                   
                        <li><h2><strong>Effective Java 개정 2판</strong></h2></li>
                        <li><h3>등록일: 2016.9.19 00:00:00</h3></li>
                        <li><h3>판매자: 홍길동</h3></li>
                        <li><h3>정가: <span class="line">32,000원</span></h3></li>
                        <li><h3><strong class="color">20,000</strong>원</h3></li>
                   </ul>
                   		<a href="#" class="btns btn btn-primary" id="buy">구매하기</a>
                        <a href="#" class="btns btn btn-warning" id="cart">장바구니</a>
                        
             ${shop.item_titlt }
                </div>
                 ${readItem.item_title }
                <div class="marg col-md-12">
                  <h1>책 정보</h1>
                <hr />
                </div>
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->

        </div>
        <!-- Grid Row 끝 -->

<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>


    <script type="text/javascript">
        $(document.body).on('click', '.dropdown-menu li', function(event) {

            var $target = $(event.currentTarget);

            $target.closest('.input-group-btn').find('[data-bind="label"]').text($target.text()).end().children('.dropdown-toggle').dropdown('toggle');

            return false;

        });

        $(function(){
        $("#buy").click(function(){
        swal({
        /*버튼 클릭시 출력되는 메시지*/
            title: "구매확인",
            text: "구매하시겠습니까?",
           showCancelButton: true,
        /*확인버튼에 대한 설정*/
          confirmButtonClass: "btn-info",
          confirmButtonText: "구매",
        /*취소 버튼에 대한 설정*/
          cancelButtonClass:"btn-warning",
          cancelButtonText:"아니요",
          closeOnConfirm: false,
          closeOnCancel:false,
        /*확인버튼 누를경우 동작하는 기능*/
        },function(isConfirm){
          if(isConfirm){
               window.location="";
          }else{
               swal({
                    title:"취소하였습니다.",
                    type:"error",
                    confirmButtonClass:"btn-info",
                    confirmButtonText:"확인"
               });
               };
        
        });
        });
        });

        $(function(){
        $("#cart").click(function(){
        swal({
        /*버튼 클릭시 출력되는 메시지*/
            title: "장바구니 담기",
           showCancelButton: true,
        /*확인버튼에 대한 설정*/
          confirmButtonClass: "btn-info",
           confirmButtonText: "장바구니에 담기",
        /*취소 버튼에 대한 설정*/
          cancelButtonClass:"btn-warning",
          cancelButtonText:"아니요",
          closeOnConfirm: false,
          closeOnCancel:false,
        /*확인버튼 누를경우 동작하는 기능*/
        },function(isConfirm){
          if(isConfirm){
               window.location="${pageContext.request.contextPath}/shop/cart_ok.do";
          }else{
               swal({
                    title:"취소하였습니다.",
                    type:"error",
                    confirmButtonClass:"btn-info",
                    confirmButtonText:"확인"
               });
               };
        
        });
        });
        });
    </script>
</body>

</html>
