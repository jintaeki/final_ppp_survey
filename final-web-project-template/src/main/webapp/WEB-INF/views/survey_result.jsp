<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/survey_result.css" />
<div class="col-11">
	<div class="card">
		<div class="card-body">
			<div class="forshadowing">
			  <div class="container_flex">
				<div class="individual">
					<div class="row" style="text-align: center">
						<div class="info" style="display: contents;">
							<c:forEach items="${surveyResultTarget}" var="SRT">
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">소속</div></div>
								<div class="col-2"><div class="infodiv">${SRT.DEPARTMENT_NAME}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div style="margin:auto;">직급</div></div>
								<div class="col-2"><div class="infodiv">${SRT.GRADE_NAME}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">이름</div></div>
								<div class="col-2"><div class="infodiv">${SRT.EMPLOYEE_NAME}</div></div>
							</c:forEach>

							<c:forEach items="${personalStats}" var="PS">
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">점수</div></div>
								<div class="col-2"><div class="infodiv">${PS.score}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">등급</div></div>
								<div class="col-2"><div class="infodiv">${PS.grd}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div style="margin:auto;">설문 내<br>최소점</div></div>
								<div class="col-2"><div class="infodiv">${PS.min}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">설문 평균 <br>점수</div></div>
								<div class="col-2"><div class="infodiv">${PS.avg}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">설문 내<br>최고점</div></div>
								<div class="col-2"><div class="infodiv">${PS.max}</div></div>
							</c:forEach>
						</div>
						<div class="col-12">&nbsp;</div>
						<div class="col-12">&nbsp;</div>
					</div>
				</div>
			 </div>

				<div class="table_container_flex">
					<table class="table  table-bordered" style="word-break: break-all">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">평가자</th>
								<th scope="col">부서</th>
								<th scope="col">직책</th>
								<th scope="col">문제</th>
								<th scope="col">문항</th>
								<th scope="col">점수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${surveyResultList}" var="SRL">
								<tr>
									<td>${SRL.rnum}</td>

									<td>${SRL.raterName}</td>

									<td>${SRL.raterDepartmentName}</td>

									<td>${SRL.raterGrade}</td>

									<td>${SRL.questionContent}</td>

									<td>${SRL.itemContent}</td>

									<td>${SRL.itemScore}</td>
								</tr>
							</c:forEach>
						<tbody>
					</table>
					<!-- table_container_flex 종료 -->
				</div>
			</div>
			<!-- forshadowing 종료 -->
		</div>
		<!--card-body 종료  -->
	</div>
	<!-- col-11 종료 -->
</div>

<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>