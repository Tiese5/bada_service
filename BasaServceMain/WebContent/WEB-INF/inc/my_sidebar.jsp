<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
 <!-- 좌측 사이드 네비게이션 바 -->
            <div class="col-sm-3 col-md-2 side-menu">
                <h5 class="list-title text-info"> - 카테고리</h5>
                <ul class="nav nav-side-menu list-title">

                    <li><a href="${pageContext.request.contextPath }/member/info.do">내정보</a></li>
                    <li><a href="${pageContext.request.contextPath }/member/edit_ok.do">정보수정</a></li>
                    <li><a href="${pageContext.request.contextPath }/cart.do">장바구니</a></li>
                    <li><a href="${pageContext.request.contextPath }/order_check.do">주문/배송 조회</a></li>
                    <li><a href="${pageContext.request.contextPath }/buylist.do">구매내역</a></li>
                    <li><a href="${pageContext.request.contextPath }/message_send.do">쪽지 쓰기</a></li>
                    <li><a href="${pageContext.request.contextPath }/message.do">보낸 쪽지함</a></li>
                    <li><a href="${pageContext.request.contextPath }/message_get.do">받은 쪽지함</a></li>

                </ul>
                <ul class="nav nav-side-menu list-title">
                    <li><a href="${pageContext.request.contextPath }/sale.do">회원에게 판매</a></li>
                    <li><a href="${pageContext.request.contextPath }/trade.do">판매내역</a></li>
                </ul>
                <ul class="nav nav-side-menu list-title">
                    <li><a href="${pageContext.request.contextPath }/qna/qna.do">1:1 문의</a></li>
                    <li><a href="${pageContext.request.contextPath}/member/out.do">탈퇴하기</a></li>
                </ul>
            </div>
            <!-- 좌측 사이드 네비게이션 바 끝 -->
		<script type="text/javascript">
			$(function() {
				$(window).scroll(function() {
					$(".side-menu").animate({"top": $(this).scrollTop()}, {queue: false, ducation: 50, easing: "swing"});
					
				});
			});
		</script>

