<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp"%>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

	
	

</head>
<body>
	
	<div class="all_insertdiv">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">설문지 이름</span> <input
				type="text" class="form-control" placeholder="설문지 이름을 입력해 주세요">
		<!-- 문제 추가 버튼  -->
		<button type="button" class="btn btn-outline-primary " onclick=" divCopy()">문제 추가</button>		
		</div>
		
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white">
				 <div class="list-group list-group-flush border-bottom scrollarea">
				
				<!-- 문제 div -->
				<div class="list-group-item list-group-item-action active py-3 lh-sm" id="question_list">
					<input type="text" class="input_qus"  
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="문제를 입력해 주세요.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="문제를 입력해 주세요.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				 <div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="문제를 입력해 주세요.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="문제를 입력해 주세요.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus"  placeholder="문제를 입력해 주세요.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
						viewBox="0 0 16 16">
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
							</svg></button>
							<div class="blank_under"></div>
							
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
					class="input_qus" 
						placeholder="문제를 입력해 주세요.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>-0
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="문제를 입력해 주세요.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
			</div>
		</div>
		


		<div class="all_qus">
			<div class="block_box">
				<div class="icon_line">
					<label><input type="radio" name="" value="">1 </label> 
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">2</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">3</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">4</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">5</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
			</div>
			
			
			<div class="block_box">
				<input type="text" class="input_qus" placeholder="답변">
				<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				<div class="blank_under"></div>
			</div>
			
			
			<div class="block_box">
				<div class="icon_line">
					<label><input type="radio" name="company" value=""
						checked required>1</label>
						<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">2</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">3</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">4</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				
				
				<!-- 기타 -->
				t
			</div>
			
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		

<script>	

	/*문제 삭제*/
	const close = document.querySelectorAll('.delete_btn');

	close.forEach((item) => {
	    item.addEventListener('click', () => {
	        item.parentNode.style.display = 'none';
	    })
	})

	
	
	/*문제 추가*/
	let idNum = 0;
		
	function divCopy()  {
		const testDiv = document.getElementById('question_list');
		
		const newNode = testDiv.cloneNode(true);
		
		 idNum++;
		 newNode.id = 'question_list' + idNum;
		  
		  testDiv.after(newNode);
	}

	
</script>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>