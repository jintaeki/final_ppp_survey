<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/insert.css">

<div class="container">


<!-- 상단 information -->
	<div class="container_flex">
		<form:form modelAttribute="SLD" id="survey_setting_form">
				<span class="insert_category" ><b>제목</b>
					<label for="survey_name"></label> 
					<input type="text" id="survey_name" name="surveyName" style="width: 200px;" value="${SLD.surveyName}">
				</span>
				
				<span class="insert_category">
					<input type="date" name="surveyStartDate" class="survey_date"
						value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">- 
					<input type="date" name="surveyClosedDate" class="survey_date"
						value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />">
				</span>
				
				<span class="insert_category">
					<c:if test="${SLD.anonymityCheckCode eq '20001'}" >
					<input type="radio" name="anonymityCheckCode" 
							id="survey_type_check" value="20001" checked>익명
					<input type="radio" name="anonymityCheckCode"
							id="survey_type_check" value="20002">기명
         		    </c:if>

					<c:if test="${SLD.anonymityCheckCode eq '20002'}">
						<input type="radio" name="anonymityCheckCode" 
							id="survey_type_check" value="20001">
						<label for="survey_type_check">익명</label>
						
						<input type="radio" name="anonymityCheckCode" style=""
							id="survey_type_check" value="20002" checked>
						<label for="survey_type_check">기명</label>
					</c:if>
				</span>	
				<br>
				<%-- <span class="insert_category"><b>상세 설명</b>
					<label for="message-text" ></label>
					<textarea class="visually-hidden" id="message-text"
						name="surveyContent">${SLD.surveyContent }</textarea>
				
					<input type="hidden" name="stateCode" value="30001"> 
						<input type="hidden" name="surveySeq" id="surveyseq" value="${SLD.surveySeq}">
				</span> --%>
		</form:form>
		<input type="button" class="update_btn" onclick="register()" value="적용">
	</div>
<!-- 상단 information 끝 -->











 <!-- ㅇㅅㅇ < 미야옹 ) -->

<div class="container_survey">
<div class="row">

			<div class="question_management col-6">
				<div class="input_title" style="margin-bottom: 60px;"> 문제 관리 </div>
				<div id="scroll_area">
					<!--save-->
					<c:forEach items="${SQL}" var="qlist">
						<div id="queAfter">

							<div class="input_qus">
								<input disabled type="text" id="input_qus"
									value="${qlist.questionContent }">
							</div>
							<!-- 조회 버튼 -->
							<button value="${qlist.questionSeq }"
								onclick="touchQuestion(this)"
								style="border: 1px solid #fff; border-radius: 35em;">
								<i class="fas fa-search"></i>
							</button>

							<!-- 삭제 버튼 -->
							<button class="delete_btn"
								onclick="deleteQus(this,${qlist.surveySeq})"
								value="${qlist.questionSeq }"
								style="border: 1px solid #fff; border-radius: 35em;">
								<i class="fa-regular fa-trash-can"></i>
							</button>
							<div class="blank_under"></div>
						</div>
					</c:forEach>

				</div>
			</div>
		
		
	<div class="item_management col-1">ddd</div>
		
   <div class="item_management col-5">
      <div class="input_title">문항 관리</div>
      
      <div class="question_inputdv" id="input_question">
      <form:form modelAttribute="SQD" id="questioN_insert_form">
         <!-- aa -->
         <div id="insertQform">

            <div class="select_radio" id="select_radio">
               <input type="radio" name="questionTypeCode" id="obj_radio"
                  onclick="checkit1()" value="10001" checked>&nbsp;객관식 &nbsp;&nbsp;&nbsp;
                  <input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002">&nbsp;주관식 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003">&nbsp;혼합식 &nbsp;&nbsp;&nbsp;
            </div>
            <div class="question_content_area" id="question_add">
               <div class="input-group" id="question_content">
                  <textarea class="form-control" aria-label="문제 입력칸"
                     name="questionContent">${SQD.questionContent}</textarea>
               </div>




               <!-- 문제 추가 버튼  -->
               <!-- onclick="insertQus()" -->
            <div class="question_add_btn_div">

               <button type="button" class="create_btn" id="add_qus_btn"
                  onclick="insertQus()">문제 추가</button>

               <button type="button" class="create_btn"
                  id="update_btn" onclick="qusUpdate(${SLD.surveySeq})">문제 수정</button>
               <input type="hidden" name="surveySeq" id="seq"
                  value="${SLD.surveySeq }"> <input type="hidden"
                  name="questionSeq" value="2">
               <!-- 비동기로 바꿔 넣어보자 -> 문항도 마찬가지 -->
            </div>

            <input type="hidden" name="itemScore" value="1"> 
            <input type="hidden" name="itemContent" value=" ">
         </div>
         </div>
      </form:form>
   </div>




         <button type="button" class="create_btn" id="add_item_btn"
                  onclick="insertItem()">문항 추가</button>
                  
   </div>




  
</div>



   <!-- 채우 폼에 진택 코드 넣기 끝-->

   <div class="list-group-item list-group-item-action active py-3 lh-sm"
      id="newQUE" style="display: none">

      <input type="text" class="input_qus" value="문제를 입력해주세요">
      <button class="delete_btn">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
            fill="currentColor" class="bi bi-x" viewBox="0 0 16 16"> <path
               d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /> </svg>
      </button>
      <div class="blank_under"></div>
   </div>


   
</div>
<!-- 객관식 -->
		<div class="" id="item_div">
			<c:forEach items="${SQL}" var="qlist">
				<div id="obj_box_toggle" style="display: none;">
					<div class="col-12">
						<div class="Item_box">
							<button type="button" id="item_obj_copy">+</button>
							<form:form modelAttribute="SQD" id="item_obj_form">
								<input type="hidden" name="questionTypeCode" value="10001">
								<input type="hidden" name="surveySeq" value="${SLD.surveySeq}">

								<div class="icon_line" id="obj_ItemAfter">
									<label><input type="text" name="itemContent"
										placeholder="문항 입력..." id="ic"></label> 점수<input type="number"
										name="itemScore" min="0" value="0"
										style="min-width: 20px; max-width: 40px;" id="is">
								</div>

								<div class="col-12">

									<input type="button" class="btn btn-primary"
										onclick="update_obj_item_btn()" value="수정">
								</div>
							</form:form>
						</div>
					</div>
				</div>



				<%--       <c:if test="${ }"></c:if> --%>
				<!-- 혼합식 -->
				<div id="mix_box_toggle" style="display: none;">
					<div class="col-12">
						<div class="Item_box">
							<button type="button" id="item_mix_copy">+</button>
							<form:form modelAttribute="SQD" id="item_mix_form">
								<input type="hidden" name="questionTypeCode" value="10003">
								<input type="hidden" name="surveySeq" value="${SLD.surveySeq}"
									id="surveyseq">
								<input type="hidden" name="questionSeq" value="2">
								<div class="icon_line" id="mix_ItemAfter">
									<label><input type="text" name="itemContent"
										placeholder="문항 입력..." id="ic" required></label> 점수<input
										type="number" name="itemScore" min="0" value="0"
										style="min-width: 20px; max-width: 40px;" id="is">
								</div>
								<div class="icon_line">
									<label> <input type="text" id="ic" name="itemContent"
										placeholder="기타.." value="기타"></label> <input type="number"
										name="itemScore" value="0" style="display: none">
								</div>
								<div class="col-12">

									<input type="button" class="btn btn-primary"
										onclick="update_mix_item_btn()" value="수정">
								</div>
							</form:form>
						</div>
					</div>
				</div>

				<%--       <c:if test="${ }"></c:if> --%>
				<!-- 주관식 -->

				<!-- 주관식은 문제 만들 때 id값 가장 큰 거 부여 -->
				<div id="subj_box_toggle" style="display: none">
					<div class="block_box">
						<input type="text" class="input_qus" id="input_qus"
							placeholder="주관식 문제입니다.">

						<div class="blank_under"></div>
					</div>
				</div>

			</c:forEach>
		</div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>