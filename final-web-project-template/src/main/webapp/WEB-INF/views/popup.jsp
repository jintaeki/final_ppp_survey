<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/popup.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- contextPath가 변경돼도 소스 수정없이 적용 (유지보수 용이) -->


<script>
   var path = "${pageContext.request.contextPath }";
   /* 전체 선택 */
   $(function() {
      $("#check_all").click(function() {
         var chk = $(this).is(":checked");
         if (chk)
            $("#resTb input[name='chk_res']").prop('checked', true);
         else
            $("#resTb input[name='chk_res']").prop('checked', false);
      });
   });
   /* 체크값이 없을 경우 알림 */
   function selectItem() {
      if ($("#resTb input[name='chk_res']:checked").length == 0) {
         alert("추가할 인원을 선택해주세요");
         return false;
      }
      var resArr = new Array();
      $("#resTb input[name='chk_res']:checked").each(
            function(index) {
               var plusId = $(this).val();
               var addObj = new Object();
               $tr = $("#tr_" + plusId);
               addObj.projectId      = $tr.find("input[name='projectId']").val();
               addObj.gradeId        = $tr.find("input[name='gradeId']").val();
               addObj.departmentId   = $tr.find("input[name='departmentId']").val();
               addObj.surveySeq      = $tr.find("input[name='surveySeq']").val();
               addObj.raterId        = $tr.find("input[name='raterId']").val();
               addObj.appraiseeId    = $tr.find("input[name='appraiseeId']").val();
               addObj.projectName    = $tr.find("input[name='projectName']").val();
               addObj.surveyName     = $tr.find("input[name='surveyName']").val();
               addObj.departmentName = $tr.find("input[name='departmentName']").val();
               addObj.raterName      = $tr.find("input[name='raterName']").val();
               addObj.appraiseeName  = $tr.find("input[name='appraiseeName']").val();
               addObj.gradeName      = $tr.find("input[name='gradeName']").val();
               resArr.push(addObj);
      console.log(plusId);
      });
      console.log(resArr);   
     
     $.ajax({
		 url: "popup.do",
		 type: "POST",
		 contentType: "application/json;charset=UTF-8",
		 data:JSON.stringify(resArr),
		 dataType : "json"
	   })
	  .done(function(resMap) {
	     alert(resMap.msg);
		 opener.parent.location.reload();
		 window.close();
	  })
	  .fail(function(e) {
	 	 alert("추가 실패용");
	  })
	  always(function() {
		 alert(resMap.msg);

	  });   
   }
</script>
<div class="entire_popup">
<div class="popup-title">다면평가 대상 추가</div>

   <div class="table table-hover">
         <table id="resTb" class="table">
            <thead>
               <tr>
                  <th><input type="checkbox" id="check_all" /></th>
                  <th>프로젝트</th>
                  <th>부서</th>
                  <th>평가자</th>
                  <th>피평가자</th>
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
								<input type="hidden" name="departmentId" value="${result.departmentId}" />
								<input type="hidden" name="surveySeq" value="${result.surveySeq}" />
								<input type="hidden" name="raterId" value="${result.raterId}" />
								<input type="hidden" name="appraiseeId" value="${result.appraiseeId}" />
								<input type="hidden" name="projectName" value="${result.projectName}" />
								<input type="hidden" name="surveyName" value="${result.surveyName}" />
								<input type="hidden" name="departmentName" value="${result.departmentName}" />
								<input type="hidden" name="raterName" value="${result.raterName}" />
								<input type="hidden" name="appraiseeName" value="${result.appraiseeName}" />
								<input type="hidden" name="gradeName" value="${result.gradeName}" />
								
								<td><input type="checkbox" name="chk_res" value="${result.raterId}${result.appraiseeId}"/></td>
								<td class="projectName"><c:out value="${result.projectName}" /></td>
								<td class="raterName"><c:out value="${result.raterName}" /></td>
								<td class=departmentName><c:out value="${result.departmentName}" /></td>
								<td class="appraiseeName"><c:out value="${result.appraiseeName}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<c:if test="${fn:length(popupList) == 0}">
                  <tr>
                     <td colspan="5">
                     <spring:message code="list.noResult" text="추가할 인원을 선택해주세요" />
                     </td>
                  </tr>
               </c:if>
            </tbody>
         </table>


      <div class="d-flex justify-content-between"></div>

      <!-- selectItem : 체크값이 없을 경우 체크하라는 유효성 검사 -->
      <div class="d-grid gap-2">
      <a class="btn btn-primary" onclick="selectItem();">추가</a>
      </div>
   </div>
</div>
<!--
<input type="button" type="submit" value="저장" />
<input type="button" type="reset" value="닫기" onclick="window.close();" />
-->