<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>


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
	<div class="all_insertdiv">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">설문지 제목</span> <input
				type="text" class="form-control" placeholder="설문지 이름을 입력해 주세요">
			<!-- 문제 추가 버튼  -->
			<button type="button" class="btn btn-outline-primary"
				onclick=" divCopy()">문제 추가</button>
		</div>

			<div
				class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" id="question_div">
				<div class="list-group list-group-flush border-bottom scrollarea">
	
					<!-- 문제 div -->
					<div
						class="list-group-item list-group-item-action active py-3 lh-sm"
						id="question_list">
						<input type="text" class="input_qus" placeholder="문제를 입력해 주세요.">

						<button class="delete_btn" onclick="deleteQuestion(this)">
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
			<!-- 문항 div -->
				<div class="all_qus">
				<!-- 객관식 -->
					<div class="block_box">
					<button class="insert_button" onclick=" divCopy2()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
					</svg> </button>
				<div class="icon_line" id="question_option">
					<label><input type="radio" name="" value="">객관식 문항</label> 
					<button class="delete_btn" onclick="deleteQuestion(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path
									d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
					</svg>
						</button>
				</div>	
			</div>	
			<!-- 주관식 -->
				<div class="block_box">
					<input type="text" class="input_qus" placeholder="주관식 문제입니다.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
						viewBox="0 0 16 16">
  						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
						</svg></button>
				<div class="blank_under"></div>
			</div>
			
			<!-- 기타 -->
			<div class="block_box">
				<div class="icon_line" id="question_option">
					<label><input type="radio" name="" value="">객관식 문항</label> 
					<button class="delete_btn" onclick="deleteQuestion(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  					<path
									d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
					</svg>
						</button>		
				</div>	
				<div class="icon_line">
					<label><input type="radio" name="test" value=""><input type="text" id="other"  placeholder="기타.."></label>
					<button class="delete_btn" onclick="deleteQuestion(this)"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
			</div>
			
			
		
		</div>
	</div>



	<script>	

	/*문제 삭제*/
	/* const close = document.querySelectorAll('.delete_btn');

	close.forEach((item) => {
	    item.addEventListener('click', () => {
	        item.parentNode.style.display = 'none';
	    })
	}) */
	
	
	
	function deleteQuestion(obj){
		const tag = $(obj);
		tag.parent().remove();
	}

	
	/*문제 추가*/
/* 	let idNum = 0;
		
	function divCopy()  {
		const testDiv = document.getElementById('question_list');
		
		const newNode = testDiv.cloneNode(true);
		
		 idNum++;
		 newNode.id = 'question_list';
		  
		  testDiv.after(newNode);
	} */
	
	
	/* function divCopy()  {
		const element = `<input type="text" class="input_qus"  placeholder="문제를 입력해 주세요.">`;
		//const testDiv = document.getElementById('question_list');
		//const newNode = testDiv.cloneNode(true);
		  $("#zz").append(element);
	}
	 */
	
	/*문항 추가*/
	
	/* 	let idNum2 = 0;
		
	function divCopy2()  {
		const testDiv2 = document.getElementById('question_option');
		
		const newNode2 = testDiv2.cloneNode(true);
		
		 idNum2++;
		 newNode2.id = 'question_option' + idNum2;
		  
		  testDiv2.after(newNode2);
	} */
	
	
	function divCopy()  {
		const element = `<div class="list-group-item list-group-item-action active py-3 lh-sm" id="question_list">
								<input type="text" class="input_qus" placeholder="문제를 입력해 주세요.">
									<button class="delete_btn" onclick="deleteQuestion(this)">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
											<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
										</svg>
									</button>
								<button type="button" class="btn btn-outline-primary" onclick=" divCopy()">문제 추가</button>
							<div class="blank_under"></div>
						</div>`;

		  $("#question_list").after(element);
	}
	
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
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>