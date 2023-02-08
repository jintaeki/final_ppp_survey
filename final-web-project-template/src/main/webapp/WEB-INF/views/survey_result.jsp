<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/survey_result.css" />
	<div class="card">
			<div class="forshadowing">
			  <div class="container_flex">
			  <div class="title" style="font-size: 24px;">설문 결과</div>
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
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">백분율|순위</div></div>
								<div class="col-2"><div class="infodiv">상위  ${PS.grd}% | ${PS.rank}/${PS.tot}</div></div>
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
					<table class="table table-bordered table-striped text-center">
						<thead>
							<tr>
								<th class="col-xs">#</th>
								<th class="col-xs">평가자</th>
								<th class="col-1.5">부서</th>
								<th class="col-xs">직책</th>
								<th class="col-xs">문제 유형</th>
								<th class="col-6">문제</th>
								<th class="col-xs">문항</th>
								<th class="col-xs">점수</th>
							</tr>
						</thead>
						<tbody>
						   <c:if test="${ORL.size() !=0}">
							<tr>
								<td colspan="8">객관식 목록</td>
							</tr>
						  </c:if>
							<c:forEach items="${objectiveResultList}" var="ORL">
								<tr>
									<td>${ORL.rnum}</td>
									<td>${ORL.raterName}</td>
									<td>${ORL.raterDepartmentName}</td>
									<td>${ORL.raterGrade}</td>
									<td>${ORL.questionType}</td>
									<td>${ORL.questionContent}</td>
									<td>${ORL.itemContent}</td>
									<td>${ORL.itemScore}</td>
								</tr>
							</c:forEach>

								<c:if test="${SRL.size() !=0}">
									<tr>
								<td colspan="8">주관식 목록</td>
									</tr>
						  		</c:if>

							   <c:forEach items="${subjectiveResultList}" var="SRL">

								<tr>
									<td>${SRL.rnum}</td>
									<td>${SRL.raterName}</td>
									<td>${SRL.raterDepartmentName}</td>
									<td>${SRL.raterGrade}</td>
									<td>${SRL.questionType}</td>
									<td>${SRL.questionContent}</td>
									<td>${SRL.itemContent}</td>
									<td>${SRL.itemScore}</td>
								</tr>
							</c:forEach>

								<c:if test="${MRL.size() !=0}">
									<tr>
								<td colspan="8">혼합식 목록</td>
									</tr>
						  		</c:if>


							 <c:forEach items="${mixResultList}" var="MRL">
								<tr>
									<td>${MRL.rnum}</td>
									<td>${MRL.raterName}</td>
									<td>${MRL.raterDepartmentName}</td>
									<td>${MRL.raterGrade}</td>
									<td>${MRL.questionType}</td>
									<td>${MRL.questionContent}</td>
									<td>${MRL.itemContent}</td>
									<td>${MRL.itemScore}</td>
								</tr>
							</c:forEach>



						<tbody>
					</table>
					<!-- table_container_flex 종료 -->
				</div>
			</div>
			<!-- forshadowing 종료 -->
	</div>
<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>