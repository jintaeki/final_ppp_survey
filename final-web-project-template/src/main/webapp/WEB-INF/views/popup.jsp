<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/popup.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paging.css" />


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/popup.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- contextPath가 변경돼도 소스 수정없이 적용 (유지보수 용이) -->


<script>
   function reset_btn_mapping_pop(surveySeq, raterId, month){
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
       

    html +=` <select name="selection2" class="selection2">
             <option selected value="60004">피평가자 부서</option>
             <c:forEach items="${appraiseeDepartment}" var="adp">
              <option value="${adp.departmentId}">${adp.departmentName}</option>
           </c:forEach>
          </select>
          
          <input type="text" class="form-control" id="selectedKeyword" placeholder="피평가자 이름 검색창" name="keyword2" aria-describedby="button-addon2">
          <input type="hidden" name="pageNo" value="1">`;
       html +='<input type="hidden" name="surveySeq" value="'+surveySeq+'">';
       html +='<input type="hidden" name="raterId" value="'+raterId+'">';
       html+='<input type="hidden" name="month" value="'+month+'">';  
       html+='<div class="input-group-append">';  
       html+=`<input type="submit" class="btn btn-outline-secondary"
             id="button-addon2" value="검색"> `;
       html+='<input type="button" style="margin-left:10px;" class="btn btn-outline-secondary" onclick="reset_btn_mapping_pop('+surveySeq+','+raterId+','+month+')" value="초기화"></div>';
       $('.searchRangeAll').append(html);

    }
</script>
<div class="entire_popup">
   <div class="hmenu_popup">
      <div class="survey_list_form_upper_dv">
         <form action="<c:url value='/mapping/popup.do'/>" method="get" class="survey_list_form">
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
                  <c:if test="${pagingdto.selection eq rdp.departmentId }">
                     <option selected value="${pagingdto.selection}">${rdp.departmentName}</option>
                  </c:if>
                  <c:if test="${pagingdto.selection ne rdp.departmentId }">
                     <option value="${rdp.departmentId}">${rdp.departmentName}</option>
                  </c:if>
               </c:forEach>
            </select> 
            <input type="text" class="form-control" id="selectedKeyword" placeholder="평가자  이름 검색창"
                  name="keyword" value="${pagingdto.keyword}" aria-describedby="button-addon2"> 
             </div>
            <select name="selection2" class="selection2">
               <option value="60004">피평가자 부서</option>
               <c:forEach items="${appraiseeDepartment}" var="adp">
                  <c:if test="${pagingdto.selection2 eq adp.departmentId}">
                     <option selected value="${pagingdto.selection2}">${adp.departmentName}</option>
                  </c:if>
                  <c:if test="${pagingdto.selection2 ne adp.departmentId}">
                     <option value="${adp.departmentId}">${adp.departmentName}</option>
                  </c:if>
               </c:forEach>
            </select> 
            <input type="text" class="form-control" id="selectedKeyword" placeholder="피평가자 이름 검색창"
                  name="keyword2" value="${pagingdto.keyword2}" aria-describedby="button-addon2"> 
            <input type="hidden" name="pageNo" value="1">
            <input type="hidden" name="surveySeq" value="${pagingdto.surveySeq}">
            <input type="hidden" name="raterId" value="${pagingdto.raterId}">
            <input type="hidden" name="month" value="${pagingdto.month}">
            <div class="input-group-append">
               <input type="submit" class="btn btn-outline-secondary" id="button-addon2" value="검색">
               <input type="button" style="margin-left:10px;" class="btn btn-outline-secondary" onclick="reset_btn_mapping_pop(${pagingdto.surveySeq},${pagingdto.raterId},${pagingdto.month})" value="초기화">
            </div>
            </div>
         </form>
      </div>
   </div>
   <div class="table-table-hover">
      <div class="col-12" style=""><h3 style="text-align:center;"><b>다면평가 대상 추가</b></h3><br></div>
         <table id="resTb" class="tablePop">
            <thead>
               <tr>
                  <th class="check"><input type="checkbox" id="check_all" /></th>
                  <th>프로젝트</th>
                  <th>평가자</th>
                  <th>평가자 부서</th>
                  <th>피평가자</th>
                  <th>피평가자 부서</th>
               </tr>
            </thead>
            <tbody>
            <c:choose>
               <c:when test="${empty getPopup}">
                  <tr>
                     <td>매칭된 평가자가 없습니다.
                  <tr>
               </c:when>
               <c:otherwise>
                  <c:forEach var="result" items="${getPopup}">
                     <tr id="tr_${result.raterId}${result.appraiseeId}">
                        <input type="hidden" name="projectId" value="${result.projectId}" />
                        <input type="hidden" name="gradeId" value="${result.gradeId}" />
                        <input type="hidden" name="rDepartmentId" value="${result.rDepartmentId}" />
                        <input type="hidden" name="aDepartmentId" value="${result.aDepartmentId}" />
                        <input type="hidden" name="surveySeq" value="${result.surveySeq}" />
                        <input type="hidden" name="raterId" value="${result.raterId}" />
                        <input type="hidden" name="appraiseeId" value="${result.appraiseeId}" />
                        <input type="hidden" name="projectName" value="${result.projectName}" />
                        <input type="hidden" name="surveyName" value="${result.surveyName}" />
                        <input type="hidden" name="rDepartmentName" value="${result.rDepartmentName}" />
                        <input type="hidden" name="aDepartmentName" value="${result.aDepartmentName}" />
                        <input type="hidden" name="raterName" value="${result.raterName}" />
                        <input type="hidden" name="appraiseeName" value="${result.appraiseeName}" />
                        <input type="hidden" name="gradeName" value="${result.gradeName}" />
                        
                        <td><input type="checkbox" name="chk_res" value="${result.raterId}${result.appraiseeId}"/></td>
                        <td class="projectName"><c:out value="${result.projectName}" /></td>
                        <td class="raterName"><c:out value="${result.raterName}" /></td>
                        <td class="rDepartmentName"><c:out value="${result.rDepartmentName}" /></td>
                        <td class="appraiseeName"><c:out value="${result.appraiseeName}" /></td>
                        <td class="aDepartmentName"><c:out value="${result.aDepartmentName}" /></td>
                     </tr>
                  </c:forEach>
               </c:otherwise>
            </c:choose>
            </tbody>
         </table>


      <div class="d-flex justify-content-between"></div>

      <!-- selectItem : 체크값이 없을 경우 체크하라는 유효성 검사 -->
      <div id=button class="d-grid gap-2">
      <br>
      <spring:message code="list.noResult" text="추가할 인원을 선택해주세요" /><br><br>
      <button type="button" class="btn btn-primary" onclick="selectItem();">추가</button><br><br>
      </div>
      <div class="page_wrap">
         <div class="page_nation">
            <%-- 맨처음 페이지 이동    
                  <a class="arrow prev" href="surveysearch?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">처음</a> --%>
            <c:if test="${pagingdto.groupNo>1}">
               <a class="arrow prev"
                  href="popup.do?pageNo=${pagingdto.startPageNo-1}&surveySeq=${pagingdto.surveySeq}&raterId=${pagingdto.raterId}&month=${pagingdto.month}&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&selectGD=${pagingdto.selectGD}">이전</a>
            </c:if>
            <c:forEach var="i" begin="${pagingdto.startPageNo}" end="${pagingdto.endPageNo}">
               <c:if test="${pagingdto.pageNo != i}">
                  <a class="active" 
                     href="popup.do?pageNo=${i}&surveySeq=${pagingdto.surveySeq}&raterId=${pagingdto.raterId}&month=${pagingdto.month}&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&selectGD=${pagingdto.selectGD}">${i}</a>
               </c:if>
               <c:if test="${pagingdto.pageNo == i}">
               <a class="page_nation"
                     href="popup.do?pageNo=${i}&surveySeq=${pagingdto.surveySeq}&raterId=${pagingdto.raterId}&month=${pagingdto.month}&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&selectGD=${pagingdto.selectGD}">${i}</a>
               </c:if>
            </c:forEach>
            <c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
               <a class="arrow next"
                  href="popup.do?pageNo=${pagingdto.endPageNo+1}&surveySeq=${pagingdto.surveySeq}&raterId=${pagingdto.raterId}&month=${pagingdto.month}&keyword=${pagingdto.keyword}&keyword2=${pagingdto.keyword2}&selection=${pagingdto.selection}&selection2=${pagingdto.selection2}&selectGD=${pagingdto.selectGD}">다음</a>
            </c:if>
            <%-- 맨마지막 페이지 이동 
                <a class="arrow next" href="surveysearch?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">맨끝</a> --%>
         </div>
      </div>
   </div>
</div>