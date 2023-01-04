<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insert_survey.css"/>

<form:form modelAttribute="SLD" style="display:inline-flex;" id="form"> 
	<div class="container">
		<div class="row">
			<div class="col-3">설문지 이름</div>
			<div class="col-3">설문 기간</div>
			<div class="col-3">익명기명</div>
			<div class="col-3">설문 부가 설명</div>

			<input type="hidden" name="decideCheck" value="N"> 
			<input type="hidden" name="surveyId" value="1">
			<div class="col-3">
				<div class="form-group" id="survey_name_content">
					<label for="recipient-name" class="col-form-label"></label> 
					<input type="text" class="form-control" id="recipient-name" name="surveyName">
				</div>
			</div>

			<div class="col-3">
				<input type="date" name="surveyStartDate">
				~
				<input type="date" name="surveyClosedDate">
			</div>
			<div class="col-3">
				<input type="radio" name="anonymityCheckCode" value="20001">익명
				<br> 
				<input type="radio" name="anonymityCheckCode" value="20002">기명
			</div>
			<div class="col-3">
				<div class="form-group">
					<label for="message-text" class="col-form-label"></label>
					<textarea class="form-control" id="message-text"
						name="surveyContent"></textarea>
				</div>
			</div>
			<div class="col-12">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">취소</button>
				<input type="button" class="btn btn-primary" onclick="register()" value="등록">
			</div>
		</div>
	</div>
</form:form>

	<!-- 	<div id="survey_manage" style=""> -->
	<%-- 		<c:url value="/set" var="actionURL" scope="page" /> --%>
	<%-- 		<form:form action="${actionURL}" modelAttribute="SLD" --%>
	<%-- 			style="display:inline-flex;"> --%>

	<!-- 			<div class="form-group" id="survey_name_content"> -->
	<!-- 				<label for="recipient-name" class="col-form-label">설문지 이름</label> <input -->
	<!-- 					type="text" class="form-control" id="recipient-name" -->
	<!-- 					name="surveyName"> -->
	<!-- 			</div> -->

	<!-- 			<div class="form-group"> -->
	<!-- 				<label for="message-text" class="col-form-label">설문 부가 설명</label> -->
	<!-- 				<textarea class="form-control" id="message-text" -->
	<!-- 					name="surveyContent"></textarea> -->
	<!-- 			</div> -->


	<!-- 			<input type="hidden" name="decideCheck" value="N"> -->
	<!-- 			<input type="hidden" name="surveyId" value="1"> -->

	<!-- 			<div id="survey_date_A_R_submit" style=""> -->
	<!-- 				설문 진행 기간 <br> <input type="date" name="surveyStartDate">~<input -->
	<!-- 					type="date" name="surveyClosedDate"> <br> <input -->
	<!-- 					type="radio" name="anonymityCheckCode" value="20001">익명 <br> -->
	<!-- 				<input type="radio" name="anonymityCheckCode" value="20002">기명 -->

	<!-- 				<div class="modal-footer"> -->
	<!-- 					<button type="button" class="btn btn-secondary" -->
	<!-- 						data-dismiss="modal">취소</button> -->
	<!-- 					<input type="submit" class="btn btn-primary" value="등록"> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<%-- 		</form:form> --%>
	<!-- 	</div> -->

<script>
	/*문제 삭제*/
	function register(){
		var form = $('#form')[0];
		
		/*var data = new FormData();
		data.append("surveyName", "aaa");
		data.append("surveyStartDate", "2022-01-01");
		data.append("surveyClosedDate", "2022-01-05");
		data.append("anonymityCheckCode", "20001");
		data.append("surveyContent", "bbb");
		data.append("surveyId", "1");*/
		
		var data = new FormData(form);
		
		$.ajax({
			method: "POST",
			url: 'surveyupdate.do',	// form을 전송할 실제 파일경로
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			beforeSend : function() {
				// 전송 전 실행 코드
			},
			success: function (data) {
				// 전송 후 성공 시 실행 코드
				console.log(data);

			},
			error: function (e) {
				// 전송 후 에러 발생 시 실행 코드
				console.log("ERROR : ", e);
			}
		});

	
	}
	
	
// 	 $(function(){
// 	        $('#submit').on("click",function () {

// 	            var form1 = $("#form").serialize();
// 				console.log("하이")
// 	            console.log(form1);

// 	            $.ajax({
// 	                type: "post",
// 	                url: "/login/check",
// 	                data: form1,
// 	                dataType: 'json',
// 	                success: function (data) {
// 	                    alert("success");
// 	                    console.log(data);
// 	                },
// 	                error: function (request, status, error) {
// 	                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

// 	                }
// 	            });
// 	        });
// 	    });
	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>