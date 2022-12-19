<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
		Controller/Forward & Redirect
	</div>
	<div class="card-body">
		<a href="forward" class="btn btn-info btn-sm">JSP 포워드</a>
		<hr/>
		
		<a href="redirect" class="btn btn-info btn-sm">홈으로 리다이렉트</a>
		<hr/>
		
		<form method="POST" action="${pageContext.request.contextPath}/ch06/login">
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password" class="form-control" id="exampleInputPassword1">
		  </div>
		  <div class="form-group form-check">
		    <input type="checkbox" class="form-check-input" id="exampleCheck1">
		    <label class="form-check-label" for="exampleCheck1">Check me out</label>
		  </div>
		  <button type="submit" class="btn btn-primary btn-sm">로그인</button>
		</form>
		<hr/>
		
		<div>
			<a class="btn btn-info btn-sm" href="boardlist">게시물 목록</a>
			<a class="btn btn-info btn-sm" href="boardwriteform">게시물 작성</a>
		</div>
		<hr/>
		
		<p>[AJAX 요청은 리다이렉트를 하면 안됨]</p>
		<a href="javascript:ajax1()" class="btn btn-info btn-sm">AJAX 요청(HTML 조각 얻기)</a>
		<a href="javascript:ajax2()" class="btn btn-info btn-sm">AJAX 요청(JSON)</a>
		<a href="javascript:ajax3()" class="btn btn-info btn-sm">AJAX 요청(JSON)</a>
		<a href="javascript:ajax4()" class="btn btn-info btn-sm">AJAX 요청(리다이렉트) - (o)</a>
		<div id="content" class="mt-2"></div>
		<script>
			function ajax1() {
				console.log("ajax1() 실행");
				$.ajax({
					url:"getFragmentHtml"
				})
				.done((data) => {
					$("#content").html(data);
				});
			}
			
			function ajax2() {
				console.log("ajax2() 실행");
				$.ajax({
					url:"getJson1"
				})
				.done((data) => {
					$("#content").html(
						"<img src='${pageContext.request.contextPath}/resources/images/" + 
						data.fileName + "' width='200px'/>");
				});
			}
			
			function ajax3() {
				console.log("ajax3() 실행");
				$.ajax({
					url:"getJson2"
				})
				.done((data) => {
					$("#content").html(
						"<img src='${pageContext.request.contextPath}/resources/images/" + 
						data.fileName + "' width='200px'/>");
				});
			}
			
			function ajax4() {
				console.log("ajax4() 실행");
				$.ajax({
					url:"getJson3"
				})
				.done((data) => {
					console.log(data);
					$("#content").html(
						"<img src='${pageContext.request.contextPath}/resources/images/" + 
						data.fileName + "' width='200px'/>");
				});
			}
		</script>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>