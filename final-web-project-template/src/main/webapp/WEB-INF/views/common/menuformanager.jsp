<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="menu_profile">
	<div style="border-bottom: 1px solid white; text-align: center; margin-top: 20px;">
		<img
			src="${pageContext.request.contextPath}/resources/images/logo-spring.png"
			width="30" height="30" class="d-inline-block align-top">
		<p class="text-white">ManyFace</p>
	</div>
	<div style="text-align: center;">
		<br> <br>
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/survey/surveysearch'/>">설문지
				목록</a>
		</div>
		<br> <br>
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white"
				href="<c:url value='/survey/surveyresultteam'/>">결과 통계</a>
		</div>
		<br> <br>
		<c:if test="${checked ne '' }">		
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/logout'/>">로그아웃</a>
		</div>
		</c:if>
		<c:if test="${checked eq '' }">
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/login'/>">로그인</a>
		</div>
		</c:if>
	</div>
	<!--<a class="btn btn-success btn-sm" href="#">로그아웃</a> -->
</div>