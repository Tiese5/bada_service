<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="/WEB-INF/inc/admin_head.jsp"%>
</head>

<body>

    <%@include file="/WEB-INF/inc/admin_topbar.jsp"%>

    <!-- 컨테이너 영역 -->
    <div class="container">
       <%@include file="/WEB-INF/inc/admin_head.jsp"%>
        <div class="row">
               <%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>
            <!-- 메인 컨텐츠 영역 -->
            <div class="col-sm-offset-2 col-md-offset-2 main-content">

                <!-- 작성 영역 -->
                <div class="page-header">
                  <h1>${bbsName} 수정</h1>
                </div>
                <form class="form-horizontal" id="myform" method="post" action="${pageContext.request.contextPath}/admin_document_edit_ok.do">
                	<input type="hidden" name="document_id" id="document_id" value="${readDocument.id}" />
                	<input type="hidden" name="category" id="category" value="${category}"/>
                    <div class="form-group">
                        <label for="n_title" class="col-md-2">제목</label>
                        <div class="col-md-8"><input type="text" name="title" id="title" class="form-control" value="${readDocument.title}"></div>
                    </div>
                    <div class="form-group">
                        <label for="n_content" class="col-md-2">공지사항 내용</label>
                        <div class="col-md-8">
                            <textarea name="content" id="content" rows="10" class="form-control">${readDocument.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-8 clearfix">
                            <button type="submit" class="btn btn-primary pull-right">수정</button>
                        </div>
                    </div>
                </form>
                <!-- 작성 영역 끝 -->

            </div>
            <!-- 메인 컨텐츠 영역 끝 -->
        </div>
    </div>
    <!-- 컨테이너 끝 -->


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>