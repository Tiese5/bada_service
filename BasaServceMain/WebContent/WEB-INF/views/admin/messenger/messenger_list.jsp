<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<%@include file="/WEB-INF/inc/admin_head.jsp"%>
<style type="text/css">
.btn {
	margin-left: 900px;
}

.main-content {
	margin-top: 30px;
}
</style>
</head>

<body>
	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/admin_topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->
<div class="container">
		<%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
        <!-- Grid Row 시작 -->
        <div class="row">
            <!-- 메인 컨텐츠 영역 시작 -->
            <div class="col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h1>받은 쪽지함</h1>
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
                    		<td class="text-center">테스트</td>
                    		<td class="text-center">테스트</td>
                    		<td class="text-center">테스트</td>
                    		</tr>
                   		</tbody>
                    </table>
                </div>
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->

        </div>
        <!-- Grid Row 끝 -->

        <!-- Footer 영역 시작 -->
        <hr>
        <footer>
            <address>
                Copyright&copy; 2016 <strong class="text-primary">BaDa</strong> All rights reserved.
            </address>
        </footer>
        <!-- Footer 영역 끝 -->
    </div>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document.body).on('click', '.dropdown-menu li', function(event) {

            var $target = $(event.currentTarget);

            $target.closest('.input-group-btn').find('[data-bind="label"]').text($target.text()).end().children('.dropdown-toggle').dropdown('toggle');

            return false;

        });
    </script>
</body>

</html>
