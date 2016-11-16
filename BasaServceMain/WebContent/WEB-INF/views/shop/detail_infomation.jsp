<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<script
	src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.css">
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

.btns{
	margin-left: 30px;
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		
		<!-- Grid Row 시작 -->
		<div class="row">
			<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
			<!-- 메인 컨텐츠 영역 시작 -->
			<div class="test col-sm-9 col-md-10 main-content">
				<div class="page-header">
					<h1>제품 상세</h1>
				</div>
				<div class="image col-md-9 clearfix">

					<c:if test="${readItem.item_image != null }">
						<c:url var="downloadUrl" value="/download.do">
							<c:param name="file" value="${readItem.item_image}"></c:param>
							<c:param name="category" value="${shop.category}"></c:param>
						</c:url>
						<img src="${downloadUrl}" style="float: left" width="190px"
							height="200px" />
					</c:if>

					<ul class="size">
						<li><h2>
								<strong>${readItem.item_title}</strong>
							</h2></li>
						<li><h3>등록일: ${readItem.reg_date}</h3></li>
						<li><h3>
								판매자: <a
									href="${pageContext.request.contextPath}/message_send.do?user_id=${readMember.user_id}"
									id="nameid"> ${readItem.memberName}</a>
							</h3></li>               
						<li><h3>
								<strong class="color">${readItem.price}</strong>원
							</h3></li>
					</ul>
									
							<a href="${pageContext.request.contextPath}/shop/cart_ok.do?id=${readItem.id}"
								class="btns btn btn-warning" id="cart">장바구니</a>
							<a href></a>
					
				</div>
				<div class="marg col-md-12">
					<h1>책 정보</h1>
					<hr />
					<div class="item-info">
					
					</div>
				</div>
			</div>
			<!-- 메인 컨텐츠 영역 끝 -->

		</div>
		<!-- Grid Row 끝 -->

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	
	</div>

	<script type="text/x-handlebars-template" id="info-template">
	{{#channel.item}}
		<table>
			<tr>
			<td rowspan="6">
				<img src="{{cover_l_url}} art="{{title}}"></td>
			</tr>
			<tr>
				<td style=padding-left:20px;>저자: {{etc_author}}</td>
			</tr>
			<tr>
				<td style=padding-left:20px;>출판사 : {{pub_nm}}</td>
			</tr>
			<tr>
				<td style=padding-left:20px;>출판일 : {{pub_date}}</td>
			</tr>
			<tr>
				<td style=padding-left:20px;>판매가 : {{sale_price}} 원</td>
			</tr>
			<tr>
				<td style=padding-left:20px;>설명 : {{description}}</td>
			</tr>
		</table>
		{{/channel.item}}
	</script>

	<script type="text/javascript">
	$(function(){
		$.get("${pageContext.request.contextPath }/shop/item_info.do",{
			//접속하고자 하는 다른 사이트 JSON 주소
			csurl:'http://apis.daum.net/search/book',
			apikey:'541b6a841fff529d9865476dacbbf679',
			q:"${readItem.item_title}",
			result:1,
			output:'json'
		},function(req){
			
			//미리 준비한 HTML틀을 읽어온다.
			var tmplate = Handlebars.compile($("#info-template").html());
			//ajax를 통해서 읽어온 내부의 배열데이터를 템플릿에 병합한다
			var html = tmplate(req);
			//#result에 읽어온 내용을 추가한다
			$(".item-info").append(html);
		});
	}); 
	</script>
</body>

</html>
