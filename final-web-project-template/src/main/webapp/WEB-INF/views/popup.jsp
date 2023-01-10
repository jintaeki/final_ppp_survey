<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
<link rel="stylesheet" href="resources/css/popup.css"/>

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
					var surveyName = $(this).val();
					var addObj = new Object();
					$tr = $("#tr_" + surveyName);
					addObj.survey_Name = $tr.find("input[name='surveyName']").val();
					addObj.department_Name = $tr.find("input[name='departmentName']").val();
					addObj.appraisee_id = $tr.find("input[name='appraiseeId']").val();

					resArr.push(resObj);
				});
		window.opener.setResList(resArr);
		window.close();
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
						<th>이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${getPopup}">
						<tr id="tr_${result.surveyName}">
								<input type="hidden" name="surveyName" value="${result.surveyName}" /> 
								<input type="hidden" name="departmentName" value="${result.departmentName}" /> 
								<input type="hidden" name="appraiseeId" value="${result.appraiseeId}" />

							<td>
								<input type="checkbox" name="chk_res" value="${result.surveyName}" />
							</td>
								<td class="surveyName"><c:out value="${result.surveyName}" /></td>
								<td class=departmentName><c:out value="${result.departmentName}" /></td>
								<td class="appraiseeId"><c:out value="${result.appraiseeId}" /></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(popupList) == 0}">
						<tr>
							<td colspan="5">
							<spring:message code="list.noResult" text="추가할 인원을 선택해주세요" />
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<div class="d-flex justify-content-between"></div>

		<!-- selectItem : 체크값이 없을 경우 체크하라는 유효성 검사 -->
		<div class="d-grid gap-2">
		<a class="btn btn-primary" href="#" onclick="selectItem(); return false;">추가</a>
		</div>
</div>
<!-- 
<input type="button" type="submit" value="저장" />
<input type="button" type="reset" value="닫기" onclick="window.close();" /> 
-->