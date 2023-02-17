<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>

   <div class="card">
         <div class="forshadowing">
               <div class="hmenu">
                  <div class="survey_list_form_upper_dv">
                     <form
                        action="<c:url value='/survey/evaluatesearch.do/${surveySeq}'/>"
                        method="GET" class="survey_list_form" id="survey_list_form_id">
                        <div class="searchRangeAll">
                        <div class="searchRange">
                          <select class="subSelection" name="selection2">
                         <option value=""
                              <c:out value ='${paigingDto.selection2== null? "selected":""}'/>>직급</option>
                                 <option value="사원"
                                    <c:out value = '${param.selection2 eq "사원"? "selected":"사원"}'/>>사원</option>
                                 <option value="대리"
                                 <c:out value = '${param.selection2 eq "대리"? "selected":"대리"}'/>>대리</option>
                                 <option value="과장"
                                 <c:out value = '${param.selection2 eq "과장"? "selected":"과장"}'/>>과장</option>
                                 <option value="차장"
                                 <c:out value = '${param.selection2 eq "차장"? "selected":"차장"}'/>>차장</option>
                                <option value="부장"
                                <c:out value = '${param.selection2 eq "부장"? "selected":"부장"}'/>>부장</option>

                           </select>

                        <select class="selection" name="selection">

                          <option value="employeeName"
                              <c:if test="${pagram.selection eq 'employeeName'}">selected</c:if>>이름</option>

                           <option value="departmentName"
                              <c:if test="${param.selection eq 'departmentName'}">selected</c:if>>부서명</option>

                        </select>
                        </div>

                        <div class="input-group-append">





                        <input type="text" class="form-control" id="selectedKeyword"
                           placeholder="search" name="keyword"
                           value="${pagingDto.keyword}${param.keyword}" aria-describedby="button-addon2">
                        <input type="hidden" name="pageNo" value="1"> <input
                           type="hidden" name="surveySeq" value="${surveySeq}" />
                        <input type="submit" class="btn btn-outline-secondary"
                              id="button-addon2" value="검색"> <input type="reset"
                              class="btn btn-outline-secondary" id="button-addon2" onclick="reset_btn_evaluate()"
                              value="초기화">
                        </div>
                        </div>
                     </form>
                  </div>
               </div>

         <div class="col-12" style=""><h3 style="text-align:left;"><b>${surveyInfo.surveyName} 피평가자 결과 목록</b> 
         	<div class="btn-group" style="margin-left: 715px; border-radius: 10px; height: 40px; border: 2px solid #e8e8e8;">
  				<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    				평가 참여 여부
  				</button>
  				<div class="dropdown-menu" style="width:170px">
  					<c:forEach items="${completeSurvey}" var="CS">  				
    					<a style="color:black;" href="<c:url value='/survey/evaluatesearch.do/${CS.surveySeq}'/>">${CS.surveyName}<br></a>
  					</c:forEach>
  				</div>
			</div>
			</h3>
		</div>

               <table class="table table-sm table-striped table-bordered" style="text-align: center;">
                  <thead>
                     <tr>

                        <th class="">#</th>
                        <th class="">이름</th>
                        <th class="">직급</th>
                        <th class="">부서</th>
                        <th class="">결과</th>


                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${evaluateList}" var="EL">
                        <tr>
                           <th scope="row">${EL.RNUM}</th>
                           <td>${EL.EMPLOYEE_NAME}</td>
                           <td>${EL.GRADE_NAME}</td>
                           <td class="sv_name">${EL.DEPARTMENT_NAME}</td>
                           <c:if test="${EL.GRADE_NAME eq '부장'}">
                           <td><input type="button" class="btn btn-link"
                           style="--bs-btn-padding-y: .25rem;
                             --bs-btn-padding-x: .5rem;
                            --bs-btn-font-size: .5rem;
                               line-height: 1;
                               font-size: 1rem;"
                              onclick="result_search_btn(${surveySeq},${EL.EMPLOYEE_ID})"
                              value="조회"></td>
                           </c:if>
                           <c:if test="${EL.GRADE_NAME ne '부장'}">
                           <td><input type="button" class="btn btn-link"  style="--bs-btn-padding-y: .25rem;
    --bs-btn-padding-x: .5rem;
    --bs-btn-font-size: .5rem;
    line-height: 1;
    font-size: 1rem;"
                              value="조회" disabled></td>
                           </c:if>
                        </tr>
                     </c:forEach>

                  </tbody>
   <table class="paiging-btn-table" style="width:100%; text-align:center;">
                  <tr class="table-light">
                     <td colspan="12" class="text-center" style="border: none;">
                        <div>
                           <a class="btn btn-outline-secondary"
                              href="?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&surveySeq=${pagingdto.surveySeq}">처음</a>
                           <c:if test="${pagingdto.groupNo>1}">
                              <a class="btn btn-outline-secondary"
                                 href="?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&surveySeq=${pagingdto.surveySeq}">이전</a>
                           </c:if>

                           <c:forEach var="i" begin="${pagingdto.startPageNo}"
                              end="${pagingdto.endPageNo}">
                              <c:if test="${pagingdto.pageNo != i}">
                                 <a class="btn btn-outline-secondary"
                                    href="${surveySeq}?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&surveySeq=${pagingdto.surveySeq}">${i}</a>
                              </c:if>
                              <c:if test="${pagingdto.pageNo == i}">
                                 <a class="btn btn-secondary"
                                    href="${surveySeq}?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&surveySeq=${pagingdto.surveySeq}">${i}</a>
                              </c:if>
                           </c:forEach>

                           <c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
                              <a class="btn btn-outline-secondary"
                                 href="?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&surveySeq=${pagingdto.surveySeq}">다음</a>
                           </c:if>
                           <a class="btn btn-outline-secondary"
                              href="?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&surveySeq=${pagingdto.surveySeq}">맨끝</a>
                        </div>
                        <div style="float: right;">
                          <button type="button" class="btn btn-outline-primary" onclick="location.href='<c:url value='/survey/evaluateMessage.do/${surveySeq}'/>'">
                     		 평가 참여 여부 확인 하러 가기
                       </div>
                     </td>
                  </tr>
                 </table>
              </table>
         </div>
   </div>

   <%@include file="/WEB-INF/views/common/footerformanager.jsp"%>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/survey_evaluate.js"></script>
<script>
function reset_btn_evaluate(){
	$('.searchRangeAll').empty();
	html='';
	
	html +='<div class="searchRange">';
    html +='<select class="subSelection" name="selection2">';
    html += `<option value="">직급</option>
           <option value="사원">사원</option>
           <option value="대리">대리</option>
           <option value="과장">과장</option>
           <option value="차장">차장</option>
          <option value="부장">부장</option>

     </select>`;
	html +=`&nbsp;<select class="selection" name="selection">
    <option value="employeeName" selected>이름</option>

     <option value="departmentName">부서명</option>

  </select>
  </div>`;

	html +=`<div class="input-group-append">

        <input type="text" class="form-control" id="selectedKeyword"
           placeholder="search" name="keyword"
            aria-describedby="button-addon2">
        <input type="hidden" name="pageNo" value="1"> <input
           type="hidden" name="surveySeq" value="${surveySeq}" />
        <input type="submit" class="btn btn-outline-secondary"
              id="button-addon2" value="검색"> <input type="reset"
              class="btn btn-outline-secondary" id="button-addon2" onclick="reset_btn_evaluate()"
              value="초기화">
        </div>`;
	$('.searchRangeAll').append(html);

} 
   
</script>


