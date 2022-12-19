<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul class="nav flex-column">
	<li class="nav-item mb-2">
		<h6 class="text-white">
			<span class="mr-2">Title.</span>
			(views menu.jsp에서 등록)
			<br>
			<a class="text-white" href="<c:url value='/home2'/>">Subtitle (views menu.jsp에서 등록)</a>
			<br>
			<a class="text-white" href="<c:url value='/'/>">Subtitle (views menu.jsp에서 등록)</a>
			<br>
			<a class="text-white" href="#">Subtitle (views menu.jsp에서 등록)</a>
			<br>
			<a class="text-white" href="#">Subtitle (views menu.jsp에서 등록)</a>
		</h6>
	</li>	
</ul>