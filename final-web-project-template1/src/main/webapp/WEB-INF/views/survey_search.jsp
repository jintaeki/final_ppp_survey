<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>




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
	
			

  	function send(obj) {
  		
  		var pageno = $('#pageNo').val();
  		var surveyseq = $(obj).val();

  		console.log(surveyseq);

		$.ajax({
			method:'POST', //어떤 방식으로 보낼 지
			url:'sendmessage.do/'+surveyseq+'/'+pageno, // qdiv를 보낼 경로 설정	
		    beforeSend : function() { //보내기 전 실행
			console.log("요청이 보내지는가?");
		   },
		   success:function () {	 //전송 성공시 실행
			console.log("굿");
			const tag = $(obj);
			console.log(tag);
			console.log(surveyseq);
 			
			const text = '<button type="button" class="btn btn-link" onclick="location.href='+'\'surveyevaluate/' +surveyseq+ '\'">조회</button>';	
 			tag.parent().parent().next().append(text);	
 									

 			const complete = `알림발송완료`;
 			tag.parent().html(complete);
 			tag.parent().css('font-weight', 'bold');
 			tag.parent().css('color', '#F06');
 										
			tag.parent().parent().parent().closest('td').css('color', 'black');
			tag.parent().parent().parent().closest('td').css('disabled', true);
			const done=`매핑완룡`;
			tag.parent().parent().next().next().append(done);
			
		   }, error:function(e) {	//실패, 에러
			   console.log("Error", e); 
		   }
			});
		

	}
  	
  	function btn_for_mapping(obj){
  		var seqValue=$(obj).val();
  		html ="";
  		html += '<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
  		html += ' <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="exampleModalLabel">매핑 조건 선택</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
  	    html += '<span aria-hidden="true">&times;</span></button>';
  	    html += '</div>';
  	    html += '<div class="modal-body">'
  	   	html += '<c:url value="/mapping/set.do" var="actionURL"/>';
  	   	html += '<form:form action="${actionURL}" modelAttribute="map">';
  	   	html += '<input type="hidden" id="surveySeq" name="surveySeq" value="'+seqValue+'">';
  	   	html += '<br> <h5> 다면평가에 포함될 프로젝트의 범위 정하기 </h5> <select class="form-control" name="month"> <option value="3">최근 3개월 동안에 끝난 프로젝트</option> <option value="6">최근 6개월 동얀에 끝난 프로젝트</option> <option value="12">최근 1년 동안에 끝난 프로젝트</option>';
  		html +=	'<option value="24">최근 2년 동안에 끝난 프로젝트</option> <option value="36">최근 3년 동안에 끝난 프로젝트</option> </select>';
  		html += '<br> <h5>평가 인원</h5> <input type="number" name="number" placeholder="인원을 입력해주세요" min="1" max="5" style="width: 100%; height: calc(1.5em + 0.75rem + 2px); padding: 0.375rem 0.75rem;">';
  	    html += '<div class="modal-footer"> <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> <input type="submit" class="btn btn-primary" value="매핑">';
  	    html += '</div></form:form></div></div></div></div>';     
  	    	
  	    $('#beforeModal').after(html)
  	}


</script>

<!-- modal(설문 등록 시 뜨는 팝업창) -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">설문 생성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>


			<div class="modal-body">
				<c:url value="/survey/set.do" var="actionURL" scope="page" />
				<form:form action="${actionURL}" modelAttribute="SLD">

					<div class="form-group">
						<label for="recipient-name" class="col-form-label">이름</label>
						<input type="text" class="form-control" id="recipient-name"
							name="surveyName">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">상세 설명</label>
						<textarea class="form-control" id="message-text"
							name="surveyContent"></textarea>
					</div>
					<input type="hidden" name="stateCode" value="30001">
					<input type="hidden" name="surveySeq" value="1">기간<br>

					<input type="date" name="surveyStartDate" pattern="yyyy-MM-dd">~<input
						type="date" name="surveyClosedDate" pattern="yyyy-MM-dd">
					<br>
					<input type="radio" name="anonymityCheckCode" value="20001">익명 <br>
					<input type="radio" name="anonymityCheckCode" value="20002">기명
<!-- 					<select name="anonymityCheckDate"> -->
					<!-- 						<option value="A">익명</option> -->
					<!-- 						<option value="R">기명</option> -->
					<!-- 					</select> -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</form:form>
			</div>

		</div>
	</div>
</div>
<!-- modal(설문 등록 시 뜨는 팝업창) 끝-->


<div class="container" id="beforeModal">
	<div class="seach_float">
		<form action="<c:url value='/survey/surveysearch'/>" method="GET"
			class="survey_list_form">
			<input type="date" name="surveyStartDate"
				value="<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">
			<select name="selection">
				<c:forEach items="${commonCodeList}" var="commonCode">
					<c:if test="${pagingdto.selection eq commonCode.codeDetailId }">
						<option selected value="${pagingdto.selection}">${commonCode.codeDetailName }</option>

					</c:if>
					<c:if test="${pagingdto.selection ne commonCode.codeDetailId }">
						<option value="${commonCode.codeDetailId}">${commonCode.codeDetailName }</option>
					</c:if>
				</c:forEach>
			</select> <input type="text" class="search_form" placeholder="search"
				name="keyword" value="${pagingdto.keyword}"
				aria-describedby="button-addon2"> <input type="hidden"
				name="pageNo" value="1">


			<button class="seach_btn" type="submit"
				style="border: 1px solid #fff; border-radius: 35em;">
				<i class="fas fa-search"></i>
			</button>
		</form>
	</div>

	<div class="search_form">
		<button id="upper_dv_btn" type="button" class="create_btn"
			style="margin-left: 910px; margin-bottom: 20px;" data-toggle="modal"
			data-target="#exampleModal" data-whatever="@mdo">새로 만들기</button>
	</div>

	<table class="table">
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
				<tr>

					<th scope="row">${list.surveySeq }</th>
					<td><c:if test="${list.stateCode ne '30004'}">
							<a href="surveyinsert2?surveyseq=${list.surveySeq}">${list.surveyName }</a>
						</c:if> <c:if test="${list.stateCode eq '30004'}">
									${list.surveyName }
								</c:if></td>
					<td><fmt:formatDate value="${list.surveyStartDate }"
							pattern='yyyy-MM-dd' /> &nbsp;~&nbsp; <fmt:formatDate
							value="${list.surveyClosedDate }" pattern='yyyy-MM-dd' /></td>

					<td><span class="wait" id="stateCode"> <c:if
								test="${list.stateCode eq '30003'}">
								<button class="btn btn-primary" onclick="send(this)"
									value="${list.surveySeq}">발송</button>
							</c:if> <c:if test="${list.stateCode ne '30003'}">
										${list.codeDetailName }
									</c:if>

					</span></td>

					<td><c:if test="${list.stateCode eq '30004'}">
							<button type="button" class="btn btn-link"
								onclick="location.href='surveyevaluate/surveyseq">조회</button>
						</c:if> <input type="hidden" id="pageNo" name=pageNo
						value="${pagingdto.startPageNo}"></td>

					<td><c:if test="${list.stateCode ne '30004'}">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal1" onclick="btn_for_mapping(this)"
								value="${list.surveySeq}">매핑</button>
						</c:if> <c:if test="${list.stateCode eq '30004'}">
									매핑완료
								</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="page_wrap">
		<div class="page_nation">
			<%-- 맨처음 페이지 이동 	
		<a class="arrow prev"
				href="surveysearch?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">처음</a> --%>
			<c:if test="${pagingdto.groupNo>1}">
				<a class="arrow prev"
					href="surveysearch?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">이전</a>
			</c:if>

			<c:forEach var="i" begin="${pagingdto.startPageNo}"
				end="${pagingdto.endPageNo}">
				<c:if test="${pagingdto.pageNo != i}">
					<a class="active"
						href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">${i}</a>
				</c:if>
				<c:if test="${pagingdto.pageNo == i}">
					<a class="page_nation"
						href="surveysearch?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">${i}</a>
				</c:if>
			</c:forEach>

			<c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
				<a class="arrow next"
					href="surveysearch?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">다음</a>
			</c:if>
			<%-- 맨마지막 페이지 이동 
			<a class="arrow next" href="surveysearch?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&surveyStartDate=<fmt:formatDate value='${pagingdto.surveyStartDate}' pattern='yyyy-MM-dd' />">맨끝</a> --%>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>