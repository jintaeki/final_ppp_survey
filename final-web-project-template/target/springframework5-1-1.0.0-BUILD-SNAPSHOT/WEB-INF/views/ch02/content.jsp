<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
		Controller/RequestMapping
	</div>
	<div class="card-body">
		<div class="card m-2">
			<div class="card-header">
				요청 방식별 메소드 매핑
			</div>
			<div class="card-body">
				<div class="m-2"><a href="${pageContext.request.contextPath}/ch02/method?bkind=free&bno=1" class="btn btn-info btn-sm">GET방식(&lt;a&gt;)</a></div>
				<hr/>
				<form class="m-2" method="get" action="${pageContext.request.contextPath}/ch02/method">
					<div class="form-group">
					    <label for="bkind">bkind</label>
					    <input type="text" class="form-control" id="bkind" name="bkind" value="free">
					    <small id="bkindHelp" class="form-text text-muted">input board kind</small>
					</div>
					
					<div class="form-group">
					    <label for="bno">bno</label>
					    <input type="text" class="form-control" id="bno" name="bno" value="1">
					    <small id="bnoHelp" class="form-text text-muted">input board no</small>
					</div>
					<input type="submit" value="GET방식(&lt;form&gt;)" class="btn btn-info btn-sm"/>
				</form>
				<hr/>
				
				<div class="m-2"><button class="btn btn-info btn-sm" onclick="requestGet()">GET방식(Ajax)</button></div>
			</div>
			<script>
				function requestGet() {
					$.ajax({
						url:"${pageContext.request.contextPath}/ch02/method",
						method: "GET"
					})
					.done((data) => {});
				}			
			</script>
		</div>
				
		<div class="card m-2">
			<div class="card-header">
				요청 방식별 메소드 매핑
			</div>
			<div class="card-body">				
				<form class="m-2" method="post" action="${pageContext.request.contextPath}/ch02/method">
					<div class="form-group">
					    <label for="bkind">bkind</label>
					    <input type="text" class="form-control" id="bkind" name="bkind" value="free">
					    <small id="bkindHelp" class="form-text text-muted">input board kind</small>
					</div>
					
					<div class="form-group">
					    <label for="bno">bno</label>
					    <input type="text" class="form-control" id="bno" name="bno" value="1">
					    <small id="bnoHelp" class="form-text text-muted">input board no</small>
					</div>
					<input type="submit" value="POST방식(&lt;form&gt;)" class="btn btn-info btn-sm"/>
				</form>
				<hr/>
				
				<button class="btn btn-info btn-sm" onclick="requestPost()">POST방식(Ajax)</button>
			</div>
			<script>
				function requestPost() {
					$.ajax({
						url:"${pageContext.request.contextPath}/ch02/method",
						method: "POST"
					})
					.done((data) => {});
				}
			</script>
		</div>
				

		<div class="card m-2">
			<div class="card-header">
				PUT 방식 / DELETE 방식
			</div>
			<div class="card-body">				
				<button class="btn btn-info btn-sm" onclick="requestPut()">PUT방식(Ajax)</button>
				<button class="btn btn-info btn-sm" onclick="requestDelete()">DELETE방식(Ajax)</button>
			</div>
			<script>
				function requestPut() {
					$.ajax({
						url:"${pageContext.request.contextPath}/ch02/method",
						method: "PUT"
					})
					.done((data) => {});
				}
				function requestDelete() {
					$.ajax({
						url:"${pageContext.request.contextPath}/ch02/method",
						method: "DELETE"
					})
					.done((data) => {});
				}
			</script>			
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>