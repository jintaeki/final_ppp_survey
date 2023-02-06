
<body>
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
														<!-- 문제 가져오자 -->



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
</body>

<script>

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
       htmlSubj += '<input type="text" placeholder="주관식 문제입니다." value="'+data[0].QUESTION_SEQ+'" readonly>'
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

</script>