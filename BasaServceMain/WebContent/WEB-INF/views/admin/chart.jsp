<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
 <%@include file="/WEB-INF/inc/admin_head.jsp"%>
    <style media="screen" type="text/css">
         /*마지막 선 만들기*/
        table:last-child{
            border-bottom: 1px solid #ccc;
        }
        /*대시보드 크기 위치 조정*/
        #chartdiv {
        width   : 100%;
        height  : 300px;
        margin-left: auto;
        margin-right: 100px;
        }                               
    </style>
    
</head>

<body>


   <%@include file="/WEB-INF/inc/admin_topbar.jsp"%>

    <!-- 컨테이너 영역 -->
    <div class="container">

     
        <%@include file="/WEB-INF/inc/admin_siderbar.jsp"%>

        <div class="row">
            <!-- 메인 컨텐츠 영역 -->
            <div class="col-sm-offset-2 col-md-offset-2 main-content">

                <!-- 작성 영역 -->
                <div class="page-header">
                  <h1>대시보드</h1>
                </div>
                <!-- 작성 영역 끝 -->
                <!--대시보드 텍스트-->
                <div id="chartdiv">
                </div>
                <div class="table-responsive">
                <!--대시보드 텍스트 끝-->
                <!--대시보드 메인-->
                    <table class="table table-hover">
                        <thead style="background-color : #eee;">
                <!--대시보드 메인끝-->
                <!--대시보드 테이블-->
                            <tr>
                                <th class="text-center" width="20%">no</th>
                                <th class="text-center" width="40%">제목</th>
                                <th class="text-center" width="40%">판매자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr align="center">
                                <td>1.</td>
                                <td>칭찬은 고래도 춤추게한다</td>
                                <td>해밍웨이</td>
                            </tr>
                            <tr align="center">
                                <td>2.</td>
                                <td>난정말 자바를 공부한적이 없다구요</td>
                                <td>남궁성</td>
                            </tr>
                            <tr align="center">
                                <td>3.</td>
                                <td>트위스트킹</td>
                                <td>김종국</td>
                            </tr>
                            <tr align="center">
                                <td>4.</td>
                                <td>원피스</td>
                                <td>오다 에이치로</td>
                            </tr>
                        </tbody>
                    </table>
                    <!--대시보드 테이블 끝-->
            </div>
            <!-- 메인 컨텐츠 영역 끝 -->
        </div>
    </div>
    <!-- 컨테이너 끝 -->
</div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
        <script src="https://www.amcharts.com/lib/3/serial.js"></script>
        <script src="https://www.amcharts.com/lib/3/themes/patterns.js"></script>
        <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />

       
        <script type="text/javascript">
            


$.get("${pageContext.request.contextPath }/ChartData.do", function(chartData) {

    var chart = AmCharts.makeChart("chartdiv", {
	    "type": "serial",
	    "theme": "patterns",
	    "legend": {
	        "useGraphSettings": true
	    },
	    "dataProvider": chartData,
	    "synchronizeGrid":true,
	    "valueAxes": [{
	        "id":"v1",
	        "axisColor": "#FF6600",
	        "axisThickness": 2,
	        "axisAlpha": 3,
	        "position": "left"
	    }, {
	        "id":"v3",
	        "axisColor": "#B0DE09",
	        "axisThickness": 2,
	        "gridAlpha": 0,
	        "offset": 50,
	        "axisAlpha": 1,
	        "position": "left"
	    }],
	    "graphs": [{
	        "valueAxis": "v1",
	        "lineColor": "#FF6600",
	        "bullet": "round",
	        "bulletBorderThickness": 1,
	        "hideBulletsCount": 30,
	        "title": "오늘 신규 회원",
	        "valueField": "visits",
	        "fillAlphas": 0
	    }, {
	        "valueAxis": "v3",
	        "lineColor": "#B0DE09",
	        "bullet": "triangleUp",
	        "bulletBorderThickness": 1,
	        "hideBulletsCount": 30,
	        "title": "일일 거래량",
	        "valueField": "views",
	        "fillAlphas": 0
	    }],
	    "chartScrollbar": {},
	    "chartCursor": {
	        "cursorPosition": "mouse"
	    },
	    "categoryField": "date",
	    "categoryAxis": {
	        "parseDates": true,
	        "axisColor": "#DADADA",
	        "minorGridEnabled": true
	    },
	    "export": {
	        "enabled": true,
	        "position": "bottom-right"
	     }
	});
});



</script>
</body>

</html>
