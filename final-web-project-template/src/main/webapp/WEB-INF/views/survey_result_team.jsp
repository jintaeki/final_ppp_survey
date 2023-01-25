<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/survey_result_team.css">

<script src="resources/js/surveyresult.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<div class="container">

<div class="result_container">
	<div class="row">
		<div class="col-1">프로젝트명</div>
		<div class="col-2" style="font-size: 90%; width: 100px">${mapping.project_name}</div>
		<div class="col-1">기간</div>
		<div class="col-2" style="font-size: 90%">${mapping.project_start_date}</div>
		<div class="col-2" style="font-size: 90%">${mapping.project_closed_date}</div>
		<div class="col-1">부서</div>
		<div class="col-2">${mapping.departmentName}</div>
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
      data: [
        {
          name: 'SI사업부 1팀',
          y: 63.06, /* 팀 전체 스코어 */
          drilldown: 'SI사업부 1팀'
        },
        {
          name: 'SI사업부 2팀',
          y: 19.84,
          drilldown: 'SI사업부 2팀'
        },
        {
          name: 'SI사업부 3팀',
          y: 4.18,
          drilldown: 'SI사업부 3팀'
        },
        {
          name: 'SI사업부 4팀',
          y: 4.12,
          drilldown: 'SI사업부 4팀'
        },
        {
          name: 'SI사업부 5팀',
          y: 2.33,
          drilldown: 'SI사업부 5팀'
        },
        {
          name: 'SI사업부 6팀',
          y: 50.45,
          drilldown: 'SI사업부 6팀'
        },
        {
          name: '정보기술연구소',
          y: 1.582,
          drilldown: null
        }
      ]
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
            'v65.0',
            0.1
          ],
          [
            'v64.0',
            1.3
          ],
          [
            'v63.0',
            53.02
          ],
          [
            'v62.0',
            1.4
          ],
          [
            'v61.0',
            0.88
          ],
          [
            'v60.0',
            0.56
          ],
          [
            'v59.0',
            0.45
          ],
          [
            'v58.0',
            0.49
          ],
          [
            'v57.0',
            0.32
          ],
          [
            'v56.0',
            0.29
          ],
          [
            'v55.0',
            0.79
          ],
          [
            'v54.0',
            0.18
          ],
          [
            'v51.0',
            0.13
          ],
          [
            'v49.0',
            2.16
          ],
          [
            'v48.0',
            0.13
          ],
          [
            'v47.0',
            0.11
          ],
          [
            'v43.0',
            0.17
          ],
          [
            'v29.0',
            0.26
          ]
        ]
      },
      {
        name: 'SI사업부 2팀',
        id: 'SI사업부 2팀',
        data: [
          [
            'v58.0',
            1.02
          ],
          [
            'v57.0',
            7.36
          ],
          [
            'v56.0',
            0.35
          ],
          [
            'v55.0',
            0.11
          ],
          [
            'v54.0',
            0.1
          ],
          [
            'v52.0',
            0.95
          ],
          [
            'v51.0',
            0.15
          ],
          [
            'v50.0',
            0.1
          ],
          [
            'v48.0',
            0.31
          ],
          [
            'v47.0',
            0.12
          ]
        ]
      },
      {
        name: 'SI사업부 3팀',
        id: 'SI사업부 3팀',
        data: [
          [
            'v11.0',
            6.2
          ],
          [
            'v10.0',
            0.29
          ],
          [
            'v9.0',
            0.27
          ],
          [
            'v8.0',
            0.47
          ]
        ]
      },
      {
        name: 'SI사업부 4팀',
        id: 'SI사업부 4팀',
        data: [
          [
            'v11.0',
            3.39
          ],
          [
            'v10.1',
            0.96
          ],
          [
            'v10.0',
            0.36
          ],
          [
            'v9.1',
            0.54
          ],
          [
            'v9.0',
            0.13
          ],
          [
            'v5.1',
            0.2
          ]
        ]
      },
      {
        name: 'SI사업부 5팀',
        id: 'SI사업부 5팀',
        data: [
          [
            'v16',
            2.6
          ],
          [
            'v15',
            0.92
          ],
          [
            'v14',
            0.4
          ],
          [
            'v13',
            0.1
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
      }
    ]
  }
});
/* CHART END */
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>