<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>



<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="all_insertdv">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">설문지 제목</span> <input
				type="text" class="form-control" placeholder="설문지 이름을 입력해 주세요">

		</div>
				<!-- 여기까지 설문제 제목 div -->		
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" id="survey_question_dv">
			<div class="list-group list-group-flush border-bottom scrollarea" id="scroll_area">

				<!-- 여기까지 문제 div -->

				<div
					class="list-group-item list-group-item-action active py-3 lh-sm"
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


		<div id="answer_box">
			<div class="all_qus">
				<div id="obj_box_toggle">
					<div class="block_box" id="block_box">
						<button class="insert_button" id="qus_isnert_button" type="submit" onclick=" divCopy2()">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
  						<path fill-rule="evenodd"
									d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z" />
					</svg>
						</button>
						<div class="icon_line" id="question_option">
							<label><input type="radio" name="" value="">객관식
								문항</label>
							<button class="delete_btn" id="delete_button" onclick="deleteQuestion(this)">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
					</svg>
							</button>
						</div>
					</div>
				</div>
				<div id="mix_box_toggle" style="display: none" id="1001">
					<div class="block_box">
						<div class="icon_line" id="question_option">
							<label><input type="radio" name="" value="">객관식
								문항</label>
							<button class="delete_btn" onclick="deleteQuestion(this)">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path
										d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
					</svg>
							</button>
						</div>
						<div class="icon_line" style="display:none" id="1003">
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
					<div id="subj_box_toggle" style="display: none" id="1002">
						<div class="block_box">
							<input type="text" class="input_qus" id="input_qus" placeholder="주관식 문제입니다.">
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
				<button class="btn btn-secondary" id="btn_for_answer_box"
					onclick="btn_for_ans_box(this)">ans</button>
			</div>
			<div class="blank_under"></div>
		</div>
		
	<div class="question_inputdv">
		<c:url value="survey/questioninsert.do"  var='surveyinsert'/>
		<form:form  modelAttribute="sqd" action="${surveyinsert}" id="questioN_insert_form" method="post">
		<div class="select_radio" id="select_radio" value="${sqd.questionTypeCode}">
			<input type="radio" name="questionTypeCode" value="1001">객관식
			<input type="radio" name="questionTypeCode" value="1002">주관식
			<input type="radio" name="questionTypeCode" value="1003">혼합식
		</div>
		<div class="question_content_area" id="question_add">
			<div class="input-group" id="question_content">
  				<div class="input-group-prepend">
  				  <span class="input-group-text">문제 입력</span>
  				</div>
  					<textarea class="form-control" aria-label="문제 입력칸" name="questionContent" value="${sqd.questionContent}"></textarea>
			</div>
			<!-- 문제 추가 버튼  -->
			<button type="submit" class="btn btn-outline-primary" id="add_btn" onclick="divCopy()">문제 추가</button>
		</div>
		<input type="hidden" name="surveyId" value="2310103">
		<input type="hidden" name="itemScore" value="1">
		<input type="hidden" name="itemContent" value=" ">
		</form:form>
</div>	
	</div>
	<script>
	/*
	$(function(){
		$('#submit').on("click", function() {
			
			var qI = qI;
			
			$.ajax({
			 type:"post",
			 url:"survey/questioninsert.do"
			 data:qI,
			 success: functon (data) {
				 alert("success");
		
			 }
			})
		}
	}
	*/
	
	$("#replyList").on("click", "a", function() {
    	event.preventDefault(); // 고유 이벤트 중지
    	
    	// 클릭한 대상의 번호를 모달창에 저장.
    	var rno = $(this).attr("href");
    	$("#modalRno").val(rno);
    	
    	// replyModify 라면 수정창, replyDelete 라면 삭제창의 형태로 사용
    	if( $(this).hasClass("replyModify") ){ // 수정창
    		
    		$(".modal-title").html("댓글수정");
    		$("#modalModBtn").css("display", "inline"); // 수정버튼은 보여지도록 처리
    		$("#modalDelBtn").css("display", "none"); // 삭제버튼은 숨겨지도록 처리
    		$("#modalReply").css("display", "inline"); // 수정창 보여지도록
    		
    	} else if ( $(this).hasClass("replyDelete") ) { // 삭제창
    		
    		$(".modal-title").html("댓글삭제");
    		$("#modalModBtn").css("display", "none"); // 수정버튼은 숨겨지도록 처리
    		$("#modalDelBtn").css("display", "inline"); // 삭제버튼은 보여지도록 처리
    		$("#modalReply").css("display", "none"); // 수정창 숨겨지도록
    		
    	}
    	
    	$("#replyModal").modal("show"); // 부트스트랩 모달 함수
    	
    }); // end on
	
	
	</script>
</body>

<script>

	/*문제 삭제*/
	
	function delete_btn1(obj) {
		const tag = $(obj);
		tag.parent().remove();
	}
	function btn_for_ans_box(obj) {
		$("#select_answer_box").slideToggle();
	}

	//문제 추가

	function divCopy() {
		const testDiv = document.getElementById('newQUE');
		const testDiv1 = document.getElementById('queAfter');
		const testDiv 2
		const newNode = testDiv.cloneNode(true);
		newNode.style.display = 'inline-block';

		testDiv1.after(newNode);
	}


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

		// 		});

	});
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
	}
	

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>