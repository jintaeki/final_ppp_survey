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