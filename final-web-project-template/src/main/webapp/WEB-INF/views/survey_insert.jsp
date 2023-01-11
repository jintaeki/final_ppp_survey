<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />



<!-- 설문지 설정 진택 -->
<form:form modelAttribute="SLD"
	style="display:inline-flex; border: 1px solid black;" id="form">
	<div class="container">
		<div class="row">
			<div class="col-3">설문지 이름</div>
			<div class="col-3">설문 기간</div>
			<div class="col-3">익명기명</div>
			<div class="col-3">설문 부가 설명</div>

			<input type="hidden" name="decideYN" value="N"> <input
				type="hidden" name="surveySeq" id="surveyseq" value="${SLD.surveySeq}">
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
<!--  혼합식 -->
<div class="icon_line" id="new_mix_Item" style="display: none;">
	<label><input type="text" name="itemContent" required
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
				<div class="blank_under"></div>
			</div>
		</div>
	</div>





	<!-- 채우 폼에 진택 코드 넣기 -->
	<div id="answer_box" style="border: 1px solid black;">
		<%-- 			<c:if test="${ }"></c:if> --%>


		<div id="obj_box_toggle" style="display: none">
			<div class="col-12">
				<div class="Item_box">
					<button type="button" id="item_obj_copy">+</button>
					<form:form modelAttribute="SQD" id="item_obj_form">
						<input type="hidden" name="questionTypeCode" value="10001">
						<input type="hidden" name="surveySeq" value="${SLD.surveySeq}">
						<input type="hidden" name="questionSeq" value="2">
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



		<%-- 		<c:if test="${ }"></c:if> --%>

		<div id="mix_box_toggle" style="display: none">
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
		<%-- 		<c:if test="${ }"></c:if> --%>
		<!-- 주관식은 문제 만들 때 id값 가장 큰 거 부여 -->
		<div id="subj_box_toggle" style="display: none">
			<div class="block_box">
				<input type="text" class="input_qus" id="input_qus"
					placeholder="주관식 문제입니다.">

				<div class="blank_under"></div>
			</div>
		</div>


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
				<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()" value="10001" checked>객관식 
				<input type="radio" name="questionTypeCode" id="sub_radio" onclick="checkit2()" value="10002"> 주관식
				<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> 혼합식
			</div>
			<div class="question_content_area" id="question_add">
				<div class="input-group" id="question_content">
					<div class="input-group-prepend">
						<span class="input-group-text">문제 입력</span>
					</div>
					<textarea class="form-control" aria-label="문제 입력칸"
						name="questionContent">${sqd.questionContent}</textarea>
				</div>
				${SLD.surveySeq}-> 설문id 확인용
				<!-- 문제 추가 버튼  --><!-- onclick="insertQus()" 뺌 -->
				<button type="button" class="btn btn-outline-primary"  id="add_btn" >문제
					추가</button>
				<button type="button" class="btn btn-outline-primary"  id="update_btn" onclick="qusUpdate()">문제
					수정</button>
				<input type="hidden" name="surveySeq" id="seq" value="${SLD.surveySeq }">
				<input type="hidden" name="questionSeq" value="2"> <!-- 비동기로 바꿔 넣어보자 -> 문항도 마찬가지 -->
			</div>
			<input type="hidden" name="itemScore" value="1">
			<input type="hidden" name="itemContent" value=" ">
		</form:form>
	</div>
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
	
	$(document).ready(function(){
	 	if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
	 		document.querySelector("#obj_box_toggle").style.display = "block";
	 	}
				
	});
	function checkit1() {
		if($("input[type=radio][id=mix_radio]:checked").is(':checked') != true){ // 
	 		 document.querySelector("#mix_box_toggle").style.display = "none";
	 	} if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
	 		document.querySelector("#obj_box_toggle").style.display = "block";
	 	}
	}
	function checkit3() {
		if($("input[type=radio][id=obj_radio]:checked").is(':checked') != true){ // 체크 여부(checked)
	 		 document.querySelector("#obj_box_toggle").style.display = "none";
	 	}if ($("input[type=radio][id=mix_radio]:checked").is(':checked') == true){
	 		document.querySelector("#mix_box_toggle").style.display = "block";
	 	}
	}
	
	
	function checkit2() {
		 document.querySelector("#mix_box_toggle").style.display = "none";
		 document.querySelector("#obj_box_toggle").style.display = "none";
		
	}
	
	//문제 입력 채우 코드에 추가한 것
// 	function insertQus(){
// 			var qdiv = $('#questioN_insert_form')[0];
// 			var data = new FormData(qdiv);
		
// 			$.ajax({
// 				method:'POST', //어떤 방식으로 보낼 지
// 				url:'questioninsert.do', // qdiv를 보낼 경로 설정
// 				data: data,	//
// 				processData : false,
//  				contentType : false,
// 	 			cache : false,
// 			   beforeSend : function() { //보내기 전 실행
// 				console.log("요청이 보내지는가?");
// 			   },
// 			   success:function (data) {	 //전송 성공시 실행
// 				   console.log($('#surveyseq').val());
// 				   var surveyseq = $('#surveyseq').val();
				   
// 			   $.ajax({
// 						method:'GET', //어떤 방식으로 보낼 지
// 						url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정				
// 			 			dataType: "json",
// 					   beforeSend : function() { //보내기 전 실행
// 						console.log("요청이 보내지는가?");
// 					   },
// 					   success:function (jsondata){	 //전송 성공시 실행
// 								console.log(jsondata);
// 								questionHtml(jsondata);
// 								var surveyseq = jsondata[0].SURVEY_SEQ;
// 								var questionseq = jsondata[0].QUESTION_SEQ;
														
								
								
// 					   }, error:function(e) {	//실패, 에러
// 						   console.log("Error", e); 
// 					   }
// 						});
				   
// 			   }, error:function(e) {	//실패, 에러
// 				   console.log("Error", e); 
// 			   }
// 				});
// 			}
	
// 	function questionHtml(data){
// 		  let size = data.length;
// 		  var html = '';
// 		  $("#scroll_area").empty();
// 		 for(i=0; i<size; i++){
// 			 html +='<div class="list-group-item list-group-item-action active py-3 lh-sm" id="queAfter1">';
// 			   html +='<input type="text" class="input_qus" value="'+data[i].QUESTION_CONTENT+'" onclick="touchQuestion(this)" readonly>';
// 			   html	+='<div class="card m-2" style="float: right; width: 60px;">';
// 			   html +='<button class="btn btn-secondary" id="btn_for_answer_box" onclick="btn_for_ans_box(this)">ans</button>';
// 			   html +='</div> <div class="blank_under"></div></div>';
//          }
// 		 $('#scroll_area').append(html);
// 	}
	
// 	function itemHtml(data){
// 		  let size = data.length;
// 		  var html = '';
// 		 if(data[0].QUESTION_TYPE_CODE)
// 		 for(i=0; i<size; i++){
// 			 html +='<div class="list-group-item list-group-item-action active py-3 lh-sm" id="queAfter1">';
// 			   html +='<input type="text" class="input_qus" value="'+data[i].QUESTION_CONTENT+'">';
// 			   html	+='<div class="card m-2" style="float: right; width: 60px;">';
// 			   html +='<button class="btn btn-secondary" id="btn_for_answer_box" onclick="btn_for_ans_box(this)">ans</button>';
// 			   html +='</div> <div class="blank_under"></div></div>';
//        }
// 		 $('#scroll_area').append(html);
// 	}
	
	//문제 입력 채우 코드에 추가한 것 끝
	
		var test = document.getElementById('add_btn');
		test.addEventListener('click', insertQus);
		
 	function insertQus(){
 			var qdiv = $('#questioN_insert_form')[0];
 			var data = new FormData(qdiv);
		
 			$.ajax({
 				method:'POST', //어떤 방식으로 보낼 지
 				url:'questioninsert.do', // qdiv를 보낼 경로 설정
 				data: data,	//
 				processData : false,
  				contentType : false,
 	 			cache : false,
 			   beforeSend : function() { //보내기 전 실행
 				console.log("요청이 보내지는가?");
 			   },
 			   success:function (data) {	 //전송 성공시 실행
 				   console.log($('#surveyseq').val());
 				   var surveyseq = $('#surveyseq').val();
				
 			   $.ajax({
 						method:'GET', //어떤 방식으로 보낼 지
 						url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정				
 			 			dataType: "json",
 					   beforeSend : function() { //보내기 전 실행
 						console.log("요청이 보내지는가?");
 					   },
 					   success:function (jsondata){	 //전송 성공시 실행
 								console.log(jsondata);
 								questionHtml(jsondata);
 								var surveyseq = jsondata[0].SURVEY_SEQ;
 								var questionseq = jsondata[0].QUESTION_SEQ;
 								$.ajax({
 									method:'GET', //어떤 방식으로 보낼 지
 									url:'selectitems.do/'+ surveyseq + questionseq, // qdiv를 보낼 경로 설정				
 						 			dataType: "json",
 								   	beforeSend : function() { //보내기 전 실행
 									console.log("요청이 보내지는가?");
 								   },
 								   success:function (jsondata){	 //전송 성공시 실행
 											console.log(jsondata);
 											itemHtml(jsondata)
											
											
											
 								   }, error:function(e) {	//실패, 에러
									   console.log("Error", e); 
 								   }
									});								
								
								
 					   }, error:function(e) {	//실패, 에러
 						   console.log("Error", e); 
 					   }
 						});
 				  
 			   }, error:function(e) {	//실패, 에러
				   console.log("Error", e); 
			   }
 				});
 			}
	
 	function questionHtml(data){
 		  let size = data.length;
 		  var html = '';
 		  $("#scroll_area").empty();
 		 for(i=0; i<size; i++){
 			 	
 				html +='<div class="list-group-item list-group-item-action active py-3 lh-sm" var="" id="queAfter1">';
 				html +='<input type="text" id="input_qus" value="'+data[i].QUESTION_CONTENT+'">';
 				html +='<div class="card m-2" style="float: right; width: 60px; border: none;">';
 				html +='<button onclick="deleteQus(this)" value="'+data[i].QUESTION_SEQ+'">';
 				html += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">';
 			  	html += '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /></svg>';
 				html +=	'</button>';
 				html +='</div> <div class="blank_under"></div></div>';
 			
          }
 		 $('#scroll_area').append(html);
 	}
	
 	function itemHtml(data){
 		  let size = data.length;
 		  var html = '';
 		 if(data[0].QUESTION_TYPE_CODE)
 		 for(i=0; i<size; i++){
 			 html +='<div class="list-group-item list-group-item-action active py-3 lh-sm" id="queAfter1">';
 			   html +='<input type="text" class="input_qus" value="'+data[i].QUESTION_CONTENT+'">';
 			   html	+='<div class="card m-2" style="float: right; width: 60px;">';
 			   html +='<button class="btn btn-secondary" id="btn_for_answer_box" onclick="btn_for_ans_box(this)">ans</button>';
 			   html +='</div> <div class="blank_under"></div></div>';
        }
 		 $('#scroll_area').append(html);
 	}
	
	// 진택 끝
	
	//채우
	
	/*문제 삭제*/
	function delete_btn(obj) {
		const tag = $(obj);
		tag.parent().remove();
	}
	
	//문제 추가(비동기)
	function insertQus(){
			var qdiv = $('#questioN_insert_form')[0];
			var data = new FormData(qdiv);
			alert("요청이 가는가?");
			$.ajax({
				method:'POST', //어떤 방식으로 보낼 지
				url:'questioninsert.do', // qdiv를 보낼 경로 설정
				data: data,	
				processData: false, 
				contentType: false, 
				cache: false, 
				timeout: 600000, 
			   	beforeSend : function() { //보내기 전 실행
				console.log("요청이 보내지는가?");// 			   
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
			var qdiv = $('#questioN_insert_form')[0];
			console.log("리스트 시작!");
			var data = new FormData(qdiv);
			
			$.ajax({
				method: 'POST',
				url: 'questionList.do' + surveyseq,
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
	
		function updateQus(){
			var qdiv = $('#questioN_insert_form')[0];
			alert("업데이트 시작!");
			 console.log("업데이트 시작");
			var data = new FormData(qdiv);
			
			$.ajax({
				method: 'POST',
				url: 'questionUpdate.do',
				data: data,	
				processData: false, 
				contentType: false, 
				cache: false, 
				timeout: 600000, 
				beforeSend: function() {
					console.log("요청 보냈음");
					alert("업데이트 beforesend");
					
				},
				succes: function(data) {
					console.log("요청 성공");
					alert("업데이트 요청 success!");
				},
				error: function(e) {
					console.log("Error", e);
					}
				});
		}
			
	/*					
		var test = document.getElementById('add_btn');
		test.addEventListener('click', insertQus() {
		});
		test.addEventListener('click' , insertQus() {
			console.log("야호");
			alert(1);
		});
		*/
		
	//채우 끝
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>