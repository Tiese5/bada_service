<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<!-- Grid Row 시작 -->
		<div class="row">
			<%@ include file="/WEB-INF/inc/my_sidebar.jsp"%>
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h2>회원에게 판매</h2>
				</div>
				<p class="col-md-offset-2 text-warning">*은 필수 입력입니다.</p>
				<form class="form-horizontal" id="myform" method="post"
					action="${pageContext.request.contextPath}/shop/item_add_ok.do"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="b_title" class="col-md-2">도서명*</label>
						<div class="col-md-8">
							<input type="text" name="item_title" id="item_title"
								class="form-control">
						</div>
					</div>
					<div class="form-group padding">
						<label for="category" class="col-md-2">카테고리*</label>
						<div class="col-md-8">
							<select class="form-control" name="category" id="category">
								<option value="">---카테고리---</option>
								<option value="1">학문</option>
								<option value="2">소설</option>
								<option value="3">자기계발</option>
								<option value="4">정기 간행물</option>
								<option value="5">어린이 도서</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label for="s_price" class="col-md-2">판매가*</label>
						<div class="col-md-4">
							<input type="text" name="price" id="price" class="form-control">
						</div>
						<div class="col-md-4 clearfix">
							<span class="text-danger pull-right">-판매 수수료는 10%입니다.</span>
						</div>
					</div>
					<div class="form-group">
						<label for="profile_img" class="col-md-2">도서 이미지</label>
						<div class="col-md-8">
							<input type="file" name="item_image" id="item_image"
								class="form-control">
						</div>				
					</div>
					<div class="form-group">
						<div class="col-md-offset-2 col-md-8">
							<button type="submit" class="btn btn-info btn-lg" id="sale_reg">판매등록</button>
						</div>
					</div>
				</form>
			</div>
			<!-- 메인 컨텐츠 영역 끝 -->
		</div>
		<!-- Grid Row 끝 -->
		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>
</body>

</html>
