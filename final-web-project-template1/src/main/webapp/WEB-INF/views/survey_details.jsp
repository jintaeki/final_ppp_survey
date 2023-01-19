<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp"%>
<<<<<<< HEAD

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />

	
	<div class="all_insertdiv">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">설문지 이름</span> <input
				type="text" class="form-control" placeholder="2022년 4분기 다면평가">
		<button type="button" class="btn btn-outline-primary" onclick="addInput();">문제 추가</button>		
		</div>
		
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white">
			<div class="list-group list-group-flush border-bottom scrollarea">	
				
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" id="input_question" 
						placeholder="1번 문제. 피평가자가 해당 업무에 전문성이 능력에 대하여 어떻게 생각합십니까?">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="2번 문제. 피평가자가 해당 업무에 문제해결 능력에 대하여 어떻게 생각하십니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="3번 문제. 피평가자가 업무에 대하여 늦은적이 어느정도 있었습니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				 <div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="4번 문제. 피평가자가 리더쉽을 발휘한 일화가 있다면 서술해주십시오.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="5번 문제. 피평가자가 다른 팀과의 이해충돌이나 갈등을 완만히 조절한 적이 있습니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus"  placeholder="6번문제. 피평가자가 목표 성취를 위해 조직 구성원의 동의와 적극성을 이끌어낸 적이 있습니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="7번 문제. 피평가자가 업무에 대하여 창의적인 방법등을 재시한 적이 있습니까?">
						<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
						viewBox="0 0 16 16">
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
							</svg></button>
							<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
					class="input_qus" 
						placeholder="8번 문제. 피평가자가 해당 업무에 책임성은 어느 정도 입니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="9번 문제. 피평가자가 가지고 있는 환경변화  대처능력은 어떻게 생각하십니까?">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="10번 문제. 피평가자는 조직의 목표를 공유하고 스스로의 목표를 구체적으로 설정한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="11번 문제. 주어진 목표를 초과 달성하기 위해 구체적인 노력과 행동들이 이어진다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="12번 문제. 업무추진 시 다양한 의견을 고려함으로써 치우지치 않는 균형 감각을 유지한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="13번 문제. 피평가자는 새로운 환경에 적응하기 위해 자신의 행동을 변화시키려고 노력한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="14번 문제. 피평가자는 업무 여건이나 상황에 영향을 받지 않고 성과를 만들어낼 수 있다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="15번 문제. 피평가자는 어려운 상황에서도 평정을 유지하며 업무를 수행한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="16번 문제. 피평가자는 변화가 가져올 긍정적으로 제시하고 추진할 수 있다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="17번 문제. 피평가자는 비효율적인 업무를 개선하기 위해 적극적으로 노력한다.">
						
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
					<label><input type="radio" name="" value="">1: 매우 불만족</label> 
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">2: 불만족</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">3: 보통</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">4: 만족</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">5: 매우 만족</label>
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
						checked required>1: 매우 그렇지 않다</label>
						<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">2: 그렇지 않다</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">3: 보통</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">4: 그렇다</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value=""><input type="text" id="other"  placeholder="5: 기타.."></label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
			</div>
			
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		

<script>
	
	
	
	const close = document.querySelectorAll('.delete_btn');

	close.forEach((item) => {
	    item.addEventListener('click', () => {
	        item.parentNode.style.display = 'none';
	    })
	})
	
	</script>

=======
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />
	
	
	

</head>
<body>
	
	<div class="all_insertdiv">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">설문지 이름</span> <input
				type="text" class="form-control" placeholder="2022년 4분기 다면평가">
		<button type="button" class="btn btn-outline-primary" onclick="addInput();">문제 추가</button>		
		</div>
		
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white">
			<div class="list-group list-group-flush border-bottom scrollarea">	
				
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" id="input_question" 
						placeholder="1번 문제. 피평가자가 해당 업무에 전문성이 능력에 대하여 어떻게 생각합십니까?">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="2번 문제. 피평가자가 해당 업무에 문제해결 능력에 대하여 어떻게 생각하십니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="3번 문제. 피평가자가 업무에 대하여 늦은적이 어느정도 있었습니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
				 <div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="4번 문제. 피평가자가 리더쉽을 발휘한 일화가 있다면 서술해주십시오.">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="5번 문제. 피평가자가 다른 팀과의 이해충돌이나 갈등을 완만히 조절한 적이 있습니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus"  placeholder="6번문제. 피평가자가 목표 성취를 위해 조직 구성원의 동의와 적극성을 이끌어낸 적이 있습니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
						class="input_qus" 
						placeholder="7번 문제. 피평가자가 업무에 대하여 창의적인 방법등을 재시한 적이 있습니까?">
						<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
						viewBox="0 0 16 16">
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
							</svg></button>
							<div class="blank_under"></div>
					</div>
				<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text"
					class="input_qus" 
						placeholder="8번 문제. 피평가자가 해당 업무에 책임성은 어느 정도 입니까?">
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="9번 문제. 피평가자가 가지고 있는 환경변화  대처능력은 어떻게 생각하십니까?">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="10번 문제. 피평가자는 조직의 목표를 공유하고 스스로의 목표를 구체적으로 설정한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="11번 문제. 주어진 목표를 초과 달성하기 위해 구체적인 노력과 행동들이 이어진다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="12번 문제. 업무추진 시 다양한 의견을 고려함으로써 치우지치 않는 균형 감각을 유지한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="13번 문제. 피평가자는 새로운 환경에 적응하기 위해 자신의 행동을 변화시키려고 노력한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="14번 문제. 피평가자는 업무 여건이나 상황에 영향을 받지 않고 성과를 만들어낼 수 있다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="15번 문제. 피평가자는 어려운 상황에서도 평정을 유지하며 업무를 수행한다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="16번 문제. 피평가자는 변화가 가져올 긍정적으로 제시하고 추진할 수 있다.">
						
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					<div class="blank_under"></div>
					</div>
					
						<div class="list-group-item list-group-item-action active py-3 lh-sm">
					<input type="text" class="input_qus" 
						placeholder="17번 문제. 피평가자는 비효율적인 업무를 개선하기 위해 적극적으로 노력한다.">
						
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
					<label><input type="radio" name="" value="">1: 매우 불만족</label> 
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">2: 불만족</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">3: 보통</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">4: 만족</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="" value="">5: 매우 만족</label>
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
						checked required>1: 매우 그렇지 않다</label>
						<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">2: 그렇지 않다</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">3: 보통</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value="">4: 그렇다</label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
				<div class="icon_line">
					<label><input type="radio" name="test" value=""><input type="text" id="other"  placeholder="5: 기타.."></label>
					<button class="delete_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" 
					viewBox="0 0 16 16">
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg></button>
				</div>
			</div>
			
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		

<script>
	
	
	
	const close = document.querySelectorAll('.delete_btn');

	close.forEach((item) => {
	    item.addEventListener('click', () => {
	        item.parentNode.style.display = 'none';
	    })
	})
	
	</script>

</body>
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
