<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey_result_team.css">

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

	<div class="card">
			<div class="forshadowing">
				<div class="result_container">
					<div class="hmenu">
						<table class="table table-bordered">
							<thead class="chartselect">
								<tr>
									<th scope="col">
										<form action="<c:url value='/survey/surveyresultDetail.do'/>"
											method="get" class="survey_list_form">
											<select name="surveySeq" id="surveySeq" onchange="typeFn();">
												<option value="1">--선택--</option>
												<c:forEach items="${Sdt}" var="sdt">
													<option value="${sdt.surveySeq}">${sdt.surveyName}</option>
												</c:forEach>
											</select>
											<div id="select" style="display: none;">
												<select name="departmentId" id="departmentId">
												</select>
											</div>
											<div class="input-group-append">
												<input type="submit" class="btn btn-outline-secondary"
													id="button-addon2" value="검색"> 
											    <input type="reset" class="btn btn-outline-secondary" 
											        id="button-addon2" value="초기화">
											</div>
										</form>
									</th>
									<th scope="col">${surveyName}</th>
									<th scope="col">${departmentName}</th>
								</tr>
							</thead>
						</table>

					</div>
				</div>
				<div class="chartdiv">
				<!-- CHART -->
				<figure class="highcharts-figure">
					<div class="scroll_body">
						<div class="chartGP">
						<div class="container_flex" style="float: left">
							<c:if test="${chartJSONResult[0].s eq null}">
								설문지를 선택하면 그래프가 나올 것 입니다.
							</c:if>
							<c:if test="${chartJSONResult[0].s ne null}">
								<div id="chart_container"></div>
								<p class="highcharts-description">다면평가에 대한 팀별 결과를 조회합니다.</p>
							</c:if>
						</div>
						<div class="container_flex" style="float: right">
							<c:if test="${chartJSONDp[0].s eq null}">
								설문지를 선택하면 그래프가 나올 것 입니다.
							</c:if>
							<c:if test="${chartJSONDp[0].s ne null}">
								<div id="chart_container2"></div>
								<p class="highcharts-description">부서별 소속 팀원들의 결과를 조회할 수 있습니다.</p>
							</c:if>
						</div>
						</div>
					</div>
				</figure>
				</div>
			</div>
	</div>
<script>
	/* 선택지 비동기 부분 */
function typeFn() {
	$("#departmentId").attr("disabled",true);

	console.log($("#surveySeq").val());

	if($("select[name=surveySeq] > option:selected").val() != null){
	$("#select").show();
	$("#departmentId > option").remove();
	$("#departmentId").attr("disabled",true);
	$("#departmentId").append("<option value=\"\">--선택--</option>");

	var surveySeq = $("#surveySeq").val();

	var submitObj = new Object();
	submitObj.surveySeq= surveySeq;

	$.ajax({
	      url: "select_ajax.do",
	      type: "POST",
	      contentType: "application/json;charset=UTF-8",
	      data:JSON.stringify(submitObj),
	      dataType : "json",
	      progress: true
	     })
	     .done(function(data) {

	$('#departmentId').children('option:not(:first)').remove();

	        var laborOption = "";
	        for(var k in data.Odt){
	          var obj = data.Odt[k];
	          var departmentName = obj.departmentName;
	          var departmentId = obj.departmentId;

	          laborOption = "<option value='" + departmentId + "'>" + departmentName + "</option>";
	          $("#departmentId").append(laborOption);
	      }

	$("#departmentId").attr("disabled",false);

	     })
	     .fail(function(e) {
	         alert("FAIL - "+e);
	     })
	     .always(function() {
	      $("#departmentId").attr("disabled",false);
	     });
		}
	}
	
function statics(survyeSeq, departmentId){
	
	console.log(surveySeq);
	console.log(departmentId);
	var submitObj = new Object();
		submitObj.surveySeq= surveySeq;
		submitObj.departmentId= departmentId;
		$.ajax({
			url: "surveyresultDetail.do",
		    type: "POST",
		    contentType: "application/json;charset=UTF-8",
		    data:JSON.stringify(submitObj),
		    dataType : "json"
		    })
		    .done(function(resMap) {
		    	
		    })
		    .fail(function(e) {
		        alert("통계검색을 실패하였습니다.");
		    })
		    .always(function() {
		    });

}

	/* CHART 설정부분 */

	var scoreInfo = null;

	function getScoreCnt(type){
		if(${chartJSONResult} != null) {
	    	if(scoreInfo==null) scoreInfo=${chartJSONResult};
	    	var scoreInfoMap = resultProcLineChart(scoreInfo);
	    	if(scoreInfoMap==null) return null;
	    	if(type=="data"){
	    	    return scoreInfoMap.get("data");
	    	}else{
	    	    return scoreInfoMap.get("cateArr");
	    	}
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

	var todayInfo = null;

	function getDPScoreCnt(type){
		if(${chartJSONDp} != null) {
	    	if(todayInfo==null) todayInfo=${chartJSONDp};
	    	var todayInfoMap = resultDPProcLineChart(todayInfo);
	    	if(todayInfoMap==null) return null;
	    	if(type=="data"){
	    	    return todayInfoMap.get("data");
	    	}else{
	    	    return todayInfoMap.get("cateArr");
	    	}
		}
	}
	function resultDPProcLineChart($obj){
	    if($obj==null) return null;
	    var resMap = new Map();

	    var cateArr = new Array();
	    var dataArr = new Array();

	    for(var k in $obj){
	        var xobj =$obj[k];

	        cateArr.push(xobj.e);
	        dataArr.push(xobj.s);
	    }

	    resMap.set("cateArr",cateArr);
	    resMap.set("data",dataArr);

	    return resMap;
	}

/* CHART 설정 끝 */

/* CHART 전체 START */
// Create the chart
Highcharts.chart('chart_container', {
  chart: {
    type: 'column'
  },
  credits: {
      enabled: false
  },
  navigation: {
      buttonOptions: {
          enabled: false
      }
  },
  title: {
    align: 'left',
    text: '다면평가 전체 결과 통계'
  },
  accessibility: {
    announceNewData: {
      enabled: true
    }
  },
  xAxis: {
	 categories: getScoreCnt("cateArr")
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
        format: '{point.y:.1f}'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> 점<br/>'
  },

  series: [
    {
      name: '전체',
      colorByPoint: true,
      data:getScoreCnt("data")
     }
  ],
});
/* CHART 전체 END */

/* CHART 팀별 START */
// Create the chart
Highcharts.chart('chart_container2', {
  chart: {
    type: 'column'
  },
  credits: {
      enabled: false
  },
  navigation: {
      buttonOptions: {
          enabled: false
      }
  },
  title: {
    align: 'left',
    text: '다면평가 부서 결과 통계'
  },
  accessibility: {
    announceNewData: {
      enabled: true
    }
  },
  xAxis: {
	 categories: getDPScoreCnt("cateArr")
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
        format: '{point.y:.1f}'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> 점<br/>'
  },

  series: [
    {
      name: '전체',
      colorByPoint: true,
      data: getDPScoreCnt("data")
     }
  ],
});

/* CHART 팀별 END */

</script>

<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>