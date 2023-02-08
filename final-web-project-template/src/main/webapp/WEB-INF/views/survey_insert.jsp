<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>

<style>
#input_qus:focus { font-size:20px; } 

}

</style>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />
<div class="col-11">
	<div class="card" >
		<div class="card-body" style="height:890px;">
			<div class="forshadowing" style="height:860px;">

				<button style="float: right;" class="btn btn-link"
					onclick="insertComplete(${SLD.surveySeq})">등록완료</button>
				<!-- 설문지 설정 진택 -->

				<div class="container_survey">
					<div class="row" style="margin-top: 45px;"></div>

<!-- 					<div class="inner_container"> -->
					<div class="container_flex"
						style="border-radius: 20px; box-shadow: 1px 1px 10px 0px;">
						<div class="input_title" style="margin-right:0px; text-align:center;">기본 설정</div>
						<form:form modelAttribute="SLD" id="survey_setting_form">
							<table style="text-align:center;">
								<!-- 									<tr> -->
								<!-- 										<th><div style="margin-top: 8px;"></div></th> -->
								<!-- 									</tr> -->

								<tr class="col-12">

									<th class="col-1"><span class="insert_category"><b>설문지 제목</b><label
											for="survey_name"></label></span></th>
									<th class="col-2"><span class="insert_category"> <b>평가 기간</b>
									</span></th>
									<th class="col-1"><span class="insert_category"> <b>익명/기명</b></span></th>
									<th class="col-3"><span class="insert_category"><b>상세 설명</b></span></th>
									<th class="col-1"></th>
								</tr>

								<tr>
									<td class="col-1"><input type="text" id="survey_name" name="surveyName"
										style="width: 200px;" value="${SLD.surveyName}"></td>

									<td class="col-2"><input type="date" name="surveyStartDate"
										class="survey_date"
										value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">-
										<input type="date" name="surveyClosedDate" class="survey_date"
										value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />"></td>

									<td class="col-1"><c:if test="${SLD.anonymityCheckCode eq '20001'}">
											<input type="radio" name="anonymityCheckCode"
												id="survey_type_check" value="20001" checked>
											<label style="margin-bottom: 0px;" for="survey_type_check"><b>익명</b></label>
											<input type="radio" name="anonymityCheckCode"
												id="survey_type_check" value="20002">
											<label style="margin-bottom: 0px;" for="survey_type_check"><b>기명</b></label>
										</c:if> <c:if test="${SLD.anonymityCheckCode eq '20002'}">
											<input type="radio" name="anonymityCheckCode"
												id="survey_type_check" value="20001">
											<label style="margin-bottom: 0px;" for="survey_type_check"><b>익명</b></label>

											<input type="radio" name="anonymityCheckCode"
												id="survey_type_check" value="20002" checked>
											<label style="margin-bottom: 0px;" for="survey_type_check"><b>기명</b></label>
										</c:if></td>
										
										
											<td class="col-3"><textarea class="visually-hidden" id="message-text"
								name="surveyContent"
								style="width: 400px; height: 100px; max-width: 350px;">${SLD.surveyContent }</textarea></td>
										
										
										<td class="col-1"><input type="button" class="update_btn" style="padding:5px 26px 26px 26px;" onclick="register()" value="적용">
										</td>
								</tr>

							</table>

		
							<input type="hidden" name="stateCode" value="30001">
							<input type="hidden" name="surveySeq" id="surveyseq"
								value="${SLD.surveySeq}">
							
						</form:form>
						
					</div>




					<div class="questionAndItem"
						style="display: flex; justify-content: space-around;">
						<div class="question_management">
							<div class="input_title" style="display: contents">
								문제 목록
								<button type="button"
									onclick="question_copy(this,${SLD.surveySeq} )"
									style="background: white; border: 1px solid #fff; border-radius: 35em;">
									<i class="fas fa-plus"></i>
								</button>
							</div>

							<div id="scroll_area" style="overflow: auto; height: 500px;">

								
								<!-- 여기까지 문제 div -->
								<div id="queAfter">
								<c:if test="${empty SQL}">
								<div class="noquestion">
									<br>
									<b>${NoQuestion}</b>
								</div>
								</c:if>
									<c:forEach items="${SQL}" var="qlist">
										<div class="deleteThis" style="display: flex;">
											<button class="delete_btn"
												onclick="deleteQus(this,${qlist.surveySeq})"
												style="background: white;" value="${qlist.questionSeq }">
												<i class="fas fa-xmark"></i>
											</button>
											<form id="${qlist.questionSeq }" onsubmit="return false;">

												<div class="input_qus" id="checkTouch">
													<input type="hidden" name="surveySeq"
														value="${qlist.surveySeq }" id="surveySequence"> <input
														type="hidden" name="questionSeq"
														value="${qlist.questionSeq }"> <input
														name="questionContent" type="text" id="input_qus" 
														onclick="manageQus(this,${qlist.questionSeq},${qlist.questionTypeCode }); this.onclick=null;"
														value="${qlist.questionContent }">

												</div>
												<c:if test="${qlist.questionTypeCode eq '10001' }">
													<input type="radio" id="obj_radio"
														name="${qlist.questionSeq}" value="10001"
														onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
														checked> 객관식
													<input type="radio" id="subj_radio"
														name="${qlist.questionSeq}" value="10002"
														onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													<input type="radio" id="mix_radio"
														name="${qlist.questionSeq}" value="10003"
														onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식												
												</c:if>
												<c:if test="${qlist.questionTypeCode eq '10002' }">
													<input type="radio" id="obj_radio"
														name="${qlist.questionSeq}" value="10001"
														onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 객관식
													<input type="radio" id="subj_radio"
														name="${qlist.questionSeq}" value="10002"
														onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
														checked> 주관식
													<input type="radio" id="mix_radio"
														name="${qlist.questionSeq}" value="10003"
														onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식												
												</c:if>
												<c:if test="${qlist.questionTypeCode eq '10003' }">
													<input type="radio" id="obj_radio"
														name="${qlist.questionSeq}" value="10001"
														onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 객관식
													<input type="radio" id="subj_radio"
														name="${qlist.questionSeq}" value="10002"
														onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													<input type="radio" id="mix_radio"
														name="${qlist.questionSeq}" value="10003"
														onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
														checked> 혼합식												
											</c:if>
												<c:if
													test="${qlist.questionTypeCode ne '10001' and qlist.questionTypeCode ne '10002' and qlist.questionTypeCode ne '10003' }">
													<input type="radio" id="obj_radio"
														name="${qlist.questionSeq}" value="10001"
														onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"
														checked> 객관식
													<input type="radio" id="subj_radio"
														name="${qlist.questionSeq}" value="10002"
														onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													<input type="radio" id="mix_radio"
														name="${qlist.questionSeq}" value="10003"
														onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식												
											</c:if>



											</form>

											<!-- 조회 버튼 -->
											<button value="${qlist.questionSeq }"
												onclick="touchQuestion(this)" style="display: none;">
												<i class="fas fa-search"></i>
											</button>


											<div class="blank_under"></div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>



						<div class="item_management">
						<div style="display:flex">
							<div class="input_title">문항 관리</div>
							
							<p class="beforeTouch">문제를 클릭하여 문항을 관리해 보세요.</p>
							
							<div class="itemAfter">
							
								<!-- 객관식 -->
								<c:forEach items="${SQL}" var="qlist">

								</c:forEach>
							</div>
						</div>
					</div>

					<!--  문제관리 끝 -->


				</div>
			</div>
		</div>
	</div>
</div>
<script>


// 문제 버튼없이 저장 및 수정
// var cnt = 0;
// function ho(tag){
// 	$().keydown(function(){
// 	    if(event.keyCode === 13) {
	
	    	
// 	    	tag.parent().parent().parent().next().children().next().children().first().children().next().next().focus();
// 	    	tag.parent().parent().parent().next().children().next().children().first().children().next().next().click();
// 	    	}
	    	

// });
// }

function manageItem(obj,questionSeq){
	
		const tag = $(obj);
		
		keyArray = [];
		valueArray = [];
		var cnt = 0;
			$(tag).blur(function(e){
				var form = $('#i'+questionSeq)[0];
				var formdata = new FormData(form);
				for(const pairkeys of formdata.keys()){
		             keyArray.push(pairkeys);
		             console.log(pairkeys);	
		          }
				
		          for(const pairvalues of formdata.values()){
		        	  console.log(pairvalues);
		        	  
		          }
				$.ajax({
			         method : "POST",
			         url : 'insertItem.do', // form을 전송할 실제 파일경로
			         data : formdata,
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
			});
	
}

function manageQus(obj,questionSeq,questionTypeCodes){
	const tag = $(obj);
	
	keyArray = [];
	valueArray = [];
	var cnt = 0;
		$(tag).blur(function(e){
			
			
			
			if(questionSeq ==0){
				var form = $('#0')[0];
				var formdata = new FormData(form);
				for(const pairkeys of formdata.keys()){
		             keyArray.push(pairkeys);
		             console.log(pairkeys);	
		             cnt = cnt +1;
		          }
				
		          for(const pairvalues of formdata.values()){
		        	  console.log(pairvalues);
		        	  
		             valueArray.push(pairvalues);
		          }
		          
		          
		          for(var i = 0 ; i<cnt ; i++){
	
		        	  if(keyArray[i].substr(0,1)=='0'){
		        		  formdata.append('questionTypeCode',valueArray[i]);
		        		  break;
		        	  }
		        	  
		          }
		          
		          $.ajax({
						method : "POST",
				         url : 'insertquestion.do/', // form을 전송할 실제 파일경로
				         data: formdata,
				         processData : false,
				         contentType : false,
				         cache : false,
				         timeout : 600000,
				         dataType: 'html',
				         beforeSend : function() {
				            // 전송 전 실행 코드
				         },
				         success : function(data) {
				        	 if(data==0){
				        		 alert("빈 텍스트는 저장이 불가합니다."); 
				        		 location.reload();
				        	 }else{
				     	    	
				        	 }
								

				        	 
				         },
				         error : function(e) {
				            // 전송 후 에러 발생 시 실행 코드
				            console.log("ERROR : ", e);
				         }
					})
					
			}else{
				var form = $('#'+questionSeq)[0];
				var formdata = new FormData(form);
				for(const pairkeys of formdata.keys()){
		             keyArray.push(pairkeys);
						cnt = cnt +1;
		          }
		          for(const pairvalues of formdata.values()){
		             valueArray.push(pairvalues);
		          }
		          
		          for(var i = 0 ; i < cnt ; i++){
		        	  if(keyArray[i]==questionSeq){
		        		  formdata.append('questionTypeCode',valueArray[i]);
		        		  break;
		        	  }
		          }
		          
		          $.ajax({
						method : "POST",
				         url : 'updatequestion.do/', // form을 전송할 실제 파일경로
				         data: formdata,
				         processData : false,
				         contentType : false,
				         cache : false,
				         timeout : 600000,
				         dataType: 'html',
				         beforeSend : function() {
				            // 전송 전 실행 코드
				         },
				         success : function(data) {
				        	 if(data==0){
				        		 alert("빈 텍스트는 저장이 불가합니다.");
				        		 location.reload();
				        	 }else{
				     	    	
				        	 }
				         },
				         error : function(e) {
				            // 전송 후 에러 발생 시 실행 코드
				            console.log("ERROR : ", e);
				         }
					})
			}
			//엔터키로 내려가기... 어렵네...
			ho(tag);	
	});
	
		
}




	//surveyinsertcomplete.do/${SLD.surveySeq}
	function insertComplete(surveySeq){

		$.ajax({
			method : "POST",
	         url : 'surveyinsertcomplete.do/'+surveySeq, // form을 전송할 실제 파일경로
	         async : false,
	         dataType: 'html',
	         processData : false,
	         contentType : false,
	         cache : false,
	         timeout : 600000,
	         beforeSend : function() {
	            // 전송 전 실행 코드
	         },
	         success : function(data) {
	        	 console.log(data);
	            if(data == '0'){
	            	alert("문항이 최소 1개는 존재해야 합니다.")
	            }else{
	            	window.location.replace("/survey/surveysearch");
	            }

	         },
	         error : function(e) {
	            // 전송 후 에러 발생 시 실행 코드
	            console.log("ERROR : ", e);
	         }
		})
	}


   // 문제 누르면 touch버튼(돋보기) 활성화
   $(document).ready(function(){
        $('div#checkTouch').click(function(){
           $(this).parent().next('button').click();

        });
      });
	
   // 문항 누르면 touch버튼(돋보기) 활성화
   $(document).ready(function(){
        $('div#TouchItem').click(function(){
           $(this).parent().next('button').click();

        });
      });

   
   
   //진택
   var cnt = 0;

   //설문 설정 비동기 수정
   function register() {
      var form = $('#survey_setting_form')[0];
      var data = new FormData(form);
      $.ajax({
         method : "POST",
         url : 'updatesurvey.do/', // form을 전송할 실제 파일경로
         data : data,
         processData : false,
         contentType : false,
         cache : false,
         timeout : 600000,
         beforeSend : function() {
            // 전송 전 실행 코드
         },
         success : function(data) {
        	 if(data=="nameEmpty"){alert('제목을 입력해 주세요.'); return false;}
        	 if(data=="datemissmatch"){alert('날짜 조건이 알맞지 않습니다.'); return false;}
        	 else{
        		 alert("등록 성공"); return false;
        	 }
         },
         error : function(e) {
            // 전송 후 에러 발생 시 실행 코드
            console.log("ERROR : ", e);
         }
      });
   }
	
   
   
   
   
   
   
	// 문제 추가
	var newQuestionCnt = 0;
   function question_copy(obj,surveySeq){
		$('.noquestion').empty();
	   var testDiv ='';
	   	testDiv +='<div class="deleteThis" style="display:flex;">';
      	testDiv +='<button class="delete_btn" onclick="deleteQus(this,'+surveySeq+')" style="background: white;" value="'+0+'"><i class="fas fa-xmark"></i></button>';
	 	testDiv +='<form id="0" name="0" onsubmit="return false;">';
	   	testDiv +='<div class="input_qus" id="checkTouch">';
	   	testDiv +='<input type="hidden" name= "surveySeq" value="'+surveySeq+'" id="surveySequence">';
		testDiv +='<input type="hidden" name= "questionSeq" value="0">';
		testDiv +='<input type="text" name="questionContent"  id="input_qus"  onclick="manageQus(this,0,10001); this.onclick=null;" value="hi">';	
		testDiv +='</div>';
		testDiv +='<input type="radio" id="obj_radio" name="0'+newQuestionCnt+'" value="10001" onclick="checkit1(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+'" checked> 객관식';
		testDiv +='<input type="radio" id="subj_radio" name="0'+newQuestionCnt+'" value="10002" onclick="checkit2(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+')"> 주관식';
		testDiv +='<input type="radio" id="mix_radio" name="0'+newQuestionCnt+'" value="10003" onclick="checkit3(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+')"> 혼합식';									
      	testDiv +='</form>';
      	testDiv +='<button value="'+0+'" onclick="touchQuestion(this)"style="display:none;">';
      	testDiv +='	<i class="fas fa-search"></i>';
      	testDiv +='</button>';
		
      	testDiv +='<div class="blank_under"></div>';
      	testDiv +='</div>'
      	
        $('#queAfter').prepend(testDiv);

        

        $('#queAfter div form div input[name=questionContent]').first().focus();
        $('#0').children().children().next().next().click();
        newQuestionCnt = newQuestionCnt + 1;
	}
   

   
   //문항 추가
      let cntObj=0;
      let cntMix=0;
	function item_copy(obj,type){
	   var questionSeq = $(obj).val();
	   var html = '';
	   if(type=='10001'){
		   
		   if(cntObj ==5){
			   alert("객관식 문항은 최대 5개까지 생성 가능합니다.");
		   }else if(cntObj < 5){
			   html  +='<div class="icon_line">';
			   html +='<div id="TouchItem">';
			   html  +='<input type="hidden" name="questionSeq" value="' + questionSeq +'">';
			   html  +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,0)" >';
			   html  += '<i class="fas fa-xmark"></i>';
			   html  +=   '</button>';
			   html  += '<input type="text" name="itemContent" placeholder="문항 입력..." id="input_item" onclick="manageItem(this,'+questionSeq+');this.onclick=null;">';
			   html  +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
			   html  +='<input type="hidden" name="itemSeq" value="0">';
			   html +='</div>';
			   html  += '</div>';
			   cntObj = cntObj +1;

		   }
	   }else if (type=='10003'){
		   
		   if(cntMix ==5){
			   alert("객관식 문항은 최대 5개까지 생성 가능합니다.");
		   }else if(cntMix < 5){
			   html  +='<div class="icon_line">';
			   html +='<div id="TouchItem">';
		 	   html  +='<input type="hidden" name="questionSeq" value="' + questionSeq +'">';
		       html  +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,0)" >';
		       html  += '<i class="fas fa-xmark"></i>';
			   html  += '</button>';
		       html  += '<input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+questionSeq+');this.onclick=null;" >';
		 	   html  +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" >';
			   html  +='<input type="hidden" name="itemSeq" value="0">';
			   html +='</div>';
		   	   html  += '</div>';
		   	   cntMix = cntMix +1;
		   }
	   }
	   $('.itemAfter').prepend(html);
	  
	   $('.itemAfter div div input[name=itemContent]').first().focus();


	   	   
	}
   
   
	function itemHtml(data, questionSeq){
		console.log("itemHtml");
		console.log(questionSeq);
	
		 let size = data.length;
		 var html  = '';
		 var html  = '';
		 var html ='';
		 $('.item_management').empty();
	
		 var cntForTopOfItem = 0 ;
		 var html ='';
 		 for(var i = 0; i< size; i++){
 			
			
			 if(data[i].QUESTION_SEQ==questionSeq){
				 if(cntForTopOfItem==0){
					 if(data[i].QUESTION_TYPE_CODE == "10002"){
						html +='<div style="display:flex">';
						html  +='<div class="input_title">문항 관리</div>';		
						html   += '</div>';
						html  +='<div class="itemAfter">';
						cntForTopOfItem = cntForTopOfItem + 1;

					 }else{
						html +='<div style="display:flex">';
						html  +='<div class="input_title">문항 관리</div>';
						html  +='<button type="button" value="'+data[i].QUESTION_SEQ+'" onclick="item_copy(this,'+data[i].QUESTION_TYPE_CODE+')" style="background: white; border: 1px solid #fff; border-radius: 35em;">';
						html 	+='<i class="fas fa-plus"></i>';
						html  +='</button>';
						html   += '</div>';
						html  +='<form id="i'+data[i].QUESTION_SEQ+'"onsubmit="return false;">';
						html +='<input type="hidden" name=surveySeq value="'+data[i].SURVEY_SEQ+'">';
						html +='<input type="hidden" name="questionTypeCode" value="'+data[i].QUESTION_TYPE_CODE+'">';
						html  +='<div class="itemAfter">';
						cntForTopOfItem = cntForTopOfItem + 1;						 
					 }
				 }
			 if(data[i].QUESTION_TYPE_CODE == "10001"){
				 console.log(data[i].QUESTION_TYPE_CODE);
				 if(data[i].ITEM_SEQ == null){
					html  +='<div class="icon_line">';
					html +='<div id="TouchItem">';
					html  +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
					html  +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,0)" value="'+data[i].QUESTION_SEQ+'">';
					html  += '<i class="fas fa-xmark"></i>';
					html  +=   '</button>';
					html  += '<input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;">';
					html  +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
					html  +='<input type="hidden" name="itemSeq" value="0">';
					html  +='</div>'
				    html  += '</div>';
				    html  +='<div class="icon_line">';
					html +='<div id="TouchItem">';
					html  +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
				    html  +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,0)" value="'+data[i].QUESTION_SEQ+'">';
				    html  += '<i class="fas fa-xmark"></i>';
				    html  +=   '</button>';
				    html  += '<input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;">';
				    html  +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
				    html  +='<input type="hidden" name="itemSeq" value="0">';
				    html  +='</div>';
				    html  += '</div>';

				        cntObj = cntObj + 2;
				        
				 }else{
					 html  +='<div class="icon_line">';
					 html +='<div id="TouchItem">';
					 html  +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
			         html  +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,'+data[i].ITEM_SEQ+')" value="'+data[i].QUESTION_SEQ+'">';
				     html  += '<i class="fas fa-xmark"></i>';
				     html  +=   '</button>';
			         html  += '<input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;" value="'+data[i].ITEM_CONTENT+'">';
			         html  +='<input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'">';
				     html  +='<input type="hidden" name="itemSeq" value="'+data[i].ITEM_SEQ+'">';
				     html  +='</div>';
				     html  += '</div>';

				     cntObj = cntObj + 1;
				        
				       
				 }
					
				 
			 }//객관식
			 else if(data[i].QUESTION_TYPE_CODE == "10002"){
				 html  +='<div class="icon_line">';
				 html  += '<input type="text" placeholder="주관식 문제입니다." value="주관식 문제입니다." readonly>'
					 html  +='<input type="hidden" name="itemSeq" value="'+data[i].ITEM_SEQ+'">';
			     html  += '</div>';


			 }//주관식
			 else if(data[i].QUESTION_TYPE_CODE == "10003"){
				 if(data[i].ITEM_SEQ == null){
					html  +='<div class="icon_line">';
					html +='<div id="TouchItem">';
			        html  +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
			        html +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,0)" value="'+data[i].QUESTION_SEQ+'">';
			        html += '<i class="fas fa-xmark"></i>';
			        html +=   '</button>'
			        html  += '<input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;">';
			        html  +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
			        html  +='<input type="hidden" name="itemSeq" value="0">';
			        html  +='</div>';
			        html  += '</div>';
			        html  +='<div class="icon_line" id="guitar">';
					html +='<div id="TouchItem">';
			        html  +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
			        html  += '<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i><input type="text" name="itemContent" placeholder="기타" value="기타" id="guitar" readonly>';
			        html  +='<input type="hidden" name="itemScore"  value="0">';
			        html  +='<input type="hidden" name="itemSeq" value="0">';
					html  +='</div>';
					html +='</div>';
					console.log(cntMix);
			        cntMix = cntMix + 2;
				     
				 }else{
					 if(data[i].ITEM_CONTENT =="기타"){
		                html  +='<div class="icon_line" id="guitar">';
		 			    html +='<div id="TouchItem">';
		                html  +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
		                html  += '<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i><input type="text" name="itemContent" id="guitar" value="'+data[i].ITEM_CONTENT+'" readonly>';
		                html  +='<input type="hidden" name="itemScore"  value="0">';
		                html  +='<input type="hidden" name="itemSeq" value="'+data[i].ITEM_SEQ+'">';
		                html  += '</div>';
		                html +='</div>';
		                console.log(cntMix);
		                cntMix = cntMix + 1;
				 	 }else{
				 		html  +='<div class="icon_line">';
						html +='<div id="TouchItem">';
				 		html  +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
				        html  +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,'+data[i].ITEM_SEQ+')" value="'+data[i].QUESTION_SEQ+'">';
				        html  += '<i class="fas fa-xmark"></i>';
					    html  +=   '</button>';
				 		html  += '<input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;" value="'+data[i].ITEM_CONTENT+'">';
				 		html  +='<input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'">';
					    html  +='<input type="hidden" name="itemSeq" value="'+data[i].ITEM_SEQ+'">';
					    html  += '</div>';
					    html +='</div>';
					    console.log(cntMix);
		                cntMix = cntMix + 1;
		                
				 	 }	


				 }	 
					
		 
			  }//혼합식
			}//특정 문제의 문항만 출력
		 }//첫 for문
 		html  +='</div>';
 		html  +='</form>';		 
		$('.item_management').append(html );
		console.log(cntObj);
		console.log(cntMix);

	}//itemHtml
	
	function deleteItem (obj,itemSeq) {
		var questionSeq = $(obj).val();
		   if(confirm("삭제하시겠습니까?")){
			 if(cntObj == 2 || cntMix ==2){
				 alert("문항은 최소 2개를 유지해 주세요.")
			 }else if(itemSeq ==0){
         		$(obj).parent().remove();
				cntObj = cntObj - 1;
				cntMix = cntMix - 1;
			 }else{
				 $.ajax({
		       		method:'POST', //어떤 방식으로 보낼 지
		         	url:'deleteItem.do/'+ questionSeq +'/'+itemSeq, // qdiv를 보낼 경로 설정
		            processData : false,
		            contentType : false,
		            cache : false,
		            beforeSend : function() { //보내기 전 실행
		           		console.log("삭제 요청이 보내지는가?");
		         	},
		            success:function () {    //전송 성공시 실행
		         		$(obj).parent().remove();
						cntObj = cntObj - 1;
						cntMix = cntMix - 1;
		            }
		      	 });
			}
		}else{
			
		}
	}


    function deleteQus(obj,surveySeq) {
  		 if(confirm("삭제하시겠습니까?")){
   		    var questionSeq = $(obj).val();
		 	if(questionSeq==0){
				$(obj).parent().remove();
			}else{ 
      			$.ajax({
         			method:'POST', //어떤 방식으로 보낼 지
            		url:'deletequestion.do/'+ questionSeq , // qdiv를 보낼 경로 설정
            		processData : false,
            		contentType : false,
             		cache : false,
             		beforeSend : function() { //보내기 전 실행
            		console.log("삭제 요청이 보내지는가?");
         			},
            		success:function (data) {    //전송 성공시 실행
            			$(obj).parent().remove();

            		}
       			});
			}
   		}
   }
    

    function touchQuestion(obj){
    	$(".beforeTouch").empty();
      var sq = $('#surveySequence').val();
      var questionid = $(obj).val();
      $.ajax({
         method:'get', //어떤 방식으로 보낼 지
         url:'touchandselect.do/' + questionid+'/'+sq, // qdiv를 보낼 경로 설정
         dataType: "json",
          beforeSend : function() { //보내기 전 실행
         console.log("요청이 보내지는가?");
         },
         success:function (data) {    //전송 성공시 실행
            cntObj=0;
            cntMix=0;

                itemHtml(data,questionid);


            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
      });
   }


      function changeTypeAndQusUpdate(questionSeq,typeCode){
          	var data = new FormData();
			data.append("questionTypeCode",typeCode);
			data.append("questionSeq",questionSeq);		
			data.append("questionContent","!@#");

			
         $.ajax({
            method: 'POST',
            url: 'updatequestion.do/',
            data: data,
            dataType: 'text',
            processData : false,
            contentType : false,
             cache : false,
            beforeSend: function() {
               console.log("요청 보냈음");
            },
            success: function(data) {

               if(data=='0'){
            	   alert("빈 텍스트는 저장이 불가합니다.");
            	   location.reload();
               }else{
            	   $.ajax({
                       method: 'POST',
                       url: 'deleteItem.do/'+questionSeq,
                       data: data,
                       processData : false,
                       contentType : false,
                        cache : false,
                       beforeSend: function() {
                          console.log("요청 보냈음");
                          alert("업데이트 beforesend");
                       },
                       success: function(jsondata) {
							cntObj = 0;
							cntMix = 0;

                       },

                       error: function(e) {
                          console.log("Error", e);
                          }
                       });
               }
               


            },
            error: function(e) {
               console.log("Error", e);
               }
            });
         }





    //문제 유형 선택 시  해당하는 유형의 문항form이 나오도록 하는 비동기
   window.onloade=function(){
	   
     if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
               $("#obj_box_toggle").show();
      }
   };

   $(document).ready(function(){
	   $('#queAfter div form div input[name=questionContent]').first().focus();
	   $('#queAfter div form div input[name=questionContent]').first().click();

   });

   function checkit1(obj,questionType,questionSeq,name) {
	   $(".beforeTouch").empty();
	   
	   newValue=$(obj).val();
	   
      if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
    	  if(questionType != newValue){
    		  if(confirm("유형이 바뀌면 저장된 데이터가 사라집니다. 계속 진행하시겠습니까?")){
    			  changeTypeAndQusUpdate(questionSeq,newValue);
    			  location.reload();
    		  }else{
    				$("input[type=radio][name="+name+"][value="+newValue+"]").prop('checked',false);
      				$("input[type=radio][name="+name+"][value="+questionType+"]").prop('checked',true);

  		
    			  return false;
    		  }
    	  }

		
         
			
       }
   };
   function checkit3(obj,questionType,questionSeq,name) {
	   $(".beforeTouch").empty();
	   newValue=$(obj).val();

      if ($("input[type=radio][id=mix_radio]:checked").is(':checked') == true){
    	  if(questionType != newValue){
    		  if(confirm("유형이 바뀌면 저장된 데이터가 사라집니다. 계속 진행하시겠습니까?")){
    			  changeTypeAndQusUpdate(questionSeq,newValue);
    			  location.reload();
    		  }else{
    				$("input[type=radio][name="+name+"][value="+newValue+"]").prop('checked',false);
      				$("input[type=radio][name="+name+"][value="+questionType+"]").prop('checked',true);


  		
  					
  			        
  			
  			  return false;
  		 	 }
    	  }



       }
   };

   function checkit2(obj,questionType,questionSeq,name) {
	   $(".beforeTouch").empty();
	   newValue=$(obj).val();

    if($("input[type=radio][id=subj_radio]:checked").is(':checked') == true){ // 체크 여부(checked)
    	if(questionType != newValue){
  		  if(confirm("유형이 바뀌면 저장된 데이터가 사라집니다. 계속 진행하시겠습니까?")){
  			changeTypeAndQusUpdate(questionSeq,newValue);
  			location.reload();
  		  }else{
  				$("input[type=radio][name="+name+"][value="+newValue+"]").prop('checked',false);
  				$("input[type=radio][name="+name+"][value="+questionType+"]").prop('checked',true);

			    	
			  return false;
		  }
  	  }


      }

   };
   
   
</script>

<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>