
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



function manageQus(obj,questionSeq,questionTypeCodes,surveySeq){
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

		        	  if(pairvalues==''){
		        		  alert("빈 텍스트는 저장이 불가합니다.");
		        		  return false;
		        	  }
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
				         dataType: 'json',
				         beforeSend : function() {
				            // 전송 전 실행 코드
				         },
				         success : function(data) {
				 				tag.parent().parent().parent().remove();

				        	 console.log(data[0].questionSeq);
				        	 if(data[0].questionSeq==0){
				        		 alert("빈 텍스트는 저장이 불가합니다.");
				        		 location.reload();
				        	 }else{
				        		 console.log(data);
				        		 location.reload();



// 				        	         var testDiv ='';
// 	   	testDiv +='<div class="deleteThis" style="display:flex;">';
//       	testDiv +='<button class="delete_btn" onclick="deleteQus(this,'+surveySeq+')"  value="'+data[0].questionSeq+'"><i class="fas fa-xmark"></i></button>';
// 	 	testDiv +='<form id="'+data[0].questionSeq+'" name="'+data[0].questionSeq+'" onsubmit="return false;">';
// 	   	testDiv +='<div class="input_qus" id="checkTouch1">';
// 	   	testDiv +='<input type="hidden" name= "surveySeq" value="'+surveySeq+'" id="surveySequence">';
// 		testDiv +='<input type="hidden" name= "questionSeq" value="'+data[0].questionSeq+'">';
// 		testDiv +='<input type="text" name="questionContent"  id="input_qus"  onclick="manageQus(this,'+data[0].questionSeq+',10001,'+surveySeq+'); this.onclick=null;" value="'+data[0].questionContent+'">';
// 		testDiv +='</div>&nbsp;';
// 		testDiv +='&nbsp;&nbsp;<input type="radio" id="obj_radio" name="'+data[0].questionSeq+'" value="10001" onclick="checkit1(this,10001,'+data[0].questionSeq+','+data[0].questionSeq+')" checked> 객관식';
// 		testDiv +='&nbsp;&nbsp;<input type="radio" id="subj_radio" name="'+data[0].questionSeq+'" value="10002" onclick="checkit2(this,10001,'+data[0].questionSeq+','+data[0].questionSeq+')"> 주관식';
// 		testDiv +='&nbsp;&nbsp;<input type="radio" id="mix_radio" name="'+data[0].questionSeq+'" value="10003" onclick="checkit3(this,10001,'+data[0].questionSeq+','+data[0].questionSeq+')"> 혼합식';
//       	testDiv +='</form>';
//       	testDiv +='<button value="'+data[0].questionSeq+'" onclick="touchQuestion(this)"style="display:none;">';
//       	testDiv +='</button>';

//       	testDiv +='<div class="blank_under"></div>';
//       	testDiv +='</div>';
// 	        $('#queAfter').prepend(testDiv);
// 	        $(obj).parent().next('button').click();
// 	        console.log( $(obj).parent().next('button'));

// 				        	        $('#queAfter div form div input[name=questionContent]').first().focus();
// 				        	        $('#'+data[0].questionSeq).children().children().next().next().click();
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
	            	window.location.replace("/survey/surveysearch.do");
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
        	console.log($(this).parent().next('button'));
           $(this).parent().next().click();

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
	   	testDiv +='<tr class="deleteThis">';
	   	testDiv +='<td style="display:flex;">'
      	testDiv +='<button class="delete_btn" onclick="deleteQus(this,'+surveySeq+')" value="'+0+'"><i class="fas fa-xmark"></i></button>';
	 	testDiv +='<form id="0" name="0" onsubmit="return false;">';
	   	testDiv +='<div class="input_qus" id="checkTouch">';
	   	testDiv +='<input type="hidden" name= "surveySeq" value="'+surveySeq+'" id="surveySequence">';
		testDiv +='<input type="hidden" name= "questionSeq" value="0">';
		testDiv +='<input type="text" name="questionContent"  id="input_qus"  onclick="manageQus(this,0,10001,'+surveySeq+'); this.onclick=null;" value="">';
		testDiv +='</div>&nbsp;';
		testDiv +='&nbsp;&nbsp;<input type="radio" id="obj_radio" name="0'+newQuestionCnt+'" value="10001" onclick="checkit1(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+')" checked> 객관식';
		testDiv +='&nbsp;&nbsp;<input type="radio" id="subj_radio" name="0'+newQuestionCnt+'" value="10002" onclick="checkit2(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+')"> 주관식';
		testDiv +='&nbsp;&nbsp;<input type="radio" id="mix_radio" name="0'+newQuestionCnt+'" value="10003" onclick="checkit3(this,10001,0'+newQuestionCnt+',0'+newQuestionCnt+')"> 혼합식';
      	testDiv +='</form>';
      	testDiv +='<button value="'+0+'" onclick="touchQuestion(this)"style="display:none;">';
      	testDiv +='	<i class="fas fa-search"></i>';
      	testDiv +='</button>';

      	testDiv +='<div class="blank_under"></div>';
      	testDiv +='</td>';
      	testDiv +='</tr>';

        $('#queAfter').prepend(testDiv);

     $('#queAfter tr form div input[name=questionContent]').first().focus();
     $('#0').children().children().next().next().click();
//      $('#0').children().children().next().next().click();



// 		location.reload();
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
// 			   html  +='<div class="icon_line">';
			   html +='<tr id="TouchItem">';
			   html  +='<td><input type="hidden" name="questionSeq" value="' + questionSeq +'">';
			   html  +='<button type="button"  class="delete_btn" onclick="deleteItem(this,0)" >';
			   html  += '<i class="fas fa-xmark"></i>';
			   html  +=   '</button></td>';
			   html  += '<td><input type="text" name="itemContent" placeholder="문항 입력..." id="input_item" onclick="manageItem(this,'+questionSeq+');this.onclick=null;">';
			   html  +='</td><td><input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" onclick="manageItem(this,'+questionSeq+');this.onclick=null;">';
			   html  +='<input type="hidden" name="itemSeq" value="0"></td>';
			   html +='</tr>';
// 			   html  += '</div>';
			   cntObj = cntObj +1;

		   }
	   }else if (type=='10003'){

		   if(cntMix ==5){
			   alert("객관식 문항은 최대 5개까지 생성 가능합니다.");
		   }else if(cntMix < 5){
// 			   html  +='<div class="icon_line">';
			   html +='<tr id="TouchItem">';
		 	   html  +='<td><input type="hidden" name="questionSeq" value="' + questionSeq +'">';
		       html  +='<button type="button"  class="delete_btn" onclick="deleteItem(this,0)" >';
		       html  += '<i class="fas fa-xmark"></i>';
			   html  += '</button></td>';
		       html  += '<td><input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+questionSeq+');this.onclick=null;" >';
		 	   html  +='</td><td><input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" onclick="manageItem(this,'+questionSeq+');this.onclick=null;">';
			   html  +='<input type="hidden" name="itemSeq" value="0"></td>';
			   html +='</tr>';
// 		   	   html  += '</div>';
		   	   cntMix = cntMix +1;
		   }
	   }
	   $('.item').children().children().first().after(html);

	   $('.item table table-stripe tbody tr td input[name=itemContent]').first().focus();



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
						html +='<div style="display:flex; align-items: baseline;">';
						html  +='<div class="input_title">문항 관리</div>';
						html   += '</div>';
						html  +='<div class="itemAfter">';
						cntForTopOfItem = cntForTopOfItem + 1;

					 }else{
						html +='<div style="display:flex;align-items: baseline;">';
						html  +='<div class="input_title">문항 관리</div>';
						html  +='<button type="button" value="'+data[i].QUESTION_SEQ+'" onclick="item_copy(this,'+data[i].QUESTION_TYPE_CODE+')" style="background: white; border: 1px solid #fff; border-radius: 35em;">';
						html 	+='<i class="fas fa-plus"></i>';
						html  +='</button>';
						html   += '</div>';
						html  +='<form id="i'+data[i].QUESTION_SEQ+'"onsubmit="return false;">';
						html +='<input type="hidden" name=surveySeq value="'+data[i].SURVEY_SEQ+'">';
						html +='<input type="hidden" name="questionTypeCode" value="'+data[i].QUESTION_TYPE_CODE+'">';
						html+='<table class="item table table-stripe"><tr><th class="itemdeletebtn"></th><th class="itemContent">문항</th><th>점수</th></tr>';
// 						html  +='<div class="itemAfter">';


						cntForTopOfItem = cntForTopOfItem + 1;
					 }
				 }
			 if(data[i].QUESTION_TYPE_CODE == "10001"){
				 console.log(data[i].QUESTION_TYPE_CODE);
				 if(data[i].ITEM_SEQ == null){
// 					html  +='<div class="icon_line">';
					html +='<tr id="TouchItem">';
					html  +='<td><input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
					html  +='<button type="button"  class="delete_btn" onclick="deleteItem(this,0)" value="'+data[i].QUESTION_SEQ+'">';
					html  += '<i class="fas fa-xmark"></i>';
					html  +=   '</button></td>';
					html  += '<td><input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;">';
					html  +='</td><td><input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" onclick="manageItem(this,'+data[i].QUESTION_SEQ+');this.onclick=null;">';
					html  +='<input type="hidden" name="itemSeq" value="0"></td>';
// 					html  +='</div>'
				    html  += '</tr>';
// 				    html  +='<div class="icon_line">';
					html +='<tr id="TouchItem">';
					html  +='<td><input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
				    html  +='<button type="button"  class="delete_btn" onclick="deleteItem(this,0)" value="'+data[i].QUESTION_SEQ+'">';
				    html  += '<i class="fas fa-xmark"></i>';
				    html  +=   '</button></td>';
				    html  += '<td><input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;">';
				    html  +='</td><td><input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" onclick="manageItem(this,'+data[i].QUESTION_SEQ+');this.onclick=null;">';
				    html  +='<input type="hidden" name="itemSeq" value="0"></td>';
				    html  +='</tr>';
// 				    html  += '</div>';

				        cntObj = cntObj + 2;

				 }else{

// 					 html  +='<div class="icon_line">';
					 html +='<tr id="TouchItem">';
					 html  +='<td><input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
			         html  +='<button type="button"  class="delete_btn" onclick="deleteItem(this,'+data[i].ITEM_SEQ+')" value="'+data[i].QUESTION_SEQ+'">';
				     html  += '<i class="fas fa-xmark"></i>';
				     html  +=   '</button></td>';
			         html  += '<td><input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;" value="'+data[i].ITEM_CONTENT+'">';
			         html  +='</td><td><input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;">';
				     html  +='<input type="hidden" name="itemSeq" value="'+data[i].ITEM_SEQ+'"></td>';
				     html  +='</tr>';
// 				     html  += '</div>';

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
// 					html  +='<div class="icon_line">';
					html +='<tr id="TouchItem">';
			        html  +='<td><input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
			        html +='<button type="button"  class="delete_btn" onclick="deleteItem(this,0)" value="'+data[i].QUESTION_SEQ+'">';
			        html += '<i class="fas fa-xmark"></i>';
			        html +=   '</button></td>';
			        html  += '<td><input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;">';
			        html  +='</td><td><input type="number" name="itemScore" min="0" value="0" style="min-width: 20px; max-width: 40px;" id="is" onclick="manageItem(this,'+data[i].QUESTION_SEQ+');this.onclick=null;">';
			        html  +='<input type="hidden" name="itemSeq" value="0"></td>';
			        html  +='</tr>';
// 			        html  += '</div>';
// 			        html  +='<div class="icon_line" id="guitar">';
					html +='<tr id="TouchItem">';
			        html  +='<td> <input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
			        html  += '<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></td><td><input type="text" name="itemContent" placeholder="기타" value="기타" id="guitar" readonly>';
			        html  +='</td><td><input type="hidden" name="itemScore"  value="0" >';
			        html  +='<input type="hidden" name="itemSeq" value="0"></td>';
					html  +='</tr>';
// 					html +='</div>';
					console.log(cntMix);
			        cntMix = cntMix + 2;

				 }else{
					 if(data[i].ITEM_CONTENT =="기타"){
// 		                html  +='<div class="icon_line" id="guitar">';
		 			    html +='<tr id="TouchItem">';
		                html  +='<td><input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
		                html  += '<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></td><td><input type="text" name="itemContent" id="guitar" value="'+data[i].ITEM_CONTENT+'" readonly>';
		                html  +='</td><td><input type="hidden" name="itemScore"  value="0">';
		                html  +='<input type="hidden" name="itemSeq" value="'+data[i].ITEM_SEQ+'"></td>';
		                html  += '</tr>';
// 		                html +='</div>';
		                console.log(cntMix);
		                cntMix = cntMix + 1;
				 	 }else{
// 				 		html  +='<div class="icon_line">';
						html +='<tr id="TouchItem">';
				 		html  +='<td><input type="hidden" name="questionSeq" value="' + data[i].QUESTION_SEQ +'">';
				        html  +='<button type="button"  class="delete_btn" onclick="deleteItem(this,'+data[i].ITEM_SEQ+')" value="'+data[i].QUESTION_SEQ+'">';
				        html  += '<i class="fas fa-xmark"></i>';
					    html  += '</button></td>';
				 		html  += '<td><input type="text" name="itemContent" placeholder="문항 입력..."  id="input_item" onclick="manageItem(this,'+data[i].QUESTION_SEQ+'); this.onclick=null;" value="'+data[i].ITEM_CONTENT+'">';
				 		html  +='</td><td><input type="number" name="itemScore" min="0" value="'+data[i].ITEM_SCORE+'" style="min-width: 20px; max-width: 40px;" id="is" value="'+data[i].ITEM_SCORE+'" onclick="manageItem(this,'+data[i].QUESTION_SEQ+');this.onclick=null;">';
					    html  +='<input type="hidden" name="itemSeq" value="'+data[i].ITEM_SEQ+'"></td>';
					    html  += '</tr>';
// 					    html +='</div>';
					    console.log(cntMix);
		                cntMix = cntMix + 1;

				 	 }


				 }


			  }//혼합식
			}//특정 문제의 문항만 출력
		 }//첫 for문
		 html +='</table>';
//  		html  +='</div>';
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
         		$(obj).parent().parent().remove();
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
		         		$(obj).parent().parent().remove();
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
	   $('#queAfter tr form div input[name=questionContent]').first().focus();
	   $('#queAfter tr form div input[name=questionContent]').first().click();


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

