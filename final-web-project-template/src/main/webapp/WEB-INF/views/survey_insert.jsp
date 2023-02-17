<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>

<style>
#input_qus:focus { font-size:20px; }

}

</style>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />
<div class="card">
	<div class="forshadowing" style="height: 860px;padding:0px;">
		<div class="title">
			<div class="input_title">기본 설정</div>
		<div><button  class="btn btn-link"
			onclick="insertComplete(${SLD.surveySeq})">등록완료</button></div>
		</div>
		<!-- 설문지 설정 진택 -->

		<div class="container_survey">
			<div class="row" ></div>

			<div class="container_flex">

				<form:form modelAttribute="SLD" id="survey_setting_form">
					<div style="display:flex; justify-content: space-around;">
							<div>
							<div class="insert_category"><b>설문지 제목</b><label for="survey_name"></label></div>
							<input type="text" id="survey_name"
								name="surveyName" style="width: 200px;"
								value="${SLD.surveyName}">
							</div>

							<div>
							<div class="insert_category"> <b>평가 기간</b></div>
							<input type="date" name="surveyStartDate"
								class="survey_date"
								value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">-
								<input type="date" name="surveyClosedDate" class="survey_date"
								value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />">

							</div>

							<div>
							<div class="insert_category"> <b>익명/기명</b></div>
							<c:if
									test="${SLD.anonymityCheckCode eq '20001'}">
									<input type="radio" name="anonymityCheckCode"
										id="survey_type_check" value="20001" checked>
									<label style="margin-bottom: 0px;" for="survey_type_check"><b>익명</b></label>
									<input type="radio" name="anonymityCheckCode"
										id="survey_type_check" value="20002">
									<label style="margin-bottom: 0px;" for="survey_type_check"><b>기명</b></label>
							</c:if>
							<c:if test="${SLD.anonymityCheckCode eq '20002'}">
									<input type="radio" name="anonymityCheckCode"
										id="survey_type_check" value="20001">
									<label style="margin-bottom: 0px;" for="survey_type_check"><b>익명</b></label>

									<input type="radio" name="anonymityCheckCode"
										id="survey_type_check" value="20002" checked>
									<label style="margin-bottom: 0px;" for="survey_type_check"><b>기명</b></label>
							</c:if>
							</div>

							<div style="z-index:1">
							<div class="insert_category" ><b>상세 설명</b></div>
							<textarea class="visually-hidden"
									id="message-text" name="surveyContent"
									style="width: 400px; height: 100px; max-width: 350px;">${SLD.surveyContent }</textarea>
							</div>




							<div><input type="button" class="update_btn" style="margin-top:70px"
								style="" onclick="register()"
								value="적용">
							<input type="hidden" name="stateCode" value="30001">
					<input type="hidden" name="surveySeq" id="surveyseq"value="${SLD.surveySeq}">
							</div>


					</div>



				</form:form>

			</div>


			<div style="box-shadow: 0px 0px 1px 1px #c0c0c0; border: 4px solid #F2F2F2;"></div>

			<div class="questionAndItem">
				<div class="question_management">
					<div class="input_title" style="display: contents">
						문제 목록
						<button type="button"
							onclick="question_copy(this,${SLD.surveySeq} )"
							style="background: white; border: 1px solid #fff; border-radius: 35em;">
							<i class="fas fa-plus"></i>
						</button>
					</div>

					<div id="scroll_area" style="overflow: auto; height: 500px;">


						<!-- 여기까지 문제 div -->
						<table id="queAfter" class="table  table-striped">
							<c:if test="${empty SQL}">
								<tr class="noquestion">
									<td><b>${NoQuestion}</b></td>
								</tr>
							</c:if>
							<c:forEach items="${SQL}" var="qlist">
								<tr class="deleteThis">
									<td style="display: flex;">
									<button class="delete_btn" onclick="deleteQus(this,${qlist.surveySeq})" value="${qlist.questionSeq }">
										<i class="fas fa-xmark"></i>
									</button>

									<form id="${qlist.questionSeq }" onsubmit="return false;">

										<div class="input_qus" id="checkTouch">
											<input type="hidden" name="surveySeq"
												value="${qlist.surveySeq }" id="surveySequence"> <input
												type="hidden" name="questionSeq"
												value="${qlist.questionSeq }"> <input
												name="questionContent" type="text" id="input_qus"
												onclick="manageQus(this,${qlist.questionSeq},${qlist.questionTypeCode },${qlist.surveySeq} ); this.onclick=null;"
												value="${qlist.questionContent }">

										</div>&nbsp;
										<c:if test="${qlist.questionTypeCode eq '10001' }">
											&nbsp;<input type="radio" id="obj_radio"
												name="${qlist.questionSeq}" value="10001"
												onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
												checked> 객관식
													&nbsp;<input type="radio" id="subj_radio"
												name="${qlist.questionSeq}" value="10002"
												onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													&nbsp;<input type="radio" id="mix_radio"
												name="${qlist.questionSeq}" value="10003"
												onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식
												</c:if>
										<c:if test="${qlist.questionTypeCode eq '10002' }">
											&nbsp;<input type="radio" id="obj_radio"
												name="${qlist.questionSeq}" value="10001"
												onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 객관식
													&nbsp;<input type="radio" id="subj_radio"
												name="${qlist.questionSeq}" value="10002"
												onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
												checked> 주관식
													&nbsp;<input type="radio" id="mix_radio"
												name="${qlist.questionSeq}" value="10003"
												onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식
												</c:if>
										<c:if test="${qlist.questionTypeCode eq '10003' }">
											&nbsp;<input type="radio" id="obj_radio"
												name="${qlist.questionSeq}" value="10001"
												onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 객관식
													&nbsp;<input type="radio" id="subj_radio"
												name="${qlist.questionSeq}" value="10002"
												onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													&nbsp;<input type="radio" id="mix_radio"
												name="${qlist.questionSeq}" value="10003"
												onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
												checked> 혼합식
											</c:if>
										<c:if
											test="${qlist.questionTypeCode ne '10001' and qlist.questionTypeCode ne '10002' and qlist.questionTypeCode ne '10003' }">
											&nbsp;<input type="radio" id="obj_radio"
												name="${qlist.questionSeq}" value="10001"
												onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
												checked> 객관식
													&nbsp;<input type="radio" id="subj_radio"
												name="${qlist.questionSeq}" value="10002"
												onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													&nbsp;<input type="radio" id="mix_radio"
												name="${qlist.questionSeq}" value="10003"
												onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식
											</c:if>



									</form>

									<!-- 조회 버튼 -->
									<button value="${qlist.questionSeq }"
										onclick="touchQuestion(this)" style="display: none;">
										<i class="fas fa-search"></i>
									</button>


									<div class="blank_under"></div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div style="box-shadow: 1px 1px 1px 0px #c0c0c0; border-left: 4px solid #F2F2F2; border-right: 4px solid #F2F2F2;
    				height: 630px;"></div>

				<div class="item_management">
					<div class="hey" style="height:20px; width:200px;"></div>
					<div style="display: flex;align-items: baseline;">

						<div class="input_title">문항 관리</div>


						<div class="itemAfter">
							<!-- 객관식 -->
							<c:forEach items="${SQL}" var="qlist">

							</c:forEach>
<!-- 							<div><p class="beforeTouch"><b>문제를 클릭하여 문항을 관리해 보세요.</b></p></div> -->

						</div>
					</div>
				</div>

				<!--  문제관리 끝 -->


			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/survey_insert.js"></script>

<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>