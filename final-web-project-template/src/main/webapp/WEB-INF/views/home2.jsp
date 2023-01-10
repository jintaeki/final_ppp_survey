<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_list.css"/>

<script>

function popup() 
{window.open("/springframework-xml-config-no-root/popup", "다면평가 대상 추가", 
      "width=800, height=600, left=500, top=100");}
   
</script>

<div class="card m-2">
	<div class="card-body">
		<div>
			<h3 style="text-align: center;">${mappingList[0].surveyName} 매핑 목록</h3>
		</div>
		<div class="container my-5">
			<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">직급</th>
							<th scope="col">평가자</th>
							<th scope="col">피평가자</th>
							<th scope="col">삭제여부</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty mappingList}">
								<tr>
									<td>매칭된 평가자가 없습니다.
								<tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="mapping" items="${mappingList}">
									<tr id="${mapping.raterId}">
										<td></td>	
										<td>${mapping.gradeName}</td>
										<td>${mapping.raterName}</td>
											
											<td>${mapping.appraiseeName} 
											<input type="button" class="add_btn" value="+" onclick="popup();" />
											</td>
											
										<td><input type="button" id="delete" class="btn btn-primary"
								         		   onclick="delete(${mapping.raterId})" value="삭제">
										</td>
									</tr>
								</c:forEach>							
							</c:otherwise>
						</c:choose>
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
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>