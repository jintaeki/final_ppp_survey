<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_list.css"/>

<script>
function send(obj){	
	const tag = $(obj);
	
	const completeMsg = `전송완료`;
	const complete = `확정`;
	const text = `<button type="button" class="btn btn-link" onclick="location.href='surveyevaluate'">조회</button>`;
	tag.parent().next().append(text);
	
	tag.parent().prev().html(complete);
	tag.parent().prev().css('font-weight', 'bold');
	
	tag.closest('tr').css('color', '#ccc');	
	tag.parent().html(completeMsg);
		
	tag.hide();
		
   }
   
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
   
</script>

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
					<button type="button" class="btn btn-outline-primary" onclick="location.href='surveyinsert'">등록</button>
				</div>
			</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">다면평가 목록</th>
							<th scope="col">기간</th>
							<th scope="col">평가마감</th>
							<th scope="col">확정여부</th>
							<th scope="col">상태</th>
							<th scope="col">결과</th>
							<th scope="col">매핑</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td class="sv_name"><a href="surveydetails">22년도 4분기 다면평가</a></td>
							<td>2022.10.01 - 2022.12.31</td>
							<td>2023.01.06</td>
							<td><span class="wait">대기</span></td>
							<td><input type="button" id="send" class="btn btn-primary"
								onclick="send(this)" value="발송"></td>
							<td></td>
							<td><button type="button" class="btn btn-primary" 
										data-toggle="modal" data-target="#exampleModal">
 								매핑</button>
							</td>
						</tr>
						<tr id="grey">
							<th scope="row">2</th>
							<td class="sv_name"><a href="surveydetails">22년도 3분기 다면평가</a></td>
							<td>2022.07.01 - 2022.09.30</td>
							<td>2022.10.07</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">3</th>
							<td class="sv_name"><a href="surveydetails">22년도 2분기 다면평가</a></td>
							<td>2022.04.01 - 2022.06.30</td>
							<td>2022.07.07</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">4</th>
							<td class="sv_name"><a href="surveydetails">22년도 1분기 다면평가</a></td>
							<td>2022.01.01 - 2022.03.31</td>
							<td>2022.04.07</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">5</th>
							<td class="sv_name"><a href="surveydetails">21년도 전체 다면평가</a></td>
							<td>2021.01.01 - 2021.12.31</td>
							<td>2021.01.07</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">6</th>
							<td class="sv_name"><a href="surveydetails">21년도 4분기 다면평가</a></td>
							<td>2021.10.01 - 2021.12.31</td>
							<td>2022.01.06</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">7</th>
							<td class="sv_name"><a href="surveydetails">21년도 3분기 다면평가</a></td>
							<td>2021.07.01 - 2021.09.30</td>
							<td>2021.10.07</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">8</th>
							<td class="sv_name"><a href="surveydetails">21년도 2분기 다면평가</a></td>
							<td>2021.04.01 - 2021.06.30</td>
							<td>2021.07.07</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">9</th>
							<td class="sv_name"><a href="surveydetails">21년도 1분기 다면평가</a></td>
							<td>2021.01.01 - 2021.03.31</td>
							<td>2021.04.07</td>
							<td class="comp">확정</td>
							<td class="omp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
						<tr id="grey">
							<th scope="row">5</th>
							<td class="sv_name"><a href="surveydetails">20년도 전체 다면평가</a></td>
							<td>2020.01.01 - 2020.12.31</td>
							<td>2020.01.07</td>
							<td class="comp">확정</td>
							<td class="comp">전송완료</td>
							<td><button type="button" class="btn btn-link"
									onclick="location.href='surveyevaluate'">조회</button></td>
							<td>매핑완료</td>
						</tr>
					</tbody>
				</table>
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">매핑 조건 선택</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     	<c:url value="/mapping/set.do" var="actionURL"/>
     	<form:form action="${actionURL}" modelAttribute="map">
  		   	<input type="hidden" id="surveySeq" name="surveySeq" value="2241012">
     		<br>
     		<h5> 다면평가에 포함될 프로젝트의 제한 년도 정하기 </h5>
      	   	<select class="form-control" name="year">
  				<option value="1">최근 1년전에 끝난 프로젝트</option>
  				<option value="2">최근 2년전에 끝난 프로젝트</option>
  				<option value="3">최근 3년전에 끝난 프로젝트</option>
		 	</select>
		 	<br>
		 	<h5> 다면평가를 할 피평가자 수 정하기 </h5>
		 	<select class="form-control" name="number">
  				<option value="1">1명</option>
  				<option value="2">2명</option>
  				<option value="3">3명</option>
		 	</select>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
        		<input type="submit" class="btn btn-primary" value="메핑하기">
      		</div>
      	</form:form>
      </div>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>