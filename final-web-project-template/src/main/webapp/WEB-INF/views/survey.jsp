<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="/survey.css"> -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey.css" />

<!-- <script src="resources/js/survey.js"></script> -->
<!-- <script src="resources/js/surveycountdown.js"></script> -->
<script>

   function answerBox_on(obj){
	   var radioItemSeq = $(obj).val();
	   var tag = $(obj);
	   tag.parent().next().show();


   }

   function answerBox_off(obj){
	   var radioItemSeq = $(obj).val();
	   var tag = $(obj);
	   tag.parent().next().val('선택형 문제입니다.');
	   tag.parent().next().hide();


   }

   function questionHTML(result,raterId,appraiseeId,anonymitycode,theSeq){
      var itemNum = 0;
      // radio required 기능을 위한 배열
      var itemSeqArray=[];
      // 주관식 문제 required 기능을 위한 배열
      // 주관식의 개수만큼 배열의 크기가 정해진다
      // 0~ n번까지 주관식 문제의 문항번호가 들어가게 된다
      var itemSubjSeq = [];
      var itemSubjSeqIndex=0;
      const size= result.length;
      console.log(size);

      var subjNum = 0;

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
                surveyQandA += '<input type="hidden" name="'+(i+'num')+'" value="'+result[i].ITEM_SEQ+'">';
                surveyQandA += '<textarea name="'+(i-itemNum +1)+'answerContent" ></textarea>';
                surveyQandA += '</div>';
                itemSeqArray[i-itemNum +1]=i;
                itemSubjSeq[itemSubjSeqIndex]=result[i].ITEM_SEQ;
                itemSubjSeqIndex = itemSubjSeqIndex + 1;
             }else if(result[i].QUESTION_TYPE_CODE =="10003"){
            	 surveyQandA += '<div class="item_form">';
                 surveyQandA += '<div style=" display: flex; align-items: flex-end;">';

                 for(var j = i-cnt;j<=i;j++ ){

                     if(result[j].ITEM_CONTENT=="기타"){
                         surveyQandA += '<input type="radio" onclick = "answerBox_on(this)" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px" required>'+result[j].ITEM_CONTENT+'</label>';
                     }else{
                         surveyQandA += '<input type="radio" onclick ="answerBox_off(this)" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px" required>'+result[j].ITEM_CONTENT+'</label>';
                     }

                     if(j==i){
                     surveyQandA += '</div>';
                     surveyQandA +='<textarea name="'+(i-itemNum +1)+'answerContent" value="선택형 문제입니다." id="'+(i-itemNum +1)+'answerContent" style="display:none;"></textarea>';
                     surveyQandA += '</div>';
                     }
             	 }

                 itemSeqArray[i-itemNum +1]=i;

             }else{
                surveyQandA += '<div class="item_form" style=" display: flex; align-items: flex-end;">';

                 for(var j = i-cnt;j<=i;j++ ){

                     surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px" required>'+result[j].ITEM_CONTENT+'</label>';

                     if(j==i){
                     surveyQandA +='<input type="hidden" name="'+(i-itemNum +1)+'answerContent" value="선택형 문제입니다.">';
                     surveyQandA += '</div>'

                     }
             	 }

                 itemSeqArray[i-itemNum +1]=i;
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

            		surveyQandA += '<textarea name="'+(i-itemNum +1)+'answerContent"></textarea>';

            		surveyQandA += '</div>';
            		itemSeqArray[i-itemNum +1]=i;
            		itemSubjSeq[itemSubjSeqIndex]=result[i].ITEM_SEQ;
            		itemSubjSeqIndex = itemSubjSeqIndex + 1;
          		}else if(result[i].QUESTION_TYPE_CODE =="10003"){
            	 surveyQandA += '<div class="item_form" >';
                 surveyQandA += '<div style=" display: flex; align-items: flex-end;">';

                 for(var j = i-cnt;j<=i;j++ ){

                     if(result[j].ITEM_CONTENT=="기타"){
                         surveyQandA += '<input type="radio" onclick = "answerBox_on(this)" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px" required>'+result[j].ITEM_CONTENT+'</label>';
                     }else{
                         surveyQandA += '<input type="radio" onclick ="answerBox_off(this)" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px" required>'+result[j].ITEM_CONTENT+'</label>';
                     }

                     if(j==i){
                     surveyQandA += '</div>';
                     surveyQandA +='<textarea name="'+(i-itemNum +1)+'answerContent" value="선택형 문제입니다." id="'+(i-itemNum +1)+'answerContent" style="display:none;"></textarea>';
                     surveyQandA += '</div>';
                     }
             	 }

                 itemSeqArray[i-itemNum +1]=i;

             }else{
             		surveyQandA += '<div class="item_form" style=" display: flex; align-items: flex-end;">';
             		itemSeqArray[i-itemNum +1]=i;
            		for(var j = i-cnt;j<=i;j++ ){

               			surveyQandA += '<input type="radio" name="'+(i+'num')+'" class="item_btn" value="'+result[j].ITEM_SEQ+'"id="'+result[j].ITEM_SEQ+'"><label for="'+result[j].ITEM_SEQ+'" style="margin-right: 15px" required>'+result[j].ITEM_CONTENT+'</label>';


               			if(j==i){
               				surveyQandA +='<input type="hidden" name="'+(i-itemNum +1)+'answerContent" value="선택형 문제입니다.">';
               				surveyQandA += '</div>'

              			}

            		}
          		}

            		cnt=0;

         }else if(result[i].QUESTION_CONTENT == result[i+1].QUESTION_CONTENT){
            // 문제 1개와 문제 n개를 출력할 때 필요한 cnt 수
        	cnt = cnt + 1;
            // radio 타입에 name 값을 i+num으로 부여하고 formdata를 받게되면 controller와 mapping이 되지 않는다
            // 선택한 radio가 어떤 name을 가지고 있는지 알 수 있다면 mapping 가능한 name으로 변경이 가능하다
            //  itemnum은 i번째 for문을 진행할 때 출력된 문제가 페이지에서 몇 번째 문제인지 보여질 때 사용되는 cnt수
            // n번까지 존재하는 배열에 출력되는 문항의 name에 붙게될 i를  0번부터 차례대로 넣기 위해도 사용된다
            // 몇 번쨰 문제를 선택하지 않았는지 체크도 해줄 수 있게 된다
            itemNum= itemNum + 1;
         }



      }
      itemSeqArray[0] = itemSeqArray.length;
      console.log(itemSeqArray);
      submitBtn = '';
      submitBtn='<button type="button" class="create_btn" onclick="submit('+JSON.stringify(itemSeqArray)+','+JSON.stringify(itemSubjSeq)+')">제출</button>';

      //문제 전송버튼 삭제 및 생성
      $('.submit_btn').empty();
      $('.submit_btn').append(submitBtn);
      $('#surveyForm').append(surveyQandA);
   }

   function selectSurvey(obj,raterId){
      $('.submit_btn').empty();
      console.log(raterId);
      console.log($(obj).val());
      var surveySeq = $(obj).val();
      $("#surveyForm").empty();
      $.ajax({
            url:'getAnonymityCode.do/'+surveySeq,
            method: 'GET',
            success: function(result){
               console.log('result '+result.anonymityCheckCode);
			   var surveyName = result.surveyName;
			   var startDate = result.surveyStartDate;
			   var closedDate = result.surveyClosedDate;
               var anonymitycode = result.anonymityCheckCode;
               var htmlQuestion = '';
                  $('#surveyForm').empty();
			
               // 전체로 두고 조회했을 때
               if($(obj).val()==0){
                  console.log("surveySeq is 0");
                  var html='';
                html += '<div class="noAppraisee"><b>평가 대상이 없습니다.</b></div>'
                  $('#appendArea').empty();
                  $('#appendArea').append(html);
                  var htmlQuestion='<div class="noQuestion"><b>설문을 먼저 선택하세요.</b></div>';
                  $('#surveyForm').append(htmlQuestion);
                  showSurveyInfo("","","");
                 }else{

                	  showSurveyInfo(surveyName,startDate,closedDate);

               // 설문지 정보 출력
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
                             var htmlQuestion='<div class="noQuestion"><b>평가 버튼을 눌러 평가를 진행해주세요.</b></div>';
                              $('#surveyForm').append(htmlQuestion);


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




   function submit(itemSeqArray, itemSubjSeq){
      if(confirm("제출하시겠습니까?")){

         var data = $('#surveyForm')[0];
          var formData = new FormData(data);

          var cnt = 0;
          var cnt2=0
          var keyArray=[];
          var valueArray =[];


          for(const pairkeys of formData.keys()){
             keyArray.push(pairkeys);

              cnt = cnt+1;
          }
          for(const pairvalues of formData.values()){
             valueArray.push(pairvalues);
             cnt2 = cnt2 +1;
          }


          for(var i = 0; i<cnt;i++){
             if(keyArray[i].substr(-13,13)=='answerContent'){
                formData.append('answerContent',valueArray[i]);
             }

             if(keyArray[i].substr(-3,3)=='num'){

                formData.append('itemSeq',valueArray[i]);
             }
          }

      
          var cntCheckedAnswer=1;
				//1번부터 진행하는 이유는 itemSeqArray에 i를 대입할 때 index가 1부터시작(i-itemNum+1)했기 때문에 0은 null값이 들어가있다
             for(var i =1; i<itemSeqArray.length; i++){

                if ($('input[name="'+itemSeqArray[i]+'num"]').is(':checked')){
                    cntCheckedAnswer = cntCheckedAnswer + 1;
                 }else if(!$('input[name="'+itemSeqArray[i]+'num"]').is(':checked') ) {
                	 // 실제 주관식 문제가 비어있는 지 확인하고 alert
                       if($('textarea[name="'+i+'answerContent"]').val()==''){
                          alert(i+"번을 채워주세요.");
                          $('input[name="'+itemSeqArray[i]+'num"]').focus();
                            break;
                     // 주/객관식 문제에 hidden으로 되어있는 answerContent를 확인하고 alert
                       }else if($('input[name="'+i+'answerContent"]').val()=='선택형 문제입니다.'){
                       alert(i+"번을 선택해주세요.");
                        $('input[name="'+itemSeqArray[i]+'num"]').focus();
                            break;
                       }


					 //radio가 비어있지 않다면 +1
                 }else if ($('textarea[name="'+i+'answerContent"]').val()!=''){
                       cntCheckedAnswer = cntCheckedAnswer + 1;
                 }
             }
             		//문제 개수만큼 cnt가 쌓였다면 전송 진행
                  if(cntCheckedAnswer == itemSeqArray.length - 1){


                    //formData에 담은 데이터를 object map에 담는다
                    var object = {};
                    formData.forEach((value, key) => object[key] = value);

					$.ajax({
                     url: 'insertSurveyResult.do',
                     method: 'POST',
                     data : formData,
                     processData : false,
                     contentType : false,
                     cache : false,
                     timeout : 600000,
                     success: function(result){
                        alert("결과저장성공");
                  		$("#surveyForm").empty();
                  		var htmlQuestion='<div class="noQuestion"><b>평가 버튼을 눌러 평가를 진행해주세요.</b></div>';
                 		$('#surveyForm').append(htmlQuestion);
                 		$('.submit_btn').empty();
                 		var tag = $('#'+object['appraiseeId']);
                		tag.parent().html('<button type="button" class="create_btn" style="padding: 10px 13px; color:green;" disabled>평가완료</button>');
                     }
                  });
                 }






      }
   }

   function showSurveyInfo(surveyName,startDate,closedDate){
	   let html ='';
	   html +='<br><b>설문 참여가능 기간</b><br>';
	   html +='<p>'+startDate+' ~ '+ closedDate+'</p>';
	   html +='<p><b>참여 중인 설문</b><br> '+surveyName +'<br></p>';

	$('.survey_info').empty();
	$('.survey_info').append(html);

   }

</script>



<div class="container_flex">
   <div class="survey_info">
   <br>
      <b>설문 참여가능 기간</b><br>
      <p>~</p>
      <b>참여 중인 설문</b> <br>  <br>
   </div>
</div>



<!-- 문항 시작 -->
<div class="container" style="padding: 40px 40px 40px 40px; margin:0;">
	<div style="display:flex;">
   <select name="surveySeq" onclick="selectSurvey(this,${raterId})">
      <option value="0">설문 선택</option>
      <c:forEach items="${surveySeqAndName}" var="surveySeqAndName">
         <option  value="${surveySeqAndName.SURVEY_SEQ}" >${surveySeqAndName.SURVEY_NAME}</option>
      </c:forEach>
   </select>
				<div style="margin-left: 1090px;">
					<a href="/logout">로그아웃</a>
				</div>
			</div>
   <div class="row" style="width: 1360px;">

      <div class="appraiseeList col-4">
         <div class="input_title">피평가자 목록</div>

         <div id="scroll_area">


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





<!--    <div class="col-1">하이</div> -->





         

      <div class="question-box col-7">

      <div class="submit_btn"></div>
         <div id="scroll_area" style="max-height: 670px; ">
            <div class="survey_list">

               <form:form id="surveyForm" modelAttribute="surveyResult">
               <!-- 문제 들어가는 곳 -->
               </form:form>
            </div>
         </div>
      </div>
      <img src="${pageContext.request.contextPath}/resources/images/evaluate.png" 
      style="width: 600px; margin-top: 300px; margin-left: -28px; position: fixed; opacity: 0.1;">
   </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>