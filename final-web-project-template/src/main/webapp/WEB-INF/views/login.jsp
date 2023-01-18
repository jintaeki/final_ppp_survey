<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>다면평가 시스템</title>

   <!-- CSS -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paging.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
   <!-- Javascript -->
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>



<div class="card m-2">
	<div class="card-body">
		<div class="container my-5">
  			<div class="row">
    			<div class="col-md-6 mx-auto">	
    				<div class="logintitle">
						<p class="h1 font-weight-bold">다면평가 로그인</p>
    				</div>		
    				<c:url value="/logincheck" var="actionURL" scope="page" />
    				<form:form action="${actionURL }" modelAttribute="UCD">
						<div class="form-group">
  							<input type="text" class="form-control" name= "email" id="email" value="RQELZD@kcc.co.kr" required>
  							<label class="form-control-placeholder" for="email" >Email</label>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="raterId" value="118879"
								id="id" required> <label
								class="form-control-placeholder" for="id" >ID</label>
						</div>
						<div class="buttonlogin">
							<button type="submit" class="btn btn-primary">로그인</button>
<!-- 							<button type="button" class="btn btn-primary" -->
<!-- 								onclick="location.href='survey/surveylist'">관리자 로그인</button> -->
						</div>
					</form:form>	
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>

