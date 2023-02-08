<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>

<div class="col-11">
   <div class="card">
      <div class="card-body">
         <div class="forshadowing">
           <div class="title">평가 대상자 목록</div>
            <div class="row">
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
                           		<c:out value = '${param.selection2 eq "사원"? "selected":"과장"}'/>>과장</option>
                           		<option value="차장"
                           		<c:out value = '${param.selection2 eq "사원"? "selected":"차장"}'/>>차장</option>
                                <option value="부장"
                                <c:out value = '${param.selection2 eq "사원"? "selected":"부장"}'/>>부장</option>

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
                              class="btn btn-outline-secondary" id="button-addon2"
                              value="초기화">
                        </div>
                        </div>
                     </form>
                  </div>
               </div>
               <table class="table table-striped">
                  <thead>
                     <tr>

                        <th class="col-2"></th>
                        <th class="col-2">이름</th>
                        <th class="col-2">직급</th>
                        <th class="col-3">부서</th>
                        <th class="col-3">결과</th>


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
                              onclick="result_search_btn(${surveySeq},${EL.EMPLOYEE_ID})"
                              value="조회"></td>
                           </c:if>
                           <c:if test="${EL.GRADE_NAME ne '부장'}">
                           <td><input type="button" class="btn btn-link"
                              value="조회" disabled></td>
                           </c:if>
                        </tr>
                     </c:forEach>

                  </tbody>
							
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
                        <div style="float: right;">
                        <button type="button" class="btn btn-outline-primary" onclick="location.href='<c:url value='/survey/evaluateMessage.do/${surveySeq}'/>'">
							 설문지 참여 여부 확인 하러 가기
						</button>
                        </div>
                     </td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
   </div>
</div>


<script>
//평가 유무 비동기 체크
function result_search_btn(surveySeq, employeeId) {
      var data =$('#surveyResultList')[0]
      let empid = employeeId;
      let surseq = surveySeq;
      $.ajax({
       method: 'POST',
       url: '/survey/surveyresultcheck.do/' + surveySeq + '/' + employeeId,
       processData : false,
       contentType : false,
        cache : false,
        beforeSend: function() {
            console.log("surveyresult 비동기 요청");
            console.log(employeeId);
            console.log(surveySeq);

         },
         success: function(data){
       if(data[0] != null){

//           console.log(data);
//          console.log(empid);
//          console.log(surseq);
          location.href="/survey/surveyresult.do/"+surseq+'/'+empid;
       }else{
            alert("평가 데이터가 없습니다.");
       }
          },error : function(e) {   //실패, 에러
              console.log("Error", e);
          }
      });
   }
</script>

   <%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>

