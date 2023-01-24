<div class="container_flex">
		<form:form modelAttribute="SLD" id="survey_setting_form">
			<span class="insert_category"><b>제목</b> <label
				for="survey_name"></label> <input type="text" id="survey_name"
				name="surveyName" style="width: 200px;" value="${SLD.surveyName}">
			</span>

			<span class="insert_category"> <input type="date"
				name="surveyStartDate" class="survey_date"
				value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">-
				<input type="date" name="surveyClosedDate" class="survey_date"
				value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />">
			</span>

			<span class="insert_category"> <c:if
					test="${SLD.anonymityCheckCode eq '20001'}"> --%>
					<input type="radio" name="anonymityCheckCode"
						id="survey_type_check" value="20001" checked>익명 
					<input type="radio" name="anonymityCheckCode" 
						id="survey_type_check" value="20002">기명 
          		    </c:if> <c:if test="${SLD.anonymityCheckCode eq '20002'}"> 
					<input type="radio" name="anonymityCheckCode" 
						id="survey_type_check" value="20001"> 
					<label for="survey_type_check">익명</label> 

					<input type="radio" name="anonymityCheckCode" style="" 
						id="survey_type_check" value="20002" checked> 
 					<label for="survey_type_check">기명</label> 
				</c:if> 
			</span> 
		
 			<span class="insert_category"><b>상세 설명</b></span> 
 			<textarea style="display:none;" class="visually-hidden"id="message-text" name="surveyContent">${SLD.surveyContent }</textarea> 

				<input type="hidden" name="stateCode" value="30001"> <input 
				type="hidden" name="surveySeq" id="surveyseq" 
				value="${SLD.surveySeq}"> 
				
		</form:form> 
		<input type="button" class="update_btn" style="margin-bottom:10px;" onclick="register()" 
			value="적용"> 
		
</div> 