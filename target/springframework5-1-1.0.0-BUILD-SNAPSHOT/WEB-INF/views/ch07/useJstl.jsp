<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
		JSTL을 이용한 반복 처리
	</div>
	<div class="card-body">
		<h6>[지정환 횟수만큼 반복]</h6>
		<table class="table table-striped border">
			<thead>
			  <tr>
			    <th scope="col">No</th>
			    <th scope="col">Title</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach begin="1" end="5" step="1" var="i">
				<tr>
			      <th scope="row">${i}</th>
			      <td>제목${i}</td>
			    </tr>
			</c:forEach>
			</tbody>
		</table>
		
		<h6 class="mt-5">[Arrya 항목 수 만큼]</h6>
		<table class="table table-striped border">
			<thead>
			  <tr>
			    <th scope="col">No</th>
			    <th scope="col">Language</th>
			  </tr>
			</thead>
			<%--
				${status.index}   <!– 0부터의 순서 –>
				${status.count}   <!– 1부터의 순서 –>
				${status.first}   <!– 현재 루프가 처음인지 반환 –>
				${status.last}    <!– 현재 루프가 마지막인지 반환 –> 
			--%>
			<c:forEach var="lang" items="${langs}" varStatus="status">
				<c:if test="${status.first}">
					<tbody>
				</c:if>
				
				<tr>
			      <th scope="row">${status.count}</th>
			      <td>${lang}</td>
			    </tr>
				    
				<c:if test="${status.last}">
			    	</tbody>
			    </c:if>
			</c:forEach>
		</table>
		
		<h6 class="mt-5">[List 항목 수 만큼 반복]</h6>
		<table class="table table-striped border">
			<thead>
			  <tr>
			    <th scope="col">No</th>
			    <th scope="col">Title</th>
			    <th scope="col">Content</th>
			    <th scope="col">Writer</th>
			    <th scope="col">Date</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach var="board" items="${boardList}">
				<tr>
			      <td scope="row">${board.no}</td>
			      <td>${board.title}</td>
			      <td>${board.content}</td>
			      <td>${board.writer}</td>
			      <td><fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd"/></td>
			    </tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>