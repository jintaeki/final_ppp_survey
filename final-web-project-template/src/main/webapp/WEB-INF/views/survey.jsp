<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="/survey.css"> -->
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey.css" /> --%>

<!-- <script src="resources/js/survey.js"></script> -->
<!-- <script src="resources/js/surveycountdown.js"></script> -->
<script type="text/javascript">
  
   
   function questionHTML(result,raterId,appraiseeId,anonymitycode,theSeq){

	   const size= result.length;
	   console.log(size);
   	   $("#addQuestion").empty();
	   let cnt = 0;
	   surveyQandA = '';
	   surveyQandA += '<input type="hidden" name="anonymityCode" value='+anonymitycode+'>';
	   surveyQandA += '<input type="hidden" name="anonymitySeq" value='+theSeq+'>'; 

	   	 $('#surveyForm').append(surveyQandA);
	   for(let i = 0; i<size;i++){ 
		   		
		    if(i==size-1){
		    	surveyQandA += '<div class="question-form">';
		    	surveyQandA+= '<input type="hidden" name="questionSeq" value="'+result[i].QUESTION_SEQ+'">';
			    surveyQandA += result[i].QUESTION_CONTENT;
			    surveyQandA +='</div>';
			    surveyQandA +='<input type="hidden" name="raterId" value="'+raterId+'">';
			    surveyQandA +='<input type="hidden" name="appraiseeId" value="'+appraiseeId+'">';
			    surveyQandA +='<input type="hidden" name="surveySeq" value="'+result[i].SURVEY_SEQ+'">';

			    
			    console.log("마지막");
			    console.log(cnt);
			    if(result[i].QUESTION_TYPE_CODE =="10002"){
			    	surveyQandA += '<span class="item_form">';
			    	surveyQandA+= '<input type="hidden" name="'+(i+'num')+'" value="'+result[i].ITEM_SEQ+'">';
					surveyQandA += '<textarea name="answerContent"></textarea>';
					surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[i].ITEM_SEQ+'" style="display:none;">';
					surveyQandA += '</span>';
			    }else{
			    	 for(var j = i-cnt;j<=i;j++ ){
					    	
					   	   surveyQandA += '<span class="item_form">'
	 					   surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'">'+result[j].ITEM_CONTENT;
						   surveyQandA += '</span>'
					
						   if(j==i){
						   surveyQandA +='<input type="hidden" name="answerContent" value="선택형 문제입니다.">';
						   }
			    }
			   
					   
			   	}
			    break;
			}else if(result[i].QUESTION_CONTENT != result[i+1].QUESTION_CONTENT){

				
			
		    surveyQandA += '<div class="question-form">';
	    	surveyQandA+= '<input type="hidden" name="questionSeq" value="'+result[i].QUESTION_SEQ+'">';
		    surveyQandA += result[i].QUESTION_CONTENT;
		    surveyQandA +='</div>';
		    surveyQandA +='<input type="hidden" name="raterId" value="'+raterId+'">';
		    surveyQandA +='<input type="hidden" name="appraiseeId" value="'+appraiseeId+'">';
		    surveyQandA +='<input type="hidden" name="surveySeq" value="'+result[i].SURVEY_SEQ+'">';
		    if(result[i].QUESTION_TYPE_CODE =="10002"){
		    	surveyQandA += '<span class="item_form">';
		    	surveyQandA+= '<input type="hidden" name="'+(i+'num')+'" value="'+result[i].ITEM_SEQ+'">';

				surveyQandA += '<textarea name="answerContent"></textarea>';
				   surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'" style="display:none;">';

				surveyQandA += '</span>';
		    }else{
		    
		   	for(var j = i-cnt;j<=i;j++ ){
			   	   surveyQandA += '<span class="item_form">'
 					   surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'">'+result[j].ITEM_CONTENT;
				   surveyQandA += '</span>'
				   
				   if(j==i){
				   surveyQandA +='<input type="hidden" name="answerContent" value="선택형 문제입니다.">';

				   }
		   	}
		    }
		   	cnt=0;
		   }else if(result[i].QUESTION_CONTENT == result[i+1].QUESTION_CONTENT){
			   cnt = cnt + 1;
		   }
		
	  
		   
	   }
	   
	   $('#addQuestion').append(surveyQandA);
   }
   
   function selectSurvey(obj,raterId){
	   console.log(raterId);
	   console.log($(obj).val());
	   var surveySeq = $(obj).val();
	   $("#addQuestion").empty();
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
	      		   html += '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평가 대상이 없습니다.</b>';
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
		   html +='<div class="col-3"><button id="'+data[i].appraiseeId+'" onclick="surveyStart(this,'+data[i].appraiseeId+','+data[i].raterId+','+anonymitycode+','+theSeq+')" value="'+data[i].surveySeq+'">평가</button></div>';
		   }else{
		   html +='<div class="col-3"><button disabled>평가완료</button></div>';
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
<div class="container" style="padding: 40px 20px 20px 40px;">
	<select name="surveySeq" onclick="selectSurvey(this,${raterId})">
		<option value="0">선택</option>
		<c:forEach items="${surveySeqAndName}" var="surveySeqAndName">
			<option  value="${surveySeqAndName.SURVEY_SEQ}" >${surveySeqAndName.SURVEY_NAME}</option>
		</c:forEach>
	</select>
	<div class="row">
		
		<div class="col-4" style="font-size: 14px; text-align: center">
			<div id="scroll_area" style="overflow: auto;">


				<div class="row">
					<div class="col-4">부서</div>
					<div class="col-2">직급</div>
					<div class="col-3">피평가자</div>
					<div class="col-3"></div>
				</div>
				<div id="appendArea" class="row">
	
				<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평가 대상이 없습니다.</b>
				</div>



			</div>
		</div>











		<div id="question-box" class="col-7" style="border: 1px solid;">
			<div class="survey_list">
			
				<form:form id="surveyForm" modelAttribute="surveyResult">

					<div class="form_area" id="addQuestion">
						<div class="question-form"></div>


					</div>
				</form:form>
									<button onclick="submit()">제출</button>
				
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>