<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_list.css"/>

<script>

function popup() 
{window.open("/springframework-xml-config-no-root/popup", "다면평가 대상 추가", 
      "width=800, height=600, left=500, top=100");}
   
function map_delete(raterId, appraiseeId){
	if(!confirm("삭제를 하시겠습니까?"))
	return false;
	
	var submitObj = new Object();
	submitObj.raterId = raterId
	submitObj.appraiseeId = appraiseeId
	
	$.ajax({ 
	    url: "/mapping/deleteMapping.do", 
	    type: "POST", 
	    contentType: "application/json;charset=UTF-8",
	    data:JSON.stringify(submitObj),
	    dataType : "json"
	    }) 
	    .done(function(resMap) {
	    
	      alert(gTxt(resMap.msg));
	 
	    }) 
	    .fail(function(e) {  
	        alert("삭제를 실패하였습니다ㅜㅜ.");
	    }) 
	    .always(function() { 
	        
	    }); 
	  
}
   
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
							<th scope="col">추가</th>
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
								<c:set var="cnt" value="1"/>
								<c:forEach var="mapping" items="${mappingList}">
									<c:set var="sum" value="${sum+1}"/>
									<tr id="${mapping.raterId}">
										<td>${sum}</td>	
										<td>${mapping.gradeName}</td>
										<td>${mapping.raterName}</td>
										<td>${mapping.appraiseeName}</td>
										<td><input type="button" value="추가" onclick="popup();" /></td>
										<td><input type="button" id="map_delete" class="btn btn-primary"
								         		   onclick="map_delete('${mapping.raterId}', '${mapping.appraiseeId}');"
								         		   value="삭제">
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