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
				<button style="float: left;" class="btn btn-link"
					onclick="history.go(-1)">뒤로가기</button>
				<button style="float: right;" class="btn btn-link"
					onclick="location.href='<c:url value='surveyinsertcomplete.do/${SLD.surveySeq}'/>'">등록완료</button>
				<!-- 설문지 설정 진택 -->

				<div class="container_survey">
					<div class="row" style="margin-top: 45px;"></div>

					<div class="inner_container">
						<div class="container_flex"
							style="border-radius: 20px; box-shadow: 1px 1px 10px 0px; padding: 20px; width: 450px;">
							<div class="input_title">기본 설정</div>
							<form:form modelAttribute="SLD" id="survey_setting_form">
								<table style="border-collapse: collapse;">
									<tr>
										<th><div style="margin-top: 8px;"></div></th>
									</tr>

									<tr>

										<td><span class="insert_category"><b>설문지 제목</b><label
												for="survey_name"></label></span></td>
										<td><input type="text" id="survey_name" name="surveyName"
											style="width: 200px;" value="${SLD.surveyName}"></td>

									</tr>

									<tr style="border-bottom: 3px solid gainsboro;">
										<th><div style="margin-top: 8px;"></div></th>
									</tr>
									<tr>
										<th><div style="margin-top: 8px;"></div></th>
									</tr>
									<tr>
										<td><span class="insert_category"> <b>평가 기간</b>
										</span></td>
										<td><input type="date" name="surveyStartDate"
											class="survey_date"
											value="<fmt:formatDate value='${SLD.surveyStartDate}' pattern='yyyy-MM-dd' />">-
											<input type="date" name="surveyClosedDate"
											class="survey_date"
											value="<fmt:formatDate value='${SLD.surveyClosedDate}' pattern='yyyy-MM-dd' />"></td>
									</tr>

									<tr style="border-bottom: 3px solid gainsboro;">
										<th><div style="margin-top: 8px;"></div></th>
									</tr>
									<tr>
										<th><div style="margin-top: 8px;"></div></th>
									</tr>

									<tr>
										<td><span class="insert_category"> <b>익명/기명</b></span></td>
										<td><c:if test="${SLD.anonymityCheckCode eq '20001'}">
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
									</tr>
									<tr style="border-bottom: 3px solid gainsboro;">
										<th><div style="margin-top: 8px;"></div></th>
									</tr>
									<tr>
										<th><div style="margin-top: 8px;"></div></th>
									</tr>

								</table>

								<span class="insert_category"><b>상세 설명</b></span>
								<br>
								<div style="margin-top: 8px;"></div>
								<textarea class="visually-hidden" id="message-text"
									name="surveyContent"
									style="width: 350px; height: 100px; max-width: 350px;">${SLD.surveyContent }</textarea>

								<input type="hidden" name="stateCode" value="30001">
								<input type="hidden" name="surveySeq" id="surveyseq"
									value="${SLD.surveySeq}">

							</form:form>
							<input type="button" class="update_btn"
								style="margin-bottom: 10px; float: right;" onclick="register()"
								value="적용">

						</div>


						<div>
							<div class="question_inputdv" id="input_question">
								<div class="input_title">문제 관리</div>

								<form:form modelAttribute="SQD" id="questioN_insert_form">
									<!-- aa -->
									<div id="insertQform">

										<div class="select_radio" id="select_radio">
											<input type="radio" name="questionTypeCode" id="obj_radio"
												onclick="checkit1()" value="10001" checked>&nbsp;객관식
											&nbsp;&nbsp;&nbsp; <input type="radio"
												name="questionTypeCode" id="subj_radio" onclick="checkit2()"
												value="10002"> &nbsp;주관식 &nbsp;&nbsp;&nbsp; <input
												type="radio" name="questionTypeCode" id="mix_radio"
												onclick="checkit3()" value="10003"> &nbsp;혼합식
											&nbsp;&nbsp;&nbsp;
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
													style="margin-left: 4.48px;"
													onclick="qusUpdate(${SLD.surveySeq})">문제 수정</button>

												<input type="hidden" name="surveySeq" id="seq"
													value="${SLD.surveySeq }"> <input type="hidden"
													name="questionSeq" value="2">
												<!-- 비동기로 바꿔 넣어보자 -> 문항도 마찬가지 -->
											</div>

											<input type="hidden" name="itemScore" value="1"> <input
												type="hidden" name="itemContent" value=" "> <input
												type="reset" value="" id="reset_btn" style="display: none">
										</div>
									</div>
								</form:form>
							</div>

							<div class="question_management">
								<div class="input_title">문제 목록</div>
								<div id="scroll_area" style="overflow: auto; height: 450px;">

									<c:if test="${empty SQL}">
										<br>
										<b>${NoQuestion}</b>
									</c:if>
									<!-- 여기까지 문제 div -->

									<c:forEach items="${SQL}" var="qlist">
										<div id="queAfter">

											<input type="hidden" value="${qlist.surveySeq }"
												id="surveySequence">
											<div class="input_qus" id="checkTouch">
												<input disabled type="text" id="input_qus"
													value="${qlist.questionContent }">
											</div>

											<!-- 조회 버튼 -->
											<button value="${qlist.questionSeq }"
												onclick="touchQuestion(this)"
												style="border: 1px solid #fff; border-radius: 35em; background: white;">
												<i class="fas fa-search"></i>
											</button>

											<button class="delete_btn"
												onclick="deleteQus(this,${qlist.surveySeq})"
												style="background: white;" value="${qlist.questionSeq }">
												<i class="fa-regular fa-trash-can"></i>
											</button>
											<div class="blank_under"></div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>


						<div class="item_management">
							<div class="input_title">문항 관리</div>
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
														value="수정">
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
														onclick="update_mix_item_btn()" value="수정">

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
					<!--  문제관리 끝 -->


				</div>
			</div>
		</div>
	</div>
</div>
<script>

   // 문제 누르면 touch버튼(돋보기) 활성화
   $(document).ready(function(){
        $('div#checkTouch').click(function(){
           $(this).next('button').click();

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
   
 
   //문제 추가 후 문항 추가
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
   
//    function resetIt(){
//       var evt = document.createEvent("MouseEvents");
//       evt.initMouseEvent("click", true, true, window,0, 0, 0, 0, 0, false, false, false, false, 0, null);
//       var reset = document.getElementById("reset_btn");
//       reset.dispatchEvent(evt);
//    }
   
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
               location.reload();

           
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
            });
         }
    
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
                oneQuestion(data);

                itemHtml(data);
              
              
            }, error:function(e) {   //실패, 에러
               console.log("Error", e);
            }
      });
   }
   //문제 확인 시 객주흔중에서 문제에 해당하는 유형이 나오게
   function oneQuestion(data){
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
      html += `<div class="question_add_btn_div">`;  
      html += '<button type="button" class="create_btn" id="add_btn" onclick="insertQus()">문제 추가</button>';
      html += '&nbsp;&nbsp;<button type="button" class="create_btn"  id="update_btn" onclick="qusUpdate('+data[0].SURVEY_SEQ+','+data[0].QUESTION_TYPE_CODE+')">문제 수정</button>';
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
      $('#questioN_insert_form').append(html);
   }
   
   function NewQuestion(data){
       let html = '';
       $("#questioN_insert_form").empty();
        html +=` <div id="insertQform">
              <div class="select_radio" id="select_radio">`;
   
        html += '<input type="radio" name="questionTypeCode" id="obj_radio" onclick="checkit1()" checked value="10001">&nbsp;객관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
        html += '<input type="radio" name="questionTypeCode" id="subj_radio" onclick="checkit2()" value="10002"> &nbsp;주관식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
        html += '<input type="radio" name="questionTypeCode" id="mix_radio" onclick="checkit3()" value="10003"> &nbsp;혼합식&nbsp;&nbsp;&nbsp&nbsp;&nbsp;';
  
     html += `</div>`;
     html += '<div class="question_content_area" id="question_add"> <div class="input-group" id="question_content">';

     html += '<textarea class="form-control" aria-label="문제 입력칸" id="hi" name="questionContent">'
     html += '</textarea></div>';
     html += `<div class="question_add_btn_div">`;  
     html += '<button type="button" class="create_btn" id="add_btn" onclick="insertQus()">문제 추가</button>';
     html += '&nbsp;&nbsp;<button type="button" class="create_btn"  id="update_btn" onclick="qusUpdate('+data[0].SURVEY_SEQ+','+data[0].QUESTION_TYPE_CODE+')">문제 수정</button>';
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
     $('#questioN_insert_form').append(html);
  }
   //문제 입력 채우 코드에 추가한 것 끝
   // 진택 끝
   //채우
   /*문제 삭제*/
//    function delete_btn(obj) {
//       const tag = $(obj);
//       tag.parent().remove();
//    }
      function qusUpdate(surveySeq,typeCode){
         var qdiv = $('#questioN_insert_form')[0]
          console.log("업데이트 시작");
         var data = new FormData(qdiv);
         
         if(typeCode !=data.get("questionTypeCode")){
            $.ajax({
                 method: 'POST',
                 url: 'deleteItem.do/'+data.get("questionSeq"),
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
         }
         
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

<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>