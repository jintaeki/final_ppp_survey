<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>

<style>
.insert2_table  tr{
/* border: 1px solid black;  */
}
.insert2_table  td{
 border: 1px solid black;
}
.insert2_table  th{
 border: 1px solid black;
}

.insert2_table  input{
 border: none;

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

									<th class="col-2"><span class="insert_category"><b>설문지 제목</b><label
											for="survey_name"></label></span></th>
									<th class="col-3"><span class="insert_category"> <b>평가 기간</b>
									</span></th>
									<th class="col-2"><span class="insert_category"> <b>익명/기명</b></span></th>
									<th class="col-4"><span class="insert_category"><b>상세 설명</b></span></th>
									<th class="col-1"></th>
								</tr>

								<tr>
									<td class="col-2"><input type="text" id="survey_name" name="surveyName"
										style="width: 200px;" value="${SLD.surveyName}"></td>

									<td class="col-3"><input type="date" name="surveyStartDate"
										class="survey_date"
										value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">-
										<input type="date" name="surveyClosedDate" class="survey_date"
										value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />"></td>

									<td class="col-2"><c:if test="${SLD.anonymityCheckCode eq '20001'}">
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
										
										
											<td class="col-4"><textarea class="visually-hidden" id="message-text"
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




				<div class="questionAndItem" style="display: flex; justify-content: space-between;">
					<div class="question_management">
								<div class="input_title" style="display:contents">문제 목록 
								<button type="button" onclick="question_copy(this,${SLD.surveySeq} )"
													style="background: white; border: 1px solid #fff; border-radius: 35em;">
													<i class="fas fa-plus"></i>
												</button>
								</div> 
								
								<div id="scroll_area" style="overflow: auto; height: 450px;">

									<c:if test="${empty SQL}">
										<br>
										<b>${NoQuestion}</b>
									</c:if>
									<!-- 여기까지 문제 div -->
									<div id="queAfter">
									
									<c:forEach items="${SQL}" var="qlist">
									<div class="deleteThis" style="display:flex;">
									<button class="delete_btn"
												onclick="deleteQus(this,${qlist.surveySeq})"
												style="background: white;" value="${qlist.questionSeq }">
												<i class="fa-regular fa-trash-can"></i>
											</button>
										<form id="${qlist.questionSeq }" onsubmit="return false;">
									
											<div class="input_qus" id="checkTouch">
												<input type="hidden" name= "surveySeq" value="${qlist.surveySeq }" id="surveySequence">
												<input type="hidden" name= "questionSeq" value="${qlist.questionSeq }">
												<input  name="questionContent" type="text" id="input_qus" onclick="manageQus(this,${qlist.questionSeq},${qlist.questionTypeCode })" value="${qlist.questionContent }">
												
											</div>
											<c:if test="${qlist.questionTypeCode eq '10001' }">
													<input type="radio" id="obj_radio" name="${qlist.questionSeq}" value="10001" onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})" checked> 객관식
													<input type="radio" id="subj_radio" name="${qlist.questionSeq}" value="10002" onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													<input type="radio" id="mix_radio" name="${qlist.questionSeq}" value="10003" onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식												
												</c:if>
												<c:if test="${qlist.questionTypeCode eq '10002' }">
													<input type="radio" id="obj_radio" name="${qlist.questionSeq}" value="10001" onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 객관식
													<input type="radio" id="subj_radio" name="${qlist.questionSeq}" value="10002" onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"checked> 주관식
													<input type="radio" id="mix_radio" name="${qlist.questionSeq}" value="10003" onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식												
												</c:if>
												<c:if test="${qlist.questionTypeCode eq '10003' }">
													<input type="radio" id="obj_radio" name="${qlist.questionSeq}" value="10001" onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 객관식
													<input type="radio" id="subj_radio" name="${qlist.questionSeq}" value="10002" onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													<input type="radio" id="mix_radio" name="${qlist.questionSeq}" value="10003" onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"checked> 혼합식												
											</c:if>
											<c:if test="${qlist.questionTypeCode ne '10001' and qlist.questionTypeCode ne '10002' and qlist.questionTypeCode ne '10003' }">
												<input type="radio" id="obj_radio" name="${qlist.questionSeq}" value="10001" onclick="checkit1(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})" checked> 객관식
													<input type="radio" id="subj_radio" name="${qlist.questionSeq}" value="10002" onclick="checkit2(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 주관식
													<input type="radio" id="mix_radio" name="${qlist.questionSeq}" value="10003" onclick="checkit3(this,${qlist.questionTypeCode},${qlist.questionSeq},${qlist.questionSeq})"> 혼합식												
											</c:if>
											
										
										
										</form>
									
											<!-- 조회 버튼 -->
											<button value="${qlist.questionSeq }"
												onclick="touchQuestion(this)"
												style="display:none;">
												<i class="fas fa-search"></i>
											</button>
											
											
											<div class="blank_under"></div>
									</div>
									</c:forEach>
								</div>
								</div>
							</div>
						


						<div class="item_management">
							<div class="input_title">문항 관리</div>
							<p class="beforeTouch">문제를 클릭하여 문항을 관리해 보세요.</p>
							<!-- 객관식 -->
							<span class="icon_div" id="item_div"> <c:forEach
									items="${SQL}" var="qlist">
									<div id="obj_box_toggle" style="display: none;">
										<div class="col-12">
											<div class="Item_box">
												<button type="button" onclick="item_obj_copy(this, 10001)"
													style="background: white; border: 1px solid #fff; border-radius: 35em;">
													<i class="fas fa-plus"></i>
												</button>
												<b style="margin-left: 160px;">점수</b>

												<form:form modelAttribute="SQD" id="item_obj_form">
													<input type="hidden" name="questionTypeCode" value="10001">
													<input type="hidden" name="surveySeq"
														value="${SLD.surveySeq}">
													<div id="obj_ItemAfter"></div>
													



													<input type="button" class="create_btn"
														onclick="update_obj_item_btn()" style="float: right;"
														value="저장">
												</form:form>
											</div>
										</div>
									</div>


									<!-- 혼합식 -->
									<div id="mix_box_toggle" style="display: none;">
										<div class="col-12">
											<div class="Item_box">
												<button type="button" onclick="item_mix_copy(this,10003)"
													style="background: white; border: 1px solid #fff; border-radius: 35em;">
													<i class="fas fa-plus"></i>
												</button>
												<b style="margin-left: 160px;">점수</b>
												<form:form modelAttribute="SQD" id="item_mix_form">
													<input type="hidden" name="questionTypeCode" value="10003">
													<input type="hidden" name="surveySeq"
														value="${SLD.surveySeq}" id="surveyseq">

													<div id="mix_ItemAfter">
														<div id="icon_line"></div>
													</div>

													<input type="button" class="create_btn"
														onclick="update_mix_item_btn()" value="저장">

												</form:form>
											</div>
										</div>
									</div>

									<!-- 주관식은 문제 만들 때 id값 가장 큰 거 부여 -->
									<div id="subj_box_toggle" style="display: none">
										<div class="block_box">
											<div class="subj_ItemAfter">
												<input type="text" placeholder="주관식 문제입니다." readonly>
											</div>
											<div class="blank_under"></div>
										</div>
									</div>

								</c:forEach>
							</span>
						</div>

					</div>
<!-- 					</div> -->
					<!--  문제관리 끝 -->


				</div>
			</div>
		</div>
	</div>
</div>
<script>


// 문제 버튼없이 저장 및 수정
// var cnt = 0;
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
				         beforeSend : function() {
				            // 전송 전 실행 코드
				         },
				         success : function(data) {

							location.reload();
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
				         beforeSend : function() {
				            // 전송 전 실행 코드
				         },
				         success : function(data) {


				         },
				         error : function(e) {
				            // 전송 후 에러 발생 시 실행 코드
				            console.log("ERROR : ", e);
				         }
					})
			}
			 
			 
			
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
         url : 'insertItem.do', // form을 전송할 실제 파일경로
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
         url : 'insertItem.do', // form을 전송할 실제 파일경로
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
	
   
   
	// 문제 추가
	var newQuestionCnt = 0;
   function question_copy(obj,surveySeq){
		
	   var testDiv ='';
	   	testDiv +='<div class="deleteThis">';
	 	testDiv +='<form id="0" name="0" onsubmit="return false;">';
	   	testDiv +='<div class="input_qus" id="checkTouch">';
	   	testDiv +='<input type="hidden" name= "surveySeq" value="'+surveySeq+'" id="surveySequence">';
		testDiv +='<input type="hidden" name= "questionSeq" value="0">';
		testDiv +='<input type="text" name="questionContent"  id="input_qus"  onclick="manageQus(this,0,10001)" value="hi">';	
		testDiv +='</div>';
		testDiv +='<input type="radio" id="obj_radio" name="0'+newQuestionCnt+'" value="10001" onclick="checkit1(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+'" checked> 객관식';
		testDiv +='<input type="radio" id="subj_radio" name="0'+newQuestionCnt+'" value="10002" onclick="checkit2(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+')"> 주관식';
		testDiv +='<input type="radio" id="mix_radio" name="0'+newQuestionCnt+'" value="10003" onclick="checkit3(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+')"> 혼합식';									
      	testDiv +='</form>';
      	testDiv +='<button value="'+0+'" onclick="touchQuestion(this)"style="display:none;">';
      	testDiv +='	<i class="fas fa-search"></i>';
      	testDiv +='</button>';
		
      	testDiv +='<button class="delete_btn" onclick="deleteQus(this,'+surveySeq+')" style="background: white;" value="'+0+'"><i class="fa-regular fa-trash-can"></i></button>';
      	testDiv +='<div class="blank_under"></div>';
      	testDiv +='</div>'
      	
        $('#queAfter').prepend(testDiv);
			console.log( $('#queAfter').children().first().before());
        
        console.log($('#queAfter').children().children().first());
        console.log(  $('#queAfter').children().children().children().first(":input[type=text]"));
        console.log( $('#queAfter').children().children().first());
//         $('#queAfter').children().children().first().children(['name=questionContent']).on('focus');
        

        $('#queAfter').children().children().children().first().children(['name=questionContent']).focus();

        $('#0').children().children().next().next().click();
        newQuestionCnt = newQuestionCnt + 1;
	}
   

   
   //문항 추가
  function item_obj_copy(obj,type){
       if(cntObj ==5){
          alert("객관식 문항은 최대 5개까지 생성 가능합니다.")
       }else{
          var testDiv ='';
           testDiv +='<div class="icon_line">';
           testDiv += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
            testDiv +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
            testDiv +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+type+')" value="0">'
            testDiv += '<i class="fas fa-xmark"></i>'
            testDiv += '</button>'
            testDiv += '</div>';
            $('#obj_ItemAfter').append(testDiv);
           cntObj = cntObj + 1;
       }
   };
   function item_mix_copy(obj,type) {
         if(cntMix ==5){
            alert("혼합식 문항은 최대 5개까지 생성 가능합니다.")
         }else{

          var testDiv ='';
          testDiv +='<div class="icon_line">';
         testDiv += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
           testDiv +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
           testDiv +='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+type+')" value="0">'
         testDiv += '<i class="fas fa-xmark"></i>'
         testDiv += '</button>'
         testDiv += '</div>';

           $('#guitar').before(testDiv);
           cntMix = cntMix + 1;
         }
   };

//     function insertQus(){
//           var qdiv = $('#questioN_insert_form')[0];
//           var data = new FormData(qdiv);
//           $.ajax({
//             method:'POST', //어떤 방식으로 보낼 지
//             url:'insertquestion.do', // qdiv를 보낼 경로 설정
//             data: data,   //
//             processData : false,
//              contentType : false,
//              cache : false,
//             beforeSend : function() { //보내기 전 실행
//             console.log("요청이 보내지는가?");
//             console.log("qdiv:"+qdiv[0]);
//             console.log("data:"+data);
//             },
//             success:function (data) {    //전송 성공시 실행
//                console.log(data);
//                console.log($('#surveyseq').val());
//                var surveyseq = $('#surveyseq').val();
//                location.reload();


//             }, error:function(e) {   //실패, 에러
//                console.log("Error", e);
//             }
//             });
//          }

        let cntObj=0;
          let cntMix=0;

    function itemHtml(data){
          //문제 개수 설정
		

         let size = data.length;
         var htmlObj = '';
         var htmlMix = '';
         var htmlSubj='';
         $("#mix_box_toggle").hide();
         $("#obj_box_toggle").hide();
         $("#subj_box_toggle").hide();

         $("#obj_ItemAfter").empty();
         $("#mix_ItemAfter").empty();
         $("#subj_ItemAfter").empty();

        console.log("답은:"+data[0].QUESTION_TYPE_CODE)
       // 10001 객 10002 주 10003 혼

              console.log(size);
          var cnt=0 ;
        for(i=0; i<size; i++){
            console.log(data[0].QUESTION_SEQ);
           if(data[i].QUESTION_TYPE_CODE == "10001"){



              if(data[i].ITEM_SEQ == null){
              $("#obj_ItemAfter").empty();
              htmlObj +='<div class="icon_line">';
              htmlObj +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
              htmlObj += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
              htmlObj +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
              htmlObj+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+data[i].QUESTION_TYPE_CODE+')" value="'+data[i].QUESTION_SEQ+'">';
              htmlObj+= '<i class="fas fa-xmark"></i>';
              htmlObj+=   '</button>';
              htmlObj+= '</div>';
              cntObj = cntObj + 1;

               $('#obj_ItemAfter').append(htmlObj);
               $("#obj_box_toggle").show();
              }else{
                  $("#obj_ItemAfter").empty();
                  htmlObj +='<div class="icon_line">';
                  htmlObj +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                  htmlObj += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic" value="'+data[i].ITEM_CONTENT+'">';
                  htmlObj +='<input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'">';
                  htmlObj+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,'+data[i].QUESTION_TYPE_CODE+')" value="'+data[i].ITEM_SEQ+'">';
                  htmlObj+= '<i class="fas fa-xmark"></i>';
                  htmlObj+=   '</button>';
                  htmlObj += '</div>';

                   $('#obj_ItemAfter').append(htmlObj);
                   $("#obj_box_toggle").show();
                   cntObj = cntObj + 1;
              }

              cnt=cnt+1
               if(cnt == size){

                  cntMix = cntMix + 2;
                  $("#mix_ItemAfter").empty();
                  $("#subj_ItemAfter").empty();
                  htmlMix +='<div class="icon_line">';
                    htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                   htmlMix += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
                    htmlMix +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
                    htmlMix+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+10003+')" value="'+data[i].ITEM_SEQ+'">';
                     htmlMix+= '<i class="fas fa-xmark"></i>';
                   htmlMix+=   '</button>';
                   htmlMix += '</div>';
                   htmlMix +='<div class="icon_line" id="guitar">';
                   htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                     htmlMix += '<input type="text" name="itemContent" placeholder="기타" value="기타" id="guitar" readonly>';
                     htmlMix +='<input type="hidden" name="itemScore"  value="0">';
                   htmlMix += '</div>';
                   htmlSubj += '<input type="text"    placeholder="주관식 문제입니다." readonly>'
                   $('#subj_ItemAfter').append(htmlSubj);
                   $('#mix_ItemAfter').append(htmlMix);


               }


           } else if(data[i].QUESTION_TYPE_CODE == "10003"){



                  if(data[i].ITEM_SEQ == null){
                   $("#mix_ItemAfter").empty();

                  htmlMix +='<div class="icon_line">';
                  htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                    htmlMix += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
                  htmlMix +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
                  htmlMix+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+data[i].QUESTION_TYPE_CODE+')" value="'+data[i].ITEM_SEQ+'">';
                  htmlMix+= '<i class="fas fa-xmark"></i>';
                  htmlMix+=   '</button>';
                  htmlMix += '</div>';
                  htmlMix +='<div class="icon_line" id="guitar">';
                  htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                   htmlMix += '<input type="text" name="itemContent" placeholder="기타" value="기타" id="guitar" readonly>';
                   htmlMix +='<input type="hidden" name="itemScore"  value="0">';
                   htmlMix += '</div>';
                  cntMix = cntMix + 2;


                    $('#mix_ItemAfter').append(htmlMix);
                    $("#mix_box_toggle").show();
                    console.log('10003인 문제를 불러왔는데 저장된 문제가 없을 때:'+ cntMix);
                   }else{
                       $("#mix_ItemAfter").empty();


                      if(data[i].ITEM_CONTENT =="기타"){
                         htmlMix +='<div class="icon_line" id="guitar">';
                         htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                          htmlMix += '<input type="text" name="itemContent" id="guitar" value="'+data[i].ITEM_CONTENT+'" readonly>';
                           htmlMix +='<input type="hidden" name="itemScore"  value="0">';
                          htmlMix += '</div>';
                         cntMix = cntMix + 1;
                      }else{
                        htmlMix +='<div class="icon_line">';
                        htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                        htmlMix += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic" value="'+data[i].ITEM_CONTENT+'">';
                           htmlMix +='<input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'">';
                           htmlMix+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem(this,'+data[i].QUESTION_TYPE_CODE+')" value="'+data[i].ITEM_SEQ+'">';
                           htmlMix+= '<i class="fas fa-xmark"></i>';
                           htmlMix+=   '</button>';
                           htmlMix += '</div>';
                           cntMix = cntMix + 1;
                      }



                        $('#mix_ItemAfter').append(htmlMix);
                        $("#mix_box_toggle").show();
                   }

                // 미리 만든 문항의 개수를 체크(cnt는 문항의 개수)
                // cnt가 size와 동일해지면 출력되는 문항의 타입과 다른 타입의 문항들이 하나만 출려되고 숨겨진다
                // radio 버튼을 누를 때 하나씩 출력되는 것을 볼 수 있다
                  cnt=cnt+1
                  if(cnt == size){
                     $("#subj_ItemAfter").empty();
                   $("#obj_ItemAfter").empty();
                    htmlObj +='<div class="icon_line">';
                    htmlObj +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                    htmlObj += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
                    htmlObj +='<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
                    htmlObj+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+10001+')" value="'+data[i].ITEM_SEQ+'">';
                    htmlObj+= '<i class="fas fa-xmark"></i>';
                    htmlObj+=   '</button>';
                    htmlObj += '</div>';
                    htmlSubj += '<input type="text"    placeholder="주관식 문제입니다." readonly>'
                   $('#subj_ItemAfter').append(htmlSubj);
                   $('#obj_ItemAfter').append(htmlObj);
                   cntObj = cntObj + 1;

                  }
           }else if (data[i].QUESTION_TYPE_CODE == "10002"){
             $("#subj_ItemAfter").empty();
             htmlSubj += '<input type="text"    placeholder="주관식 문제입니다." value="'+data[0].QUESTION_SEQ+'" readonly>'
               $('#subj_ItemAfter').append(htmlSubj);
               $("#subj_box_toggle").show();

             cnt=cnt+1
               if(cnt == size){
               $("#mix_ItemAfter").empty();
                $("#obj_ItemAfter").empty();
                 htmlObj +='<div class="icon_line">';
                 htmlObj +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                 htmlObj += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
                 htmlObj +='<input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is">';
                 htmlObj+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+10001+')" value="'+data[i].ITEM_SEQ+'">';
                 htmlObj+= '<i class="fas fa-xmark"></i>';
                 htmlObj+=   '</button>';
                 htmlObj += '</div>';
                 htmlMix +='<div class="icon_line">';
                htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                  htmlMix += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
                htmlMix +='<input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is">';
                htmlMix+='<button type="button" style="background:white;" class="delete_btn" onclick="deleteItem_zero(this,'+10003+')" value="'+data[i].ITEM_SEQ+'">';
                htmlMix+= '<i class="fas fa-xmark"></i>';
                htmlMix+=   '</button>';
                htmlMix += '</div>';
                htmlMix +='<div class="icon_line" id="guitar">';
                htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                 htmlMix += '<input type="text" name="itemContent" placeholder="기타" value="기타"  readonly>';
                 htmlMix +='<input type="hidden" name="itemScore"  value="0">';
                 htmlMix += '</div>';
                 $('#mix_ItemAfter').append(htmlMix);
                $('#obj_ItemAfter').append(htmlObj);
                cntObj = cntObj + 1;
                cntMix = cntMix + 2;


               }
          }

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
               var surveyseq = surveySeq;
               location.reload();

            }
       });
	}
   }
   }
    let deleteItemZeroConfirm = 0;
    function deleteItem_zero(obj,type){
       if(deleteItemZeroConfirm ==0){

          if(confirm("삭제하시겠습니까?")){

              if(type=='10001'){
                 cntObj = cntObj - 1;
              }else if (type=='10003'){
                 cntMix = cntMix - 1;
              }
              const tag = $(obj,type);
              tag.parent().remove();
              alert("저장되지 않은 문항은 알림없이 영구 삭제됩니다");
             deleteItemZeroConfirm = 1;
              }

       }else{
           if(type=='10001'){
              cntObj = cntObj - 1;
           }else if (type=='10003'){
              cntMix = cntMix - 1;
           }
           const tag = $(obj,type);
           tag.parent().remove();
       }

    }
    let deleteItemConfirm = 0;
    function deleteItem(obj,type){
       if(deleteItemConfirm==0){
       if(confirm("임시 삭제하시겠습니까?")){


          if(type=='10001'){
             cntObj = cntObj - 1;
          }else if (type=='10003'){
             cntMix = cntMix - 1;
          }

          var itemSeq = $(obj).val();
          const tag = $(obj,type);
          console.log(tag);
          console.log(tag.parent());
           tag.parent().remove();


       }
       if(confirm("삭제 알림 끄기")){
          deleteItemConfirm=1;
          exit;
       }
       }else{
          if(type=='10001'){
              cntObj = cntObj - 1;
           }else if (type=='10003'){
              cntMix = cntMix - 1;
           }

           var itemSeq = $(obj).val();
           const tag = $(obj,type);
           console.log(tag);
           console.log(tag.parent());
           tag.parent().remove();
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
//                 oneQuestion(data);

                itemHtml(data);


            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
      });
   }
   //문제 확인 시 객주흔중에서 문제에 해당하는 유형이 나오게
//    function oneQuestion(data){
//         let html = '';
//         $("#questioN_insert_form").empty();
//          html +=` <div id="insertQform">
//                <div class="select_radio" id="select_radio">`;
//       if(data[0].QUESTION_TYPE_CODE =="10001"){
//          html += '<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')" checked value="10001">&nbsp;객관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
//          html += '<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')" value="10002"> &nbsp;주관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
//          html += '<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')" value="10003"> &nbsp;혼합식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
//       } else if (data[0].QUESTION_TYPE_CODE =="10002"){
//          html += '<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')"  value="10001" >&nbsp;객관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
//          html += '<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')" checked value="10002"> &nbsp;주관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
//          html += '<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')" value="10003"> &nbsp;혼합식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
//       } else if (data[0].QUESTION_TYPE_CODE =="10003"){
//          html += '<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')"  value="10001" >&nbsp;객관식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
//          html += '<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')" value="10002"> &nbsp;주관식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
//          html += '<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3(this,'+data[0].QUESTION_TYPE_CODE+','+data[0].QUESTION_SEQ+')" checked value="10003"> &nbsp;혼합식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
//       }
//       html += `</div>`;
//       html += '<div class="question_content_area" id="question_add"> <div class="input-group" id="question_content">';

//       html += '<textarea class="form-control" aria-label="문제 입력칸" id="hi" name="questionContent">'
//       html += data[0].QUESTION_CONTENT;
//       html += '</textarea></div>';
//       html += `<div class="question_add_btn_div">`;
//       html += '<button type="button" class="create_btn" id="add_btn" onclick="insertQus()">문제 추가</button>';
//       html += '&nbsp;&nbsp;<button type="button" class="create_btn"  id="update_btn" onclick="qusUpdate('+data[0].SURVEY_SEQ+','+data[0].QUESTION_TYPE_CODE+')">문제 수정</button>';
//       html += '<input type="hidden" name="surveySeq" id="seq" value="'+data[0].SURVEY_SEQ+'">';
//       html += '<input type="hidden" name="questionSeq" value="'+data[0].QUESTION_SEQ +'">';
//       html += `</div>`;
//       html += `<input type="hidden" name="itemScore" value="0">`;
//       html += `<input type="hidden" name="itemContent" value=" ">`;
//       html += `<input type="reset" value="" id="reset_btn"  style="display:none">
// `
//       html += `</div>`;
//       html += `</div>`;
//       html += `</div>`;
//       $('#questioN_insert_form').append(html);
//    }


      function changeTypeAndQusUpdate(questionSeq,typeCode){
        
          console.log("업데이트 시작");
   
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


                 },

                 error: function(e) {
                    console.log("Error", e);
                    }
                 });
         
          var data = new FormData();
			data.append("questionTypeCode",typeCode);
			data.append("questionSeq",questionSeq);
         $.ajax({
            method: 'POST',
            url: 'updatequestion.do/',
            data: data,
            processData : false,
            contentType : false,
             cache : false,
            beforeSend: function() {
               console.log("요청 보냈음");
               alert("업데이트 beforesend");
            },
            success: function(jsondata) {

               var surveyseq = surveySeq;
               location.reload();


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