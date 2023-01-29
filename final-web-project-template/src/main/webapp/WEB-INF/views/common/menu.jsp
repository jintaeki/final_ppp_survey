<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <div class="menu_profile">
   <img src="${pageContext.request.contextPath}/resources/images/profile.gif" style="width:300px;">
      
      <div class="menu_profile_text">${checked.raterDepartmentName }</div>
<!--       <br> -->
      <div class="menu_profile_text">${checked.raterName }</div>
      <div><a class="menu_profile_text" href="/logout">로그아웃</a></div>
      
   </div>