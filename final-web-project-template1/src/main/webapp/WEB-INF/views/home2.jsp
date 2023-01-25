<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_list.css"/>

<script>

<<<<<<< HEAD
var surveySeq="";
var raterId="";

$(document).ready(function() {     
    $('#popup').on('show.bs.modal', function(event) {          
        surveySeq = $(event.relatedTarget).data('survey');
        raterId = $(event.relatedTarget).data('rater');
    });
});
 
function popup(){
	var month = $('#month').val();
	
	let popUrl ="/springframework-xml-config-no-root/popup.do?surveySeq="+surveySeq+"&raterId="+raterId+"&month="+month;
	let popOption = "width=800, height=600, left=500, top=100";
	window.open(popUrl, "다면평가 대상 추가", popOption);
}

function mapInsert(surveySeq){
	
	let popUrl ="/springframework-xml-config-no-root/another.do?surveySeq="+surveySeq;
	let popOption = "width=800, height=600, left=500, top=100";
	window.open(popUrl, "다면평가 대상 추가", popOption);
}


function map_delete(surveySeq, raterId, appraiseeId){
	if(confirm("삭제를 하시겠습니까?")){
		var submitObj = new Object();
		submitObj.surveySeq= surveySeq;
		submitObj.raterId= raterId;
		submitObj.appraiseeId= appraiseeId;
		$.ajax({
			url: "deleteMapping.do",
		    type: "POST",
		    contentType: "application/json;charset=UTF-8",
		    data:JSON.stringify(submitObj),
		    dataType : "json"
		    })
		    .done(function(resMap) {
		    	alert(resMap.msg);
		    	const target= $('#' + raterId);
		    	target.remove();
		    })
		    .fail(function(e) {
		        alert("삭제를 실패하였습니다.");
		    })
		    .always(function() {
		    });
	};
}

</script>

<div class="card m-2">
	<div class="card-body">
		<div>
			<h3 style="text-align: center;">${mappingList[0].surveyName} 매핑 목록</h3>
		</div>

		<div class="container my-5">
		<div>
			<button type="button" id="map_insert" class="btn btn-primary" onclick="mapInsert('${mappingList[0].surveySeq}')">조건관 관계없이 추가</button>
		</div>
			<div class="row">
				<table class="table" id="mapTb">
					<thead>
						<tr>
							<th scope="col">직급</th>
							<th scope="col">평가자</th>
							<th scope="col">피평가자</th>
							<th scope="col">삭제여부</th>
						</tr>
					</thead>
					<tbody id="mapTr">
						<c:choose>
							<c:when test="${empty mappingList}">
								<tr>
									<td>매칭된 평가자가 없습니다.
								<tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="mapping" items="${mappingList}">
									<tr id="${mapping.raterId}">
										<td>${mapping.gradeName}</td>
										<td><button type="button" id="get_mapping" class="btn btn-link" data-toggle="modal" data-target="#popup"
										   	       data-survey="${mapping.surveySeq}" data-rater="${mapping.raterId}">
 										   		${mapping.raterName}  
										   </button>
										  </td>
										<td>${mapping.appraiseeName}</td>
										<td><input type="button" id="map_delete" class="btn btn-primary"
								         		   onclick="map_delete('${mapping.surveySeq}', '${mapping.raterId}', '${mapping.appraiseeId}');"
								         		   value="삭제">
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="page_wrap">
					<div class="page_nation">
						<%-- 맨처음 페이지 이동    
      						<a class="arrow prev" href="surveysearch?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">처음</a> --%>
						<c:if test="${pagingdto.groupNo>1}">
							<a class="arrow prev"
								href="surveysearch?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">이전</a>
						</c:if>

						<c:forEach var="i" begin="${pagingdto.startPageNo}"
							end="${pagingdto.endPageNo}">
							<c:if test="${pagingdto.pageNo != i}">
								<a class="active"
									href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">${i}</a>
							</c:if>
							<c:if test="${pagingdto.pageNo == i}">
								<a class="page_nation"
									href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">${i}</a>
							</c:if>
						</c:forEach>

						<c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
							<a class="arrow next"
								href="surveysearch?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">다음</a>
						</c:if>
						<%-- 맨마지막 페이지 이동 
       						  <a class="arrow next" href="surveysearch?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">맨끝</a> --%>
					</div>
				</div>
			</div>
		</div>
			<input type="button" onclick="location.href='<c:url value='/survey/surveysearch'/>'" class="btn btn-primary" value="돌아가기">
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<!-- Modal -->
<div class="modal fade" id="popup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">추가할 조합의 프로젝트 범위를 정하시오</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<br><h5> 다면평가에 포함될 프로젝트의 범위 정하기 </h5> 
		<select class="form-control" id="month"> 
			<option value="3">최근 3개월 동안에 끝난 프로젝트</option> 
			<option value="6">최근 6개월 동안에 끝난 프로젝트</option> 
			<option value="12">최근 1년 동안에 끝난 프로젝트</option>
  			<option value="24">최근 2년 동안에 끝난 프로젝트</option> 
  			<option value="36">최근 3년 동안에 끝난 프로젝트</option> 
  		</select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="popup()">추가할사람 보기</button>
      </div>
    </div>
  </div>
</div>
=======
function popup(surveySeq, raterId, month)
{
   let popUrl ="/springframework-xml-config-no-root/popup.do?surveySeq="+surveySeq+"&raterId="+raterId+"&month="+month;
   let popOption = "width=800, height=600, left=500, top=100"

   window.open(popUrl, "다면평가 대상 추가", popOption);

}

function map_delete(surveySeq, raterId, appraiseeId){

   if(confirm("삭제를 하시겠습니까?")){
      var submitObj = new Object();
      submitObj.surveySeq= surveySeq;
      submitObj.raterId= raterId;
      submitObj.appraiseeId= appraiseeId;

      $.ajax({
         url: "deleteMapping.do",
          type: "POST",
          contentType: "application/json;charset=UTF-8",
          data:JSON.stringify(submitObj),
          dataType : "json"
          })
          .done(function(resMap) {
             alert(resMap.msg);
             const target= $('#' + raterId);
             target.remove();
          })
          .fail(function(e) {
              alert("삭제를 실패하였습니다.");
          })
          .always(function() {

          });
   };
}


</script>

<div class="card m-2">
   <div class="card-body">
      <div>
         <h3 style="text-align: center;">${mappingList[0].surveyName} 매핑 목록</h3>
      </div>

      <div class="container my-5">
      <div>
         <input type="button" id="map_insert" class="btn btn-primary" value="조건과 관계없이 추가">
      </div>
         <div class="row">
            <table class="table">
               <thead>
                  <tr>
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
                              <td>${mapping.gradeName}</td>
                              <td><a href="javascript:void(0);"
                                 onclick="popup('${mapping.surveySeq}', '${mapping.raterId}', '${month}');">
                                 ${mapping.raterName}</a></td>
                              <td>${mapping.appraiseeName}</td>
                              <td><input type="button" id="map_delete" class="btn btn-primary"
                                          onclick="map_delete('${mapping.surveySeq}', '${mapping.raterId}', '${mapping.appraiseeId}');"
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
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
=======
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_list.css"/>

<script>

function popup(surveySeq, raterId, month)
{
   let popUrl ="/springframework-xml-config-no-root/popup.do?surveySeq="+surveySeq+"&raterId="+raterId+"&month="+month;
   let popOption = "width=800, height=600, left=500, top=100"

   window.open(popUrl, "다면평가 대상 추가", popOption);

}

function map_delete(surveySeq, raterId, appraiseeId){

   if(confirm("삭제를 하시겠습니까?")){
      var submitObj = new Object();
      submitObj.surveySeq= surveySeq;
      submitObj.raterId= raterId;
      submitObj.appraiseeId= appraiseeId;

      $.ajax({
         url: "deleteMapping.do",
          type: "POST",
          contentType: "application/json;charset=UTF-8",
          data:JSON.stringify(submitObj),
          dataType : "json"
          })
          .done(function(resMap) {
             alert(resMap.msg);
             const target= $('#' + raterId);
             target.remove();
          })
          .fail(function(e) {
              alert("삭제를 실패하였습니다.");
          })
          .always(function() {

          });
   };
}


</script>

<div class="card m-2">
   <div class="card-body">
      <div>
         <h3 style="text-align: center;">${mappingList[0].surveyName} 매핑 목록</h3>
      </div>

      <div class="container my-5">
      <div>
         <input type="button" id="map_insert" class="btn btn-primary" value="조건과 관계없이 추가">
      </div>
         <div class="row">
            <table class="table">
               <thead>
                  <tr>
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
                              <td>${mapping.gradeName}</td>
                              <td><a href="javascript:void(0);"
                                 onclick="popup('${mapping.surveySeq}', '${mapping.raterId}', '${month}');">
                                 ${mapping.raterName}</a></td>
                              <td>${mapping.appraiseeName}</td>
                              <td><input type="button" id="map_delete" class="btn btn-primary"
                                          onclick="map_delete('${mapping.surveySeq}', '${mapping.raterId}', '${mapping.appraiseeId}');"
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
>>>>>>> refs/remotes/origin/cbj2
