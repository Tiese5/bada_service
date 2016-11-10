<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BaDa Admin</title>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style media="screen" type="text/css">
        /* Hide for mobile, show later */
        .sidebar {
            display: none;
        }
        .main-content {
            margin-top: 70px;
        }
        @media (min-width: 768px) {
            .sidebar {
                position: fixed;
                top: 51px;
                bottom: 0;
                left: 0;
                z-index: 1000;
                display: block;
                padding: 20px;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
                background-color: #f5f5f5;
                border-right: 1px solid #eee;
            }
            .navbar-nav {
                display: none;
            }
        }
        /* Sidebar navigation */
        .nav-sidebar {
          margin-right: -21px; /* 20px padding + 1px border */
          margin-bottom: 20px;
          margin-left: -20px;
        }
        .nav-sidebar > li > a {
          padding-right: 20px;
          padding-left: 20px;
        }
        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
          color: #fff;
          background-color: #428bca;
        }
        /* Sidebar-inner navigation */
        .nav-sidebar-inner {
          margin-right: -21px; /* 20px padding + 1px border */
          margin-left: -20px;
        }
        .nav-sidebar-inner > li > a {
          padding-right: 50px;
          padding-left: 20px;
          text-align: right;
          color: #0e348b;
        }
        .nav-sidebar-inner > li:first-child {
            border-top: 1px solid #eee;
        }
        .nav-sidebar-inner > li:last-child {
            border-bottom: 1px solid #eee;
        }
        .nav-sidebar-inner > .active > a,
        .nav-sidebar-inner > .active > a:hover,
        .nav-sidebar-inner > .active > a:focus {
          color: #fff;
          background-color: #428bca;
        }

        .navbar-nav-inner > li > a {
          padding-right: 50px;
          padding-left: 20px;
          text-align: right;
          color: #888;
        }
        .navbar-nav-inner > li:first-child {
            border-top: 1px solid #eee;
        }
        .navbar-nav-inner > li:last-child {
            border-bottom: 1px solid #eee;
        }
        .navbar-nav-inner > .active > a,
        .navbar-nav-inner > .active > a:hover,
        .navbar-nav-inner > .active > a:focus {
          color: #fff;
          background-color: #999;
        }
        .btn {
            
            margin-left: 900px;
          
        }
        .main-content{
            margin-top: 30px;
        }

    </style>

</head>

<body>

    <!-- 로고, 상단 네비게이션 바 -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">메뉴 열기</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
                <a class="navbar-brand" href="#">BaDa <span class="small">ADMIN</span></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#">대시보드</a></li>
                    <li><a href="#collapse-nav-item-shop" data-toggle="collapse">쇼핑몰 관리</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-shop">
                            <li><a href="#">회원주문내역</a></li>
                            <li><a href="#">거래내역</a></li>
                            <li><a href="#">상품등록(바다)</a></li>
                            <li><a href="#">승인요청관리</a></li>
                            <li><a href="#">주문/입금/베송관리</a></li>
                        </ul>
                    </li>
                    <li><a href="#collapse-nav-item-board" data-toggle="collapse">게시판 관리</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-board">
                            <li><a href="#">1:1문의 관리</a></li>
                            <li><a href="#">공지사항 관리</a></li>
                            <li><a href="#">자주묻는 질문 관리</a></li>
                        </ul>
                    </li>
                    <li><a href="#collapse-nav-item-user" data-toggle="collapse">회원 관리</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-user">
                            <li><a href="#">회원 정보</a></li>
                            <li><a href="#">판매자 평</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 로고, 상단 네비게이션 바 끝 -->

    <!-- 컨테이너 영역 -->
    <div class="container">
        <!-- 사이드 네비게이션 바 -->
        <div class="col-sm-2 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">대시보드</a></li>
                <li><a href="#collapse-item-shop" data-toggle="collapse">쇼핑몰 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-shop">
                        <li><a href="#">회원주문내역</a></li>
                        <li><a href="#">거래내역</a></li>
                        <li><a href="#">상품등록(바다)</a></li>
                        <li><a href="#">승인요청관리</a></li>
                        <li><a href="#">주문/입금/베송관리</a></li>
                    </ul>
                </li>
                <li><a href="#collapse-item-board" data-toggle="collapse">게시판 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-board">
                        <li><a href="#">1:1문의 관리</a></li>
                        <li><a href="#">공지사항 관리</a></li>
                        <li><a href="#">자주묻는 질문 관리</a></li>
                    </ul>
                </li>
                <li><a href="#collapse-item-user" data-toggle="collapse">회원 관리</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-user">
                        <li><a href="#">회원 정보</a></li>
                        <li><a href="#">판매자 평</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- 사이트 네비게이션 바 끝 -->
        <div class="row">
            <!-- 메인 컨텐츠 영역 -->
            <div class="col-sm-offset-2 col-md-offset-2 main-content">
 <div class="col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h1>보낸 쪽지 목록</h1>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead style="background-color : #eee;">
                            <tr>
                                
                                <th class="text-center" width="20%">받는이</th>
                                <th class="text-center" width="50%">제목</th>
                                <th class="text-center" width="30%">받은날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                           <c:choose>
                    <c:when test="${fn:length(messengerList) > 0}">
                        <c:forEach var="messenger" items="${messengerList}">
                            <tr>
                                <td class="text-center">${messenger.receiverName}</td>
                                <td class="text-center">
                                    <c:url var="readUrl" value="/bbs/document_read.do">
                                        <c:param name="category" value="${document.category}" />
                                        <c:param name="document_id" value="${document.id}" />
                                    </c:url>
                                    <a href="${readUrl}">${document.content}</a>
                                </td> 
                                <td class="text-center">${messenger.regDate}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3" class="text-center" style="line-height: 100px;">
                                조회된 글이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                        </tbody>
                  <tfoot>
                         <tr><td colspan="3" class="text-center"></td></tr>
                  </tfoot>
                    </table>
                        <!-- 페이지 번호 시작 -->
                        <nav class="text-center">
                            <ul class="pagination">
                                <!-- 이전 그룹으로 이동 -->
                                <c:choose>
                                    <c:when test="${pageHelper.prevPage > 0}">
                                        <!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
                                        <!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
                                        <c:url var="prevUrl" value="/message.do">                                           
                                            <c:param name="page" value="${pageHeler.prevPage}"></c:param>
                                        </c:url>
                                        
                                        <li><a href="${prevUrl}">&laquo;</a></li>
                                    </c:when>
                                    
                                    <c:otherwise>
                                        <!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
                                        <li class="disabled"><a href="#">&laquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                                
                                <!-- 페이지 번호 -->
                                <!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
                                <c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage}" step="1">
                                    <!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url 에 저장 -->
                                    <c:url var="pageUrl" value="/message.do">                                       
                                        <c:param name="page" value="${i}"></c:param>
                                    </c:url>
                                    
                                <!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
                                    <c:choose>
                                        <c:when test="${pageHelper.page == i}">
                                            <li class="active"><a href="#">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="${pageUrl}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                
                                <!-- 다음 그룹으로 이동 -->
                                <c:choose>
                                    <c:when test="${pageHelper.nextPage > 0}">
                                        <!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
                                        <!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
                                        <c:url var="nextUrl" value="/message.do">                                           
                                            <c:param name="page" value="${pageHelper.nextPage}"></c:param>
                                        </c:url>
                                        
                                        <li><a href="${nextUrl}">&raquo;</a></li>       
                                    </c:when>
                                    
                                    <c:otherwise>
                                        <!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
                                        <li class="disabled"><a href="#">&raquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>                      
                        <!-- // 페이지 번호 끝 -->
                    </table>
                </div>
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->
        </div>
    </div>
    <!-- 컨테이너 끝 -->


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
