<<<<<<< HEAD
<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
function surveyopen(obj){
	// survey_result 테이블에 필요한 요소들 온클릭 메소드 안에 넣어주고 같이 survey 컨트롤러로 이동해보자
	// 위 사항을 적어둔 이유는 평가 페이지를 통해서 survey_result 테이블에 데이터가 들어갈거고 평가했는 지 여부가 결정나기 때문
    window.open("http://localhost:8080/springframework-xml-config-no-root/survey", "_blank");
	const tag = $(obj);
	
	const completeMsg = `완료`;
	tag.parent().prev().html(completeMsg);
	tag.parent().prev().css('color', '#ccc').css('font-weight', 'normal');
	
	tag.parent().css('color', '#ccc');
	tag.parent().html(completeMsg);
	
   }
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_after_user.css"/>
<div class="card m-2">	
	<div class="card-body">
		<div class="container my-5">
  			<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th scope="col">프로젝트 명</th>
							<th scope="col">대상</th>
							<th scope="col">진행상태</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${UCDList}" var="list">
						<tr>
							<th scope="row">#</th>
							<td class="pj_name" style="text-align:center;">${list.surveyName }</td>
							<td>${list.appraiseeName }</td>
							<td class="not_comp">${list.surveyCompleteYN }</td>
							<td><button type="button" class="btn btn-primary" onclick="surveyopen(this})">설문 시작</button></td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
			
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
=======
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
function surveyopen(obj){
    window.open("http://localhost:8080/springframework-xml-config-no-root/survey", "_blank");
	const tag = $(obj);
	
	const completeMsg = `완료`;
	tag.parent().prev().html(completeMsg);
	tag.parent().prev().css('color', '#ccc').css('font-weight', 'normal');
	
	tag.parent().css('color', '#ccc');
	tag.parent().html(completeMsg);
	
   }
</script>
<div class="container" id="beforeModal">
			<table class="table">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">프로젝트 명</th>
						<th scope="col">대상</th>
						<th scope="col">진행상태</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td class="pj_name">다면평가 시스템 구축</td>
						<td>김찬수</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td class="pj_name">다면평가 시스템 구축</td>
						<td>민채우</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td class="pj_name">스프링부트를 이용한 배치관리시스템 구축</td>
						<td>임진택</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td class="pj_name">스프링부트를 이용한 배치관리시스템 구축</td>
						<td>최병준</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td class="pj_name">점포관리 시스템 구축</td>
						<td>홍길동</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">6</th>
						<td class="pj_name">점포관리 시스템 구축</td>
						<td>이순신</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">7</th>
						<td class="pj_name">용어사전 관리 시스템 구축</td>
						<td>을지문덕</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">8</th>
						<td class="pj_name">용어사전 관리 시스템 구축</td>
						<td>권율</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">9</th>
						<td class="pj_name">연수관리 시스템 구축</td>
						<td>장보고</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">10</th>
						<td class="pj_name">연수관리 시스템구축</td>
						<td>임꺽정</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
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
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
=======
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
function surveyopen(obj){
    window.open("http://localhost:8080/springframework-xml-config-no-root/survey", "_blank");
	const tag = $(obj);
	
	const completeMsg = `완료`;
	tag.parent().prev().html(completeMsg);
	tag.parent().prev().css('color', '#ccc').css('font-weight', 'normal');
	
	tag.parent().css('color', '#ccc');
	tag.parent().html(completeMsg);
	
   }
</script>
<div class="container" id="beforeModal">
			<table class="table">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">프로젝트 명</th>
						<th scope="col">대상</th>
						<th scope="col">진행상태</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td class="pj_name">다면평가 시스템 구축</td>
						<td>김찬수</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td class="pj_name">다면평가 시스템 구축</td>
						<td>민채우</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td class="pj_name">스프링부트를 이용한 배치관리시스템 구축</td>
						<td>임진택</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td class="pj_name">스프링부트를 이용한 배치관리시스템 구축</td>
						<td>최병준</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td class="pj_name">점포관리 시스템 구축</td>
						<td>홍길동</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">6</th>
						<td class="pj_name">점포관리 시스템 구축</td>
						<td>이순신</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">7</th>
						<td class="pj_name">용어사전 관리 시스템 구축</td>
						<td>을지문덕</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">8</th>
						<td class="pj_name">용어사전 관리 시스템 구축</td>
						<td>권율</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">9</th>
						<td class="pj_name">연수관리 시스템 구축</td>
						<td>장보고</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">10</th>
						<td class="pj_name">연수관리 시스템구축</td>
						<td>임꺽정</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
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
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
>>>>>>> refs/remotes/origin/cbj2
