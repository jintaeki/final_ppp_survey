<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_after_user.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_after_user.css"/>
<div class="card m-2">	
	<div class="card-body">
		<div class="container my-5">
  			<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th scope="col">프로젝트 명</th>
							<th scope="col">대상</th>
							<th scope="col">진행상태</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${UCDList}" var="list">
						<tr>
							<th scope="row">#</th>
							<td class="pj_name" style="text-align:center;">${list.surveyName }</td>
							<td>${list.appraiseeName }</td>
							<td class="not_comp">${list.surveyCompleteYN }</td>
							<td><button type="button" class="btn btn-primary" onclick="surveyopen(this})">설문 시작</button></td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
			
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>