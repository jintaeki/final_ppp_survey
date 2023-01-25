<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="/survey.css"> -->
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey.css" /> --%>

<!-- <script src="resources/js/survey.js"></script> -->
<!-- <script src="resources/js/surveycountdown.js"></script> -->
<script type="text/javascript">
   function gosurvey(obj,surveyseq){
      console.log('gosurvey 함수 실행');
      var surveySeq= surveyseq;
      $.ajax({
         url: 'getquestionforsurvey.do/'+surveySeq,
         method: 'GET',
         dataType: 'json',
         success: function(result){
        	 alert("문제요청성공");
        	 questionHTML(result);
        	 
            // result는 컨트롤러 리턴값 
            // result => survey_result table의 값이 담겨있음 List<SurveyResultVo>
            //  document.getElementById("question-box");
            // $("#question-box")
//             for(var i=0; i<result.length; i++){
               // result.get(i).get("serveySeq") -> JAVA 형태
               // result[i]['serveySeq'] -> 자바스크립트 형태
               
               // result[i]['title'] -> 설문 문항
               // $("#question-box .question-form").html(result[i]['title']); -> 태그에 설문 문항을 넣어줌
//             }
         }
      })
   } 
   
   function questionHTML(result){
	   const size= result.length;
	   console.log(size);
   	   $("#addQuestion").empty();
	   let cnt = 0;
	   surveyQandA = '';
	   for(let i = 0; i<size;i++){

		    if(i==size-1){
		    	console.log(result[i].QUESTION_CONTENT);
		    	surveyQandA += '<div class="question-form">';
		    	surveyQandA+= '<input type="hidden" value="'+result[i].QUESTION_SEQ+'">';
			    surveyQandA += result[i].QUESTION_CONTENT;
			    surveyQandA +='</div>';
			    console.log("마지막");
			    console.log(cnt);
			    if(result[i].QUESTION_TYPE_CODE =="10002"){
			    	surveyQandA += '<span class="item_form">';
			    	surveyQandA+= '<input type="hidden" value="'+result[i].ITEM_SEQ+'">';
					surveyQandA += '<textarea name="answerContent"></textarea>';
					surveyQandA += '</span>';
			    }else{
			    	 for(var j = i-cnt;j<=i;j++ ){
					    	
					   	   surveyQandA += '<span class="item_form">'
	 					   surveyQandA += '<button class="item_btn" type="submit">'+result[j].ITEM_CONTENT+'</button>'
						   surveyQandA += '</span>'
			    }
			   
					   
			   	}
			    break;
			}else if(result[i].QUESTION_CONTENT != result[i+1].QUESTION_CONTENT){

		    surveyQandA += '<div class="question-form">';
	    	surveyQandA+= '<input type="hidden" value="'+result[i].QUESTION_SEQ+'">';
		    surveyQandA += result[i].QUESTION_CONTENT;
		    surveyQandA +='</div>';
		    if(result[i].QUESTION_TYPE_CODE =="10002"){
		    	surveyQandA += '<span class="item_form">';
		    	surveyQandA+= '<input type="hidden" value="'+result[i].ITEM_SEQ+'">';
				surveyQandA += '<textarea name="answerContent"></textarea>';
				surveyQandA += '</span>';
		    }else{
		    
		   	for(var j = i-cnt;j<=i;j++ ){
			   	   surveyQandA += '<span class="item_form">'
				   surveyQandA += '<button class="item_btn" type="submit">'+result[j].ITEM_CONTENT+'</button>'
				   surveyQandA += '</span>'
					   console.log(result[j].ITEM_CONTENT);
		   	}
		    }
		   	cnt=0;
		   }else if(result[i].QUESTION_CONTENT == result[i+1].QUESTION_CONTENT){
			   cnt = cnt + 1;
		   }
		
	  
		   
	   }
	   
	   $('#addQuestion').append(surveyQandA);
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
<div class="container">
   <div class="row">
      <div class="col-4" style="border: 1px solid;">
        <table class="survey_table">
           <thead class="survey_table_thead">
              <tr class="survey_table_tr">
                 <th class="col-4">부서</th>
                 <th class="col-3">직급</th>
                 <th class="col-4">피평가자</th>
                 <th class="col-1"></th>
              </tr>
           </thead>
        <tbody>
					

					<c:forEach items="${UCDList}" var="appraiseeList">
						<c:choose>
							<c:when test="${empty UCDList}">
								<tr>
									<td>평가 대상이 없습니다.
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="survey_table_tr">
									<td>${appraiseeList.appraiseeDepartmentName }</td>
									<td>${appraiseeList.appraiseeGradeName }</td>
									<td>${appraiseeList.appraiseeName }</td>
									<td><button onclick="gosurvey(this,${appraiseeList.surveySeq})" >평가</button></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					
        </tbody>
        
        </table>
      </div>
      
      
      
<div class="col-1">
가운데 철벽
</div>



<div id="question-box" class="col-7" style="border: 1px solid;">
   <div class="survey_list">
      <div class="form_area" id="addQuestion">
            <div class="question-form">
           
      </div>
         

        </div>
         
   </div>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>