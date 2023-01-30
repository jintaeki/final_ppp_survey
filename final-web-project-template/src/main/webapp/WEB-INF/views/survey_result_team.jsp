<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey_result_team.css">
	
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<div class="col-11">
	<div class="card">
		<div class="card-body">
			<div class="forshadowing">
				<div class="result_container">
					<div class="hmenu">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">
										<form action="<c:url value='/survey/surveyresultDetail'/>"
											method="get" class="survey_list_form">
											<select name="surveySeq" id="surveySeq" onchange="typeFn();">
												<option>--선택--</option>
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
													id="button-addon2" value="검색"> <input type="reset"
													class="btn btn-outline-secondary" id="button-addon2"
													value="초기화">
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

				<!-- CHART -->
				<figure class="highcharts-figure"
					style="overflow: auto; height: 500px; width: 800px; display: flex;">
					<div class="scroll_body">
						<div style="min-width: 800px;">
							<div id="chart_container"></div>
							<p class="highcharts-description">다면평가에 대한 팀별 결과를 조회합니다.</p>
						</div>
						<div style="min-width: 800px;">
							<div id="chart_container2"></div>
							<p class="highcharts-description">부서별 소속 팀원들의 결과를 조회할 수 있습니다.
							</p>
						</div>
					</div>
				</figure>

			</div>
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
	
$(document).ready(function() {
	console.log(getScoreCnt("cateArr")[0]);
	console.log(getScoreCnt("data")[0]);
	console.log(getDPScoreCnt("cateArr")[0]);
	console.log(getDPScoreCnt("data")[0]);
	
	console.log(getScoreCnt("cateArr"));
	console.log(getScoreCnt("data"));
	console.log(getDPScoreCnt("cateArr"));
	console.log(getDPScoreCnt("data"));
});
/* CHART 설정 끝 */

/* CHART 전체 START */
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