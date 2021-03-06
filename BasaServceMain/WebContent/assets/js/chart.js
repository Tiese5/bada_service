function showChart(divName, chartData) {
	alert("23234");
	var chart = AmCharts.makeChart(divName, {
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
	        "title": "일일 거래량",
	        "valueField": "visits",
	        "fillAlphas": 0
	    }, {
	        "valueAxis": "v3",
	        "lineColor": "#B0DE09",
	        "bullet": "triangleUp",
	        "bulletBorderThickness": 1,
	        "hideBulletsCount": 30,
	        "title": "오늘 신규 회원",
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
	
	
};