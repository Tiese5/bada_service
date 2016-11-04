<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
 <%@ include file="/WEB-INF/inc/head.jsp" %>
    <style media="screen" type="text/css">
        .total {
            margin-top: 40px;
        }

        .color {
            color: #ff0000;
        }

        .size {
            font-size: 1.4em;
            margin-top: 30px;
            padding-bottom: 30px;
        }
          .table > tbody > tr > td {
            text-align: center;
            vertical-align: middle !important;
        }

        .button {
            margin-top: 30px;
        }
        /*상단바 끝*/
    </style>
</head>

<body>
<%@ include file="/WEB-INF/inc/topbar.jsp" %>
    <div class="container">
        <!-- Grid Row 시작 -->
        <div class="row">
<%@ include file="/WEB-INF/inc/sidebar.jsp" %>
            <!-- 메인 컨텐츠 영역 시작 -->
            
            <div class="col-sm-9 col-md-10 main-content" >
                <div class="page-header">
                    <h1>장바구니</h1>
                </div>
                <table class="table table-hover">
                    <thead style="background-color : #eee;">
                        <tr>
                            <th class="text-center" width="20%">표지</th>
                            <th class="text-center" width="20%">책 제목</th>
                            <th class="text-center" width="20%">판매자</th>
                            <th class="text-center" width="15%">가격</th>
                            <th class="text-center" width="15%">담은시간</th>
                            <th class="text-center" width="10%">삭제여부</th>
                            
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
                            <td><a href="${pageContext.request.contextPath}/shop/cart_delete_ok.do?cartid=${cart.id}" class="btn btn-danger">삭제</a>
                       </tr>
                        
                        
              			</c:forEach>
              			
              		
                      
                    </tbody>
                </table>
                </form>
                <h1 class="total">총 금액</h1>
                <hr />
                <div class="col-md-3">
                 <label for="price" class="size pull-right"><strong class="color">${sum}</strong>원</label>
                </div>
                <div class="button col-md-8">
                    <a href="${pageContext.request.contextPath}/shop/buy.do" class="btn btn-primary pull-right">구매하기</a>
                </div>
            
              
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->

        </div>
        <!-- Grid Row 끝 -->
<%@ include file="/WEB-INF/inc/footer.jsp" %>
    </div>

</body>

</html>
