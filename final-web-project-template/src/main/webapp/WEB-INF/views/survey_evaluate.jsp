<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>

<div class="card m-2">
	<div class="card-body">
		<div class="container my-5">
			<div class="row">
				<div class="hmenu">
					<div class="input-group mb-3">
						<input type="text" class="form-control " placeholder="search"
							   aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
									id="button-addon2">검색</button>
						</div>
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
							<td><input type="button" class="btn btn-link" onclick="location.href='surveyresult'" value="조회"></td>
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