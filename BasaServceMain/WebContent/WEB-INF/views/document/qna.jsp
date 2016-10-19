<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<title>BaDa</title>
<%@include file="/WEB-INF/inc/head.jsp"%>
<!--sweetalert플러그인-->
	<script src="${pageContext.request.contextPath }/plugins/sweetalert/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.css">
	<script type="text/javascript">
		$(document.body).on(
				'click',
				'.dropdown-menu li',
				function(event) {
					var $target = $(event.currentTarget);
					$target.closest('.input-group-btn').find(
							'[data-bind="label"]').text($target.text()).end()
							.children('.dropdown-toggle').dropdown('toggle');
					return false;
				});

		$(function() {
			$("#com1").click(function() {
				swal({
					title : "문의완료",
					text : "",
					confirmButtonText : "확인",
					confirmButtonClass : "btn-info"
				})
			});
		});
	</script>
<style media="screen" type="text/css">
.test {
	color: #EEB10A;
}

.namefont {
	font-weight: bold;
}

.none {
	padding-top: 50px;
}

.btnpadding {
	padding-top: 20px;
	margin-left: 320px;
}

.nametext1 {
	font-weight: bold;
}

.nametext {
	margin-top: 50px;
}
/*텍스트 중앙정렬*/
tr td {
	text-align: center;
}
/*좌우 구분선*/
td, th {
	border-right: 1px solid #ccc;
}
/*좌우 선 지우기*/
td:last-child, th:last-child {
	border: 0;
}
/*마지막 선 만들기*/
table:last-child {
	border-bottom: 1px solid #ccc;
}
/*테이블 크기 조정*/
table {
	width: 100%;
	height: 300px;
	margin-left: 20px;
}

.none {
	margin-top: -30px;
}
/*상단바 끝*/
</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/topbar.jsp"%>
	<!-- 로고, 상단 네비게이션 바 끝 -->
	<div class="container">
		<!-- Grid Row 시작 -->
		<div class="row">
			<!-- 좌측 사이드 네비게이션 바 -->
			<%@include file="/WEB-INF/inc/sidebar.jsp"%>
			<!-- 좌측 사이드 네비게이션 바 끝 -->
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1 class="nametext1 ">1:1 문의</h1>
					<p class="test col-sm-offset-10">*은 필수 입력 입니다</p>
				</div>
				<!--제목라인-->
				<form class="form-horizontal">
					<div class="form-group nametext">
						<label for="bookname" class="col-md-offset-2 col-md-2">제목*
						</label>
						<div class="col-md-8">
							<input type="text" name="bookname" id="bookname"
								class="form-control" placeholder="제목을 입력해주세요">
						</div>
					</div>
					<!--제목끝-->
					<!--문의종류-->
					<div class="none">
						<div class="form-group padding">
							<label for="select" class="col-md-offset-2 col-md-2">문의종류*</label>
							<div class="col-md-8">
								<select class="form-control">
									<option>선택해주세요</option>
									<option>판매관련</option>
									<option>배송</option>
									<option>환불</option>
									<option>기타</option>
								</select>
							</div>
						</div>
					</div>
					<!--문의중류 긑-->
					<!--문의내용-->
					<div class="form-group none">
						<label for="text" class="col-md-offset-2 col-md-2">문의내용*</label>
						<div class="col-md-8">
							<textarea class="form-control " rows="3"
								placeholder="내용을 입력해 주세요"></textarea>
							<div class="btnpadding">
								<button type="submit" id="com1" class="btn btn-info">작성완료</button>
							</div>
						</div>
					</div>
				</form>
				<!--문의내용 끝-->
				<!--문의내역-->
				<div>
					<h2 class="nametext1">문의내역</h2>
					<hr />
				</div>
				<!--문의내역 테이블-->
				<div>
					<table class="table table-hover">
						<thead style="background-color: #eee;">
							<tr height="30px">
								<th class="text-center" width="15%">문의종류</th>
								<th class="text-center" width="55%">제목</th>
								<th class="text-center" width="25%">문의일시</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>종류</td>
								<td><a href="">10,000</a></td>
								<td>2016.09.13</td>
							</tr>
							<tr>
								<td>종류</td>
								<td><a href="">10,000</a></td>
								<td>2016.09.13</td>
							</tr>
							<tr>
								<td>종류</td>
								<td><a href="">10,000</a></td>
								<td>2016.09.13</td>
							</tr>
							<tr>
								<td>종류</td>
								<td><a href="">10,000</a></td>
								<td>2016.09.13</td>
							</tr>
							<tr>
								<td>종류</td>
								<td><a href="">10,000</a></td>
								<td>2016.09.13</td>
							</tr>
							<tr>
								<td>종류</td>
								<td><a href="">10,000</a></td>
								<td>2016.09.13</td>
							</tr>
							<tr>
								<td>종류</td>
								<td><a href="">10,000</a></td>
								<td>2016.09.13</td>
							</tr>
						</tbody>

					</table>
					<!--문의내역 테이블 끝-->
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 영역 끝 -->
		<!-- Grid Row 끝 -->
		<!-- Footer 영역 시작 -->

		<%@include file="/WEB-INF/inc/footer.jsp"%>
		<!-- Footer 영역 끝 -->
	</div>
</body>
</html>