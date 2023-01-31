<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>

<div class="col-11">
	<div class="card">
		<div class="card-body">
			<div class="forshadowing">
				<div class="row">
					<div class="hmenu">
						<div class="survey_list_form_upper_dv">
							<form
								action="<c:url value='/survey/evaluatesearch/${surveySeq}'/>"
								method="GET" class="survey_list_form" id="survey_list_form_id">
								<select name="selection">
									<option value="employeeName"
										<c:if test="${pagingDto.selection eq 'employeeName'}">selected</c:if>>이름</option>
									<option value="departmentName"
										<c:if test="${pagingDto.selection eq 'departmentName'}">selected</c:if>>부서명</option>
									<option value="gradeName"
										<c:if test="${pagingDto.selection eq 'gradeName'}">selected</c:if>>직급</option>
									<option value="surveyCompleteYn"
										<c:if test="${pagingDto.selection eq 'surveyCompleteYn'}">selected</c:if>>참여
										여부</option>
								</select> <input type="text" class="form-control" id="selectedKeyword"
									placeholder="search" name="keyword"
									value="${pagingDto.keyword}" aria-describedby="button-addon2">
								<input type="hidden" name="pageNo" value="1"> <input
									type="hidden" name="surveySeq" value="${surveySeq}" />
								<div class="input-group-append">
									<input type="submit" class="btn btn-outline-secondary"
										id="button-addon2" value="검색"> <input type="reset"
										class="btn btn-outline-secondary" id="button-addon2"
										value="초기화">
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
							<c:forEach items="${evaluateList}" var="EL">
								<tr>
									<th scope="row">${EL.RNUM}</th>
									<td class="sv_name">${EL.DEPARTMENT_NAME}</td>
									<td>${EL.GRADE_NAME}</td>
									<td>${EL.EMPLOYEE_NAME}</td>
									<td>${EL.SURVEY_COMPLETE_YN}</td>
									<td><input type="button" class="btn btn-link"
										onclick="location.href='<c:url value="/survey/surveyresult/${EL.SURVEY_SEQ}/${EL.EMPLOYEE_ID}"/>'"
										value="조회"></td>
								</tr>
							</c:forEach>

						</tbody>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td style="float: right;"><button id="upper_dv_btn"
										type="button" class="btn btn-primary" data-toggle="modal"
										data-target="#exampleModal" >재전송</button></td>
							</tr>
						</tbody>
						<tr>
							<td colspan="12" class="text-center">
								<div>
									<a class="btn btn-outline-primary btn-sm"
										href="EvaluateSearch?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}&surveySeq=${pagingdto.surveySeq}">처음</a>
									<c:if test="${pagingdto.groupNo>1}">
										<a class="btn btn-outline-info btn-sm"
											href="EvaluateSearch?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">이전</a>
									</c:if>

									<c:forEach var="i" begin="${pagingdto.startPageNo}"
										end="${pagingdto.endPageNo}">
										<c:if test="${pagingdto.pageNo != i}">
											<a class="btn btn-outline-success btn-sm"
												href="${surveySeq}?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">${i}</a>
										</c:if>
										<c:if test="${pagingdto.pageNo == i}">
											<a class="btn btn-danger btn-sm"
												href="${surveySeq}?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">${i}</a>
										</c:if>
									</c:forEach>

									<c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
										<a class="btn btn-outline-info btn-sm"
											href="EvaluateSearch?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">다음</a>
									</c:if>
									<a class="btn btn-outline-primary btn-sm"
										href="EvaluateSearch?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&surveySeq=${pagingdto.surveySeq}">맨끝</a>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
	<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>
	
	

	<!-- modal(이메일 보낼시) -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">평가 공시 재전송</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:url value="/survey/remessage.do" var="actionURL" scope="page" />
					<form:form action="${actionURL}" modelAttribute="map">
						<input type="hidden" name="surveySeq" value="${surveySeq}">
						<div class="form-group">
    						<label for="exampleFormControlTextarea1">
    							평가를 하지 않은 평가자에게 재전송할 메세지를 입력하시오
    						</label>
    						<textarea class="form-control" name="deliveryContent" rows="3"></textarea>
  						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- modal(설문 등록 시 뜨는 팝업창) 끝-->