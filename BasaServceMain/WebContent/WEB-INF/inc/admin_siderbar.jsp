<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
 <!-- 사이드 네비게이션 바 -->
        <div class="col-sm-2 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">대시보드</a></li>
                <li><a href="#collapse-item-shop" data-toggle="collapse">쇼핑몰 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-shop">
                        <li><a href="${pageContext.request.contextPath}/admin/shop/TrList">거래내역</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin_order_select.do">주문/입금/베송관리</a></li>
                    </ul>
                </li>
                <li><a href="#collapse-item-board" data-toggle="collapse">게시판 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-board">
                        <li><a href="${pageContext.request.contextPath}/admin/qna.do">1:1문의 관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin_document_list.do?category=n">공지사항 관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin_document_list.do?category=f">자주묻는 질문 관리</a></li>
                    </ul>
                </li>
                <li><a href="#collapse-item-user" data-toggle="collapse">회원 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-user">
                        <li><a href="${pageContext.request.contextPath}/admin/member/user_manage.do">회원 정보</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- 사이트 네비게이션 바 끝 -->