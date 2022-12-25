<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul class="nav flex-column">
	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			(views menu.jsp에서 등록)
			<br>
			<a class="text-white" href="<c:url value='/home2'/>">home</a>
			<br>
			<a class="text-white" href="<c:url value='/'/>">home2</a>
		</h6>
	</li>
	
		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/loginafter'/>">피평가자 리스트</a>
		</h6>
	</li>	
	

		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/login'/>">정보 확인</a>
		</h6>
	</li>	
	
		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/surveydetails'/>">설문지 문항 관리</a>
		</h6>
	</li>	
	
		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/surveyinsert'/>">설문 등록</a>
		</h6>
	</li>	
	
		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/surveylist'/>">설문지 목록</a>
		</h6>
	</li>	
	
		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/surveyresult'/>">설문 결과 = 통계</a>
		</h6>
	</li>	
	
		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/surveysuccess'/>">설문 성공</a>
		</h6>
	</li>	
	
		<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/surveyupdate'/>">설문 수정</a>
		</h6>
	</li>	
		
			<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			<a class="text-white" href="<c:url value='/survey'/>">평가 뷰</a>
		</h6>
	</li>	
		
</ul>