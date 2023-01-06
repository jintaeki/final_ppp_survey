
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<!-- 설문지 설정 진택 -->
<form:form modelAttribute="SLD"
	style="display:inline-flex; border: 1px solid black;" id="form">
	<div class="container">
		<div class="row">
			<div class="col-3">설문지 이름</div>
			<div class="col-3">설문 기간</div>
			<div class="col-3">익명기명</div>
			<div class="col-3">설문 부가 설명</div>
		
				<input type="hidden" name="decideCheck" value="N"> <input
				type="hidden" name="surveyId" id="surveyid" value="2310103">${SLD.surveyId}
			<div class="col-3">
				<div class="form-group">
					<label for="survey_name" class="col-form-label"></label> <input
						type="text" class="form-control" id="survey_name"
						name="surveyName" value="${SLD.surveyName }">
					</div>
				</div>
			<div class="col-3">
				<input type="date" name="surveyStartDate"
					value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">
				~ <input type="date" name="surveyClosedDate"
					value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />">
			</div>
				<div class="col-3">
				<c:if test="${SLD.anonymityCheckCode eq '20001'}">
					<input type="radio" name="anonymityCheckCode" value="20001" checked>익명
				<input type="radio" name="anonymityCheckCode" value="20002">기명	
				</c:if>

					<c:if test="${SLD.anonymityCheckCode eq '20002'}">
						<input type="radio" name="anonymityCheckCode" value="20001">익명
					<br>
						<input type="radio" name="anonymityCheckCode" value="20002"
							checked>기명
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
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<input type="button" class="btn btn-primary" onclick="register()"
						value="수정">
				</div>

			
		</div>
		</div>
</form:form>
<!-- 설문지 설정 진택 -->

<!-- 문항 관리 진택-->
<!-- <div class="col-12"> -->
<!-- 	<div class="Item_box"> -->
<!-- 		<button type="button" id="itemcopy">+</button> -->
<%-- 		<form:form modelAttribute="SQD" id="itemform"> --%>
<!-- 			<input type="hidden" name="surveyId" value="13"> -->
<!-- 			<input type="hidden" name="questionId" value="4"> -->
<!-- 			<div class="icon_line" id="ItemAfter"> -->
<!-- 				<label><input type="text" name="itemContent" value="" -->
<!-- 					placeholder="문항 입력..." id="ic"></label> 점수<input type="number" -->
<!-- 					name="itemScore" min="0" value="0" -->
<!-- 					style="min-width: 20px; max-width: 40px;" id="is"> -->
<!-- 			</div> -->

	<!-- 			<div class="col-12"> -->
<!-- 				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
<!-- 				<input type="button" class="btn btn-primary" -->
<!-- 					onclick="updateitem_btn()" value="수정"> -->
<!-- 			</div> -->
<%-- 		</form:form> --%>
<!-- 	</div> -->
<!-- </div> -->



</div>
<!-- 문항 관리 진택-->
<!-- 추가될 문항 none 진택 -->

<!--  객관식 -->
<div class="icon_line" id="new_obj_Item" style="display: none;">
	<label><input type="text" name="itemContent" 
		placeholder="문항 입력..." id="ic"></label> 점수<input type="number"
		name="itemScore" min="0" value="0"
		style="min-width: 20px; max-width: 40px;" id="is">

	<button onclick="delete_obj_item_btn(this)">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path
				d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
	</svg>
	</button>
</div>
		<!--  주관식 -->
<div class="icon_line" id="new_mix_Item" style="display: none;">
	<label><input type="text" name="itemContent"  required
		placeholder="문항 입력..." id="ic"></label> 점수<input type="number"
		name="itemScore" min="0" value="0"
		style="min-width: 20px; max-width: 40px;" id="is">

	<button onclick="delete_mix_item_btn(this)">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path
				d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />

					</svg>
	</button>
</div>
		
<!-- 추가될 문항 none 진택 -->
<br>
<div class="col-12">&nbsp;</div>


<div class="all_insertdv" style="border: 1px solid black;">

	<!-- 여기까지 설문제 제목 div -->
	<div style="border: 1px solid black;"
		class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white"
		id="survey_question_dv">
		<div class="list-group list-group-flush border-bottom scrollarea"
			id="scroll_area">


	<!-- 여기까지 문제 div -->

			<div class="list-group-item list-group-item-action active py-3 lh-sm"
				id="queAfter">
				<input type="text" class="input_qus" placeholder="문제를 입력해 주세요.">
				<div class="card m-2" style="float: right; width: 60px;">
					<button class="btn btn-secondary" id="btn_for_answer_box"
						onclick="btn_for_ans_box(this)">ans</button>
				</div>
				<div class="blank_under"></div>
				
						</div>
		</div>
	</div>





	<!-- 채우 폼에 진택 코드 넣기 -->
	<div id="answer_box" style="border: 1px solid black;">
		<%-- 			<c:if test="${ }"></c:if> --%>
		
		<form action ="<c:url value='/survey/aa' />" method="post">
		<div id="obj_box_toggle" style="display:none;" >
			<div class="col-12">
				<div class="Item_box">
					<button type="button" id="item_obj_copy">+</button>
<%-- 					<form:form modelAttribute="SQD" id="item_obj_form"> --%>
						<input type="hidden" name="questionTypeCode" value="10001">
						<input type="hidden" name="surveyId" value="2310103">
						<input type="hidden" name="questionId" value="6">
						<div class="icon_line" id="obj_ItemAfter">
							<label><input type="text" name="itemContent"  
								placeholder="문항 입력..." id="ic"></label> 점수<input type="number"
								name="itemScore" min="0" value="0"
								style="min-width: 20px; max-width: 40px;" id="is">
						</div>

						<div class="col-12">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<input type="button" class="btn btn-primary"
								onclick="update_obj_item_btn()" value="수정">
						</div>
<%-- 					</form:form> --%>
				</div>
			</div>
		</div>



		<%-- 		<c:if test="${ }"></c:if> --%>

		<div id="mix_box_toggle" style="display:none;">
			<div class="col-12">
				<div class="Item_box">
					<button type="button" id="item_mix_copy">+</button>
<%-- 					<form:form modelAttribute="SQD" id="item_mix_form"> --%>
						<input type="hidden" name="questionTypeCode" value="10003">
						<input type="hidden" name="surveyId" value="2310103" id="surveyid">
						<input type="hidden" name="questionId" value="6">
						<div class="icon_line" id="mix_ItemAfter">
							<label><input type="text" name="itemContent"  
								placeholder="문항 입력..." id="ic" required></label> 점수<input type="number"
								name="itemScore" min="0" value="0"
								style="min-width: 20px; max-width: 40px;" id="is">
						</div>
						<div class="icon_line">
							<label> <input type="text" id="ic" name="itemContent"
								placeholder="기타.." value="기타"></label>
								<input type="number"
								name="itemScore" value="0" style="display:none">
						</div>
						<div class="col-12">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<input type="button" class="btn btn-primary"
								onclick="update_mix_item_btn()" value="수정">
						</div>
<%-- 					</form:form> --%>
				</div>
			</div>
			
 
		</div>
		<%-- 		<c:if test="${ }"></c:if> --%>

		<div id="subj_box_toggle" style="display: none">
			<div class="block_box">
				<input type="text" class="input_qus" id="input_qus"
					placeholder="주관식 문제입니다.">
				<button class="delete_btn">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  						<path
							d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
						</svg>
				</button>
				<div class="blank_under"></div>
			</div>
		</div>
		<input type="submit" value="등록">
		</form>
	</div>
	<!-- 채우 폼에 진택 코드 넣기 끝-->
				
				
	<div class="list-group-item list-group-item-action active py-3 lh-sm"
		id="newQUE" style="display: none">
		<input type="text" class="input_qus" placeholder="문제를 입력해 주세요.">
		<button class="delete_btn" onclick="delete_btn1(this)">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /> </svg>
		</button>
		<div class="card m-2" style="float: right; width: 60px;">
			<button class="btn btn-secondary" id="btn_for_answer_box"
				onclick="btn_for_ans_box(this)">ans</button>
		</div>
		<div class="blank_under"></div>
	</div>
	
	<div id="copydiv"></div>

	<div class="question_inputdv" id="input_question">
		<form:form modelAttribute="SQD" id="questioN_insert_form">
			<!-- aa -->
			<div class="select_radio" id="select_radio">
				<input type="radio" name="questionTypeCode" id= "obj_radio" onclick="checkit1()" value="10001" checked>객관식
				<input type="radio" name="questionTypeCode" id= "sub_radio" onclick="checkit2()" value="10002">주관식
				<input type="radio" name="questionTypeCode" id= "mix_radio" onclick="checkit3()" value="10003" >혼합식
			</div>
			<div class="question_content_area" id="question_add">
				<div class="input-group" id="question_content">
					<div class="input-group-prepend">
						<span class="input-group-text">문제 입력</span>
					</div>
					<textarea class="form-control" aria-label="문제 입력칸"
						name="questionContent">${sqd.questionContent}</textarea>
				</div>
				<!-- 문제 추가 버튼  -->
				<button type="button" class="btn btn-outline-primary" id="add_btn"
					onclick="insertQus()">문제 추가</button>
			</div>
			<input type="hidden" name="surveyId" value="2310103">
			<input type="hidden" name="itemScore" value="1">
			<input type="hidden" name="itemContent" value=" ">
		</form:form>
	</div>
</div>
				
				
				
				
				
				

<div class="col-12">---위 진택---</div>
<div class="col-12">---아래 채우---</div>


<div class="all_insertdv">

	<!-- 여기까지 설문제 제목 div -->
	<div
		class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white"
		id="survey_question_dv">
		<div class="list-group list-group-flush border-bottom scrollarea"
			id="scroll_area">
			<!-- 여기까지 문제 div -->
			<form:form  modelAttribute="SQD" id="iqsform">
			<div class="list-group-item list-group-item-action active py-3 lh-sm"
				id="queAfter">
				<input type="text" class="input_qus" placeholder="문제를 입력해 주세요.">
				<div class="card m-2" style="float: right; width: 60px;">
				<button type="button" class="btn btn-primary btn-sm" onclick="">수정</button>
				</div>
				<div display="none" id="update_qi" value="${sqd.questionId}"></div>
				<div class="blank_under"></div>
			</div>
			</form:form>
		</div>
		
		
		<div id="answer_box">
			<div class="all_qus">
				<div id="obj_box_toggle">
					<div class="block_box" id="block_box">
						<button class="insert_button" id="qus_isnert_button" type="submit"
							onclick=" divCopy2()">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
  						<path fill-rule="evenodd"
									d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z" />
					</svg>
						</button>
						<div class="icon_line" id="question_option">
							<label><input type="radio" name="" value="">객관식
								문항</label>
							<button class="delete_btn" id="delete_button"
								onclick="deleteQuestion(this)">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
						</svg>
							</button>
						</div>

					</div>
				</div>
			</div>
			<div id="mix_box_toggle" style="display: none">
					<div class="icon_line">
						<label><input type="radio" name="test" value=""><input
							type="text" id="other" placeholder="기타.."></label>
						<button class="delete_btn" onclick="deleteQuestion(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path
									d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
					</svg>
						</button>
					</div>
				</div>
			</div>
			<div id="subj_box_toggle" style="display: none">
				<div class="block_box">
					<input type="text" class="input_qus" id="input_qus"
						placeholder="주관식 문제입니다.">
					<button class="delete_btn">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  						<path
								d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
						</svg>
					</button>
					<div class="blank_under"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="list-group-item list-group-item-action active py-3 lh-sm"
		id="newQUE" style="display: none">
		<input type="text" class="input_qus" placeholder="문제를 입력해 주세요.">
		<button class="delete_btn" onclick="delete_btn1(this)">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-x" viewBox="0 0 16 16"> <path
					d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /> </svg>
		</button>
		<div class="card m-2" style="float: right; width: 60px;">
		
		</div>
		<div class="blank_under"></div>
	</div>

	<div class="question_inputdv" id="input_question">

		<form:form modelAttribute="sqd" action="${surveyInsert}"
			id="questioN_insert_form" method="post">
			
			<div class="select_radio" id="select_radio">
				<input type="radio" name="questionTypeCode" value="10001">객관식
				<input type="radio" name="questionTypeCode" value="10002">주관식
				<input type="radio" name="questionTypeCode" value="10003">혼합식
			</div>
			<div class="question_content_area" id="question_add">
				<div class="input-group" id="question_content">
					<div class="input-group-prepend">
						<span class="input-group-text">문제 입력</span>
					</div>
					<textarea class="form-control" aria-label="문제 입력칸"
						name="questionContent">${sqd.questionContent}</textarea>
				</div>
				<!-- 문제 추가 버튼  -->
				<button type="button" class="btn btn-outline-primary" id="add_btn">문제
					추가</button>
				<button type="button" class="btn btn-outline-primary" id="update_btn">문제
					수정</button>
					
					
			</div>
			<input type="hidden" name="surveyId" value="2310103">
			<input type="hidden" name="itemScore" value="1">
			<input type="hidden" name="itemContent" value=" ">
		</form:form>
	</div>


<script>
	//진택
	var cnt = 0;
	//설문 설정 비동기 수정
	function register() {
		var form = $('#form')[0];

		var data = new FormData(form);

		$.ajax({
			method : "POST",
			url : 'surveyupdate.do/', // form을 전송할 실제 파일경로
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			beforeSend : function() {
				// 전송 전 실행 코드
			},
			success : function(data) {
				// 전송 후 성공 시 실행 코드
				console.log(data);
			},
			error : function(e) {
				// 전송 후 에러 발생 시 실행 코드
				console.log("ERROR : ", e);
			}
		});

	}

	//문항 비동기 등록(수정) 
	function update_obj_item_btn() {
		var form = $('#item_obj_form')[0];
		
		var data = new FormData(form);
		
		$.ajax({
			method : "POST",
			url : 'itemupdate.do', // form을 전송할 실제 파일경로
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			beforeSend : function() {
				// 전송 전 실행 코드
			},
			success : function(data) {
				// 전송 후 성공 시 실행 코드
				console.log(data);
			},
			error : function(e) {
				// 전송 후 에러 발생 시 실행 코드
				console.log("ERROR : ", e);
			}
		});
		
	}
	
	function update_mix_item_btn() {
		var form = $('#item_mix_form')[0];
		console.log($('input:checkbox[input[id="obj_radio"]').is(':checked'));
		var data = new FormData(form);

		$.ajax({
			method : "POST",
			url : 'itemupdate.do', // form을 전송할 실제 파일경로
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			beforeSend : function() {
				// 전송 전 실행 코드
			},
			success : function(data) {
				// 전송 후 성공 시 실행 코드
				console.log(data);
			},
			error : function(e) {
				// 전송 후 에러 발생 시 실행 코드
				console.log("ERROR : ", e);
			}
		});

	}
	/*문제 삭제*/
	function delete_obj_item_btn(obj) {
		const tag = $(obj);
		tag.parent().remove();
	}
	function delete_mix_item_btn(obj) {
		const tag = $(obj);
		tag.parent().remove();
	}
	//문제 추가
	$("#item_obj_copy").click(function() {
		if (cnt < 1000) {
			const testDiv = document.getElementById('new_obj_Item');
			const testDiv1 = document.getElementById('obj_ItemAfter');
			const newNode = testDiv.cloneNode(true);
			newNode.style.display = 'inline-block';
			cnt++;
			testDiv1.after(newNode);

		} else {
			alert("문항은 최대 5개까지 생성 가능합니다.");
		}
	});
	
	$("#item_mix_copy").click(function() {
		if (cnt < 1000) {
			const testDiv = document.getElementById('new_mix_Item');
			const testDiv1 = document.getElementById('mix_ItemAfter');
			const newNode = testDiv.cloneNode(true);
			newNode.style.display = 'inline-block';
			cnt++;
			testDiv1.after(newNode);

		} else {
			alert("문항은 최대 5개까지 생성 가능합니다.");
		}
	});
	// 진택 끝

//채우--------------------------------------------------------------------
	/*문제 삭제*/
	function delete_btn(obj) {

		const tag = $(obj);
		tag.parent().remove();
	}
	
	//문제 추가

	$("#itemcopy").click(function(){
	if(cnt<4){
		const testDiv = document.getElementById('newItem');
		const testDiv1 = document.getElementById('ItemAfter');
		const newNode = testDiv.cloneNode(true);
		newNode.style.display = 'inline-block';
		cnt++;
		testDiv1.after(newNode);
		
	}else{
		alert("문항은 최대 5개까지 생성 가능합니다.");
		}
	});
	

	//문제 추가(비동기)
	function insertQus(){
			var qdiv = $('#questioN_insert_form')[0];
			alert("요청이 가는가?");
			var data = new FormData(qdiv);
		
			$.ajax({
				method:'POST', //어떤 방식으로 보낼 지
				url:'questioninsert.do', // qdiv를 보낼 경로 설정
				data: data,	
				processData: false, 
				contentType: false, 
				cache: false, 
				timeout: 600000, 
			   beforeSend : function() { //보내기 전 실행
				console.log("요청이 보내지는가?");
			   },
			   success:function (data) {	 //전송 성공시 실행
				   console.log("요청 성송");
				   
			   }, error:function(e) {	//실패, 에러
				   console.log("Error", e); 
			   }
				});
			}
	
	//문제 조회
	function qusList(){
			var qdiv = $('#questioN_insert_form')[0]
			console.log("리스트 시작!");
			var data = new FormData(qdiv);
			
			$.ajax({
				method: 'POST',
				url: 'questionList.do',
				data: data,
				processData: false,
				contentType: false,
				cache: false,
				beforeSend: function() {
					console.log("요청 보냄");
				},
				success:function (data) {
					console.log("요청 성공");
				}, error: function(e) {
					console.log("Error", e);
				}
			});
		}
	
		function qusUpdate(){
			var qdiv = $('#'#questioN_insert_form')[0]
			 console.log("업데이트 시작");
			var data = new FormData(qdiv);
			
			$.ajax({
				method: 'POST',
				uri: 'questionUpdate.do',
				data: data,
				processData: false,
				contentType: false,
				cache: false,
				beforeSend: function() {
					console.log("요청 보냈음");
				},
				succes: function(data) {
					console.log("요청 보냄");
				},
				error: function(e) {
					console.log("Error", e);
					}
				});
			}
		
		/*
	ab.addEventListener('click',  function(qusList) {
		console.log("문제fltmxm");
	});
	*/
	/*
	
	function change_my_select() {
		$('.btn_submit').attr('disabled', true);
		var hhh = document.getElementById('myselect')
		if (hhh.options[hhh.selectedIndex].value == "subj") {

			$('#btn_obj_toggle').attr('disabled', true);
			$('#btn_mix_toggle').attr('disabled', true);
			$('#btn_subj_toggle').removeAttr('disabled');
		}
		if (hhh.options[hhh.selectedIndex].value == "obj") {
			$('#btn_subj_toggle').attr('disabled', true);
			$('#btn_mix_toggle').attr('disabled', true);
			$('#btn_obj_toggle').removeAttr('disabled');
		}
		if (hhh.options[hhh.selectedIndex].value == "mix") {
			$('#btn_obj_toggle').attr('disabled', true);
			$('#btn_subj_toggle').attr('disabled', true);
			$('#btn_mix_toggle').removeAttr('disabled');
		}
		console.log(hhh);
	}
/*
	$(function() {
		//객관식 버튼

		$("#btn_obj_toggle").click(function() {
			if ($('.btn_submit').attr('disabled') == 'disabled') {
				$('.btn_submit').removeAttr('disabled');
			} else {
				$('.btn_submit').attr('disabled', true);
			}
			$("#obj_box_toggle").slideToggle();
		});

		//혼합식 버튼
		$("#btn_mix_toggle").click(function() {
			if ($('.btn_submit').attr('disabled') == 'disabled') {
				$('.btn_submit').removeAttr('disabled');
			} else {
				$('.btn_submit').attr('disabled', true);
			}
			$("#mix_box_toggle").slideToggle();
		});

		//주관식 버튼
		$("#btn_subj_toggle").click(function() {
			if ($('.btn_submit').attr('disabled') == 'disabled') {
				$('.btn_submit').removeAttr('disabled');
			} else {
				$('.btn_submit').attr('disabled', true);
			}
			$("#subj_box_toggle").slideToggle();
		});

			$("#btn_for_answer_box").click(function(){
		// 			$("#select_answer_box").slideToggle();		

		 		});


	});

/*
	function divCopy2()  {
		const element = `<div class="icon_line" id="question_option">
							<label><input type="radio" name="" value="">객관식 문항</label> 
							<button class="delete_btn" onclick="deleteQuestion(this)">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
									<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
								</svg>
							</button>
						</div>`;

		  $("#question_option").after(element);
	});
*/
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>

