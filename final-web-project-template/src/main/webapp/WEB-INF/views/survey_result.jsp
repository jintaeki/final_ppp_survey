<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="SRL" value="{surveyResultDTO}"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey_result.css" />
<div class="container">
	<div class="row" style="text-align: center">
		<div class="info" style="display: contents;">
			<div class="col-1">소속</div>
			<div class="col-2">${SRD.departmentName}</div>
			<div class="col-1">직급</div>
			<div class="col-2">${SRD.gradeName}</div>
			<div class="col-1">이름</div>
			<div class="col-2">${SRD.employeeName}</div>
		</div>
		<div class="col-12">&nbsp;</div>
		<div class="col-12">&nbsp;</div>
	</div>
</div>

<table class="result_table">
	<tr class="result_table_list">
		<th>문제</th>
		<th>문항</th>
		<th>점수</th>
	</tr>




	<tr>
		<td>평가자는 조직의 목표를 공유하고 스스로의 목표를 구체적으로 설정한다.</td>
		<td style="text-align:center;">5</td>
	</tr>
	<tr>
		<td>주어진 목표를 초과 달성하기 위해 구체적인 노력과 행동들이 이어진다.</td>
		<td style="text-align:center;">5</td>

	</tr>
	<tr>
		<td>업무추진 시 다양한 의견을 고려함으로써 치우지치 않는 균형 감각을 유지한다.</td>
		<td style="text-align:center;">5</td>
	</tr>

	<tr>
		<td rowspan="4" style="text-align:center;">업무 적응력</td>
	</tr>
	<tr>
		<td>평가자는 새로운 환경에 적응하기 위해 자신의 행동을 변화시키려고 노력한다.</td>
		<td style="text-align:center;">5</td>
		<td rowspan="4" style="text-align:center;">S(15)</td>
	</tr>
	<tr>
		<td>평가자는 업무 여건이나 상황에 영향을 받지 않고 성과를 만들어낼 수 있다.</td>
		<td style="text-align:center;">5</td>

	</tr>
	<tr>
		<td>평가자는 어려운 상황에서도 평정을 유지하며 업무를 수행한다.</td>
		<td style="text-align:center;">5</td>

	</tr>

</table>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>