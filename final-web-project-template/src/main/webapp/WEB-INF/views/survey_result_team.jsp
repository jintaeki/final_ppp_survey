<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey_result_team.css">
	
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<div class="container">

<div class="result_container">
	<div class="hmenu">
		<div class="survey_list_form_upper_dv">
			<form action="<c:url value='/survey/surveyresultDetail'/>" method="get" class="survey_list_form">
				<select name="surveySeq">
					<c:forEach items="${Sdt}" var="sdt">
								<c:if test="${surveySeq eq sdt.surveySeq}">
									<option selected value="${surveySeq}">${sdt.surveyName}</option>
								</c:if>
								<c:if test="${surveySeq ne sdt.surveySeq}">
									<option value="${sdt.surveySeq}">${sdt.surveyName}</option>
								</c:if>
							</c:forEach>
				</select> 
				<div class="input-group-append">
					<input type="submit" class="btn btn-outline-secondary"
						id="button-addon2" value="검색">
					<input type="reset" class="btn btn-outline-secondary"
						id="button-addon2" value="초기화">
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-2">설문조사 명</div>
		<div id=svName class="col-2" style="font-size: 90%; width: 100px"></div>
		<div class="col-1">기간</div>
		<div id=stDate class="col-2" style="font-size: 90%"></div>
		<div id=clDate class="col-2" style="font-size: 90%"></div>
	</div>
</div>

<!-- CHART -->
<figure class="highcharts-figure">
  <div id="chart_container"></div>
  <p class="highcharts-description">
  다면평가에 대한 팀별 결과를 조회합니다. <br>부서명을 선택하면 소속 팀원들의 결과를 조회할 수 있습니다.
  </p>
</figure>


</div>

<script>
	var todayInfo = null;
	
	function getPersonCnt(type){
	    if(todayInfo==null) todayInfo=${chartJSONResult};	
	    var todayInfoMap = resultProcLineChart(todayInfo);
	    if(todayInfoMap==null) return null;
	    if(type=="data"){
	        return todayInfoMap.get("data");
	    }else{
	        return todayInfoMap.get("cateArr");
	    }
	}
	
	function resultProcLineChart($obj){
	    if($obj==null) return null;        
	    var resMap = new Map();
	    
	    var cateArr = new Array();
	    var dataArr = new Array();
	    
	    for(var k in $obj){
	        var xobj =$obj[k];
	        
	        cateArr.push(xobj.d);    
	        dataArr.push(xobj.s);             
	    }
	    
	    resMap.set("cateArr",cateArr);
	    resMap.set("data",dataArr);
	    
	    return resMap;
	} 

/* CHART START */
// Create the chart
Highcharts.chart('chart_container', {
  chart: {
    type: 'column'
  },
  title: {
    align: 'left',
    text: '다면평가 결과 통계'
  },
  subtitle: {
    align: 'left',
    text: '평가 결과는 소중한 직원을 나타내는 수치가 아니므로, <br>체계적인 코칭과 피드백 수립을 위한 목적으로만 참고하시길 바랍니다.'
  },
  accessibility: {
    announceNewData: {
      enabled: true
    }
  },
  xAxis: {
    type: 'category'
  },
  yAxis: {
    title: {
      text: 'score'
    }

  },
  legend: {
    enabled: false
  },
  plotOptions: {
    series: {
      borderWidth: 0,
      dataLabels: {
        enabled: true,
        format: '{point.y:.1f}%'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
  },

  series: [
    {
      name: '전체',
      colorByPoint: true,
      data: getPersonCnt("data")
      
    }
  ],
  drilldown: {
    breadcrumbs: {
      position: {
        align: 'right'
      }
    },
    series: [
      {
        name: 'SI사업부 1팀',
        id: 'SI사업부 1팀',
        data: [
          [
            '양은석',
            0.1
          ]
        ]
      },
      {
        name: 'SI사업부 2팀',
        id: 'SI사업부 2팀',
        data: [
          [
            '권성하',
            1.02
          ]
        ]
      },
      {
        name: 'SI사업부 3팀',
        id: 'SI사업부 3팀',
        data: [
          [
            '손연재',
            6.2
          ]
        ]
      },
      {
        name: 'SI사업부 4팀',
        id: 'SI사업부 4팀',
        data: [
          [
            '예선우',
            3.39
          ]
        ]
      },
      {
        name: 'SI사업부 5팀',
        id: 'SI사업부 5팀',
        data: [
          [
            '최기혁',
            2.6
          ],
          [
            '백희철',
            0.92
          ]
        ]
      },
      {
        name: 'SI사업부 6팀',
        id: 'SI사업부 6팀',
        data: [
          [
            'v50.0',
            0.96
          ],
          [
            'v49.0',
            0.82
          ],
          [
            'v12.1',
            0.14
          ]
        ]
      },
      {
          name: '정보기술연구소',
          id: '정보기술연구소',
          data: [
            [
              '김민혁',
              0.96
            ],
            [
              '장시호',
              0.82
            ],
            [
              '문은혜',
              0.14
            ]
            ,
            [
              '황정현',
              0.14
            ]
            ,
            [
              '윤미정',
              0.14
            ]
            ,
            [
              '윤창환',
              0.14
            ]
          ]
        }
    ]
  }
});
/* CHART END */
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>