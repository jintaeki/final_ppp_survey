<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
function surveyopen(){
	  window.open("http://localhost/springframework-xml-config-no-root/survey", "_blank");
	}
</script>
<div class="card m-2">
	<div class="card-header">
		login_after_user.jsp
	</div>
	<div class="card-body">
		<img src="C:\Users\ljt94\OneDrive\바탕 화면\login_after_user.png">
		<img src="${pageContext.request.contextPath}/resources/images/forPractice/login_after_user.png">
	</div>
</div>
 <input type="button" onclick="surveyopen()" value="설문"/>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
