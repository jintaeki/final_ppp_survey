<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/survey_result.css" />
	<div class="card">
			<div class="forshadowing">
			  <div class="container_flex">
				<div class="individual">
					<div class="row" style="text-align: center; background-color: white;">
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
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">백분율, 순위</div></div>
								<div class="col-2"><div class="infodiv">상위  ${PS.grd}% | 총 ${PS.tot}명 중 ${PS.rank}등</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div style="margin:auto;">설문 내<br>최소점</div></div>
								<div class="col-2"><div class="infodiv">${PS.min}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">설문 내<br>최고점</div></div>
								<div class="col-2"><div class="infodiv">${PS.max}</div></div>
								<div class="input-group-text col-1" id="basic-addon1"><div class="infodiv">설문 평균 <br>점수</div></div>
								<div class="col-2"><div class="infodiv">${PS.avg}</div></div>
							</c:forEach>

						</div>

					</div>
				</div>
			 </div>

				<div class="table-container">
					<div class="col-12" style="">
						<h3 style="text-align:left;"><b>설문 결과</b> </h3>
					</div>


					<table class="table table-sm table-striped table-bordered">
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
									<td>
									<c:if test="${ORL.anonymitySeq eq null}">
										${ORL.raterName}
									</c:if>
									<c:if test="${ORL.anonymitySeq ne null}">
										${ORL.anonymitySeq}
									</c:if>
									</td>
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
									<td>${SRL.answerContent}</td>
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
									<c:if test="${MRL.itemContent eq '기타'}">
										<td>${MRL.answerContent}</td>
									</c:if>
									<c:if test="${MRL.itemContent ne '기타'}">
										<td>${MRL.itemContent}</td>
									</c:if>
									<td>${MRL.itemScore}</td>
								</tr>
							</c:forEach>



						<tbody>
					</table>
					<!-- table_container_flex 종료 -->


			</div>
			<button class="btn btn-outline-primary btn-sm" style="float:right; position: relative;bottom: 15px; margin-right: 20px;" onclick="history.back()">뒤로가기</button>
			<!-- forshadowing 종료 -->
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>