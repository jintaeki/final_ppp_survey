<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey_list.css" />

<script>
	function send() {
	
		const surveyseq = $('#surveyseq').val();
		console.log(surveyseq);
		$.ajax({
			method:'POST', //어떤 방식으로 보낼 지
			url:'sendmessage.do/'+surveyseq, // qdiv를 보낼 경로 설정

		   beforeSend : function() { //보내기 전 실행
			console.log("요청이 보내지는가?");
		   },
		   success:function (data) {	 //전송 성공시 실행
			   console.log("요청 성송");
		   
			   const tag = $(obj);

				const completeMsg = `전송완료`;
				const complete = `확정`;
				const text = `<button type="button" class="btn btn-link"
								onclick="location.href='surveyevaluate/${list.surveySeq}'">조회</button>`;
				tag.parent().next().append(text);

				tag.parent().prev().html(complete);
				tag.parent().prev().css('font-weight', 'bold');

				tag.closest('tr').css('color', '#ccc');
				tag.parent().html(completeMsg);
				tag.hide();
					   
			   
		   }, error:function(e) {	//실패, 에러
			   console.log("Error", e); 
		   }
			});
		
		
	}
		
		
		

</script>
<!-- modal(설문 등록 시 뜨는 팝업창) -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">설문지 설정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>


			<div class="modal-body">
				<c:url value="/survey/set.do" var="actionURL" scope="page" />
				<form:form action="${actionURL}" modelAttribute="SLD">
<%-- 					<form action='<c:url value="/set"/>' method="POST">  --%>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label" >설문지 이름</label>
						<input type="text" class="form-control" id="recipient-name" name="surveyName">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">설문 부가 설명</label>
						<textarea class="form-control" id="message-text" name="surveyContent"></textarea>
					</div>
				 	<input type="hidden" name="decideYN" value="N">
					<input type="hidden" name="surveySeq" value="1"> 설문 진행 기간<br>

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
<!-- 					</form> -->
				</form:form>
			</div>

		</div>
	</div>
</div>
<!-- modal(설문 등록 시 뜨는 팝업창) 끝-->


<div class="card m-2">
	<div class="card-body">
		<div class="container my-5">
			<div class="row">
				<div class="hmenu">
					<div class="input-group mb-3">
						<input type="text" class="form-control " placeholder="search"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">검색</button>
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal" data-whatever="@mdo">등록</button>

<!-- 						<button type="button" class="btn btn-outline-primary" -->
<!-- 							onclick="location.href='mappingview'">매핑등록</button> -->
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">다면평가 목록</th>
							<th scope="col">평가 기간</th>
							<th scope="col">확정여부</th>
							<th scope="col">상태</th>
							<th scope="col">결과</th>
							<th scope= "col">평가자 매칭</th>	
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${surveylist}">
						<tr>
							<th scope="row">${list.surveySeq }</th>
							<td ><input type="hidden" id="surveyseq" value="${list.surveySeq}">
							<a href="surveyinsert2?surveyseq=${list.surveySeq}">${list.surveyName }</a></td>
							<td><fmt:formatDate value="${list.surveyStartDate }" pattern="yyyy-MM-dd"/><br>~<br>
					<fmt:formatDate value="${list.surveyClosedDate }" pattern="yyyy-MM-dd"/></td>
							
							<td><span class="wait"><c:if test="${list.decideYN eq 'N' }">대기</c:if>
							<c:if test="${list.decideYN != 'N' }">확정</c:if></span>
							</td>
							<td><input type="button" id="send" class="btn btn-primary"
								onclick="send()" value="발송"></td>
							<td></td>
						</tr>												
						</c:forEach>
						
					</tbody>
				
				<tr>
				<tr>
				<td colspan="4" class="text-center">
					<div>
						<a class="btn btn-outline-primary btn-sm" href="surveylist?pageNo=1">처음</a>
						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-outline-info btn-sm" href="surveylist?pageNo=${pagingdto.startPageNo-1}">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pagingdto.startPageNo}" end="${pagingdto.endPageNo}">
							<c:if test="${pagingdto.pageNo != i}">
								<a class="btn btn-outline-success btn-sm" href="surveylist?pageNo=${i}">${i}</a>
							</c:if>
							<c:if test="${pagingdto.pageNo == i}">
								<a class="btn btn-danger btn-sm" href="surveylist?pageNo=${i}">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pagingdto.groupNo<pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm" href="surveylist?pageNo=${pagingdto.endPageNo+1}">다음</a>
						</c:if>
						<a class="btn btn-outline-primary btn-sm" href="surveylist?pageNo=${pagingdto.totalPageNo}">맨끝</a>
					</div>
				</td>
			</tr>
				
				</table>
				
				
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>