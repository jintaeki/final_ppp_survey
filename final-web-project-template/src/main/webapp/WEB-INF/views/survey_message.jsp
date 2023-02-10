<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_evaluate.css"/>

   <div class="card">
         <div class="forshadowing">
               <div class="hmenu">
                  <div class="survey_list_form_upper_dv">
                     <form
                        action="<c:url value='/survey/evaluateMessage.do/${surveySeq}'/>"
                        method="GET" class="survey_list_form" id="survey_list_form_id">
                        <div class="searchRangeAll">
                        <div class="searchRange" style="margin-right: 540px;">
                        <select name="selection">
	                        <c:forEach items="${CommonEvaluteList}" var="common">
							<c:if test="${pagingdto.selection eq common.codeDetailId }">
								<option selected value="${pagingdto.selection}">${common.codeDetailName}</option>
							</c:if>
							<c:if test="${pagingdto.selection ne common.codeDetailId }">
								<option value="${common.codeDetailId}">${common.codeDetailName}</option>
							</c:if>
						 </c:forEach>
                        </select>
                        </div>
                        <div class="input-group-append">
                        <input type="text" class="form-control" id="selectedKeyword"
                           placeholder="search" name="keyword"
                           value="${pagingDto.keyword}" aria-describedby="button-addon2">
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
			<div class="col-12" style=""><h3 style="text-align:left;"><b>설문지 평가 완료여부 목록</b> <button class="btn btn-outline-primary" style="float:right;"  onclick="history.back()">뒤로가기</button></h3></div>

            <table class="table table-sm table-striped table-bordered" style="text-align:center;">
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
                           	 <c:if test="${EL.SURVEY_COMPLETE_YN eq Y}">
                          		예
                             </c:if>
                             <c:if test="${EL.SURVEY_COMPLETE_YN ne Y}">
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