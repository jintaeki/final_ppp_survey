<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/mapping_view.css" />

<script>

var surveySeq="";
var raterId="";

$(document).ready(function() {
    $('#popup').on('shown.bs.modal', function(event) {
        surveySeq = $(event.relatedTarget).data('surveyseq');
        raterId = $(event.relatedTarget).data('raterid');
        console.log(surveySeq);
    });
});

function popup(){
   var month = $('#month').val();

   let popUrl ="/mapping/popup.do?pageNo=1&surveySeq="+surveySeq+"&raterId="+raterId
            +"&month="+month+"&keyword=&keyword2=&selection=60004&selection2=60004&selectGD=60004";
   let popOption = "width=1000, height=820, left=370, top=100";
   window.open(popUrl, "다면평가 대상 추가", popOption);
}

function mapInsert(surveySeq){

   let popUrl ="/mapping/another.do?surveySeq="+surveySeq
            +"&keyword=&keyword2=&selection=60004&selection2=60004&selectGD=60004";
   let popOption = "width=1000, height=820, left=370, top=100";
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
             window.location.reload();
          })
          .fail(function(e) {
              alert("삭제를 실패하였습니다.");
          })
          .always(function() {
          });
   };
}

function reset_btn_mapping_pop(surveySeq, month, number){
    $('.searchRangeAll').empty();
    html='';
    html += `<div class="searchRange">
    <select name="selectGD">
      <option selected value="60004">평가자 직급</option>
      <c:forEach items="${gradeList}" var="grade">
        <option value="${grade.gradeId}">${grade.gradeName}</option>
      </c:forEach>
    </select>
    <select name="selection">
       <option selected value="60004">평가자 부서</option>
       <c:forEach items="${raterDepartment}" var="rdp">
         <option value="${rdp.departmentId}">${rdp.departmentName}</option>
      </c:forEach>
    </select>
    <input type="text" class="form-control" id="selectedKeyword" placeholder="평가자  이름 검색창"
             name="keyword"  aria-describedby="button-addon2">
    </div>`;


 html +=`<div class="input-group-append">
       <select name="selection2">
          <option selected value="60004">피평가자 부서</option>
          <c:forEach items="${appraiseeDepartment}" var="adp">
           <option value="${adp.departmentId}">${adp.departmentName}</option>
        </c:forEach>

       </select>

       <input type="text" class="form-control" id="selectedKeyword" placeholder="피평가자 이름 검색창" name="keyword2" aria-describedby="button-addon2">
       <input type="hidden" name="pageNo" value="1">`;
    html +='<input type="hidden" name="surveySeq" value="'+surveySeq+'">';
    html +='<input type="hidden" name="month" value="'+month+'">';
    html+='<input type="hidden" name="number" value="'+number+'">';
    html+='<input type="hidden" name="newCheck" value="0">';
    html+=`<input type="submit" class="btn btn-outline-secondary"
          id="button-addon2" value="검색"> `;
       html+='<input type="button" style="margin-left:10px;" class="btn btn-outline-secondary" onclick="reset_btn_mapping_pop('+surveySeq+','+month+','+number+')" value="초기화"></div>';
    $('.searchRangeAll').append(html);

 }

</script>
   <div class="card">
         <div class="forshadowing">
               <div class="hmenu">
                  <div class="survey_list_form_upper_dv">
                     <form action="<c:url value='/mapping/set.do'/>" method="POST"
                        class="survey_list_form" style="display:flex;">
                        <div class="searchRangeAll">
                        <div class="searchRange">
                        <select name="selectGD">
                           <option value="60004">평가자 직급</option>
                           <c:forEach items="${gradeList}" var="grade">
                              <c:if test="${pagingdto.selectGD eq grade.gradeId}">
                                 <option selected value="${pagingdto.selectGD}">${grade.gradeName}</option>
                              </c:if>
                              <c:if test="${pagingdto.selectGD ne grade.gradeId}">
                                 <option value="${grade.gradeId}">${grade.gradeName}</option>
                              </c:if>
                           </c:forEach>
                        </select>
                        <select name="selection">
                             <option value="60004">평가자 부서</option>
                           <c:forEach items="${raterDepartment}" var="rdp">
                              <c:if test="${pagingdto.selection eq rdp.departmentId}">
                                 <option selected value="${pagingdto.selection}">${rdp.departmentName}</option>
                              </c:if>
                              <c:if test="${pagingdto.selection ne rdp.departmentId}">
                                 <option value="${rdp.departmentId}">${rdp.departmentName}</option>
                              </c:if>
                           </c:forEach>
                        </select>
                        <input type="text" class="form-control" id="selectedKeyword" placeholder="평가자  이름 검색창"
                                 name="keyword" value="${pagingdto.keyword}" aria-describedby="button-addon2">
                        </div>
                        <div class="input-group-append">
                        <select name="selection2">
                           <option value="60004">피평가자 부서</option>
                              <c:forEach items="${appraiseeDepartment}" var="adp">
                                 <c:if test="${pagingdto.selection2 eq adp.departmentId}">
                                    <option selected value="${pagingdto.selection2}">${adp.departmentName}</option>
                                 </c:if>
                                 <c:if test="${pagingdto.selection2 ne adp.departmentId }">
                                    <option value="${adp.departmentId}">${adp.departmentName}</option>
                                 </c:if>
                              </c:forEach>
                        </select>
                        <input type="text" class="form-control" id="selectedKeyword" placeholder="피평가자 이름 검색창"
                               name="keyword2" value="${pagingdto.keyword2}" aria-describedby="button-addon2"> 
                        <input type="hidden" name="pageNo" value="1"> 
                        <input type="hidden" name="surveySeq" value="${pagingdto.surveySeq}">
                        <input type="hidden" name="month" value="${pagingdto.month}">
                        <input type="hidden" name="number" value="${number}">
                        <input type="hidden" name="newCheck" value="0">
                        <input type="submit" class="btn btn-outline-secondary" id="button-addon2" value="검색">
                        <input type="button" style="margin-left:10px;" class="btn btn-outline-secondary" onclick="reset_btn_mapping_pop(${pagingdto.surveySeq},${pagingdto.month},${number})" value="초기화">
                        </div>
                        </div>
                     </form>

                  </div>
               </div>

               <div class="col-12"><h3 style="text-align:left;"><b><${surveyInfo.surveyName}> 매핑 목록</b></h3></div>
               <table class="table table-sm table-striped table-bordered" id="mapTb">
                  <thead>
                     <tr>
                        <th scope="col">직급</th>
                        <th scope="col">평가자</th>
                        <th scope="col">피평가자</th>
                        <th scope="col">삭제</th>
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
                                 <td><button type="button" id="get_mapping" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .5rem; line-height: 1; font-size: 1rem;"
                                       class="btn btn-link" data-toggle="modal"
                                       data-target="#popup" data-surveyseq="${mapping.surveySeq}"
                                       data-raterid="${mapping.raterId}">
                                       ${mapping.raterName}</button></td>
                                 <td>${mapping.appraiseeName}</td>
                                 <td>
                                    <c:if test="${stateCode ne 30004}">

                                       <button id="map_delete" style="border-radius: 35em;"
                                       onclick="map_delete('${mapping.surveySeq}', '${mapping.raterId}', '${mapping.appraiseeId}');" value="삭제">
                                          <i class="fas fa-xmark"></i>
                                       </button>
                                     </c:if>
                                     <c:if test="${stateCode eq 30004}">
                                     	 삭제 불가
                                     </c:if>
                                 </td>
                              </tr>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
                  </tbody>
                  <table class="paiging-btn-table">
                  <tr class="table-light">
                     <td colspan="12" class="text-center" style="border: none;">
                        <div>
                           <c:if test="${pagingdto.groupNo>1}">
                              <a class="btn btn-outline-secondary"
                                 href="set.do?pageNo=${pagingdto.startPageNo-1}&surveySeq=${pagingdto.surveySeq}&month=${pagingdto.month}&number=${number}&newCheck=0&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection}&selectGD=${pagingdto.selectGD}">이전</a>
                           </c:if>
                           <c:forEach var="i" begin="${pagingdto.startPageNo}"
                              end="${pagingdto.endPageNo}">
                              <c:if test="${pagingdto.pageNo != i}">
                                 <a class="btn btn-outline-secondary"
                                    href="set.do?pageNo=${i}&surveySeq=${pagingdto.surveySeq}&month=${pagingdto.month}&number=${number}&newCheck=0&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection}&selectGD=${pagingdto.selectGD}">${i}</a>
                              </c:if>
                              <c:if test="${pagingdto.pageNo == i}">
                                 <a class="btn btn-secondary"
                                    href="set.do?pageNo=${i}&surveySeq=${pagingdto.surveySeq}&month=${pagingdto.month}&number=${number}&newCheck=0&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection}&selectGD=${pagingdto.selectGD}">${i}</a>
                              </c:if>
                           </c:forEach>
                           <c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
                              <a class="btn btn-outline-secondary"
                                 href="set.do?pageNo=${pagingdto.endPageNo+1}&surveySeq=${pagingdto.surveySeq}&month=${pagingdto.month}&number=${number}&newCheck=0&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection}&selectGD=${pagingdto.selectGD}">다음</a>
                           </c:if>
                        </div>
                        <div style="float: right;">
                           <button type="button" id="map_insert" class="btn btn-outline-primary" onclick="mapInsert('${surveySeq}')">
                             	 조건과 관계없이 추가
                           </button>
                        </div>
                     </td>
                  </tr>
               </table>
               </table>
         </div>
      </div>
<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>

<!-- Modal -->
<div class="modal fade" id="popup" tabindex="-1"
   aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">추가할 조합의 프로젝트 범위를
               정하시오</h5>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <br>
            <h5>다면평가에 포함될 프로젝트의 범위 정하기</h5>
            <input type="hidden" id="surveySeq" name="surveySeq" value=serveySeq>
            <input type="hidden" id="raterId" name="raterId" value=raterId>
            <select class="form-control" id="month">
            <c:forEach items="${commonDateList}" var="month">
               <option value="${month.codeDetailName}">최근 ${month.codeDetailName}개월 동안에 끝난 프로젝트</option>
            </c:forEach>
            </select>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary" onclick="popup()">추가할사람
               보기</button>
         </div>
      </div>
   </div>
</div>