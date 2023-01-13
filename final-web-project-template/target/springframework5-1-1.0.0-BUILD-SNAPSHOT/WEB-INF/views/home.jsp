<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
		Home
	</div>
	<div class="card-body">
		<a href="${pageContext.request.contextPath}/ch01/content" 
		   class="btn btn-info btn-sm">
			/ch01/content
		</a>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>


