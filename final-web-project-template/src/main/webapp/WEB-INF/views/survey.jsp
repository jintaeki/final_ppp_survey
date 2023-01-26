<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="/survey.css"> -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey.css" />

<!-- <script src="resources/js/survey.js"></script> -->
<!-- <script src="resources/js/surveycountdown.js"></script> -->
<script type="text/javascript">
  
   function questionHTML(result,raterId,appraiseeId,anonymitycode,theSeq){
		var itemNum = 0;
	   const size= result.length;
	   console.log(size);
   	   $("#surveyForm").empty();
	   let cnt = 0;
	   surveyQandA = '';
	   surveyQandA += '<input type="hidden" name="anonymityCode" value='+anonymitycode+'>';
	   surveyQandA += '<input type="hidden" name="anonymitySeq" value='+theSeq+'>'; 

	   	 $('#surveyForm').append(surveyQandA);
	   for(let i = 0; i<size;i++){ 
		   		
		    if(i==size-1){
		    	surveyQandA += '<div class="question-form">';
		    	surveyQandA+= '<input type="hidden" name="questionSeq" value="'+result[i].QUESTION_SEQ+'">';
			    surveyQandA += '<p style="margin-bottom: 0px; color:dimgray;">'+(i-itemNum +1)+'.'+ result[i].QUESTION_CONTENT+'</p>';
			    surveyQandA +='</div>';
			    surveyQandA +='<input type="hidden" name="raterId" value="'+raterId+'">';
			    surveyQandA +='<input type="hidden" name="appraiseeId" value="'+appraiseeId+'">';
			    surveyQandA +='<input type="hidden" name="surveySeq" value="'+result[i].SURVEY_SEQ+'">';

			    
			    console.log("마지막");
			    console.log(cnt);
			    if(result[i].QUESTION_TYPE_CODE =="10002"){
			    	surveyQandA += '<div class="item_form" style=" display: flex; align-items: flex-end;">';
			    	surveyQandA+= '<input type="hidden" name="'+(i+'num')+'" value="'+result[i].ITEM_SEQ+'">';
					surveyQandA += '<textarea name="answerContent"></textarea>';
					surveyQandA += '<input type="hidden" name="'+(i+'num')+'" class="item_btn" value="'+result[i].ITEM_SEQ+'">';
					surveyQandA += '</div>';
			    }else{
			    	surveyQandA += '<div class="item_form" style=" display: flex; align-items: flex-end;">';

			    	 for(var j = i-cnt;j<=i;j++ ){
					    	
	 					   surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px">'+result[j].ITEM_CONTENT+'</label>';
					
						   if(j==i){
						   surveyQandA +='<input type="hidden" name="answerContent" value="선택형 문제입니다.">';
						   surveyQandA += '</div>'

						   }
			    }
			   
					   
			   	}
			    break;
			}else if(result[i].QUESTION_CONTENT != result[i+1].QUESTION_CONTENT){

				
			
		    surveyQandA += '<div class="question-form">';
	    	surveyQandA+= '<input type="hidden" name="questionSeq" value="'+result[i].QUESTION_SEQ+'">';
		    surveyQandA += '<p style="margin-bottom: 0px; color:dimgray;">'+(i-itemNum +1)+'.'+ result[i].QUESTION_CONTENT+'</p>';
		    surveyQandA +='</div>';
		    surveyQandA +='<input type="hidden" name="raterId" value="'+raterId+'">';
		    surveyQandA +='<input type="hidden" name="appraiseeId" value="'+appraiseeId+'">';
		    surveyQandA +='<input type="hidden" name="surveySeq" value="'+result[i].SURVEY_SEQ+'">';
		    if(result[i].QUESTION_TYPE_CODE =="10002"){
		    	surveyQandA += '<div class="item_form" style=" display: flex; align-items: flex-end;">';
		    	surveyQandA+= '<input type="hidden" name="'+(i+'num')+'" value="'+result[i].ITEM_SEQ+'">';

				surveyQandA += '<textarea name="answerContent"></textarea>';
				surveyQandA += '<input type="hidden" name="'+(i+'num')+'" class="item_btn" value="'+result[i].ITEM_SEQ+'">';

				surveyQandA += '</div>';
		    }else{
		    	surveyQandA += '<div class="item_form" style=" display: flex; align-items: flex-end;">';
		   	for(var j = i-cnt;j<=i;j++ ){
		    	
				   surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px">'+result[j].ITEM_CONTENT+'</label>';
				   
					  
				   if(j==i){
				   surveyQandA +='<input type="hidden" name="answerContent" value="선택형 문제입니다.">';
				   surveyQandA += '</div>'

				   }
		   	}
		    }
		   	cnt=0;
		   	
		   }else if(result[i].QUESTION_CONTENT == result[i+1].QUESTION_CONTENT){
			   cnt = cnt + 1;
			   itemNum= itemNum + 1;
		   }
		
	  
		    
	   }
	   
	   $('#surveyForm').append(surveyQandA);
   }
   
   function selectSurvey(obj,raterId){
	   console.log(raterId);
	   console.log($(obj).val());
	   var surveySeq = $(obj).val();
	   $("#surveyForm").empty();
	   $.ajax({
	         url:'getAnonymityCode.do/'+surveySeq,
	         method: 'GET',
	         dataType: 'html',
	         success: function(result){
	        	 console.log('result '+result);

	        	 var anonymitycode = result;
	        
	        	 if($(obj).val()==0){
	      		   console.log("surveySeq is 0");
	      		   var html='';
	    		   html += '<div class="noAppraisee"><b>평가 대상이 없습니다.</b></div>'
	      		   $('#appendArea').empty();
	      		   $('#appendArea').append(html);
	      	     }else{
	      		   
	      	   $.ajax({
	      	         url:'getAppraisee.do/'+raterId+"/"+surveySeq,
	      	         method: 'GET',
	      	         dataType: 'json',
	      	         success: function(result){
	      	        	 console.log('result '+result);
						 
	      	        	 var appraisees = result;
	      	        	 
	      	        	$.ajax({
	   	      	         url:'getAnonySeq.do',
	   	      	         method: 'GET',
	   	      	         dataType: 'html',
	   	      	         success: function(theSeq){
	   	      	        	 console.log('result '+result);
	   						 
	   	      	        	 appraisee(appraisees,anonymitycode,theSeq);
	   	      	        	 
	   	      	          		

	   	      	         }
	   	      	      });
	      	          		

	      	         }
	      	      });
	        	 

	         }
	         }
	      });
	   
	   
	   }
   
   
   function appraisee(data,anonymitycode,theSeq){
	   var size = data.length;
	   var html = '';
	   $('#appendArea').empty();
	  
	   		for(var i=0; i<size; i++){
		   
		   		html +='<div class="col-4">'+data[i].appraiseeDepartmentName+'</div>';
		   		html +='<div class="col-2">'+data[i].appraiseeGradeName+'</div>';
		   		html +='<div class="col-3">'+data[i].appraiseeName+'</div>';
		   		if(data[i].surveyCompleteYN=='N'){
		   		html +='<div class="col-3"><button  class="create_btn" id="'+data[i].appraiseeId+'" onclick="surveyStart(this,'+data[i].appraiseeId+','+data[i].raterId+','+anonymitycode+','+theSeq+')" value="'+data[i].surveySeq+'">평가</button></div>';
		   		}else{
		   		html +='<div class="col-3"><button style="padding: 10px 13px; color:green;" class="create_btn" disabled>평가완료</button></div>';
		   		}
	  		}
	   
	   $('#appendArea').append(html);
   }
   
   function surveyStart(obj,appraiseeId,raterId,anonymitycode,theSeq){
	   var surveySeq = $(obj).val();
	   
	   
	   $.ajax({
	         url: 'getquestionforsurvey.do/'+surveySeq,
	         method: 'GET',
	         dataType: 'json',
	         success: function(result){

	        	 alert("문제요청성공");
	        	 questionHTML(result,raterId,appraiseeId,anonymitycode,theSeq);
	            
	         }
	      });
   }
   

   

   
   function submit(){
	   var data = $('#surveyForm')[0];
	   var formData = new FormData(data);
		
	   
	   var num = 'num';
	
		var cnt = 0;
		var cnt2=0
		var keyArray=[];
		var valueArray =[];
	
		
		for(const pairkeys of formData.keys()){
			keyArray.push(pairkeys);
			
		 	cnt = cnt+1;
		}
		for(const pairvalues of formData.values()){
// 			console.log(pairvalues);
			valueArray.push(pairvalues);
			cnt2 = cnt2 +1;
		}	
   
		
		for(var i = 0; i<cnt;i++){
			if(keyArray[i].substr(-3,3)=='num'){
// 				console.log(keyArray[i]);
// 				console.log(valueArray[i]);
				formData.append('itemSeq',valueArray[i]);
			}
		}
		
		var object = {};	
		formData.forEach((value, key) => object[key] = value);
		
// 		console.log("설문아이디"+object['surveySeq']);
// 		console.log("평가자아이디"+object['raterId']);
		 var tag = $('#'+object['appraiseeId']);
// 	        	 tag.replaceAll('<div class="col-3"><button disabled>평가완료</button></div>');
// 				 tag.remove();
				 tag.parent().html('<button disabled>평가완료</button>');
// 	   $.ajax({
// 	         url: 'insertSurveyResult.do',
// 	         method: 'POST',
// 	         data : formData,
// 	         processData : false,
// 	         contentType : false,
// 	         cache : false,
// 	         timeout : 600000,
// 	         success: function(result){
// 	        	 alert("결과저장성공");
// 	        	 selectSurvey(object['surveySeq'],object['raterId']);
// 	        	 var tag = $('#'+surveyBtn);
// 	        	 tag.remove();
// 	         }
// 	      });
   } 
  
</script>



<div class="container_flex">
   <div class="survey_info">
      <b>설문 참여가능 기간</b><br>
      <div id="countdown"></div>
      <br> <b>프로젝트</b> <br> 22년도 전체 다면 평가 <br>
      <br> <b>평가대상</b><br> 임진택 님
   </div>
</div>

					

<!-- 문항 시작 -->
<div class="container" style="padding: 40px 40px 40px 40px;">
	<select name="surveySeq" onclick="selectSurvey(this,${raterId})">
		<option value="0">선택</option>
		<c:forEach items="${surveySeqAndName}" var="surveySeqAndName">
			<option  value="${surveySeqAndName.SURVEY_SEQ}" >${surveySeqAndName.SURVEY_NAME}</option>
		</c:forEach>
	</select>
	<div class="row" style="width: 1360px;">

		<div class="appraiseeList col-4">
			<div id="scroll_area" style="overflow: auto;">


				<div class="row">
					<div class="col-4">부서</div>
					<div class="col-2">직급</div>
					<div class="col-3">피평가자</div>
					<div class="col-3"></div>
				</div>
				<div id="appendArea" class="row">

					<div class="noAppraisee"><b>평가 대상이 없습니다.</b></div>
				</div>



			</div>
		</div>





<!-- 	<div class="col-1">하이</div> -->






		<div class="question-box col-7">
		<div class="submit_btn"><button class="create_btn" onclick="submit()">제출</button></div>
			<div id="scroll_area"
				style="overflow: auto; height: 670px; ">
				<div class="survey_list">

					<form:form id="surveyForm" modelAttribute="surveyResult">
					<div class="item_form" style=" display: flex; align-items: flex-end;">
					<input type="radio" class="item_btn" id="radiolabel"><label for="radiolabel" style="margin-right: 15px">혼합식1</label>
					<input type="radio" class="item_btn" id="radiolabel"><label for="radiolabel" style="margin-right: 15px">혼합식1</label>
					<input type="radio" class="item_btn" id="radiolabel"><label for="radiolabel" style="margin-right: 15px">혼합식1</label>
					<input type="radio" class="item_btn" id="radiolabel"><label for="radiolabel" style="margin-right: 15px">혼합식1</label>
					<input type="radio" class="item_btn" id="radiolabel"><label for="radiolabel" style="margin-right: 15px">혼합식1</label>					
					</div>
					</form:form>
					

				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>