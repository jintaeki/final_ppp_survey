<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="menu_profile_survey">
   <div class="menu_profile_img_circle">
      <c:if test="${checked.gender eq '남'}">
         <img src="${pageContext.request.contextPath}/resources/images/profile.gif" class="menu_profile_img">
      </c:if>
      <c:if test="${checked.gender eq '녀'}">
         <img src="${pageContext.request.contextPath}/resources/images/profile_woman.gif" class="menu_profile_img" style="margin-top: 15px;">
      </c:if>
   </div>


<div class="menu_profile_text">
   <div class="menu_departmentName">${checked.raterDepartmentName}</div>
   <div class="menu_raterName">${checked.raterName}</div>

   <div style="margin-top: 30px;">
      <a href="/logout.do" class="menu_logout">로그아웃 <svg
            xmlns="http://www.w3.org/2000/svg" width="16" height="16"
            fill="currentColor" class="bi bi-box-arrow-right"
            viewBox="0 0 16 16">
  <path fill-rule="evenodd"
               d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
               d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg></a>
   </div>
</div>
</div>