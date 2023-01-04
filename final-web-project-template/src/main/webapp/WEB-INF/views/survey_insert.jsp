<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />

<form:form modelAttribute="SLD" style="display:inline-flex;" id="form">
	<div class="container">
		<div class="row">
			<div class="col-3">설문지 이름</div>
			<div class="col-3">설문 기간</div>
			<div class="col-3">익명기명</div>
			<div class="col-3">설문 부가 설명</div>

			<input type="hidden" name="decideCheck" value="N"> <input
				type="hidden" name="surveyId" value="${SLD.surveyId}">
			<div class="col-3">
				<div class="form-group" id="survey_name_content">
					<label for="recipient-name" class="col-form-label"></label> <input
						type="text" class="form-control" id="recipient-name"
						name="surveyName" value="${SLD.surveyName }">
				</div>
			</div>

			<div class="col-3">
				<input type="date" name="surveyStartDate" value="${Sdate}">
				~ <input type="date" name="surveyClosedDate" value="${Cdate}">
			</div>
			<div class="col-3">
				<c:if test="${SLD.anonymityCheckCode eq '20001'}">
					<input type="radio" name="anonymityCheckCode" value="20001" checked>익명
				<input type="radio" name="anonymityCheckCode" value="20002">기명	
				</c:if>

				<c:if test="${SLD.anonymityCheckCode eq '20002'}">
					<input type="radio" name="anonymityCheckCode" value="20001">익명
					<br>
					<input type="radio" name="anonymityCheckCode" value="20002" checked>기명
				</c:if>

			</div>
			<div class="col-3">
				<div class="form-group">
					<label for="message-text" class="col-form-label"></label>
					<textarea class="form-control" id="message-text"
						name="surveyContent">${SLD.surveyContent }</textarea>
				</div>
			</div>
			<div class="col-12">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<input type="button" class="btn btn-primary" onclick="register()"
					value="수정">
			</div>
		</div>
	</div>
</form:form>

<!-- 문항 관리 -->
<div class="Item_box">
				<button type="button" onclick="itemCopy()" id="itemcopy">+</button>
	<div class="icon_line" id="ItemAfter">
		<label><input type="text" name="company" value="" placeholder="문항 입력...">1</label>
		
	</div>



	<!-- 기타 -->

</div>


<div class="icon_line" id="newItem" style=" display: none;">
	<label><input type="text" name="company" value="" 
		placeholder="문항 입력..." ></label>
	<button class="delete_btn" onclick="delete_btn(this)">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path
				d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
					</svg>
	</button>
</div>
<script>
	<!-- 설문 설정 비동기 수정 -->
	function register(){
		var form = $('#form')[0];
			
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
	


	//문제 삭제
	function delete_btn(obj) {
		const tag = $(obj);
		tag.parent().remove();
	}
	
	function btn_for_ans_box(obj) {
		$("#select_answer_box").slideToggle();
	}
	
	//문제 추가
	$("#itemcopy").click(function(){
// 	function itemCopy() {
		const testDiv = document.getElementById('newItem');
		const testDiv1 = document.getElementById('ItemAfter');
		const newNode = testDiv.cloneNode(true);
		newNode.style.display = 'inline-block';
		testDiv1.after(newNode);
// 	}
	});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>