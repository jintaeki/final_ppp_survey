<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>
<script src="resources/js/survey.js"></script>
<script src="resources/js/surveycountdown.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey_list.css" />



<script>



function delete_mapping_btn(){
	  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	      document.form.submit();
	  }else{   //취소
	      return;
	  }
	}


	function delete_survey_btn(obj,surveyseq,selection,pageno,anonyMityCheckCode,surveyStartDateLeft, surveyStartDateRight){
		if(confirm("삭제하시겠습니까?")){
		let bselection = selection;
		let bpageno = pageno;
		let banonyMityCheckCode = anonyMityCheckCode;
		let bkeyword = $('#selectedKeyword').val();
		let bsurveyStartDateLeft = surveyStartDateLeft;
		let bsurveyStartDateRight = surveyStartDateRight;
	  	var keyword = $('#selectedKeyword').val();
// 		if(date==''){
// 			date = new Date('1111-11-11');
// 			const year = date.getFullYear();
// 			const month = date.getMonth();
// 			const day = date.getDate();

// 			currentDay = new Date(year, month, day).toLocaleDateString();
// 			currentDay = currentDay.replaceAll('.','-');
// 			currentDay = currentDay.replaceAll(' ', '');
// 			currentDay = currentDay.slice(0,-1);

// 			let firstTemp = currentDay.split('-')[0];
// 			let middleTemp = currentDay.split('-')[1];

// 			let lastTemp = currentDay.split('-')[2];
// 			if(Number(firstTemp<10)) firstTemp = '0' +firstTemp;
// 			if(Number(middleTemp<10)) middleTemp = '0' + middleTemp;
// 			if(Number(lastTemp<10)) lastTemp = '0'+lastTemp;

// 			currentDay = firstTemp+'-'+middleTemp+'-'+lastTemp;
// 			date = currentDay;

// 		}
	  	if(surveyStartDateLeft ==''){
			surveyStartDateLeft == 'emptyLeftDate';
		}
		if(surveyStartDateRight ==''){
			surveyStartDateRight == 'emptyRightDate';
		}
		if(keyword==''){
			keyword= 'empty';

		}

		console.log(date);

		$.ajax({
	         method:'POST', //어떤 방식으로 보낼 지
	            url:'deletesurvey.do/'+ surveyseq+'/'+pageno +'/'+keyword+'/'+selection+'/'+anonyMityCheckCode+'/'+surveyStartDateLeft+'/'+surveyStartDateRight, // qdiv를 보낼 경로 설정
	            processData : false,
	            async: false,
	            contentType : false,
	            cache : false,
	            beforeSend : function() { //보내기 전 실행
	            console.log("삭제 요청이 보내지는가?");
	         },
	            success:function (data) {    //전송 성공시 실행

	    		const tag= $('#'+surveyseq);
	        	tag.remove();
	            location.href='/survey/surveysearch?pageNo='+bpageno+'&keyword='+bkeyword+'&selection='+bselection+'&anonyMityCheckCode='+banonyMityCheckCode+'&surveyStartDateLeft='+surveyStartDateLeft+'&surveyStartDateRight='+surveyStartDateRight;
	            }
	       });


		}
	};


	function sendRe(obj){
		var pageno = $('#pageNo').val();
  		var surveyseq = $(obj).val();
  		console.log(surveyseq)
//   		$.ajax({
// 			method:'POST', //어떤 방식으로 보낼 지
// 			url:'sendmessage.do/'+surveyseq+'/'+pageno, // qdiv를 보낼 경로 설정
// 		    beforeSend : function() { //보내기 전 실행
// 			console.log("요청이 보내지는가?");
// 		   },
// 		   success:function () {	 //전송 성공시 실행
// 			console.log("굿");
// 			const tag = $(obj);
// 			console.log(tag);
// 			const completeMsg = `전송완료`;

// 			tag.parent().html(completeMsg);
// 			tag.hide

// 		   }, error:function(e) {	//실패, 에러
// 			   console.log("Error", e);
// 		   }
// 			});
	}


  	function send() {

  		var pageno = $('#pageNo').val();
  		var surveyseq = $('#surveyseq').val();
  		var deliverycontent = $('#deliverycontent').val();

  		console.log(deliverycontent);

		$.ajax({
			method:'POST', //어떤 방식으로 보낼 지
			url:'sendmessage.do/'+surveyseq+'/'+pageno, // qdiv를 보낼 경로 설정
			data:{
				deliveryContent: deliverycontent
			},
		    beforeSend : function() { //보내기 전 실행
			console.log("요청이 보내지는가?");
		   },
		   success:function (data) {	 //전송 성공시 실행
			console.log("굿");
			const tag = $('#'+surveyseq+'_send');
			console.log(tag);
			console.log(surveyseq);

			$('#exampleModal1').modal('hide');

			const text = '<button type="button" class="btn btn-link" onclick="location.href='+'\'evaluateSearch/' +surveyseq+ '\'">조회</button>';
 			tag.parent().parent().next().append(text);

 			const done = `매핑완료`;
			tag.parent().parent().next().next().append(done);
			console.log(tag.parent().parent().next().next().children('button'));
			tag.parent().parent().next().next().children().hide();
			tag.parent().parent().prev().prev().children().click(function(){return false;});
			tag.parent().parent().prev().prev().children('#surveyUP').css('color', '#ccc');

 			const complete = `알림발송완료`;
 			tag.parent().html(complete);
 			tag.parent().css('font-weight', 'bold');
 			tag.parent().css('color', '#F06');

			tag.parent().parent().parent().closest('td').css('color', 'black');
			tag.parent().parent().parent().closest('td').css('disabled', true);


		   }, error:function(e) {	//실패, 에러
			   console.log("Error", e);
		   }
			});


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


  	function btn_for_mapping(surveySeq, stateCode){
  		if(stateCode == '30002'){
  		  newMapping(surveySeq)
  	    }else if(stateCode == '30003'){
  		  reMapping(surveySeq)
  	    }
  	}


  	function newMapping(serveySeq){
  		html ="";
  		html += '<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
  		html += ' <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="exampleModalLabel">매핑 조건 선택</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
  	    html += '<span aria-hidden="true">&times;</span></button>';
  	    html += '</div>';
  	    html += '<div class="modal-body">'
  	   	html += '<c:url value="/mapping/set.do" var="actionURL"/>';
  	   	html += '<form:form action="${actionURL}" modelAttribute="map">';
  	   	html += '<input type="hidden" id="surveySeq" name="surveySeq" value="'+serveySeq+'">';
  	   	html += '<input type="hidden" id="newCheck" name="newCheck" value="0">';
  	   	html += '<br> <h5> 다면평가에 포함될 프로젝트의 범위 정하기 </h5> <select class="form-control" name="month"> <option value="3">최근 3개월 동안에 끝난 프로젝트</option> <option value="6">최근 6개월 동안에 끝난 프로젝트</option> <option value="12">최근 1년 동안에 끝난 프로젝트</option>';
  		html +=	'<option value="24">최근 2년 동안에 끝난 프로젝트</option> <option value="36">최근 3년 동안에 끝난 프로젝트</option> </select>';
  		html += '<br> <h5>피평가자 최대 인원</h5> <input type="number" name="number" placeholder="인원을 입력해주세요" min="1" style="width: 100%; height: calc(1.5em + 0.75rem + 2px); padding: 0.375rem 0.75rem;">';
  	    html += '<div class="modal-footer"> <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> <input type="submit" class="btn btn-primary" value="매핑">';
  	    html += '</div></form:form></div></div></div></div>';
  	    $('#beforeModal').after(html);
  	}

  	function reMapping(serveySeq){
  		html ="";
  		html += '<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
  		html += ' <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="exampleModalLabel">다시 매핑 하시겠습니까?</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
  	    html += '<span aria-hidden="true">&times;</span></button>';
  	    html += '</div>';
  	    html += '<div class="modal-body">'
  	   	html += '<c:url value="/mapping/set.do" var="actionURL"/>';
  	   	html += '<form:form action="${actionURL}" modelAttribute="map">';
  	   	html += '<input type="hidden" id="surveySeq" name="surveySeq" value="'+serveySeq+'">';
  	   	html += '<input type="hidden" id="month" name="month" value="3">';
  	   	html += '<input type="hidden" id="number" name="number" value="3">';
  	   	html += '<br> <h5> 해당 다면평가의 매핑을 새로 하시겠습니까? </h5>';
  	   	html += '<br><button type="submit" class="btn btn-outline-danger" id="newCheck" name="newCheck" value="1" onclick="delete_mapping_btn();">삭제하고 새로 시작하기</button>';
  	   	html += '<button type="submit" class="btn btn-outline-success" id="newCheck" name="newCheck" value="0">저장된 매핑 데이터로 넘어가기</button>';
  	    html += '<div class="modal-footer"><br><button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
  	    html += '</div></form:form></div></div></div></div>';
  	    $('#beforeModal').after(html);
  	}

  	function updatemessage(surveyseq){
		html ="";
  	  	html +='<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
  	  	html +='<div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="exampleModalLabel">평가 공시 재전송</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
  	  	html +='<span aria-hidden="true">&times;</span></button>';
  	  	html +='</div>';
  	  	html +='<div class="modal-body">';
  	  	html +='<input type="hidden" id="surveyseq" value="'+surveyseq+'">';
  	  	html +='<div class="form-group"> <label for="exampleFormControlTextarea1">평가를 하지 않은 평가자에게 재전송할 메세지를 입력하시오</label>';
  	  	html +='<textarea class="form-control" id="deliverycontent" rows="3"></textarea></div>';
  	  	html +='<div class="modal-footer"> <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
  	  	html +='<button type="button" class="btn btn-primary" onclick="send()">등록</button>';
  	  	html +='</div></div></div></div></div>';
  	    $('#beforeModal').after(html);
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
  			else{alert("등록 성공. 관리 페이지로 이동합니다.");location.href="/survey/surveyinsert?surveyseq="+result;
			};


  		}
	});

  }


  	function setforcedataform() {
  		var form = $('#surveyDataForm')[0];
  		var dataform = new FormData(form);

  		$.ajax({
  		url:'/survey/forcemappingset.do',
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
  			else{alert("등록 성공. 관리 페이지로 이동합니다.");location.href="/survey/surveyinsert?surveyseq="+result;
		};


  		}




  		});
  	}





  	function reset_btn(){
  		$('.searchRangeAll').empty();
  		html='';
  		html +=`<div class="searchRange"><b>평가 시작 시간:</b>`;
		html +=`<input type="date" name="surveyStartDateLeft" id="selectedDate">
				<input type="date" name="surveyStartDateRight" id="selectedDate">`;

		html +=`	<select name="anonyMityCheckCode">
					<option value="30005">전체</option>
					<option value="30002">기명</option>
					<option value="300001">익명</option>
					</select>
				<select name="selection">

				<option value="30005">전체</option>
				<option value="30004">알림 발송 완료</option>
				<option value="30003">매핑 완료</option>
				<option value="30002">평가지 등록 완료</option>
				<option value="30001">작성 중</option>
				</select> </div>`;

		html +=`<div class="input-group-append">
				<input type="text" class="form-control" id="selectedKeyword" placeholder="search" name="keyword" aria-describedby="button-addon2">
				<input type="hidden" name="pageNo" value="1">
				<input type="submit" class="btn btn-outline-secondary"
					id="button-addon2" value="검색"> <input type="button" style="margin-left:10px;"
					class="btn btn-outline-secondary" onclick="reset_btn()" value="초기화">
				</div>
				</div>`;
  		$('.searchRangeAll').append(html);

  	}


</script>

<div class="col-11" >
	<!-- modal(설문 등록 시 뜨는 팝업창) -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">평가지 설정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>


				<div class="modal-body">
					<c:url value="/survey/set.do" var="actionURL" scope="page" />
					<form:form action="${actionURL}" modelAttribute="SLD" id="surveyDataForm">

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">평가지 이름</label>
							<input type="text" class="form-control" id="recipient-name"
								name="surveyName">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">평가 부가 설명</label>
							<textarea class="form-control" id="message-text"
								name="surveyContent"></textarea>
						</div>
						<input type="hidden" name="stateCode" value="30001">
						<input type="hidden"> 평가 진행 기간<br>

						<input type="date" name="surveyStartDate" pattern="yyyy-MM-dd">~<input
							type="date" name="surveyClosedDate" pattern="yyyy-MM-dd">
						<br>
						<br>
						<div style="display: flex;align-items: center;">
						<input type="radio" name="anonymityCheckCode" value="20001">익명 &nbsp;
						<input type="radio" name="anonymityCheckCode" value="20002">기명
						</div>
						<br>
						<input type="hidden"> 평가지 복사<br>
						<select name="surveySeq">
							<option value="0">평가지 선택</option>
							<c:forEach var="list" items="${surveylist}">
								<option value="${list.surveySeq} ">${list.surveyName }</option>
							</c:forEach>
						</select>
						<br>
						<br>
					<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<input type="button" onclick="setdataform()" class="btn btn-primary" value="등록">

						</div>
					</form:form>
				</div>

			</div>
		</div>
	</div>
	<!-- modal(설문 등록 시 뜨는 팝업창) 끝-->


	<div class="card" id="beforeModal">
		<div class="card-body">
			<div class="forshadowing">
				<div class="row">
				<div class="col-12" style="margin-bottom:30px;"><h3 style="text-align: center;
    height: 60px; line-height: 60px;"><b>평가지 목록</b></h3></div>
					<div class="hmenu">
						<div class="survey_list_form_upper_dv">
							<form action="<c:url value='/survey/surveysearch'/>"
								method="POST" class="survey_list_form" style="display: flex;">
								<div class="searchRangeAll">
								<div class="searchRange">
								<b>평가 시작 시간:</b>
								<input type="date" name="surveyStartDateLeft" id="selectedDate"
									value="<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />">
								<input type="date" name="surveyStartDateRight" id="selectedDate"
									value="<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">
								<select name="anonyMityCheckCode">
									<c:forEach items="${commonCodeList}" var="commonCode">
										<c:if
											test="${pagingdto.anonyMityCheckCode eq commonCode.codeDetailId}">
											<c:if
												test="${commonCode.codeId eq '200' or commonCode.codeDetailId eq '30005'}">
												<option selected value="${commonCode.codeDetailId}">${commonCode.codeDetailName }</option>
											</c:if>
										</c:if>
										<c:if
											test="${pagingdto.anonyMityCheckCode ne commonCode.codeDetailId}">
											<c:if
												test="${commonCode.codeId eq '200' or commonCode.codeDetailId eq '30005'}">
												<option value="${commonCode.codeDetailId}">${commonCode.codeDetailName }</option>
											</c:if>
										</c:if>
									</c:forEach>
								</select> <select name="selection">
									<c:forEach items="${commonCodeList}" var="commonCode">
										<c:if test="${commonCode.codeId eq '300' }">
											<c:if
												test="${pagingdto.selection eq commonCode.codeDetailId }">
												<option selected value="${pagingdto.selection}">${commonCode.codeDetailName }</option>
											</c:if>
											<c:if
												test="${pagingdto.selection ne commonCode.codeDetailId }">
												<option value="${commonCode.codeDetailId}">${commonCode.codeDetailName }</option>
											</c:if>
										</c:if>
									</c:forEach>
								</select>
								</div>

								<div class="input-group-append">
								<input type="text" class="form-control" id="selectedKeyword"
									placeholder="search" name="keyword"
									value="${pagingdto.keyword}" aria-describedby="button-addon2">
								<input type="hidden" name="pageNo" value="1">

									<input type="submit" class="btn btn-outline-secondary"
										id="button-addon2" value="검색"> <input type="button" style="margin-left:10px;"
										class="btn btn-outline-secondary" onclick="reset_btn()"
										value="초기화">
								</div>
								</div>
							</form>


						</div>
					</div>
					<table class="table table-sm table-striped table-hover">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">다면평가 목록</th>
								<th scope="col">평가 기간</th>
								<th scope="col">진행상태</th>
								<th scope="col">결과</th>
								<th scope="col">평가자 매칭</th>

							</tr>
						</thead>
						<tbody>

							<c:forEach var="list" items="${surveylist}">
								<tr id="${list.surveySeq }">


									<th scope="row">
										<button class="delete_survey_btn"
											style="border: none; opacity: 0.3;"
											onclick="delete_survey_btn(this,${list.surveySeq}, ${pagingdto.selection},  ${pagingdto.pageNo}, ${paging.anonyMityCheckCode},${paging.surveyStartDateLeft},${paging.surveyStartDateRight} )">

											<i class="fas fa-xmark"></i>
										</button>
									<td><c:if test="${list.stateCode ne '30004'}">
											<a href="surveyinsert?surveyseq=${list.surveySeq}"  id="surveyUP">${list.surveyName }</a> &nbsp;

										</c:if> <c:if test="${list.stateCode eq '30004'}">
									${list.surveyName }

								</c:if></td>
									<td><fmt:formatDate value="${list.surveyStartDate }"
											pattern='yyyy-MM-dd' /> &nbsp;~&nbsp; <fmt:formatDate
											value="${list.surveyClosedDate }" pattern='yyyy-MM-dd' /></td>

									<td><span class="wait" id="stateCode"> <c:if
												test="${list.stateCode eq '30003'}">
												<button class="btn btn-outline-primary" data-toggle="modal"
													data-target="#exampleModal1" id="${list.surveySeq}_send"
													onclick="updatemessage('${list.surveySeq}')">발송</button>
														<input type="button" onclick="setforcedataform()" class="btn btn-primary" value="강제 진행">
											</c:if> <c:if test="${list.stateCode ne '30003'}">
										${list.codeDetailName }
									</c:if>

									</span></td>

									<td><c:if test="${list.stateCode eq '30004'}">
											<button type="button" class="btn btn-link"
												onclick="location.href='<c:url value='evaluatesearch/${list.surveySeq}'/>'">조회</button>
										</c:if> <input type="hidden" id="pageNo" name=pageNo
										value="${pagingdto.startPageNo}"></td>

									<td><c:if test="${list.stateCode ne '30004'}">
											<input type="hidden" class="stateCode"
												value="${list.stateCode}">
											<button type="button" class="btn btn-outline-primary"
												id="btn_for_mapping" data-toggle="modal"
												data-target="#exampleModal1"
												onclick="btn_for_mapping('${list.surveySeq}', '${list.stateCode}')">매핑</button>
										</c:if> <c:if test="${list.stateCode eq '30004'}">
									<button type="button" class="btn btn-secondary" disabled>매핑완료</button>
								</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<table class="paging-table">
						<div style="border: none;">
							<tr>
								<td colspan="12" class="text-center" style="border: none;">

								<button id="upper_dv_btn"
										type="button" class="btn btn-outline-secondary" data-toggle="modal"
										data-target="#exampleModal" data-whatever="@mdo">등록</button>

									<div>

										<a class="btn btn-outline-secondary"
											href="surveysearch?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">처음</a>
										<c:if test="${pagingdto.groupNo>1}">
											<a class="btn btn-outline-secondary"
												href="surveysearch?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">이전</a>
										</c:if>

										<c:forEach var="i" begin="${pagingdto.startPageNo}"
											end="${pagingdto.endPageNo}">
											<c:if test="${pagingdto.pageNo != i}">
												<a class="btn btn-outline-secondary"
													href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">${i}</a>
											</c:if>
											<c:if test="${pagingdto.pageNo == i}">
												<a class="btn btn-secondary"
													href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">${i}</a>
											</c:if>
										</c:forEach>

										<c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
											<a class="btn btn-outline-secondary"
												href="surveysearch?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">다음</a>
										</c:if>
										<a class="btn btn-outline-secondary"
											href="surveysearch?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">맨끝</a>
									</div>
								</td>
							</tr>
						</table>


				</div>

			</div>
			<!--  평가지  -->
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>
