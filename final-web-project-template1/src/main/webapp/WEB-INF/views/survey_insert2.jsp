<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/insert_survey.css" />
   


<div class="container" style="padding: 20px 50px 50px 50px;">
<input type="button" value="BACK" onClick="history.go(-1)" style="float:left";>
<button style="float:right;"class="btn btn-link" onclick="location.href='<c:url value='surveyinsertcomplete.do/${SLD.surveySeq}'/>'">등록완료</button>
	<!-- 설문지 설정 진택 -->
	<!-- 상단 information -->
	<div class="container_flex">
		<form:form modelAttribute="SLD" id="survey_setting_form">
			<span class="insert_category"><b>제목</b> <label
				for="survey_name"></label> <input type="text" id="survey_name"
				name="surveyName" style="width: 200px;" value="${SLD.surveyName}">
			</span>

			<span class="insert_category"> <input type="date"
				name="surveyStartDate" class="survey_date"
				value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">-
				<input type="date" name="surveyClosedDate" class="survey_date"
				value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />">
			</span>

			<span class="insert_category"> <c:if
					test="${SLD.anonymityCheckCode eq '20001'}">
					<input type="radio" name="anonymityCheckCode"
						id="survey_type_check" value="20001" checked>익명
					<input type="radio" name="anonymityCheckCode"
						id="survey_type_check" value="20002">기명
         		    </c:if> <c:if test="${SLD.anonymityCheckCode eq '20002'}">
					<input type="radio" name="anonymityCheckCode"
						id="survey_type_check" value="20001">
					<label for="survey_type_check">익명</label>

					<input type="radio" name="anonymityCheckCode" style=""
						id="survey_type_check" value="20002" checked>
					<label for="survey_type_check">기명</label>
				</c:if>
			</span>
			
			<span class="insert_category"><b>상세 설명</b></span>
			<textarea style="display:none;" class="visually-hidden"id="message-text" name="surveyContent">${SLD.surveyContent }</textarea>

				<input type="hidden" name="stateCode" value="30001"> <input
				type="hidden" name="surveySeq" id="surveyseq"
				value="${SLD.surveySeq}">
				
		</form:form>
		<input type="button" class="update_btn" style="margin-bottom:10px;" onclick="register()"
			value="적용">
		
	</div>
	
	

	<!-- 상단 information 끝 -->

	<div class="container_survey">
		<div class="row">

			<!-- 문제 관리 -->
			<div class="input_title col-6">문제
				관리</div>

			<div class="input_title col-6">문항 관리</div>
		</div>
		
			<div class="item_management">

				<span class="question_inputdv" id="input_question">
					<form:form modelAttribute="SQD" id="questioN_insert_form">
						<!-- aa -->
						<div id="insertQform">

							<div class="select_radio" id="select_radio">
								<input type="radio" name="questionTypeCode" id="obj_radio"
									onclick="checkit1()" value="10001" checked>&nbsp;객관식
								&nbsp;&nbsp;&nbsp; <input type="radio" name="questionTypeCode"
									id="subj_radio" onclick="checkit2()" value="10002">
								&nbsp;주관식 &nbsp;&nbsp;&nbsp; <input type="radio"
									name="questionTypeCode" id="mix_radio" onclick="checkit3()"
									value="10003"> &nbsp;혼합식 &nbsp;&nbsp;&nbsp;
							</div>
							<div class="question_content_area" id="question_add">
								<div class="input-group" id="question_content">
									<textarea class="form-control" aria-label="문제 입력칸"
										name="questionContent">${SQD.questionContent}</textarea>
								</div>




								<!-- 문제 추가 버튼  -->
								<!-- onclick="insertQus()" -->
								<div class="question_add_btn_div">

									<button type="button" class="create_btn" id="add_qus_btn"
										onclick="insertQus()">문제 추가</button>
									<button type="button" class="create_btn" id="update_btn"
										onclick="qusUpdate(${SLD.surveySeq})">문제 수정</button>

									<input type="hidden" name="surveySeq" id="seq"
										value="${SLD.surveySeq }"> <input type="hidden"
										name="questionSeq" value="2">
									<!-- 비동기로 바꿔 넣어보자 -> 문항도 마찬가지 -->
								</div>

								<input type="hidden" name="itemScore" value="1"> <input
									type="hidden" name="itemContent" value=" ">
									<input type="reset" value="" id="reset_btn"  style="display:none">
							</div>
						</div>
					</form:form>
				</span>

<!-- 			</div> -->

			<!-- 객관식 -->
			<span class="icon_div" id="item_div" style="float:right; margin-right:200px;">
				<c:forEach items="${SQL}" var="qlist">
					<div id="obj_box_toggle" style="display: none;">
						<div class="col-12">
							<div class="Item_box">
								<button type="button" id="item_obj_copy" style="border: 1px solid #fff; border-radius: 35em;"><i class="fas fa-plus"></i></button>
								<form:form modelAttribute="SQD" id="item_obj_form">
									<input type="hidden" name="questionTypeCode" value="10001">
									<input type="hidden" name="surveySeq" value="${SLD.surveySeq}">
									<div id="obj_ItemAfter"></div>

									<div class="col-12">

										<input type="button" class="create_btn"
											onclick="update_obj_item_btn()" value="수정">
									</div>
								</form:form>
							</div>
						</div>
					</div>




					<!-- 혼합식 -->
					<div id="mix_box_toggle" style="display: none;">
						<div class="col-12">
							<div class="Item_box">
								<button type="button" id="item_mix_copy" style="border: 1px solid #fff; border-radius: 35em;"><i class="fas fa-plus"></i></button>
								<form:form modelAttribute="SQD" id="item_mix_form">
									<input type="hidden" name="questionTypeCode" value="10003">
									<input type="hidden" name="surveySeq" value="${SLD.surveySeq}"
										id="surveyseq">
				
									<div id="mix_ItemAfter">
									<div id="icon_line">
									
									</div>
									</div>
									<div class="col-12">

										<input type="button" class="create_btn"
											onclick="update_mix_item_btn()" value="수정">
									</div>
								</form:form>
							</div>
						</div>
					</div>

					<%--       <c:if test="${ }"></c:if> --%>
					<!-- 주관식 -->

					<!-- 주관식은 문제 만들 때 id값 가장 큰 거 부여 -->
					<div id="subj_box_toggle" style="display: none">
						<div class="block_box">
							<input type="text" class="input_qus" id="input_qus"
								placeholder="주관식 문제입니다.">

							<div class="blank_under"></div>
						</div>
					</div>

				</c:forEach>
			</span>


		</div>

		<div class="question_management col-6" style="margin-top: 30px;">

			<div id="scroll_area"
				style="overflow: auto; width: 500px; height: 450px; relation: fixed">


				<!-- 여기까지 문제 div -->
				<div style= "height: 400x; relation: fixed">
					<c:forEach items="${SQL}" var="qlist">
						<div id="queAfter">

							<input type="hidden" value="${qlist.surveySeq }"
								id="surveySequence">
							<div class="input_qus">
								<input disabled type="text" id="input_qus"
									value="${qlist.questionContent }">
							</div>

							<!-- 조회 버튼 -->
							<button value="${qlist.questionSeq }"
								onclick="touchQuestion(this)"
								style="border: 1px solid #fff; border-radius: 35em;">
								<i class="fas fa-search"></i>
							</button>

							<button class="delete_btn"
								onclick="deleteQus(this,${qlist.surveySeq})"
								value="${qlist.questionSeq }">
								<i class="fa-regular fa-trash-can"></i>
							</button>
							<div class="blank_under"></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<!--  문제관리 끝 -->

		

	</div>
</div>

<script>
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


   //문항 비동기 등록
   function insert_obj_item_btn() {
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
            console.log("문항 등록 전송 전");
            console.log($('#questionSeq').val());
         },
         success : function(data) {
            // 전송 후 성공 시 실행 코드
            console.log("문항 등록 전송 성공");
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
   /*문제 삭제*/
   function delete_obj_item_btn(obj) {
      const tag = $(obj);
      tag.parent().remove();
   }
   function delete_mix_item_btn(obj) {
      const tag = $(obj);
      tag.parent().remove();
   }
   //문제 추가 후 문항 추가
   $("#item_obj_copy").click(function() {
    
         var testDiv ='';
         testDiv +='<div class="icon_line">';
         testDiv += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
   		 testDiv +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
   		 testDiv +='<button class="delete_btn" onclick="deleteItem_zero(this)" value="0">'
   		 testDiv += '<i class="fas fa-xmark"></i>' 
   		 testDiv += '</button>'
   		 testDiv += '</div>';
         
         $('#obj_ItemAfter').append(testDiv);
       
    
   });
   $("#item_mix_copy").click(function() {
  	   var testDiv ='';
	   testDiv +='<div class="icon_line">';
       testDiv += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
 	   testDiv +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
 	   testDiv +='<button class="delete_btn" onclick="deleteItem_zero(this)" value="0">'
       testDiv += '<i class="fas fa-xmark"></i>' 
       testDiv += '</button>'
       testDiv += '</div>';
       
         $('#guitar').before(testDiv);
     
   });
   
   function resetIt(){
	   var evt = document.createEvent("MouseEvents");
		evt.initMouseEvent("click", true, true, window,0, 0, 0, 0, 0, false, false, false, false, 0, null);
		var reset = document.getElementById("reset_btn");
		reset.dispatchEvent(evt);
   }
   
   //문항추가 끝
//    var test = document.getElementById('add_btn');
//       test.addEventListener('click', insertQus);
    function insertQus(){
          var qdiv = $('#questioN_insert_form')[0];
          var data = new FormData(qdiv);
          $.ajax({
            method:'POST', //어떤 방식으로 보낼 지
            url:'insertquestion.do', // qdiv를 보낼 경로 설정
            data: data,   //
            processData : false,
             contentType : false,
             cache : false,
            beforeSend : function() { //보내기 전 실행
            console.log("요청이 보내지는가?");
            console.log("qdiv:"+qdiv[0]);
            console.log("data:"+data);
            },
            success:function (data) {    //전송 성공시 실행
               console.log(data);
               console.log($('#surveyseq').val());
               var surveyseq = $('#surveyseq').val();
            $.ajax({
                  method:'GET', //어떤 방식으로 보낼 지
                  url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정
                  dataType: "json",
                  beforeSend : function() { //보내기 전 실행
                  console.log("요청이 보내지는가?");
                  },
                  success:function (jsondata){    //전송 성공시 실행
                     console.log(jsondata);
                        questionHtml(jsondata);
                        var surveyseq = jsondata[0].SURVEY_SEQ;
                        var questionseq = jsondata[0].QUESTION_SEQ;
//                         resetIt();
                        location.reload();
                       
                  }, error:function(e) {   //실패, 에러
                     console.log("Error", e);
                  }
                  });
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
            });
         }
    function questionHtml(data){
        let size = data.length;
        console.log(size);
        var html = '';
        $("#scroll_area").empty();
        if(size < 1){
           html ='관리할 문제가 없어요~';
        }else{

            for(i=0; i<size; i++){
            	if(i<size-1){
            		if(data[i].QUESTION_SEQ==data[i+1].QUESTION_SEQ){
            			console.log(i+"번째: "+data[i].QUESTION_SEQ);
            			console.log(i+1+"번째: "+data[i+1].QUESTION_SEQ); 
            			continue;
            		}
            	}
                html+='<div  id="queAfter">'
                html+='<input type="hidden" value="'+data[i].SURVEY_SEQ+'" id="surveySequence">'
                html+='<input type="text" id="input_qus" value="'+data[i].QUESTION_CONTENT+'" disabled>';
                html+='<button value="'+data[i].QUESTION_SEQ+'"onclick="touchQuestion(this)" style="border: 1px solid #fff; border-radius: 35em;"><i class="fas fa-search"></i></button>';
                html+='<button class="delete_btn" onclick="deleteQus(this,'+data[i].SURVEY_SEQ+')" value="'+data[i].QUESTION_SEQ+'">';
                html+= '<i class="fas fa-xmark"></i>';
                html+=   '</button>';
                html+='<div class="blank_under"></div></div>';

			
                }
        	
        }
        $('#scroll_area').append(html);
   }
    function itemHtml(data){
         let size = data.length;
         var htmlObj = '';
         var htmlMix = '';
         $("#mix_box_toggle").hide();
         $("#obj_box_toggle").hide();
         $("#obj_ItemAfter").empty();
         $("#mix_ItemAfter").empty();
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
        	   htmlObj +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
        	   htmlObj+='<button class="delete_btn" onclick="deleteItem_zero(this)" value="'+data[i].QUESTION_SEQ+'">';
        	   htmlObj+= '<i class="fas fa-xmark"></i>';
        	   htmlObj+=   '</button>';
        	   htmlObj+= '</div>';

        	   
               $('#obj_ItemAfter').append(htmlObj);
               $("#obj_box_toggle").show();
        	   }else{
            	   $("#obj_ItemAfter").empty();

            	   htmlObj +='<div class="icon_line">';
            	   htmlObj +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
            	   htmlObj += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic" value="'+data[i].ITEM_CONTENT+'">';
            	   htmlObj +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'">';
            	   htmlObj+='<button class="delete_btn" onclick="deleteItem(this)" value="'+data[i].ITEM_SEQ+'">';
            	   htmlObj+= '<i class="fas fa-xmark"></i>';
            	   htmlObj+=   '</button>';
            	   htmlObj += '</div>';
                  
                   $('#obj_ItemAfter').append(htmlObj);
                   $("#obj_box_toggle").show();
        	   }
        	   
        	   cnt=cnt+1
               if(cnt == size){
            	   $("#mix_ItemAfter").empty();
            	   htmlMix +='<div class="icon_line">';
              	   htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                   htmlMix += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
              	   htmlMix +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
              	   htmlMix+='<button class="delete_btn" onclick="deleteItem_zero(this)" value="'+data[i].ITEM_SEQ+'">';
               	   htmlMix+= '<i class="fas fa-xmark"></i>';
                   htmlMix+=   '</button>';
                   htmlMix += '</div>';
                   htmlMix +='<div class="icon_line">';
               	   htmlMix += '<input type="text" name="itemContent" placeholder="기타" value="기타" id="guitar" readonly>';
               	   htmlMix +='<input type="hidden" name="itemScore"  value="0">';
             	   htmlMix += '</div>';
                   $('#mix_ItemAfter').append(htmlMix);
               }
        	   
               
        	} else if(data[i].QUESTION_TYPE_CODE == "10003"){
        		  
             
        		
                  if(data[i].ITEM_SEQ == null){
             	   $("#mix_ItemAfter").empty();
             	  
             	  htmlMix +='<div class="icon_line">';
             	  htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
               	  htmlMix += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
             	  htmlMix +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
             	  htmlMix+='<button class="delete_btn" onclick="deleteItem_zero(this)" value="'+data[i].ITEM_SEQ+'">';
             	  htmlMix+= '<i class="fas fa-xmark"></i>';
             	  htmlMix+=   '</button>';
             	  htmlMix += '</div>';
             	  htmlMix +='<div class="icon_line">';
              	  htmlMix += '<input type="text" name="itemContent" placeholder="기타" value="기타" id="guitar" readonly>';
              	  htmlMix +='<input type="hidden" name="itemScore"  value="0">';
              	  htmlMix += '</div>';
             	  
             	  
                    $('#mix_ItemAfter').append(htmlMix);
                    $("#mix_box_toggle").show();
             	   }else{
                 	   $("#mix_ItemAfter").empty();

                 	  
                 	  if(data[i].ITEM_CONTENT =="기타"){
                 		  htmlMix +='<div class="icon_line">';
                     	  htmlMix += '<input type="text" name="itemContent" id="guitar" value="'+data[i].ITEM_CONTENT+'" readonly>';
                      	  htmlMix +='<input type="hidden" name="itemScore"  value="0">';
                     	  htmlMix += '</div>';
                 	  }else{
                 		 htmlMix +='<div class="icon_line">';
                    	 htmlMix +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
                    	 htmlMix += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic" value="'+data[i].ITEM_CONTENT+'">';
                   	     htmlMix +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'">';
                   	     htmlMix+='<button class="delete_btn" onclick="deleteItem(this)" value="'+data[i].ITEM_SEQ+'">';
                   	     htmlMix+= '<i class="fas fa-xmark"></i>';
                   	     htmlMix+=   '</button>';
                   	     htmlMix += '</div>';
                 	  }
                 	  
                 	  
                        
                        $('#mix_ItemAfter').append(htmlMix);
                        $("#mix_box_toggle").show();
             	   }
  
                  cnt=cnt+1
                  if(cnt == size){
                  $("#obj_ItemAfter").empty();
          		    htmlObj +='<div class="icon_line">';
         	        htmlObj +='<input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
         	        htmlObj += '<input type="text" name="itemContent" placeholder="문항 입력..." id="ic">';
         	        htmlObj +='점수<input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is">';
         	        htmlObj+='<button class="delete_btn" onclick="deleteItem_zero(this)" value="'+data[i].ITEM_SEQ+'">';
         	        htmlObj+= '<i class="fas fa-xmark"></i>';
         	        htmlObj+=   '</button>';
         	        htmlObj += '</div>';
                  $('#obj_ItemAfter').append(htmlObj);
                  }
           }
        	   
           }

           }
          

    //var dltest = document.getElementById('delete_btn');
   //dltest.addEventListener('click', deleteQus);
    function deleteQus(obj,surveySeq) {
//        var qdiv = $('#sv_qst_form')[0];
//       var data = new FormData(qdiv);
      var questionSeq = $(obj).val()
      console.log(questionSeq)
      console.log("과연?:"+surveySeq);
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
                $.ajax({
                     method:'GET', //어떤 방식으로 보낼 지
                     url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정
                      dataType: "json",
                     beforeSend : function() { //보내기 전 실행
                     console.log("요청이 보내지는가?");
                     },
                     success:function (jsondata){    //전송 성공시 실행
                           questionHtml(jsondata);
                           var surveyseq = jsondata[0].SURVEY_SEQ;
                           var questionseq = jsondata[0].QUESTION_SEQ;
                     }, error:function(e) {   //실패, 에러
                        console.log("Error", e);
                     }
                     });
            }
       });
   }
    
    function deleteItem_zero(obj){
    	const tag = $(obj);
    	tag.parent().remove();
    }
    
    function deleteItem(obj){
    	const tag = $(obj);
    	tag.parent().remove();
    	var itemSeq = $(obj).val();
    	
    	$.ajax({
            method:'POST', //어떤 방식으로 보낼 지
            url:'deleteItem.do/'+ itemSeq, // qdiv를 보낼 경로 설정
            beforeSend : function() { //보내기 전 실행
            console.log("요청이 보내지는가?");
            },
            success:function (){    //전송 성공시 실행
				alert("삭제 성공");
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            	alert("삭제 실패");
            }
            });
    	
    }
    
    function touchQuestion(obj){
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
            console.log("으잉?"+data);
               oneQuestion(data);
               secondQuestion(data);
               console.log("답은:"+data[0].QUESTION_TYPE_CODE);
               itemHtml(data);
              
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
      });
   }
   //문제 확인 시 객주흔중에서 문제에 해당하는 유형이 나오게
   function oneQuestion(data){
      console.log(data[0].SURVEY_SEQ);
//       let size = data.length;
        let html = '';
        $("#questioN_insert_form").empty();
         html +=` <div id="insertQform">
         		<div class="select_radio" id="select_radio">`;
      if(data[0].QUESTION_TYPE_CODE =="10001"){
         html += '<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()" checked value="10001">&nbsp;객관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
         html += '<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002"> &nbsp;주관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
         html += '<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> &nbsp;혼합식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
      } else if (data[0].QUESTION_TYPE_CODE =="10002"){
         html += '<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()"  value="10001" >&nbsp;객관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
         html += '<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" checked value="10002"> &nbsp;주관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
         html += '<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> &nbsp;혼합식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
      } else if (data[0].QUESTION_TYPE_CODE =="10003"){
         html += '<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()"  value="10001" >&nbsp;객관식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
         html += '<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002"> &nbsp;주관식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
         html += '<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" checked value="10003"> &nbsp;혼합식&nbsp;&nbsp;&nbsp&nbsp&nbsp;';
      }
      html += `</div>`;
      html += '<div class="question_content_area" id="question_add"> <div class="input-group" id="question_content">';

      html += '<textarea class="form-control" aria-label="문제 입력칸" id="hi" name="questionContent">'
      html += data[0].QUESTION_CONTENT;
      html += '</textarea></div>';
      
      $('#questioN_insert_form').append(html);
   }
   function secondQuestion(data){
      console.log("secondQuestion");
      console.log(data[0].SURVEY_SEQ);
        let html = '';
        let html1 = '';
      

      html += `<div class="question_add_btn_div">`;  
      html += '<button type="button" class="create_btn" id="add_btn" onclick="insertQus()">문제 추가</button>';
      html += '&nbsp;&nbsp;<button type="button" class="create_btn"  id="update_btn" onclick="qusUpdate('+data[0].SURVEY_SEQ+')">문제 수정</button>';
      html += '<input type="hidden" name="surveySeq" id="seq" value="'+data[0].SURVEY_SEQ+'">';
      html += '<input type="hidden" name="questionSeq" value="'+data[0].QUESTION_SEQ +'">';
      html += `</div>`;
      html += `<input type="hidden" name="itemScore" value="1">`;
      html += `<input type="hidden" name="itemContent" value=" ">`;
      html += `<input type="reset" value="" id="reset_btn"  style="display:none">
`
      html += `</div>`;
      html += `</div>`;
      html += `</div>`;
      
       $('#question_content').after(html);
   }
   //문제 입력 채우 코드에 추가한 것 끝
   // 진택 끝
   //채우
   /*문제 삭제*/
//    function delete_btn(obj) {
//       const tag = $(obj);
//       tag.parent().remove();
//    }
      function qusUpdate(surveySeq){
         var qdiv = $('#questioN_insert_form')[0]
         alert("업데이트 시작!");
          console.log("업데이트 시작");
         var data = new FormData(qdiv);
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
                $.ajax({
                     method:'GET', //어떤 방식으로 보낼 지
                     url:'selectquestion.do/'+ surveySeq, // qdiv를 보낼 경로 설정
                      dataType: "json",
                     beforeSend : function() { //보내기 전 실행
                     console.log("요청이 보내지는가?");
                     },
                     success:function (jsondata){    //전송 성공시 실행
                           questionHtml(jsondata);


                           oneQuestion(data);
                           secondQuestion(data);
                     }, error:function(e) {   //실패, 에러
                        console.log("Error", e);
                     }
                     });
            },
            error: function(e) {
               console.log("Error", e);
               }
            });
         }
      /*
     function insertItem(questionSeq) {
         var idiv = $('#item_div')[0]
         alert("문항 등록");
          console.log("문항 등록 시작");
         var data = new FormData(idiv);
         $.ajax({
            method: 'POST',
            url: 'iteminsert.do',
            data: data,
            processData : false,
            contentType : false,
             cache : false,
            beforeSend: function() {
               console.log("요청 보냈음");
               alert("업데이트 beforesend");
               console.log("item data" + data);
               console.log("idiv: " + idiv)
            },
            success: function(data) {
               console.log($('#questionseq').val());
               var surveyseq = $('#questionseq').val();
              }, error:function(e) {
                 console.log("Error", e)
              }

*/




    //문제 유형 선택 시  해당하는 유형의 문항form이 나오도록 하는 비동기
   window.onloade=function(){
     if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
               $("#obj_box_toggle").show();
      }
   };


   function checkit1() {
      if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
          $("#obj_box_toggle").show();
          $("#subj_box_toggle").hide();
         $("#mix_box_toggle").hide();


=======
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/insert.css">

<div class="container">


<!-- 상단 information -->
	<div class="container_flex">
		<form:form modelAttribute="SLD" id="survey_setting_form">
				<span class="insert_category" ><b>제목</b>
					<label for="survey_name"></label> 
					<input type="text" id="survey_name" name="surveyName" style="width: 200px;" value="${SLD.surveyName}">
				</span>
				
				<span class="insert_category">
					<input type="date" name="surveyStartDate" class="survey_date"
						value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">- 
					<input type="date" name="surveyClosedDate" class="survey_date"
						value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />">
				</span>
				
				<span class="insert_category">
					<c:if test="${SLD.anonymityCheckCode eq '20001'}" >
					<input type="radio" name="anonymityCheckCode" 
							id="survey_type_check" value="20001" checked>익명
					<input type="radio" name="anonymityCheckCode"
							id="survey_type_check" value="20002">기명
         		    </c:if>

					<c:if test="${SLD.anonymityCheckCode eq '20002'}">
						<input type="radio" name="anonymityCheckCode" 
							id="survey_type_check" value="20001">
						<label for="survey_type_check">익명</label>
						
						<input type="radio" name="anonymityCheckCode" style=""
							id="survey_type_check" value="20002" checked>
						<label for="survey_type_check">기명</label>
					</c:if>
				</span>	
				<br>
				<%-- <span class="insert_category"><b>상세 설명</b>
					<label for="message-text" ></label>
					<textarea class="visually-hidden" id="message-text"
						name="surveyContent">${SLD.surveyContent }</textarea>
				
					<input type="hidden" name="stateCode" value="30001"> 
						<input type="hidden" name="surveySeq" id="surveyseq" value="${SLD.surveySeq}">
				</span> --%>
		</form:form>
		<input type="button" class="update_btn" onclick="register()" value="적용">
	</div>
<!-- 상단 information 끝 -->











 <!-- ㅇㅅㅇ < 미야옹 ) -->

<div class="container_survey">
<div class="row">

			<div class="question_management col-6">
				<div class="input_title" style="margin-bottom: 60px;"> 문제 관리 </div>
				<div id="scroll_area">
					<!--save-->
					<c:forEach items="${SQL}" var="qlist">
						<div id="queAfter">

							<div class="input_qus">
								<input disabled type="text" id="input_qus"
									value="${qlist.questionContent }">
							</div>
							<!-- 조회 버튼 -->
							<button value="${qlist.questionSeq }"
								onclick="touchQuestion(this)"
								style="border: 1px solid #fff; border-radius: 35em;">
								<i class="fas fa-search"></i>
							</button>

							<!-- 삭제 버튼 -->
							<button class="delete_btn"
								onclick="deleteQus(this,${qlist.surveySeq})"
								value="${qlist.questionSeq }"
								style="border: 1px solid #fff; border-radius: 35em;">
								<i class="fa-regular fa-trash-can"></i>
							</button>
							<div class="blank_under"></div>
						</div>
					</c:forEach>

				</div>
			</div>
		
		
	<div class="item_management col-1">ddd</div>
		
   <div class="item_management col-5">
      <div class="input_title">문항 관리</div>
      
      <div class="question_inputdv" id="input_question">
      <form:form modelAttribute="SQD" id="questioN_insert_form">
         <!-- aa -->
         <div id="insertQform">

            <div class="select_radio" id="select_radio">
               <input type="radio" name="questionTypeCode" id="obj_radio"
                  onclick="checkit1()" value="10001" checked>&nbsp;객관식 &nbsp;&nbsp;&nbsp;
                  <input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002">&nbsp;주관식 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003">&nbsp;혼합식 &nbsp;&nbsp;&nbsp;
            </div>
            <div class="question_content_area" id="question_add">
               <div class="input-group" id="question_content">
                  <textarea class="form-control" aria-label="문제 입력칸"
                     name="questionContent">${SQD.questionContent}</textarea>
               </div>




               <!-- 문제 추가 버튼  -->
               <!-- onclick="insertQus()" -->
            <div class="question_add_btn_div">

               <button type="button" class="create_btn" id="add_qus_btn"
                  onclick="insertQus()">문제 추가</button>

               <button type="button" class="create_btn"
                  id="update_btn" onclick="qusUpdate(${SLD.surveySeq})">문제 수정</button>
               <input type="hidden" name="surveySeq" id="seq"
                  value="${SLD.surveySeq }"> <input type="hidden"
                  name="questionSeq" value="2">
               <!-- 비동기로 바꿔 넣어보자 -> 문항도 마찬가지 -->
            </div>

            <input type="hidden" name="itemScore" value="1"> 
            <input type="hidden" name="itemContent" value=" ">
         </div>
         </div>
      </form:form>
   </div>




         <button type="button" class="create_btn" id="add_item_btn"
                  onclick="insertItem()">문항 추가</button>
                  
   </div>




  
</div>



   <!-- 채우 폼에 진택 코드 넣기 끝-->

   <div class="list-group-item list-group-item-action active py-3 lh-sm"
      id="newQUE" style="display: none">

      <input type="text" class="input_qus" value="문제를 입력해주세요">
      <button class="delete_btn">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
            fill="currentColor" class="bi bi-x" viewBox="0 0 16 16"> <path
               d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /> </svg>
      </button>
      <div class="blank_under"></div>
   </div>


   
</div>
<!-- 객관식 -->
		<div class="" id="item_div">
			<c:forEach items="${SQL}" var="qlist">
				<div id="obj_box_toggle" style="display: none;">
					<div class="col-12">
						<div class="Item_box">
							<button type="button" id="item_obj_copy">+</button>
							<form:form modelAttribute="SQD" id="item_obj_form">
								<input type="hidden" name="questionTypeCode" value="10001">
								<input type="hidden" name="surveySeq" value="${SLD.surveySeq}">

								<div class="icon_line" id="obj_ItemAfter">
									<label><input type="text" name="itemContent"
										placeholder="문항 입력..." id="ic"></label> 점수<input type="number"
										name="itemScore" min="0" value="0"
										style="min-width: 20px; max-width: 40px;" id="is">
								</div>

								<div class="col-12">

									<input type="button" class="btn btn-primary"
										onclick="update_obj_item_btn()" value="수정">
								</div>
							</form:form>
						</div>
					</div>
				</div>



				<%--       <c:if test="${ }"></c:if> --%>
				<!-- 혼합식 -->
				<div id="mix_box_toggle" style="display: none;">
					<div class="col-12">
						<div class="Item_box">
							<button type="button" id="item_mix_copy">+</button>
							<form:form modelAttribute="SQD" id="item_mix_form">
								<input type="hidden" name="questionTypeCode" value="10003">
								<input type="hidden" name="surveySeq" value="${SLD.surveySeq}"
									id="surveyseq">
								<input type="hidden" name="questionSeq" value="2">
								<div class="icon_line" id="mix_ItemAfter">
									<label><input type="text" name="itemContent"
										placeholder="문항 입력..." id="ic" required></label> 점수<input
										type="number" name="itemScore" min="0" value="0"
										style="min-width: 20px; max-width: 40px;" id="is">
								</div>
								<div class="icon_line">
									<label> <input type="text" id="ic" name="itemContent"
										placeholder="기타.." value="기타"></label> <input type="number"
										name="itemScore" value="0" style="display: none">
								</div>
								<div class="col-12">

									<input type="button" class="btn btn-primary"
										onclick="update_mix_item_btn()" value="수정">
								</div>
							</form:form>
						</div>
					</div>
				</div>

				<%--       <c:if test="${ }"></c:if> --%>
				<!-- 주관식 -->

				<!-- 주관식은 문제 만들 때 id값 가장 큰 거 부여 -->
				<div id="subj_box_toggle" style="display: none">
					<div class="block_box">
						<input type="text" class="input_qus" id="input_qus"
							placeholder="주관식 문제입니다.">

						<div class="blank_under"></div>
					</div>
				</div>

			</c:forEach>
		</div>

<script>
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
         url : 'updateitem.do', // form을 전송할 실제 파일경로
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
         url : 'updateitem.do', // form을 전송할 실제 파일경로
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
   /*문제 삭제*/
   function delete_obj_item_btn(obj) {
      const tag = $(obj);
      tag.parent().remove();
   }
   function delete_mix_item_btn(obj) {
      const tag = $(obj);
      tag.parent().remove();
   }
   //문제 추가 후 문항 추가
   $("#item_obj_copy").click(function() {
      if (cnt < 1000) {
         const testDiv = document.getElementById('new_obj_Item');
         const testDiv1 = document.getElementById('obj_ItemAfter');
         const newNode = testDiv.cloneNode(true);
         newNode.style.display = 'inline-block';
         cnt++;
         testDiv1.append(newNode);
      } else {
         alert("문항은 최대 5개까지 생성 가능합니다.");
      }
   });
   $("#item_mix_copy").click(function() {
      if (cnt < 1000) {
         const testDiv = document.getElementById('new_mix_Item');
         const testDiv1 = document.getElementById('mix_ItemAfter');
         const newNode = testDiv.cloneNode(true);
         newNode.style.display = 'inline-block';
         cnt++;
         testDiv1.after(newNode);
      } else {
         alert("문항은 최대 5개까지 생성 가능합니다.");
      }
   });
   //문항추가 끝
//    var test = document.getElementById('add_btn');
//       test.addEventListener('click', insertQus);
    function insertQus(){
          var qdiv = $('#questioN_insert_form')[0];
          var data = new FormData(qdiv);
          $.ajax({
            method:'POST', //어떤 방식으로 보낼 지
            url:'insertquestion.do', // qdiv를 보낼 경로 설정
            data: data,   //
            processData : false,
             contentType : false,
             cache : false,
            beforeSend : function() { //보내기 전 실행
            console.log("요청이 보내지는가?");
            console.log("qdiv:"+qdiv[0]);
            console.log("data:"+data);
            },
            success:function (data) {    //전송 성공시 실행
               console.log(data);
               console.log($('#surveyseq').val());
               var surveyseq = $('#surveyseq').val();
            $.ajax({
                  method:'GET', //어떤 방식으로 보낼 지
                  url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정
                   dataType: "json",
                  beforeSend : function() { //보내기 전 실행
                  console.log("요청이 보내지는가?");
                  },
                  success:function (jsondata){    //전송 성공시 실행
                     console.log(jsondata);
                        questionHtml(jsondata);
                        var surveyseq = jsondata[0].SURVEY_SEQ;
                        var questionseq = jsondata[0].QUESTION_SEQ;
                        $.ajax({
                           method:'GET', //어떤 방식으로 보낼 지
                           url:'selectitems.do/'+ questionseq, // qdiv를 보낼 경로 설정
                            dataType: "json",
                           beforeSend : function() { //보내기 전 실행
                           console.log("요청이 보내지는가?");
                           },
                           success:function (jsondata){    //전송 성공시 실행
                              console.log("답은:"+jsondata[0].QUESTIONTYPECODE)
//                               itemHtml(jsondata);
                           }, error:function(e) {   //실패, 에러
                              console.log("Error", e);
                           }
                           });
                  }, error:function(e) {   //실패, 에러
                     console.log("Error", e);
                  }
                  });
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
            });
         }
    function questionHtml(data){
        let size = data.length;
        console.log(size);
        var html = '';
        $("#scroll_area").empty();
        if(size < 1){
           html ='관리할 문제가 없어요~';
        }else{
            for(i=0; i<size; i++){
                html+='<div class="list-group-item list-group-item-action active py-3 lh-sm" id="queAfter">'
                html +='<input type="text" id="input_qus" value="'+data[i].QUESTION_CONTENT+'" disabled>';
                html +='<button value="'+data[i].QUESTION_SEQ+'"onclick="touchQuestion(this)">확인</button>';
               html +='<button class="delete_btn" onclick="deleteQus(this,'+data[i].SURVEY_SEQ+')" value="'+data[i].QUESTION_SEQ+'">';
               html += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">';
                 html += '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /></svg>';
               html +=   '</button>';
               html +='<div class="blank_under"></div></div>';
                }
        }
        $('#scroll_area').append(html);
   }
    function itemHtml(data){
         let size = data.length;
         var html = '';
        $("#item_div").empty();
        console.log("답은:"+data[0].QUESTIONTYPECODE)
       // 10001 객 10002 주 10003 혼
        for(i=0; i<size; i++){
           if(data[i].QUESTIONTYPECODE == "10001"){
                html +='<div id="obj_box_toggle" >'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_obj_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_obj_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10001">'
                 html +='<input type="hidden" name="surveySeq" value="'+data[i].SURVEYSEQ+'">'
                 html +='<input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="obj_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_obj_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
                 html +='<div id="mix_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_mix_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_mix_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10003">'
                 html +='<input type="hidden" name="surveySeq" value="'+${SLD.surveySeq}+'" id="surveyseq">'
                 html +='   <input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="mix_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="icon_line">'
                 html +='<label> <input type="text" id="ic" name="itemContent" placeholder="기타.." value="기타"></label>'
                 html +='<input type="number" name="itemScore" value="0" style="display: none">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_mix_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
           }else if(data[i].QUESTIONTYPECODE=="10002"){
             html +='<div id="obj_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='   <button type="button" id="item_obj_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_obj_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10001">'
                 html +='<input type="hidden" name="surveySeq" value="'+data[i].SURVEYSEQ+'">'
                 html +='<input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="obj_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_obj_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
                 html +='<div id="mix_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_mix_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_mix_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10003">'
                 html +='<input type="hidden" name="surveySeq" value="'+${SLD.surveySeq}+'" id="surveyseq">'
                 html +='   <input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="mix_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="icon_line">'
                 html +='<label> <input type="text" id="ic" name="itemContent" placeholder="기타.." value="기타"></label>'
                 html +='<input type="number" name="itemScore" value="0" style="display: none">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_mix_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
           }else if(data[i].QUESTIONTYPECODE=="10003"){
             html +='<div id="obj_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='   <button type="button" id="item_obj_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_obj_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10001">'
                 html +='<input type="hidden" name="surveySeq" value="'+data[i].SURVEYSEQ+'">'
                 html +='<input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="obj_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_obj_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
                 html +='<div id="mix_box_toggle" >'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_mix_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_mix_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10003">'
                 html +='<input type="hidden" name="surveySeq" value="'+${SLD.surveySeq}+'" id="surveyseq">'
                 html +='   <input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="mix_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="icon_line">'
                 html +='<label> <input type="text" id="ic" name="itemContent" placeholder="기타.." value="기타"></label>'
                 html +='<input type="number" name="itemScore" value="0" style="display: none">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_mix_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
           }
        }$('#item_div').append(html);
    }
   
    //var dltest = document.getElementById('delete_btn');
   //dltest.addEventListener('click', deleteQus);
    function deleteQus(obj,surveySeq) {
//        var qdiv = $('#sv_qst_form')[0];
//       var data = new FormData(qdiv);
      var questionSeq = $(obj).val()
      console.log(questionSeq)
      console.log("과연?:"+surveySeq);
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
                $.ajax({
                     method:'GET', //어떤 방식으로 보낼 지
                     url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정
                      dataType: "json",
                     beforeSend : function() { //보내기 전 실행
                     console.log("요청이 보내지는가?");
                     },
                     success:function (jsondata){    //전송 성공시 실행
                           questionHtml(jsondata);
                           var surveyseq = jsondata[0].SURVEY_SEQ;
                           var questionseq = jsondata[0].QUESTION_SEQ;
                     }, error:function(e) {   //실패, 에러
                        console.log("Error", e);
                     }
                     });
            }
       });
   }
    function touchQuestion(obj){
      var questionid = $(obj).val();
      $.ajax({
         method:'get', //어떤 방식으로 보낼 지
         url:'touchandselect.do/' + questionid, // qdiv를 보낼 경로 설정
         dataType: "json",
          beforeSend : function() { //보내기 전 실행
         console.log("요청이 보내지는가?");
         },
         success:function (data) {    //전송 성공시 실행
            console.log("으잉?"+data);
               oneQuestion(data);
               secondQuestion(data);
               $.ajax({
               method:'GET', //어떤 방식으로 보낼 지
               url:'selectitems.do/'+ questionid, // qdiv를 보낼 경로 설정
                dataType: "json",
               beforeSend : function() { //보내기 전 실행
               console.log("요청이 보내지는가?");
               },
               success:function (jsondata){    //전송 성공시 실행
                  console.log("답은:"+jsondata[0].QUESTION_TYPE_CODE)
//                   itemHtml(jsondata);
               }, error:function(e) {   //실패, 에러
                  console.log("Error", e);
               }
               });
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
      });
   }
   //문제 확인 시 객주흔중에서 문제에 해당하는 유형이 나오게
   function oneQuestion(data){
      console.log(data[0].SURVEY_SEQ);
//       let size = data.length;
        var html = '';
        $("#questioN_insert_form").empty();
         html += `<div id="insertQform">`;
         html += `<div class="select_radio" id="select_radio">`;
      if(data[0].QUESTION_TYPE_CODE =="10001"){
         html += `<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()" checked value="10001" >객관식 `;
         html += `<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002"> 주관식`;
         html +=  `<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> 혼합식`;
      } else if (data[0].QUESTION_TYPE_CODE =="10002"){
         html += `<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()"  value="10001" >객관식 `;
         html += `<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" checked value="10002"> 주관식`;
         html +=  `<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> 혼합식`;
      } else if (data[0].QUESTION_TYPE_CODE =="10003"){
         html += `<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()"  value="10001" >객관식 `;
         html += `<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002"> 주관식`;
         html +=  `<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" checked value="10003"> 혼합식`;
      }
      html += `</div>`;
      html += `<div class="question_content_area" id="question_add">`;
      html += `<div class="input-group" id="question_content">`;
      html += `<div class="input-group-prepend">`;
      html += '<span class="input-group-text" >문제입력</span>';
      html += `</div>`;
      html += '<textarea class="form-control" aria-label="문제 입력칸" id="hi" name="questionContent">'+data[0].QUESTION_CONTENT+'';
       $('#questioN_insert_form').append(html);
   }
   function secondQuestion(data){
      console.log(data[0].SURVEYSEQ);
        var html = '';
      html += `</div>`;
      html += `<button type="button" class="btn btn-outline-primary" id="add_btn" onclick="insertQus()">문제추가</button>`;
      html += '<button type="button" class="btn btn-outline-primary"  id="update_btn" onclick="qusUpdate('+data[0].SURVEY_SEQ+')">문제수정</button>';
      html += '<input type="hidden" name="surveySeq" id="seq" value="'+data[0].SURVEY_SEQ+'">';
      html += '<input type="hidden" name="questionSeq" value="'+data[0].QUESTION_SEQ +'">';
      html += `</div>`;
      html += `<input type="hidden" name="itemScore" value="1">`;
      html += `<input type="hidden" name="itemContent" value=" ">`;
      html += `</div>`;
       $('#hi').after(html);
   }
   //문제 입력 채우 코드에 추가한 것 끝
   // 진택 끝
   //채우
   /*문제 삭제*/
//    function delete_btn(obj) {
//       const tag = $(obj);
//       tag.parent().remove();
//    }
      function qusUpdate(surveySeq){
         var qdiv = $('#questioN_insert_form')[0]
         alert("업데이트 시작!");
          console.log("업데이트 시작");
         var data = new FormData(qdiv);
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
                $.ajax({
                     method:'GET', //어떤 방식으로 보낼 지
                     url:'selectquestion.do/'+ surveySeq, // qdiv를 보낼 경로 설정
                      dataType: "json",
                     beforeSend : function() { //보내기 전 실행
                     console.log("요청이 보내지는가?");
                     },
                     success:function (jsondata){    //전송 성공시 실행
                           questionHtml(jsondata);
                           var surveyseq = jsondata[0].SURVEY_SEQ;
                           var questionseq = jsondata[0].QUESTION_SEQ;
                     }, error:function(e) {   //실패, 에러
                        console.log("Error", e);
                     }
                     });
            },
            error: function(e) {
               console.log("Error", e);
               }
            });
         }
   //채우 끝
    //문제 유형 선택 시  해당하는 유형의 문항form이 나오도록 하는 비동기


   window.onloade=function(){
     if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
               $("#obj_box_toggle").show();
      }
   };
      
   function checkit1() {
      if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
          $("#obj_box_toggle").show();
          $("#subj_box_toggle").hide();
         $("#mix_box_toggle").hide();

          
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
       }
   };
   function checkit3() {
      if ($("input[type=radio][id=mix_radio]:checked").is(':checked') == true){
          $("#mix_box_toggle").show();
          $("#obj_box_toggle").hide();
          $("#subj_box_toggle").hide();


       }
   };

   function checkit2() {
    if($("input[type=radio][id=subj_radio]:checked").is(':checked') == true){ // 체크 여부(checked)
        $("#subj_box_toggle").show();
       $("#obj_box_toggle").hide();
        $("#mix_box_toggle").hide();

      }

   };
</script>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/insert.css">

<div class="container">


<!-- 상단 information -->
	<div class="container_flex">
		<form:form modelAttribute="SLD" id="survey_setting_form">
				<span class="insert_category" ><b>제목</b>
					<label for="survey_name"></label> 
					<input type="text" id="survey_name" name="surveyName" style="width: 200px;" value="${SLD.surveyName}">
				</span>
				
				<span class="insert_category">
					<input type="date" name="surveyStartDate" class="survey_date"
						value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">- 
					<input type="date" name="surveyClosedDate" class="survey_date"
						value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />">
				</span>
				
				<span class="insert_category">
					<c:if test="${SLD.anonymityCheckCode eq '20001'}" >
					<input type="radio" name="anonymityCheckCode" 
							id="survey_type_check" value="20001" checked>익명
					<input type="radio" name="anonymityCheckCode"
							id="survey_type_check" value="20002">기명
         		    </c:if>

					<c:if test="${SLD.anonymityCheckCode eq '20002'}">
						<input type="radio" name="anonymityCheckCode" 
							id="survey_type_check" value="20001">
						<label for="survey_type_check">익명</label>
						
						<input type="radio" name="anonymityCheckCode" style=""
							id="survey_type_check" value="20002" checked>
						<label for="survey_type_check">기명</label>
					</c:if>
				</span>	
				<br>
				<%-- <span class="insert_category"><b>상세 설명</b>
					<label for="message-text" ></label>
					<textarea class="visually-hidden" id="message-text"
						name="surveyContent">${SLD.surveyContent }</textarea>
				
					<input type="hidden" name="stateCode" value="30001"> 
						<input type="hidden" name="surveySeq" id="surveyseq" value="${SLD.surveySeq}">
				</span> --%>
		</form:form>
		<input type="button" class="update_btn" onclick="register()" value="적용">
	</div>
<!-- 상단 information 끝 -->


 <!-- ㅇㅅㅇ < 미야옹 ) -->

<div class="container_survey">
<div class="row">

			<div class="question_management col-6">
				<div class="input_title" style="margin-bottom: 60px;"> 문제 관리 </div>
				<div id="scroll_area">
					<!--save-->
					<c:forEach items="${SQL}" var="qlist">
						<div id="queAfter">

							<div class="input_qus">
								<input disabled type="text" id="input_qus"
									value="${qlist.questionContent }">
							</div>
							<!-- 조회 버튼 -->
							<button value="${qlist.questionSeq }"
								onclick="touchQuestion(this)"
								style="border: 1px solid #fff; border-radius: 35em;">
								<i class="fas fa-search"></i>
							</button>

							<!-- 삭제 버튼 -->
							<button class="delete_btn"
								onclick="deleteQus(this,${qlist.surveySeq})"
								value="${qlist.questionSeq }"
								style="border: 1px solid #fff; border-radius: 35em;">
								<i class="fa-regular fa-trash-can"></i>
							</button>
							<div class="blank_under"></div>
						</div>
					</c:forEach>

				</div>
			</div>
		
		
	<div class="item_management col-1">ddd</div>
		
   <div class="item_management col-5">
      <div class="input_title">문항 관리</div>
      
      <div class="question_inputdv" id="input_question">
      <form:form modelAttribute="SQD" id="questioN_insert_form">
         <!-- aa -->
         <div id="insertQform">

            <div class="select_radio" id="select_radio">
               <input type="radio" name="questionTypeCode" id="obj_radio"
                  onclick="checkit1()" value="10001" checked>&nbsp;객관식 &nbsp;&nbsp;&nbsp;
                  <input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002">&nbsp;주관식 &nbsp;&nbsp;&nbsp; 
                  <input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003">&nbsp;혼합식 &nbsp;&nbsp;&nbsp;
            </div>
            <div class="question_content_area" id="question_add">
               <div class="input-group" id="question_content">
                  <textarea class="form-control" aria-label="문제 입력칸"
                     name="questionContent">${SQD.questionContent}</textarea>
               </div>




               <!-- 문제 추가 버튼  -->
               <!-- onclick="insertQus()" -->
            <div class="question_add_btn_div">

               <button type="button" class="create_btn" id="add_qus_btn"
                  onclick="insertQus()">문제 추가</button>

               <button type="button" class="create_btn"
                  id="update_btn" onclick="qusUpdate(${SLD.surveySeq})">문제 수정</button>
               <input type="hidden" name="surveySeq" id="seq"
                  value="${SLD.surveySeq }"> <input type="hidden"
                  name="questionSeq" value="2">
               <!-- 비동기로 바꿔 넣어보자 -> 문항도 마찬가지 -->
            </div>

            <input type="hidden" name="itemScore" value="1"> 
            <input type="hidden" name="itemContent" value=" ">
         </div>
         </div>
      </form:form>
   </div>




         <button type="button" class="create_btn" id="add_item_btn"
                  onclick="insertItem()">문항 추가</button>
                  
   </div>




  
</div>



   <!-- 채우 폼에 진택 코드 넣기 끝-->

   <div class="list-group-item list-group-item-action active py-3 lh-sm"
      id="newQUE" style="display: none">

      <input type="text" class="input_qus" value="문제를 입력해주세요">
      <button class="delete_btn">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
            fill="currentColor" class="bi bi-x" viewBox="0 0 16 16"> <path
               d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /> </svg>
      </button>
      <div class="blank_under"></div>
   </div>


   
</div>
<!-- 객관식 -->
		<div class="" id="item_div">
			<c:forEach items="${SQL}" var="qlist">
				<div id="obj_box_toggle" style="display: none;">
					<div class="col-12">
						<div class="Item_box">
							<button type="button" id="item_obj_copy">+</button>
							<form:form modelAttribute="SQD" id="item_obj_form">
								<input type="hidden" name="questionTypeCode" value="10001">
								<input type="hidden" name="surveySeq" value="${SLD.surveySeq}">

								<div class="icon_line" id="obj_ItemAfter">
									<label><input type="text" name="itemContent"
										placeholder="문항 입력..." id="ic"></label> 점수<input type="number"
										name="itemScore" min="0" value="0"
										style="min-width: 20px; max-width: 40px;" id="is">
								</div>

								<div class="col-12">

									<input type="button" class="btn btn-primary"
										onclick="update_obj_item_btn()" value="수정">
								</div>
							</form:form>
						</div>
					</div>
				</div>



				<%--       <c:if test="${ }"></c:if> --%>
				<!-- 혼합식 -->
				<div id="mix_box_toggle" style="display: none;">
					<div class="col-12">
						<div class="Item_box">
							<button type="button" id="item_mix_copy">+</button>
							<form:form modelAttribute="SQD" id="item_mix_form">
								<input type="hidden" name="questionTypeCode" value="10003">
								<input type="hidden" name="surveySeq" value="${SLD.surveySeq}"
									id="surveyseq">
								<input type="hidden" name="questionSeq" value="2">
								<div class="icon_line" id="mix_ItemAfter">
									<label><input type="text" name="itemContent"
										placeholder="문항 입력..." id="ic" required></label> 점수<input
										type="number" name="itemScore" min="0" value="0"
										style="min-width: 20px; max-width: 40px;" id="is">
								</div>
								<div class="icon_line">
									<label> <input type="text" id="ic" name="itemContent"
										placeholder="기타.." value="기타"></label> <input type="number"
										name="itemScore" value="0" style="display: none">
								</div>
								<div class="col-12">

									<input type="button" class="btn btn-primary"
										onclick="update_mix_item_btn()" value="수정">
								</div>
							</form:form>
						</div>
					</div>
				</div>

				<%--       <c:if test="${ }"></c:if> --%>
				<!-- 주관식 -->

				<!-- 주관식은 문제 만들 때 id값 가장 큰 거 부여 -->
				<div id="subj_box_toggle" style="display: none">
					<div class="block_box">
						<input type="text" class="input_qus" id="input_qus"
							placeholder="주관식 문제입니다.">

						<div class="blank_under"></div>
					</div>
				</div>

			</c:forEach>
		</div>

<script>
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
         url : 'updateitem.do', // form을 전송할 실제 파일경로
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
         url : 'updateitem.do', // form을 전송할 실제 파일경로
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
   /*문제 삭제*/
   function delete_obj_item_btn(obj) {
      const tag = $(obj);
      tag.parent().remove();
   }
   function delete_mix_item_btn(obj) {
      const tag = $(obj);
      tag.parent().remove();
   }
   //문제 추가 후 문항 추가
   $("#item_obj_copy").click(function() {
      if (cnt < 1000) {
         const testDiv = document.getElementById('new_obj_Item');
         const testDiv1 = document.getElementById('obj_ItemAfter');
         const newNode = testDiv.cloneNode(true);
         newNode.style.display = 'inline-block';
         cnt++;
         testDiv1.append(newNode);
      } else {
         alert("문항은 최대 5개까지 생성 가능합니다.");
      }
   });
   $("#item_mix_copy").click(function() {
      if (cnt < 1000) {
         const testDiv = document.getElementById('new_mix_Item');
         const testDiv1 = document.getElementById('mix_ItemAfter');
         const newNode = testDiv.cloneNode(true);
         newNode.style.display = 'inline-block';
         cnt++;
         testDiv1.after(newNode);
      } else {
         alert("문항은 최대 5개까지 생성 가능합니다.");
      }
   });
   //문항추가 끝
//    var test = document.getElementById('add_btn');
//       test.addEventListener('click', insertQus);
    function insertQus(){
          var qdiv = $('#questioN_insert_form')[0];
          var data = new FormData(qdiv);
          $.ajax({
            method:'POST', //어떤 방식으로 보낼 지
            url:'insertquestion.do', // qdiv를 보낼 경로 설정
            data: data,   //
            processData : false,
             contentType : false,
             cache : false,
            beforeSend : function() { //보내기 전 실행
            console.log("요청이 보내지는가?");
            console.log("qdiv:"+qdiv[0]);
            console.log("data:"+data);
            },
            success:function (data) {    //전송 성공시 실행
               console.log(data);
               console.log($('#surveyseq').val());
               var surveyseq = $('#surveyseq').val();
            $.ajax({
                  method:'GET', //어떤 방식으로 보낼 지
                  url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정
                   dataType: "json",
                  beforeSend : function() { //보내기 전 실행
                  console.log("요청이 보내지는가?");
                  },
                  success:function (jsondata){    //전송 성공시 실행
                     console.log(jsondata);
                        questionHtml(jsondata);
                        var surveyseq = jsondata[0].SURVEY_SEQ;
                        var questionseq = jsondata[0].QUESTION_SEQ;
                        $.ajax({
                           method:'GET', //어떤 방식으로 보낼 지
                           url:'selectitems.do/'+ questionseq, // qdiv를 보낼 경로 설정
                            dataType: "json",
                           beforeSend : function() { //보내기 전 실행
                           console.log("요청이 보내지는가?");
                           },
                           success:function (jsondata){    //전송 성공시 실행
                              console.log("답은:"+jsondata[0].QUESTIONTYPECODE)
//                               itemHtml(jsondata);
                           }, error:function(e) {   //실패, 에러
                              console.log("Error", e);
                           }
                           });
                  }, error:function(e) {   //실패, 에러
                     console.log("Error", e);
                  }
                  });
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
            });
         }
    function questionHtml(data){
        let size = data.length;
        console.log(size);
        var html = '';
        $("#scroll_area").empty();
        if(size < 1){
           html ='관리할 문제가 없어요~';
        }else{
            for(i=0; i<size; i++){
                html+='<div class="list-group-item list-group-item-action active py-3 lh-sm" id="queAfter">'
                html +='<input type="text" id="input_qus" value="'+data[i].QUESTION_CONTENT+'" disabled>';
                html +='<button value="'+data[i].QUESTION_SEQ+'"onclick="touchQuestion(this)">확인</button>';
               html +='<button class="delete_btn" onclick="deleteQus(this,'+data[i].SURVEY_SEQ+')" value="'+data[i].QUESTION_SEQ+'">';
               html += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">';
                 html += '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /></svg>';
               html +=   '</button>';
               html +='<div class="blank_under"></div></div>';
                }
        }
        $('#scroll_area').append(html);
   }
    function itemHtml(data){
         let size = data.length;
         var html = '';
        $("#item_div").empty();
        console.log("답은:"+data[0].QUESTIONTYPECODE)
       // 10001 객 10002 주 10003 혼
        for(i=0; i<size; i++){
           if(data[i].QUESTIONTYPECODE == "10001"){
                html +='<div id="obj_box_toggle" >'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_obj_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_obj_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10001">'
                 html +='<input type="hidden" name="surveySeq" value="'+data[i].SURVEYSEQ+'">'
                 html +='<input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="obj_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_obj_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
                 html +='<div id="mix_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_mix_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_mix_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10003">'
                 html +='<input type="hidden" name="surveySeq" value="'+${SLD.surveySeq}+'" id="surveyseq">'
                 html +='   <input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="mix_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="icon_line">'
                 html +='<label> <input type="text" id="ic" name="itemContent" placeholder="기타.." value="기타"></label>'
                 html +='<input type="number" name="itemScore" value="0" style="display: none">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_mix_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
           }else if(data[i].QUESTIONTYPECODE=="10002"){
             html +='<div id="obj_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='   <button type="button" id="item_obj_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_obj_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10001">'
                 html +='<input type="hidden" name="surveySeq" value="'+data[i].SURVEYSEQ+'">'
                 html +='<input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="obj_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_obj_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
                 html +='<div id="mix_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_mix_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_mix_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10003">'
                 html +='<input type="hidden" name="surveySeq" value="'+${SLD.surveySeq}+'" id="surveyseq">'
                 html +='   <input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="mix_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="icon_line">'
                 html +='<label> <input type="text" id="ic" name="itemContent" placeholder="기타.." value="기타"></label>'
                 html +='<input type="number" name="itemScore" value="0" style="display: none">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_mix_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
           }else if(data[i].QUESTIONTYPECODE=="10003"){
             html +='<div id="obj_box_toggle" style="display:none;">'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='   <button type="button" id="item_obj_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_obj_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10001">'
                 html +='<input type="hidden" name="surveySeq" value="'+data[i].SURVEYSEQ+'">'
                 html +='<input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="obj_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_obj_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
                 html +='<div id="mix_box_toggle" >'
                 html +='<div class="col-12">'
                 html +='<div class="Item_box">'
                 html +='<button type="button" id="item_mix_copy">+</button>'
                 html +='<form:form modelAttribute="SQD" id="item_mix_form">'
                 html +='<input type="hidden" name="questionTypeCode" value="10003">'
                 html +='<input type="hidden" name="surveySeq" value="'+${SLD.surveySeq}+'" id="surveyseq">'
                 html +='   <input type="hidden" name="questionSeq" value="'+data[i].QUESTIONSEQ+'">'
                 html +='<div class="icon_line" id="mix_ItemAfter">'
                 html +='<label><input type="text" name="itemContent" value="'+data[i].ITEMCONTENT+'" id="ic"></label> 점수<input type="number" name="itemScore" min="0" value="'+data[i].ITEMSCORE+'" style="min-width: 20px; max-width: 40px;" id="is">'
                 html +='</div>'
                 html +='<div class="icon_line">'
                 html +='<label> <input type="text" id="ic" name="itemContent" placeholder="기타.." value="기타"></label>'
                 html +='<input type="number" name="itemScore" value="0" style="display: none">'
                 html +='</div>'
                 html +='<div class="col-12">'
                 html +='<input type="button" class="btn btn-primary" onclick="update_mix_item_btn()" value="수정">'
                 html +='</div>'
                 html +='</form:form>'
                 html +='</div>'
                 html +='</div>'
                 html +='</div>'
           }
        }$('#item_div').append(html);
    }
   
    //var dltest = document.getElementById('delete_btn');
   //dltest.addEventListener('click', deleteQus);
    function deleteQus(obj,surveySeq) {
//        var qdiv = $('#sv_qst_form')[0];
//       var data = new FormData(qdiv);
      var questionSeq = $(obj).val()
      console.log(questionSeq)
      console.log("과연?:"+surveySeq);
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
                $.ajax({
                     method:'GET', //어떤 방식으로 보낼 지
                     url:'selectquestion.do/'+ surveyseq, // qdiv를 보낼 경로 설정
                      dataType: "json",
                     beforeSend : function() { //보내기 전 실행
                     console.log("요청이 보내지는가?");
                     },
                     success:function (jsondata){    //전송 성공시 실행
                           questionHtml(jsondata);
                           var surveyseq = jsondata[0].SURVEY_SEQ;
                           var questionseq = jsondata[0].QUESTION_SEQ;
                     }, error:function(e) {   //실패, 에러
                        console.log("Error", e);
                     }
                     });
            }
       });
   }
    function touchQuestion(obj){
      var questionid = $(obj).val();
      $.ajax({
         method:'get', //어떤 방식으로 보낼 지
         url:'touchandselect.do/' + questionid, // qdiv를 보낼 경로 설정
         dataType: "json",
          beforeSend : function() { //보내기 전 실행
         console.log("요청이 보내지는가?");
         },
         success:function (data) {    //전송 성공시 실행
            console.log("으잉?"+data);
               oneQuestion(data);
               secondQuestion(data);
               $.ajax({
               method:'GET', //어떤 방식으로 보낼 지
               url:'selectitems.do/'+ questionid, // qdiv를 보낼 경로 설정
                dataType: "json",
               beforeSend : function() { //보내기 전 실행
               console.log("요청이 보내지는가?");
               },
               success:function (jsondata){    //전송 성공시 실행
                  console.log("답은:"+jsondata[0].QUESTION_TYPE_CODE)
//                   itemHtml(jsondata);
               }, error:function(e) {   //실패, 에러
                  console.log("Error", e);
               }
               });
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
      });
   }
   //문제 확인 시 객주흔중에서 문제에 해당하는 유형이 나오게
   function oneQuestion(data){
      console.log(data[0].SURVEY_SEQ);
//       let size = data.length;
        var html = '';
        $("#questioN_insert_form").empty();
         html += `<div id="insertQform">`;
         html += `<div class="select_radio" id="select_radio">`;
      if(data[0].QUESTION_TYPE_CODE =="10001"){
         html += `<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()" checked value="10001" >객관식 `;
         html += `<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002"> 주관식`;
         html +=  `<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> 혼합식`;
      } else if (data[0].QUESTION_TYPE_CODE =="10002"){
         html += `<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()"  value="10001" >객관식 `;
         html += `<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" checked value="10002"> 주관식`;
         html +=  `<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> 혼합식`;
      } else if (data[0].QUESTION_TYPE_CODE =="10003"){
         html += `<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()"  value="10001" >객관식 `;
         html += `<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002"> 주관식`;
         html +=  `<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" checked value="10003"> 혼합식`;
      }
      html += `</div>`;
      html += `<div class="question_content_area" id="question_add">`;
      html += `<div class="input-group" id="question_content">`;
      html += `<div class="input-group-prepend">`;
      html += '<span class="input-group-text" >문제입력</span>';
      html += `</div>`;
      html += '<textarea class="form-control" aria-label="문제 입력칸" id="hi" name="questionContent">'+data[0].QUESTION_CONTENT+'';
       $('#questioN_insert_form').append(html);
   }
   function secondQuestion(data){
      console.log(data[0].SURVEYSEQ);
        var html = '';
      html += `</div>`;
      html += `<button type="button" class="btn btn-outline-primary" id="add_btn" onclick="insertQus()">문제추가</button>`;
      html += '<button type="button" class="btn btn-outline-primary"  id="update_btn" onclick="qusUpdate('+data[0].SURVEY_SEQ+')">문제수정</button>';
      html += '<input type="hidden" name="surveySeq" id="seq" value="'+data[0].SURVEY_SEQ+'">';
      html += '<input type="hidden" name="questionSeq" value="'+data[0].QUESTION_SEQ +'">';
      html += `</div>`;
      html += `<input type="hidden" name="itemScore" value="1">`;
      html += `<input type="hidden" name="itemContent" value=" ">`;
      html += `</div>`;
       $('#hi').after(html);
   }
   //문제 입력 채우 코드에 추가한 것 끝
   // 진택 끝
   //채우
   /*문제 삭제*/
//    function delete_btn(obj) {
//       const tag = $(obj);
//       tag.parent().remove();
//    }
      function qusUpdate(surveySeq){
         var qdiv = $('#questioN_insert_form')[0]
         alert("업데이트 시작!");
          console.log("업데이트 시작");
         var data = new FormData(qdiv);
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
                $.ajax({
                     method:'GET', //어떤 방식으로 보낼 지
                     url:'selectquestion.do/'+ surveySeq, // qdiv를 보낼 경로 설정
                      dataType: "json",
                     beforeSend : function() { //보내기 전 실행
                     console.log("요청이 보내지는가?");
                     },
                     success:function (jsondata){    //전송 성공시 실행
                           questionHtml(jsondata);
                           var surveyseq = jsondata[0].SURVEY_SEQ;
                           var questionseq = jsondata[0].QUESTION_SEQ;
                     }, error:function(e) {   //실패, 에러
                        console.log("Error", e);
                     }
                     });
            },
            error: function(e) {
               console.log("Error", e);
               }
            });
         }
   //채우 끝
    //문제 유형 선택 시  해당하는 유형의 문항form이 나오도록 하는 비동기


   window.onloade=function(){
     if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
               $("#obj_box_toggle").show();
      }
   };
      
   function checkit1() {
      if ($("input[type=radio][id=obj_radio]:checked").is(':checked') == true){
          $("#obj_box_toggle").show();
          $("#subj_box_toggle").hide();
         $("#mix_box_toggle").hide();

          
       }
   };
   function checkit3() {
      if ($("input[type=radio][id=mix_radio]:checked").is(':checked') == true){
          $("#mix_box_toggle").show();
          $("#obj_box_toggle").hide();
          $("#subj_box_toggle").hide();


       }
   };

   function checkit2() {
    if($("input[type=radio][id=subj_radio]:checked").is(':checked') == true){ // 체크 여부(checked)
        $("#subj_box_toggle").show();
       $("#obj_box_toggle").hide();
        $("#mix_box_toggle").hide();

      }

   };
</script>

>>>>>>> refs/remotes/origin/cbj2
<%@ include file="/WEB-INF/views/common/footer.jsp"%>