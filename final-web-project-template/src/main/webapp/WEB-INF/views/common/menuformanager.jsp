<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <div class="menu_profile">
      		<div style="border-bottom: 1px solid white; ">
      		<img
				src="${pageContext.request.contextPath}/resources/images/logo-spring.png"
				width="30" height="30" class="d-inline-block align-top">
				<p class="text-white">Survey50</p>
			</div>
			<div style="text-align:center;">
			 <br>
			  <br>
             <a class="text-white" href="<c:url value='/survey/surveysearch'/>">설문지 목록</a>
             <br>
              <br>
             <a class="text-white" href="<c:url value='/survey/surveyresultteam'/>">결과 통계</a>
             <br>
              <br>
             <a class="text-white" href="<c:url value='/'/>">로그인</a>
             </div>
			 <!--<a class="btn btn-success btn-sm" href="#">로그아웃</a> -->
   </div>