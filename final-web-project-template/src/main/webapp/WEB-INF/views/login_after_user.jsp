<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
function surveyopen(obj){
	// survey_result 테이블에 필요한 요소들 온클릭 메소드 안에 넣어주고 같이 survey 컨트롤러로 이동해보자
	// 위 사항을 적어둔 이유는 평가 페이지를 통해서 survey_result 테이블에 데이터가 들어갈거고 평가했는 지 여부가 결정나기 때문
    window.open("http://localhost:8080/springframework-xml-config-no-root/survey", "_blank");
	const tag = $(obj);
	
	const completeMsg = `완료`;
	tag.parent().prev().html(completeMsg);
	tag.parent().prev().css('color', '#ccc').css('font-weight', 'normal');
	
	tag.parent().css('color', '#ccc');
	tag.parent().html(completeMsg);
	
   }
</script>
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