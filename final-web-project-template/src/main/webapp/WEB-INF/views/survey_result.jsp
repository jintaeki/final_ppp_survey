<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/survey_result.css" />

<div class="col-11">
	<div class="card">
		<div class="card-body">
			<div class="forshadowing">
				<div class="individual">

   <div class="row" style="text-align: center">
      <div class="info" style="display: contents;">
      <c:forEach items="${surveyResultTarget}" var="SRT">
         <div class="col-1">소속</div>
         <div class="col-2">${SRT.DEPARTMENT_NAME}</div>
         <div class="col-1">직급</div>
         <div class="col-2">${SRT.GRADE_NAME}</div>
         <div class="col-1">이름</div>
         <div class="col-2">${SRT.EMPLOYEE_NAME}</div>
      </c:forEach>
       <c:forEach items="${personalStats}" var="PS">
         <div class="col-1">점수</div>
         <div class="col-2">${PS.score}</div>
         <div class="w-100"></div>
         <div class="col-1">등급</div>
         <div class="col-2">${PS.grd}</div>
         <div class="col-1">설문 내 최소점</div>
         <div class="col-2">${PS.min}</div>
         <div class="col-1">설문 평균 점수</div>
         <div class="col-2">${PS.avg}</div>
         <div class="col-1">설문 내 최고점</div>
         <div class="col-2">${PS.max}</div>
      </c:forEach>
      </div>
      <div class="col-12">&nbsp;</div>
      <div class="col-12">&nbsp;</div>
   </div>
</div>

				<div class="container_flex"></div>



				<div class="table_container_flex">
					<table class="table  table-bordered" style="word-break: break-all">
						<thead>
							<tr>
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
				<!-- forshadowing 종료 -->
			</div>
			<!--card-body 종료  -->
		</div>
	</div>
	<!-- col-11 종료 -->
</div>
<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>