<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/survey.css">
<script src="resources/js/survey.js"></script>
<script src="resources/js/surveycountdown.js"></script>
<script type="text/javascript">
	function surveyState(){
		console.log('surveyState 함수 실행');
		
		
		$.ajax({
			url: '문제 요청 url',
			type: 'GET',
			data: {
				surveySeq: '',
				raterId: '',
				appraiseeId: ''
			},
			success: function(result){
				// result는 컨트롤러 리턴값 
				// result => survey_result table의 값이 담겨있음 List<SurveyResultVo>
				//  document.getElementById("question-box");
				// $("#question-box")
				for(var i=0; i<result.length; i++){
					// result.get(i).get("serveySeq") -> JAVA 형태
					// result[i]['serveySeq'] -> 자바스크립트 형태
					
					// result[i]['title'] -> 설문 문항
					// $("#question-box .question-form").html(result[i]['title']); -> 태그에 설문 문항을 넣어줌
				}
			}
		})
	}	
</script>
<div class="container_flex">
	<div class="survey_info">
		<b>설문 참여가능 기간</b><br>
		<div id="countdown"></div>
		<br> <b>프로젝트</b> <br> 22년도 전체 다면 평가 <br>
		<br> <b>평가대상</b><br> 임진택 님
	</div>
</div>

<!-- 문항 시작 -->
<div class="container">
	<div class="row">
		<div class="col-3" style="border: 1px solid;">
		  <table>
		  	<thead>
		  	   	<tr>
		  			<th scope="col">직급</th>
		  			<th scope="col">피평가자</th>
		  			<th scope="col"></th>
		  		</tr>
		  	</thead>
		  <tbody>
		  	<c:choose>
		  		<c:when test="${empty mappingList}">
		  			<!-- <tr>
		  				<td>평가 대상이 없습니다.
		  			</tr> -->
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  			<tr>
		  				<td>부장</td>
		  				<td>정영훈</td>
		  				<td>
		  					<input type="button" value="평가">
		  				</td>
		  			</tr>
		  		</c:when>
		  		<c:otherwise>
		  			<c:forEach var="mapping" items="${SurveyMappingList}">
		  			<tr id="${mapping.appraiseeName}">
		  				<td>${mapping.gradeName}</td>
		  				
		  				<!-- 여기서부터 잘 모르겠습니다 -->
		  				<!-- 여기서부터 잘 모르겠습니다 -->
		  				<!-- 여기서부터 잘 모르겠습니다 -->
		  				<!-- 여기서부터 잘 모르겠습니다 -->
		  				<!-- 여기서부터 잘 모르겠습니다 -->
		  				<td>${mapping.appraiseeName}</td>
						<td><input type="button" class="state" onclick="surveyState()" value="상태">
						</td>
					</tr>		
		  			</c:forEach>
		  		</c:otherwise>
		  	</c:choose>
		  </tbody>
		  
		  </table>
		</div>
		
		
		
<div class="col-1">
가운데 철벽
</div>



<div id="question-box" class="col-8" style="border: 1px solid;">
	<div class="survey_list">
		<div class="form_area">
            <div class="question-form">
                  1. 평가자는 조직의 목표를 공유하고 스스로의 목표를 구체적으로 설정한다.
            </div>
			<span class="item_form">
               <button class="item_btn" type="submit">매우 그렇지 않다</button>
               <button class="item_btn" type="submit">그렇지 않다</button>
               <button class="item_btn" type="submit">보통</button>
               <button class="item_btn" type="submit">그렇다</button>
               <button class="item_btn" type="submit">매우 그렇다</button>
         	</span>
        </div>
         
         <div class="form_area">
            <div class="question-form">
                  1. 평가자는 조직의 목표를 공유하고 스스로의 목표를 구체적으로 설정한다.
            </div>
			<span class="item_form">
               <button class="item_btn" type="submit">매우 그렇지 않다</button>
               <button class="item_btn" type="submit">그렇지 않다</button>
               <button class="item_btn" type="submit">보통</button>
               <button class="item_btn" type="submit">그렇다</button>
               <button class="item_btn" type="submit">매우 그렇다</button>
         	</span>
        </div>
         
	</div>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>