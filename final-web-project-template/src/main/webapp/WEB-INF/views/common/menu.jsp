<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="nav flex-column">
	<li class="nav-item mb-2">
		<h6 class="text-white">

			<span class="mr-2">Title.</span> <br>
			<%-- 			<a class="text-white" href="<c:url value='/'/>">home</a> --%>

			<a class="text-white" href="<c:url value='/'/>"><h2>다면평가 시스템</h2></a>

		</h6>
	</li>

	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">1.</span> <a class="text-white"
				href="<c:url value='/login'/>">정보 확인</a>
		</h6>

	</li>

	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">2.</span> <a class="text-white"
				href="<c:url value='/loginafter'/>">피평가자 리스트</a>
		</h6>
	</li>

	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">3.</span> <a class="text-white"
				href="<c:url value='/survey'/>">평가 뷰</a>
		</h6>
	</li>


	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">4.</span> <a class="text-white"
				href="<c:url value='/surveylist'/>">설문지 목록</a>
		</h6>
	</li>

	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">5.</span> <a class="text-white"
				href="<c:url value='/surveyinsert'/>">설문 등록</a>
		</h6>
	</li>


	<li class="nav-item mb-2">

		<h6 class="text-white">

			<span class="mr-2">6.</span> <a class="text-white"
				href="<c:url value='/surveydetails'/>">설문지 문항 관리</a>
		</h6>
	</li>


	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">7.</span> <a class="text-white"
				href="<c:url value='/surveyevaluate'/>">팀원 목록</a>
		</h6>
	</li>

	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">8.</span> <a class="text-white"
				href="<c:url value='/surveyresult'/>">설문 결과</a>
		</h6>
	</li>

	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">9.</span> <a class="text-white"
				href="<c:url value='/surveyresultteam'/>">설문 부서 통계</a>
		</h6>
	</li>

	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">10.</span> <a class="text-white"
				href="<c:url value='/mappingview'/>">매핑 뷰</a>
		</h6>
	</li>











</ul>