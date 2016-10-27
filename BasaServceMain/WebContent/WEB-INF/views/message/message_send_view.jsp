<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>쪽지 확인</title>
<%@include file="/WEB-INF/inc/head.jsp"%>
<style media="screen" type="text/css">
.from_people {
	text-align: right;
}

.message_content {
	text-align: right;
}

.mar {
	margin-left: 470px;
}

.pad {
	padding-bottom: 15px;
}

/*상단바 끝*/
</style>
</head>

<body>

	<!-- 로고, 상단 네비게이션 바 -->
	<%@include file="/WEB-INF/inc/topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->

	<div class="container">

		<!-- Grid Row 시작 -->
		<div class="row">

			<!-- 좌측 사이드 네비게이션 바 -->
			<%@include file="/WEB-INF/inc/my_sidebar.jsp"%>
			<!-- 좌측 사이드 네비게이션 바 끝 -->

			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1>쪽지 확인</h1>
				</div>
				<br />
				<form class="form-horizontal" id="myform" method="post" action="${pageContext.request.contextPath }/message_send_ok.do">
					<input type="hidden" name="sender_name" value="${readMessage.senderName}" />
					<input type="hidden" name="sender_id" value="${readMessage.senderId}" />
					<div class="form-group">
						<label for="send_people" class="col-md-1">보낸이:</label>
						<div class="col-md-11">
							<span> ${readMessage.senderName} </span>
						</div>
					</div>
					<div class="form-group">
						<label for="send_people" class="col-md-1">받는이:</label>
						<div class="col-md-11">
							<span> ${readMessage.receiverName} </span>
						</div>
					</div>
					<div class="form-group">
						<label for="subject" class="col-md-1">내용:</label>
						<div class="col-md-11">
							<span> ${readMessage.content} </span>
						</div>
					</div>
					<div class="page-header"></div>
					<div class="form-group">
						<div class="mar col-md-8">
							<button type="submit" class="btn btn-primary pull-right">답변완료</button>
							<button class="btn btn-danger">취소</button>
						</div>

					</div>
				</form>



			</div>
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->

		<!-- Footer 영역 시작 -->
		<%@include file="/WEB-INF/inc/footer.jsp"%>
		<!-- Footer 영역 끝 -->
	</div>


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="plugins/sweetalert/sweetalert.min.js"></script>
	<script src="http://cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#message_send").click(function() {
				swal({
					title : "작성완료",
					text : "이대로 작성하시겠습니까?",
					showCancelButton : true,
					closeOnConfirm : false,
					showLoaderOnConfirm : true
				}, function() {
					setTimeout(function() {
						swal("작성되었습니다.");
					}, 1000);
				});
			});
		});
		$(document.body).on('click','.dropdown-menu li',
				function(event) {

					var $target = $(event.currentTarget);

					$target.closest('.input-group-btn').find(
							'[data-bind="label"]').text($target.text()).end()
							.children('.dropdown-toggle').dropdown('toggle');

					return false;

				});
	</script>

</body>

</html>
