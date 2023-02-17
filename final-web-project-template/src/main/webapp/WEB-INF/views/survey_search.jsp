<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerformanager.jsp"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey_list.css" />

 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/survey_search.js"></script>

<script>



  	function btn_for_mapping(surveySeq, stateCode){
  		if(stateCode == '30002'){
  		  newMapping(surveySeq)
  	    }else if(stateCode == '30003'){
  		  reMapping(surveySeq)
  	    }else if(stateCode == '30004'){
  	      plusMapping(surveySeq)
  	    }
  	}


  	function newMapping(serveySeq){
  		html ="";
  		html += '<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
  		html += ' <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="exampleModalLabel">매칭 조건 선택</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
  	    html += '<span aria-hidden="true">&times;</span></button>';
  	    html += '</div>';
  	    html += '<div class="modal-body">'
  	   	html += '<c:url value="/mapping/set.do" var="actionURL"/>';
  	   	html += '<form:form action="${actionURL}" modelAttribute="map">';
  	   	html += '<input type="hidden" id="surveySeq" name="surveySeq" value="'+serveySeq+'">';
  	   	html += '<input type="hidden" id="newCheck" name="newCheck" value="0">';
  	   	html += '<br> <h5> 다면평가에 포함될 프로젝트의 범위 정하기 </h5> <select class="form-control" name="month"> <c:forEach items="${commonDateList}" var="month"> <option value="${month.codeDetailName}">최근 ${month.codeDetailName}개월 동안에 끝난 프로젝트</option> </c:forEach> </select>';
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
  	   	html += '<button type="submit" class="btn btn-outline-success" id="newCheck" name="newCheck" value="0">저장된 매핑 목록으로 넘어가기</button>';
  	    html += '<div class="modal-footer"><br><button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
  	    html += '</div></form:form></div></div></div></div>';
  	    $('#beforeModal').after(html);
  	}

  	function plusMapping(serveySeq){
  		html ="";
  		html += '<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
  		html += ' <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="exampleModalLabel">평가 조합을 추가하시겠습니까?</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
  	    html += '<span aria-hidden="true">&times;</span></button>';
  	    html += '</div>';
  	    html += '<div class="modal-body">'
  	   	html += '<c:url value="/mapping/set.do" var="actionURL"/>';
  	   	html += '<form:form action="${actionURL}" modelAttribute="map">';
  	   	html += '<input type="hidden" id="surveySeq" name="surveySeq" value="'+serveySeq+'">';
  	   	html += '<input type="hidden" id="month" name="month" value="3">';
  	   	html += '<input type="hidden" id="number" name="number" value="3">';
  	   	html += '<br> <h5> 해당 다면평가의 매핑조합을 추가 하시겠습니까? </h5>';
  	   	html += '<button type="submit" class="btn btn-outline-success" id="newCheck" name="newCheck" value="0">저장된 매핑 목록으로 넘어가기</button>';
  	    html += '<div class="modal-footer"><br><button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
  	    html += '</div></form:form></div></div></div></div>';
  	    $('#beforeModal').after(html);
  	}

  	function updatemessage(surveyseq){
		html ="";
  	  	html +='<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
  	  	html +='<div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="exampleModalLabel">다면 평가 메세지 전송화면</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
  	  	html +='<span aria-hidden="true">&times;</span></button>';
  	  	html +='</div>';
  	  	html +='<div class="modal-body">';
  	  	html +='<input type="hidden" id="surveyseq" value="'+surveyseq+'">';
  	  	html +='<div class="form-group"> <label for="exampleFormControlTextarea1">평가를 할 평가자에게 전송할 메세지를 입력하시오</label>';
  	  	html +='<textarea class="form-control" id="deliverycontent" rows="3">다면평가 평가원으로 선정되셨습니다. 해당 주소로 들어가 로그인하여 다면 평가를 진행해주시길 바랍니다.</textarea></div>';
  	  	html +='<div class="modal-footer"> <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
  	  	html +='<button type="button" class="btn btn-primary" onclick="send()">등록</button>';
  	  	html +='</div></div></div></div></div>';
  	    $('#beforeModal').after(html);
	}





</script>

	<!-- modal(설문 등록 시 뜨는 팝업창) -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">평가지 설정</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>


				<div class="modal-body">
					<c:url value="/survey/set.do" var="actionURL" scope="page" />
					<form:form action="${actionURL}" modelAttribute="SLD" id="surveyDataForm">

						<div class="form-group">
							<label for="recipient-name" class="col-form-label"><span style="color:red">*</span> 평가지 이름</label>
							<input type="text" class="form-control" id="recipient-name"
								name="surveyName">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label"><span style="color:red">*</span> 평가 부가 설명</label>
							<textarea class="form-control" id="message-text"
								name="surveyContent"></textarea>
						</div>
						<input type="hidden" name="stateCode" value="30001">
						<input type="hidden"><span style="color:red">*</span> 평가 진행 기간<br>

						<input type="date" name="surveyStartDate" pattern="yyyy-MM-dd">~<input
							type="date" name="surveyClosedDate" pattern="yyyy-MM-dd">
						<br>
						<br>
						<div>
						<label for="anonimityCheck-choose" class="col-form-label"><span style="color:red">*</span> 익명 기명 선택</label>
						<br>
						<label class="anonimityCheck_label"><input type="radio" name="anonymityCheckCode" value="20001">
							<span>익명</span>
						</label>
						<label class="anonimityCheck_label"><input type="radio" name="anonymityCheckCode" value="20002">
							<span>기명</span>
						</label>
						</div>
						<br>
						<input type="hidden"> 평가지 복사<br>
						<select name="surveySeq">
							<option value="0">평가지 선택</option>
							<c:forEach var="list" items="${surveyAllList}">
								<option value="${list.surveySeq} ">${list.surveyName}</option>
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

	<!--  평가지 목록 -->
	<div class="card" id="beforeModal">
			<div class="forshadowing">
					<div class="hmenu"> <!-- 상단 검색 창 -->
						<div class="survey_list_form_upper_dv">
							<form action="<c:url value='/survey/surveysearch.do'/>"
								method="POST" class="survey_list_form" style="display: flex;">
								<div class="searchRangeAll">
								<div class="searchRange">
								<b>평가 시작 기간:</b>
								<input type="date" name="surveyStartDateLeft" id="selectedDate"
									value="<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />">
								<input type="date" name="surveyStartDateRight" id="selectedDate"
									value="<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">
								<select name="anonyMityCheckCode" >
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
								</select> <select name="selection"  >
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

								<div class="input-group" style="width: 400px; right: 50px;">
								<input type="text" class="form-control" id="selectedKeyword"
									placeholder="search" name="keyword"
									value="${pagingdto.keyword}" aria-describedby="button-addon2">
									<input type="submit" class="btn btn-outline-secondary"
										id="button-addon2" value="검색" onclick="search()">
									<input type="button" class="btn btn-outline-secondary"  onclick="reset_btn()"
										value="초기화">
								<input type="hidden" name="pageNo" value="1">
								</div>
								</div>
							</form>


						</div>
					</div>

					<div class="col-12" style=""><h3 style="text-align:left;"><b>평가지 목록</b></h3></div>
					<table class="table table-sm table-striped table-bordered">
						<thead style="background-color:#F8F9FA">

							<tr>
								<th scope="col" >#</th>
								<th scope="col" >다면평가 목록</th>
								<th scope="col" >평가 기간</th>
								<th scope="col" >진행상태</th>
								<th scope="col" >결과</th>
								<th scope="col" >평가자 매핑</th>

							</tr>
						</thead>
						<tbody>

							<c:forEach var="list" items="${surveylist}">
								<tr id="${list.surveySeq }">


									<th scope="row">
											<div style="text-align:center;">
												<button class="delete_survey_btn"
												onclick="delete_survey_btn(this,${list.surveySeq})">
												<i class="fas fa-xmark"></i>
												</button>
											</div>

									<td><c:if test="${list.stateCode ne '30004'}">
											<a href="surveyinsert.do?surveyseq=${list.surveySeq}"  id="surveyUP">${list.surveyName }</a> &nbsp;

										</c:if> <c:if test="${list.stateCode eq '30004'}">
									${list.surveyName }

								</c:if></td>
									<td><fmt:formatDate value="${list.surveyStartDate }"
											pattern='yyyy-MM-dd' /> &nbsp;~&nbsp; <fmt:formatDate
											value="${list.surveyClosedDate }" pattern='yyyy-MM-dd' /></td>

									<td><span class="wait" id="stateCode">
										<c:if test="${list.stateCode ne '30003' && list.stateCode ne '30004'}">
											${list.codeDetailName}
										</c:if>
										<c:if test="${list.stateCode eq '30003'}">
											<button class="btn btn-outline-primary" id="${list.surveySeq}_send" onclick="evaluateStart('${list.surveySeq}')">평가 실행</button>
										</c:if>
										<c:if test="${list.stateCode eq '30004'}">
											<button class="btn btn-outline-primary" data-toggle="modal"
													data-target="#exampleModal1" onclick="updatemessage('${list.surveySeq}')">
													발송</button>
										</c:if>
										</span>
									</td>

									<td><c:if test="${list.stateCode eq '30004'}">
											<button type="button" class="btn btn-link"
												onclick="location.href='<c:url value='evaluatesearch.do/${list.surveySeq}'/>'">조회</button>
										</c:if> <input type="hidden" id="pageNo" name=pageNo
										value="${pagingdto.startPageNo}"></td>

									<td>
										<input type="hidden" class="stateCode" value="${list.stateCode}">
										<button type="button" class="btn btn-outline-primary"
												id="btn_for_mapping" data-toggle="modal"
												data-target="#exampleModal1"
												onclick="btn_for_mapping('${list.surveySeq}', '${list.stateCode}')">
												매핑
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>

						<table class="paiging-btn-table">
							<tr class="table-light">
								<td colspan="12" class="text-center" style="border: none;">
									<div>

										<a class="btn btn-outline-secondary"
											href="surveysearch.do?pageNo=1&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">처음</a>
										<c:if test="${pagingdto.groupNo>1}">
											<a class="btn btn-outline-secondary"
												href="surveysearch.do?pageNo=${pagingdto.startPageNo-1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">이전</a>
										</c:if>

										<c:forEach var="i" begin="${pagingdto.startPageNo}"
											end="${pagingdto.endPageNo}">
											<c:if test="${pagingdto.pageNo != i}">
												<a class="btn btn-outline-secondary"
													href="surveysearch.do?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">${i}</a>
											</c:if>
											<c:if test="${pagingdto.pageNo == i}">
												<a class="btn btn-secondary"
													href="surveysearch.do?pageNo=${i}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">${i}</a>
											</c:if>
										</c:forEach>

										<c:if test="${pagingdto.groupNo<pagingdto.totalGroupNo}">
											<a class="btn btn-outline-secondary"
												href="surveysearch.do?pageNo=${pagingdto.endPageNo+1}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">다음</a>
										</c:if>
										<a class="btn btn-outline-secondary"
											href="surveysearch.do?pageNo=${pagingdto.totalPageNo}&keyword=${pagingdto.keyword}&selection=${pagingdto.selection}&anonyMityCheckCode=${pagingdto.anonyMityCheckCode}&surveyStartDateLeft=<fmt:formatDate value='${pagingdto.surveyStartDateLeft}' pattern='yyyy-MM-dd' />&surveyStartDateRight=<fmt:formatDate value='${pagingdto.surveyStartDateRight}' pattern='yyyy-MM-dd' />">맨끝</a>
									</td>
									<div style="float: right;">
									<button id="upper_dv_btn" type="button" class="btn btn-outline-secondary" data-toggle="modal"
										data-target="#exampleModal" data-whatever="@mdo">등록</button>
								   </td>
								</td>
							</tr>
						</table>
					</table>


			</div>

	</div><!--  평가지  목록-->
<%@ include file="/WEB-INF/views/common/footerformanager.jsp"%>
