<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    </style>

</head>

<body>

    <!-- ë¡ê³ , ìë¨ ë¤ë¹ê²ì´ì ë° -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">ë©ë´ ì´ê¸°</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
                <a class="navbar-brand" href="#">BaDa <span class="small">ADMIN</span></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#">ëìë³´ë</a></li>
                    <li><a href="#collapse-nav-item-shop" data-toggle="collapse">ì¼íëª° ê´ë¦¬</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-shop">
                            <li><a href="#">íìì£¼ë¬¸ë´ì­</a></li>
                            <li><a href="#">ê±°ëë´ì­</a></li>
                            <li><a href="#">ìíë±ë¡(ë°ë¤)</a></li>
                            <li><a href="#">ì¹ì¸ìì²­ê´ë¦¬</a></li>
                            <li><a href="#">ì£¼ë¬¸/ìê¸/ë² ì¡ê´ë¦¬</a></li>
                        </ul>
                    </li>
                    <li><a href="#collapse-nav-item-board" data-toggle="collapse">ê²ìí ê´ë¦¬</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-board">
                            <li><a href="#">1:1ë¬¸ì ê´ë¦¬</a></li>
                            <li><a href="#">ê³µì§ì¬í­ ê´ë¦¬</a></li>
                            <li><a href="#">ìì£¼ë¬»ë ì§ë¬¸ ê´ë¦¬</a></li>
                        </ul>
                    </li>
                    <li><a href="#collapse-nav-item-user" data-toggle="collapse">íì ê´ë¦¬</a>
                        <ul class="nav navbar-nav-inner collapse" id="collapse-nav-item-user">
                            <li><a href="#">íì ì ë³´</a></li>
                            <li><a href="#">íë§¤ì í</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- ë¡ê³ , ìë¨ ë¤ë¹ê²ì´ì ë° ë -->

    <!-- ì»¨íì´ë ìì­ -->
    <div class="container">
        <!-- ì¬ì´ë ë¤ë¹ê²ì´ì ë° -->
        <div class="col-sm-2 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">ëìë³´ë</a></li>
                <li><a href="#collapse-item-shop" data-toggle="collapse">ì¼íëª° ê´ë¦¬</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-shop">
                        <li><a href="#">íìì£¼ë¬¸ë´ì­</a></li>
                        <li><a href="#">ê±°ëë´ì­</a></li>
                        <li><a href="#">ìíë±ë¡(ë°ë¤)</a></li>
                        <li><a href="#">ì¹ì¸ìì²­ê´ë¦¬</a></li>
                        <li><a href="#">ì£¼ë¬¸/ìê¸/ë² ì¡ê´ë¦¬</a></li>
                    </ul>
                </li>
                <li><a href="#collapse-item-board" data-toggle="collapse">ê²ìí ê´ë¦¬</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-board">
                        <li><a href="#">1:1ë¬¸ì ê´ë¦¬</a></li>
                        <li><a href="#">ê³µì§ì¬í­ ê´ë¦¬</a></li>
                        <li><a href="#">ìì£¼ë¬»ë ì§ë¬¸ ê´ë¦¬</a></li>
                    </ul>
                </li>
                <li><a href="#collapse-item-user" data-toggle="collapse">íì ê´ë¦¬</a>
                    <ul class="nav nav-sidebar-inner collapse" id="collapse-item-user">
                        <li><a href="#">íì ì ë³´</a></li>
                        <li><a href="#">íë§¤ì í</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- ì¬ì´í¸ ë¤ë¹ê²ì´ì ë° ë -->
        <div class="row">
            <!-- ë©ì¸ ì»¨íì¸  ìì­ -->
            <div class="col-sm-offset-2 col-md-offset-2 main-content">

                <!-- ìì± ìì­ -->
                <!-- ë©ì¸ ì»¨íì¸  ìì­ ìì -->
            <div class="col-sm-9 col-md-10 main-content">
                <div class="page-header">
                    <h1>${bbsName}(ìì¸ë³´ê¸°)</h1>
                </div>
                <br />
                <form class="form-horizontal" id="myform">
                    <div class="form-group">
                        <label for="writer_name" class="col-md-2">ìì±ì:</label>
                        <div class="col-md-10">
                            <span>${readDocument.writerName} </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-md-2">ì ëª©:</label>
                        <div class="col-md-10">
                            <span> ${readDocument.title} </span>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="content" class="col-md-2">ë´ì©:</label>
                        <div class="col-md-10">
                            <span> ${readDocument.content} </span>
                        </div>
                    </div>
                    <div class="page-header"></div>
                        <div class="form-group">
                        <div class="mar col-md-7">
                            <a href="${pageContext.request.contextPath}/document_list.do?category=${category}" 
                            class="btn btn-primary">ëª©ë¡</a>
                        </div>
                    </div>
                </form>
            </div>
            <!-- ë©ì¸ ì»¨íì¸  ìì­ ë -->
                <!-- ìì± ìì­ ë -->
            </div>
            <!-- ë©ì¸ ì»¨íì¸  ìì­ ë -->
        </div>
    </div>
    <!-- ì»¨íì´ë ë -->


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
