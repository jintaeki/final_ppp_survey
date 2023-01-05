<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>

<div class="card m-2">
	<div class="card-body">
		<div class="container my-5">
  			<div class="row">
    			<div class="col-md-6 mx-auto">	
    				<div class="logintitle">
						<p class="h1 font-weight-bold">다면평가 로그인</p>
    				</div>			
					<div class="form-group">
  						<input type="text" class="form-control" id="id" required>
  						<label class="form-control-placeholder" for="id">ID</label>
					</div>
					<div class="form-group">
	  					<input type="password" class="form-control" id="password" required>
  						<label class="form-control-placeholder" for="password">Password</label>
					</div>
					<div class="buttonlogin">
						<button type="button" class="btn btn-primary" onclick="location.href='loginafter'">평가자 로그인</button>
						<button type="button" class="btn btn-primary" onclick="location.href='surveylist'">관리자 로그인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>