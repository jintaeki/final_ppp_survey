<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>

<div class="card m-2">
	<div class="card-body">
		<div class="container my-5">
			<div class="row">
				<div class="hmenu">
					<div class="survey_list_form_upper_dv">
						<form action="<c:url value='/survey/surveysearch'/>" method="GET"
							class="survey_list_form">
							<select name="selection">
								
									 <option value="" <c:out value="${searchType eq 'employeeName'}"/>>이름</option>
                					 <option value="" <c:out value="${searchType eq 'departmentName'}"/>>부서명</option>
                				     <option value="" <c:out value="${searchType eq 'gradeName'}"/>>직급</option>
                					 <option value="" <c:out value="${searchType eq 'surveyCompleteYn}"/>>참여 여부</option>	
							</select> <input type="text" class="form-control" id="selectedKeyword" placeholder="search"
								name="keyword" value="${pagingdto.keyword}"
								aria-describedby="button-addon2"> <input type="hidden"
								name="pageNo" value="1">
							<div class="input-group-append">
								<input type="submit" class="btn btn-outline-secondary"
									id="button-addon2" value="검색">
								<input type="reset" class="btn btn-outline-secondary"
									id="button-addon2" value="초기화">
							</div>
						</form>
						<button id="upper_dv_btn" type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#exampleModal"
							data-whatever="@mdo">등록</button>


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
							<th scope="row">1 </th>
							<td class="sv_name">"${EL.departmentName}"</td>
							<td>"${EL.gradeName}"</td>
							<td>"${EL.employeeName}"</td>
							<td>"${EL.surveyCompleteYN}"</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='<c:url value="/survey/surveyresult"/>'" value="조회"></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
				<div class="lmenu">
					<button type="button" class="btn btn-primary" onclick="location.href='surveyresultteam'">통계</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>