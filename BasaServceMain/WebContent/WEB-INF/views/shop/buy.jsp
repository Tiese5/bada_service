<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="/WEB-INF/inc/head.jsp" %>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/postcode/postcode.js"></script>
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
                  
         
                     <c:forEach var="cart" items="${cartList}">
                        <tr>
                            <td><a href="${pageContext.request.contextPath}/shop/shop_read.do"><c:if test="${cart.itemImage != null }">
						<c:url var="downloadUrl" value="/download.do">
							<c:param name="file" value="${cart.itemImage}">
							</c:param>
						</c:url>
						<img src="${downloadUrl}" style="float: left" width="190px" height="200px" />
					</c:if></a></td>
                            <td><a href="${pageContext.request.contextPath}/shop/shop_read.do">${cart.itemTitle}</a></td>
                            <td>${cart.memberName}</td>
                            <td><span class="text-danger">${cart.price}</span> 원</td>
                            <td>${cart.editDate}</td>
                       </tr>
                     	</c:forEach>
                     	
                 
                        
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-offset-1 row">
            <h4 class="col-md-2">총 구매 금액</h4>
            <div class="col-md-10">
                <h4><span class="text-danger">${sum}</span> 원</h4>
            </div>
        </div>
        <form class="form-horizontal" id="myform" method="post" action="${pageContext.request.contextPath}/shop/buy_ok.do">
            <div class="row col-md-offset-1">
                <h4 class="col-md-2">배송지 주소</h4>
                <div class="col-md-10 form-group" style="margin-top:10px;">
                    <div class="col-md-12 clearfix" style="margin-bottom:15px;">
   
                        <input type="text" name="postcode" id="postcode" class="test form-control pull-left" style="width: 120px; margin-right: 5px;" value="${postcode}">
                        <input type="button" value="우편번호 찾기" class="btn btn-warning" onclick='execDaumPostcode("postcode", "addr1", "addr2");'>
                    </div>
                    <div class="col-md-8" style="margin-bottom:15px;"><input type="text" name="addr1" id="addr1" class="form-control"  value="${addr1}"></div>
                    <div class="col-md-8"><input type="text" name="addr2" id="addr2" class="form-control" value="${addr2}"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-5">
                    <button type="submit" class="btn btn-primary btn-lg buy">구매하기</button>
                </div>
            </div>
        </form>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>

</body>

</html>
