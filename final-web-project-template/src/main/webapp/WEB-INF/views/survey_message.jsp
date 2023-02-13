<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>
<script>
function reset_btn_mapping_pop(surveySeq){
    $('.searchRangeAll').empty();
    html='';
    html += `<div class="searchRange" style="margin-right: 190px;">
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
    <select name="selection2">
       <option selected value="60004">평가자 참여 여부</option>
       <c:forEach items="${checkList}" var="CL">
         <option value="${CL.surveyCompleteYN}">
            <c:if test="${CL.surveyCompleteYN eq 'Y'}">
                 예
              </c:if>
              <c:if test="${CL.surveyCompleteYN ne 'Y'}">
                 아니오
              </c:if>
           </option>
      </c:forEach>
    </select>
    </div>`;
    
    html+=`<div class="input-group-append">
       <input type="text" class="form-control" id="selectedKeyword" placeholder="평가자 이름 검색창" name="keyword" aria-describedby="button-addon2">
       <input type="hidden" name="pageNo" value="1">`;
    html +='<input type="hidden" name="surveySeq" value="'+surveySeq+'">';
    html+=`<input type="submit" class="btn btn-outline-secondary"
          id="button-addon2" value="검색"> `;
    html+='<input type="button" style="margin-left:10px;" class="btn btn-outline-secondary" onclick="reset_btn_mapping_pop('+surveySeq+')" value="초기화"></div>';
    $('.searchRangeAll').append(html);
}
</script>
   <div class="card">
         <div class="forshadowing">
               <div class="hmenu">
                  <div class="survey_list_form_upper_dv">
                     <form
                        action="<c:url value='/survey/evaluateMessage.do/${surveySeq}'/>"
                        method="GET" class="survey_list_form" id="survey_list_form_id">
                        <div class="searchRangeAll">
                        <div class="searchRange" style="margin-right: 190px;">
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
                        <c:if test="${pagingdto.selection eq rdp.departmentId }">
                           <option selected value="${pagingdto.selection}">${rdp.departmentName}</option>
                        </c:if>
                        <c:if test="${pagingdto.selection ne rdp.departmentId }">
                           <option value="${rdp.departmentId}">${rdp.departmentName}</option>
                        </c:if>
                     </c:forEach>
                  </select> 
                  <select name="selection2">
                     <option value="60004">평가자 참여 여부</option>
                     <c:forEach items="${checkList}" var="CL">
                        <c:if test="${pagingdto.selection2 eq CL.surveyCompleteYN}">
                           <option selected value="${pagingdto.selection2}">
                              <c:if test="${CL.surveyCompleteYN eq 'Y'}">
                                         예
                                      </c:if>
                                      <c:if test="${CL.surveyCompleteYN ne 'Y'}">
                                         아니오
                                      </c:if>
                           </option>
                        </c:if>
                        <c:if test="${pagingdto.selection2 ne CL.surveyCompleteYN}">
                           <option value="${CL.surveyCompleteYN}">
                              <c:if test="${CL.surveyCompleteYN eq 'Y'}">
                                         예
                                      </c:if>
                                      <c:if test="${CL.surveyCompleteYN ne 'Y'}">
                                         아니오
                                      </c:if>
                                   </option>
                        </c:if>
                     </c:forEach>
                  </select> 
                        </div>
                        <div class="input-group-append">
                             <input type="text" class="form-control" id="selectedKeyword" placeholder="평가자  이름 검색창"
                            name="keyword" value="${pagingdto.keyword}" aria-describedby="button-addon2"> 
                        <input type="hidden" name="pageNo" value="1"> <input
                           type="hidden" name="surveySeq" value="${surveySeq}" />
                        <input type="submit" class="btn btn-outline-secondary"
                              id="button-addon2" value="검색"> 
                        <input type="button" style="margin-left:10px;" class="btn btn-outline-secondary" onclick="reset_btn_mapping_pop(${surveySeq})" value="초기화">
                        </div>
                        </div>
                     </form>
                  </div>
               </div>
         <div class="col-12" style=""><h3 style="text-align:left;"><b>설문지 평가 완료여부 목록</b></h3></div>

            <table class="table table-sm table-striped table-bordered">
                  <thead>
                     <tr>
                        <th class="">#</th>
                        <th class="">이름</th>
                        <th class="">직급</th>
                        <th class="">부서</th>
                        <th class="">참여여부</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${evaluateList}" var="EL">
                        <tr>
                           <th scope="row">${EL.RNUM}</th>
                           <td>${EL.EMPLOYEE_NAME}</td>
                           <td>${EL.GRADE_NAME}</td>
                           <td class="sv_name">${EL.DEPARTMENT_NAME}</td>
                           <td>
                               <c:if test="${EL.SURVEY_COMPLETE_YN eq 'Y'}">
                                예
                             </c:if>
                             <c:if test="${EL.SURVEY_COMPLETE_YN ne 'Y'}">
                                아니오
                             </c:if>
                           </td>
                        </tr>
                     </c:forEach>
                  </tbody>
                 <table class="paiging-btn-table">
                  <tr class="table-light">
                     <td colspan="12" class="text-center" style="border: none;">
                        <div>
                           <a class="btn btn-outline-secondary"
                              href="?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}&surveySeq=${pagingdto.surveySeq}">처음</a>
                           <c:if test="${pagingdto.groupNo>1}">
                              <a class="btn btn-outline-secondary"
                                 href="?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">이전</a>
                           </c:if>

                           <c:forEach var="i" begin="${pagingdto.startPageNo}"
                              end="${pagingdto.endPageNo}">
                              <c:if test="${pagingdto.pageNo != i}">
                                 <a class="btn btn-outline-secondary"
                                    href="${surveySeq}?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">${i}</a>
                              </c:if>
                              <c:if test="${pagingdto.pageNo == i}">
                                 <a class="btn btn-secondary"
                                    href="${surveySeq}?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">${i}</a>
                              </c:if>
                           </c:forEach>

                           <c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
                              <a class="btn btn-outline-secondary"
                                 href="?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveySeq=${pagingdto.surveySeq}">다음</a>
                           </c:if>
                           <a class="btn btn-outline-secondary"
                              href="?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&surveySeq=${pagingdto.surveySeq}">맨끝</a>
                        </div>
                        <div style="float: right">
                         <button id="upper_dv_btn" type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">재전송</button>
                        </div>
                     </td>
                  </tr>
                 </table>
               </table>
         </div>
      </div>
   <%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>



   <!-- modal(이메일 보낼시) -->
   <div class="modal fade" id="exampleModal" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">평가 공시 재전송</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <c:url value="/survey/remessage.do" var="actionURL" scope="page" />
               <form:form action="${actionURL}" modelAttribute="map">
                  <input type="hidden" name="surveySeq" value="${surveySeq}">
                  <div class="form-group">
                      <label for="exampleFormControlTextarea1">
                         평가를 하지 않은 평가자에게 재전송할 메세지를 입력하시오
                      </label>
                      <textarea class="form-control" name="deliveryContent" rows="3">설문 날짜가 얼마 남지 않았습니다. 해당 주소로 들어가 로그인하여 다면 평가를 빨리 진행해주시길 바랍니다.</textarea>
                    </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">취소</button>
                     <input type="submit" class="btn btn-primary" value="등록">
                  </div>
               </form:form>
            </div>
         </div>
      </div>
   </div>

   <!-- modal(설문 등록 시 뜨는 팝업창) 끝-->
<!-- 제발 -->