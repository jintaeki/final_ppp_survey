<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>

<!-- <script src="resources/js/survey.js"></script> -->
<!-- <script src="resources/js/surveycountdown.js"></script> -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/survey.js"></script>

<%--    <div class="survey_info">
   <br>
      <b>참여 가능 설문</b>
       <br>
            <c:forEach items="${surveySeqAndName}" var="surveySeqAndName">
                <button id="menu_btn" onclick="selectSurvey(this,${raterId})" value="${surveySeqAndName.SURVEY_SEQ}" style="border:none;"><b>${surveySeqAndName.SURVEY_NAME}</b></button>
             <br>
             </c:forEach>
   </div> --%>

<!-- 문항 시작 -->
<div class="card_bj">
   <div class="forshadowing_bj">
   <div style="display:flex;">
      <select name="surveySeq" onclick="selectSurvey(this,${raterId})">
         <option value="0">평가 선택</option>
         <option value="1">전체 조회</option>
         <c:forEach items="${surveySeqAndName}" var="surveySeqAndName">
            <option value="${surveySeqAndName.SURVEY_SEQ}">${surveySeqAndName.SURVEY_NAME}</option>
         </c:forEach>
      </select>
      <div class="forContent"></div>
      </div>
      <div class="row">

         <div class="col-5" style="padding:0px;">
            <div class="appraiseeList_list">

               <c:forEach items="${surveySeqAndName}" var="surveySeqAndName">
                  <div class="appraiseeList">
                     <div class="input_title">피평가자 목록
                        (${surveySeqAndName.SURVEY_NAME})</div>

                     <div id="scroll_area">


                        <div class="row"
                           style="font-weight: bold; border-radius: 20px; background-color: #f3f3f3; color: #8a8a8a; margin-bottom: 10px;">
                           <div class="col-3">피평가자</div>
                           <div class="col-4">부서</div>
                           <div class="col-2">직급</div>
                           <div class="col-3"></div>

                        </div>

                        <c:forEach items="${allUser}" var="allAppraisee">

                           <c:if test="${allUser} eq null }">
                              <div class="noAppraisee">
                                 <b>평가 대상이 없습니다.</b>
                              </div>
                           </c:if>
                           <c:if
                              test="${surveySeqAndName.SURVEY_SEQ eq allAppraisee.surveySeq }">
                              <div id="appendArea" class="row" style="margin-bottom: 12px;">
                                 <div class="col-3">${allAppraisee.appraiseeName}</div>
                                 <div class="col-4">${allAppraisee.appraiseeDepartmentName}</div>
                                 <div class="col-2">${allAppraisee.appraiseeGradeName}</div>
                                 <c:if test="${allAppraisee.surveyCompleteYN eq 'N'}">
                                    <div class="col-3">

                                       <button class="create_btn" style="color: blue;"
                                          onclick="selectSurvey(this,${raterId})"
                                          value="${allAppraisee.surveySeq }">조회</button>
                                    </div>
                                 </c:if>
                                 <c:if test="${allAppraisee.surveyCompleteYN eq 'Y'}">
                                    <div class="col-3">
                                       <button style="padding: 3px 7px;" class="create_btn"
                                          disabled>평가완료</button>
                                    </div>
                                 </c:if>

                              </div>
                           </c:if>
                        </c:forEach>



                     </div>
                  </div>
               </c:forEach>
            </div>

         </div>
         <div class="col-7" style="padding: 24px;">
            <div class="survey_section">
               <div class="surveyName"></div>

               <div id="scroll_area" style="max-height: 630px;">
                  <div class="survey_list">

                     <form:form id="surveyForm" style="width:100%;" modelAttribute="surveyResult">
                        <div class="noQuestion">
                           <b>설문을 선택하세요</b>
                        </div>
                        <!-- 문제 들어가는 곳 -->
                     </form:form>
                     <div class="submit_btn" style="margin-bottom:20px;"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- forshadowing_bj -->
</div>
<!-- card -->

<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>