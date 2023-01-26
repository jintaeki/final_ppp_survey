<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<<<<<<< HEAD
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
=======
<link rel="stylesheet" type="text/css" href="resources/css/survey.css">
<script src="resources/js/survey.js"></script>
<script src="resources/js/surveycountdown.js"></script>


<div class="survey_form">
   <div class="survey_info">
      <div class="survey_info_text">
         <h1>
            <b>설문 참여가능 기간</b>
         </h1>
         <div id="countdown"></div>
      </div>
      <div class="survey_info_text">
         <h1>
            <b>프로젝트</b>
         </h1>
         22년도 전체 다면 평가
      </div>
      <div class="survey_info_text">
         <h1>
            <b>평가대상</b>
         </h1>
         임진택 님
      </div>
   </div>
   <div class="survey_list">
      [ 성과 중심 ]
      <div class="accordion" id="accordionExample1-1">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  1. 평가자는 조직의 목표를 공유하고 스스로의 목표를 구체적으로 설정한다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample1-2">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  2. 주어진 목표를 초과 달성하기 위해 구체적인 노력과 행동들이 이어진다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample1-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  3. 업무추진 시 다양한 의견을 고려함으로써 치우지치 않는 균형 감각을 유지한다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      [ 업무 적응력 ]
      <div class="accordion" id="accordionExample2-1">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  1. 평가자는 새로운 환경에 적응하기 위해 자신의 행동을 변화시키려고 노력한다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample2-2">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  2. 평가자는 업무 여건이나 상황에 영향을 받지 않고 성과를 만들어낼 수 있다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample2-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  3. 평가자는 어려운 상황에서도 평정을 유지하며 업무를 수행한다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      [ 혁신성 ]
      <div class="accordion" id="accordionExample2-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  1. 평가자는 변화가 가져올 긍정적으로 제시하고 추진할 수 있다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample2-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  2. 평가자는 비효율적인 업무를 개선하기 위해 적극적으로 노력한다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample2-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  3. 업무 추진시 기존 사고방식에 벗어나 발전적인 업무 문화를 조성한다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      [ 도덕성 ]
      <div class="accordion" id="accordionExample2-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  1. 학벌/성별/출신 지역에 대해 차별하지 않는다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample2-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  2. 바람직한 조직 분위기 조성을 위해 언행에 모범을 보인다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div class="accordion" id="accordionExample2-3">
         <div class="card">
            <div class="card-header">
               <button class="btn btn-link btn-block text-left" type="button">
                  3. 성희롱, 지나친 음주 등 품위를 손상하거나 업무 지장을 초래하는 행동을 하지 않는다.</button>
            </div>

            <div class="card-body" style="display: none">
               <button class="btn btn-primary" type="submit">매우 그렇지 않다</button>
               <button class="btn btn-primary" type="submit">그렇지 않다</button>
               <button class="btn btn-primary" type="submit">보통</button>
               <button class="btn btn-primary" type="submit">그렇다</button>
               <button class="btn btn-primary" type="submit">매우 그렇다</button>
            </div>
         </div>
      </div>
      <div id="survey_btn">
         <input class="btn btn-primary" onclick="location.href='loginafter'" type="submit" value="제출">
      </div>
   </div>

</div>

>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git

=======
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/survey.css">
<script src="resources/js/survey.js"></script>
<script src="resources/js/surveycountdown.js"></script>
<script type="text/javascript">
/* 	function surveyState(){
		console.log('surveyState 함수 실행');
		
		$.ajax({
			url: "http://localhost:8080/springframework-xml-config-no-root/survey",
			type: "GET",
			data : paramList, 
			success: function(result){
					var gradeName = mapping.gradeName;
					var appraiseeName = mapping.appraiseeName;
					var list = mapping.list;
					var temp = ""; */
					
					// result는 컨트롤러 리턴값 
					// result => survey_result table의 값이 담겨있음 List<SurveyResultVo>
					// document.getElementById("mapping_container");
					// $("#mapping_container")
					// for(var i=0; i<result.length; i++){
						// temp += list[i].gradeName + " " + 
					 // result[i]['serveySeq'] // 자바스크립트 형태
					 // result.get(i).get("serveySeq") -> JAVA 형태
					 // result[i]['title'] // 설문 문항
					 // $("#mapping_container.question-form").html(result[i]['title']); // 태그에 설문 문항을 넣어줌
					
			/* error : function() {
					alert("작업이 완료되지 않았습니다")
				}
			});
		}			
			 success: function(result){
				console.log(result) {
					if (result) {
						$("mapping_container").empty();
						mappingtarget = result; 
						$.each(mappingtarget. function (idx, post) {
						$("mapping_container").append('<tr><td>${mapping.gradeName}</td>
													   	   <td>${mapping.appraiseeName}</td>
													   	   <td><td></tr>');	
					});
				}
			},
			error : function () */
		 
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
		<div class="mapping_container col-3">
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

>>>>>>> refs/remotes/origin/cbj2
<%@ include file="/WEB-INF/views/common/footer.jsp"%>