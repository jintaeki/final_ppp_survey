<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>

<div class="card m-2">
	<div class="card-body">
		<div class="container my-5">
			<div class="row">
				<div class="hmenu">
					<div class="survey_list_form_upper_dv">
						<form action="<c:url value='/survey/EvaluateSearch'/>" method="GET"
							class="survey_list_form">
							<select name="selection">
									 <option value="employeeName" <c:if test="${pagingDto.selection eq 'employeeName'}">selected</c:if>>이름</option>
                					 <option value="departmentName" <c:if test="${pagingDto.selection eq 'departmentName'}">selected</c:if>>부서명</option>
                				     <option value="gradeName" <c:if test="${pagingDto.selection eq 'gradeName'}">selected</c:if>>직급</option>
                					 <option value="surveyCompleteYn" <c:if test="${pagingDto.selection eq 'surveyCompleteYn'}">selected</c:if>>참여 여부</option>
							</select>
							<input type="text" class="form-control" id="selectedKeyword" placeholder="search"
								name="keyword" value="${pagingDto.keyword}"
								aria-describedby="button-addon2"> <input type="hidden"
								name="pageNo" value="1">
								<input type="hidden" name="surveySeq" value="${surveySeq}"/>
							<div class="input-group-append">
								<input type="submit" class="btn btn-outline-secondary"
									id="button-addon2" value="검색">
								<input type="reset" class="btn btn-outline-secondary"
									id="button-addon2" value="초기화">
							</div>
						</form>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">부서</th>
							<th scope="col">직급</th>
							<th scope="col">이름</th>
							<th scope="col">참여여부</th>
							<th scope="col">결과</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${EL}" var="EL">
						<tr>
							<th scope="row">1</th>
							<td class="sv_name">${EL.DEPARTMENT_NAME}</td>
							<td>${EL.GRADE_NAME}</td>
							<td>${EL.EMPLOYEE_NAME}</td>
							<td>${EL.SURVEY_COMPLETE_YN}</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='<c:url value="/survey/surveyresult"/>'" value="조회"></td>
						</tr>
					</c:forEach>





					</tbody>

						<tr>
						<td colspan="4" class="text-center">
							<div style="margin-left: 170px;">

								<a class="btn btn-outline-primary btn-sm"
									href="surveysearch?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">처음</a>
								<c:if test="${pagingdto.groupNo>1}">
									<a class="btn btn-outline-info btn-sm"
										href="surveysearch?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">이전</a>
								</c:if>

								<c:forEach var="i" begin="${pagingdto.startPageNo}"
									end="${pagingdto.endPageNo}">
									<c:if test="${pagingdto.pageNo != i}">
										<a class="btn btn-outline-success btn-sm"
											href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">${i}</a>
									</c:if>
									<c:if test="${pagingdto.pageNo == i}">
										<a class="btn btn-danger btn-sm"
											href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">${i}</a>
									</c:if>
								</c:forEach>

								<c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm"
										href="surveysearch?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">다음</a>
								</c:if>
								<a class="btn btn-outline-primary btn-sm"
									href="surveysearch?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">맨끝</a>
							</div>
						</td>
					</tr>
				</table>
				<div class="lmenu">
					<button type="button" class="btn btn-primary" onclick="location.href='surveyresultteam'">통계</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>