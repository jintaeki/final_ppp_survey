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
							<th scope="col">소속</th>
							<th scope="col">직급</th>
							<th scope="col">이름</th>
							<th scope="col">참여여부</th>
							<th scope="col">결과</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td class="sv_name">사업지원팀</td>
							<td>1팀</td>
							<td>부장</td>
							<td>임진택</td>
							<td>O</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='surveyresult'" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td class="sv_name">사업지원팀</td>
							<td>1팀</td>
							<td>과장</td>
							<td>최병준</td>
							<td>O</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='surveyresult'" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td class="sv_name">사업지원팀</td>
							<td>1팀</td>
							<td>시원</td>
							<td>김찬수</td>
							<td>-</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='surveyresult'" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td class="sv_name">사업지원팀</td>
							<td>1팀</td>
							<td>대리</td>
							<td>민채우</td>
							<td>O</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='surveyresult'" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td class="sv_name">사업지원팀</td>
							<td>2팀</td>
							<td>부장</td>
							<td>홍길동</td>
							<td>-</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='surveyresult'" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td class="sv_name">사업지원팀</td>
							<td>2팀</td>
							<td>과장</td>
							<td>이순신</td>
							<td>O</td>
							<td><input type="button" class="btn btn-link" onclick="location.href='surveyresult'" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td class="sv_name">사업지원팀</td>
							<td>2팀</td>
							<td>대리</td>
							<td>을지문덕</td>
							<td>O</td>
							<td><input type="button" class="btn btn-link" onclick="send(this)" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td class="sv_name">사업지원팀</td>
							<td>2팀</td>
							<td>사원</td>
							<td>권율</td>
							<td>O</td>
							<td><input type="button" class="btn btn-link" onclick="send(this)" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">9</th>
							<td class="sv_name">사업지원팀</td>
							<td>2팀</td>
							<td>사원</td>
							<td>장보고</td>
							<td>-</td>
							<td><input type="button" class="btn btn-link" onclick="send(this)" value="조회"></td>
						</tr>
						<tr>
							<th scope="row">10</th>
							<td class="sv_name">정보기술연구원</td>
							<td>연구팀</td>
							<td>차장</td>
							<td>임꺽정</td>
							<td>O</td>
							<td></td>
						</tr>
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