function delete_mapping_btn(){
	  if (confirm("정말 삭제하시겠습니까??")){    //확인
	      document.form.submit();
	  }else{
		  alert("취소");
		  event.preventDefault();
		  return false;
	  }
	}


	function delete_survey_btn(obj,surveyseq){
		if(confirm("삭제하시겠습니까?")){

		$.ajax({
	         method:'POST', //어떤 방식으로 보낼 지
	            url:'deletesurvey.do/'+ surveyseq, // qdiv를 보낼 경로 설정
	            processData : false,
	            async: false,
	            contentType : false,
	            cache : false,
	            beforeSend : function() { //보내기 전 실행
	            console.log("삭제 요청이 보내지는가?");
	         },
	            success:function (data) {    //전송 성공시 실행
				location.reload();

	            }
	       });


		}
	};

  	function send() {

  		var surveyseq = $('#surveyseq').val();
  		var deliverycontent = $('#deliverycontent').val();

  		console.log(deliverycontent);

		$.ajax({
			method:'POST', //어떤 방식으로 보낼 지
			url:'sendmessage.do/'+surveyseq, // qdiv를 보낼 경로 설정
			data:{
				deliveryContent: deliverycontent
			},
		    beforeSend : function() { //보내기 전 실행
			console.log("요청이 보내지는가?");
		   },
		   success:function (data) {	 //전송 성공시 실행
			console.log("굿");
			alert('메일과 SMS가 잘 전송 되었습니다.');

			$('#exampleModal1').modal('hide');

		   }, error:function(e) {	//실패, 에러
			   console.log("Error", e);
		   }
		});
	}

  	function evaluateStart(surveySeq){

  		console.log(surveySeq);
		if(confirm("평가를 실행하겠습니까? 더이상 설문지를 변경하실수 없게 됩니다.")){
		$.ajax({
			method:'POST', //어떤 방식으로 보낼 지
			url:'evaluateStart.do/'+surveySeq, // qdiv를 보낼 경로 설정
			data:{
				surveySeq: surveySeq
			},
		    beforeSend : function() { //보내기 전 실행
			console.log("요청이 보내지는가?");
		   },
		   success:function (data) {	 //전송 성공시 실행
			console.log("굿");

			$('#exampleModal1').modal('hide');

			window.location.reload();

		   }, error:function(e) {	//실패, 에러
			   console.log("Error", e);
		   }
		});
		}
  	}

  	$(document).ready(function() {
  	    const stateCode = $(".stateCode");

  	    stateCode.each((index, element) => {
  	    	const value = $(element).val();
  	    	console.log($(element).parent().prev().prev().prev().prev().children());
  	    	if(value == 30001){
	  	    	$(element).next().attr('disabled', 'disabled');
  	    	}
  	    });
  	});


  	function search(){
  		var dateleft = $('[name=surveyStartDateLeft]').val();
  		var dateright = $('[name=surveyStartDateRight]').val();
  		console.log
		if (dateleft > dateright && dateright != ''){

			alert("날짜 조건이 알맞지 않습니다.");
			 event.preventDefault(); // 자식 하나만 영향

			 // event.stopPropagation(); 부모까지 영향 미치지 않고 그 외 자식만 영향
			return false;
		}else{

			document.getElementById('frm').submit();
		}







  	}

  	function setdataform(){

  		var form = $('#surveyDataForm')[0];
  		var dataform = new FormData(form);



  		$.ajax({
  		url:'/survey/set.do' ,
  		method:'POST',
  		data: dataform,
  		dataType: 'html',
  		processData : false,
        contentType : false,
        cache : false,
  		success:function(result){
  			if(result=="nameEmpty"){alert('제목을 입력해 주세요.'); return false;}
  			if(result=="nameLarge"){alert('제목이 너무 길어요. 15자까지 작성 가능합니다.');  return false;}
  			if(result=="noCode"){alert('익명 혹은 기명을 선택해 주세요.');  return false;};
  			if(result=="contentLarge"){alert('부가 설명이 너무 길어요. 150자 내로 입력 가능합니다.');  return false;}
  			if(result=="dateEmpty"){alert('날짜를 선택해 주세요.'); return false;}
  			if(result=="datemissmatch"){alert('날짜 조건이 알맞지 않습니다.'); return false;}
  			else{alert("등록 성공. 관리 페이지로 이동합니다.");location.href="/survey/surveyinsert.do?surveyseq="+result;
		};


  		}




  		});

  	}

  	function reset_btn(){
  		$('.searchRangeAll').empty();
  		html='';
  		html +=`<div class="searchRange"><b>평가 시작 시간: </b>`;
		html +=`<input type="date" name="surveyStartDateLeft" id="selectedDate">
				<input type="date" name="surveyStartDateRight" id="selectedDate">`;

		html +=`	<select name="anonyMityCheckCode">
					<option value="30005">전체</option>
					<option value="20002">기명</option>
					<option value="20001">익명</option>
					</select>
				<select name="selection">

				<option value="30005">전체</option>
				<option value="30004">알림 발송 완료</option>
				<option value="30003">매핑 완료</option>
				<option value="30002">평가지 등록 완료</option>
				<option value="30001">작성 중</option>
				</select> </div>`;

		html +=`<div class="input-group" style="width: 400px; right: 50px;">
				<input type="text" class="form-control" id="selectedKeyword" placeholder="search" name="keyword" aria-describedby="button-addon2">
				<input type="hidden" name="pageNo" value="1">
				<input type="submit" class="btn btn-outline-secondary"
					id="button-addon2" value="검색"> <input type="button" style="margin-left:10px;"
					class="btn btn-outline-secondary" onclick="reset_btn()" value="초기화">
				</div>
				</div>`;
  		$('.searchRangeAll').append(html);

  	}




