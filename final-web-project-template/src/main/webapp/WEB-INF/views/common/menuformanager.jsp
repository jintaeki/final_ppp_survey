<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}

</style>

<div class="modal fade" id="json" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로젝트 이력 및 조직도 업로드</h5>
					
				</div>


				<div class="modal-body">
					<form  id="projectHistoryForm"  method="POST" >

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">프로젝트 이력</label>
							<input type="file" id="filePath" name="projecthistoryjson" class="form-control">
						</div>
	
						
					<div class="modal-footer">
								
							<input type="button" onclick="uploadProjectHistory()" class="btn btn-primary" value="등록">
						</div>
						
					</form>
					
					
					<form  id="organizationForm">

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">조직도</label>
							<input type="file" name="organizationjson" class="form-control"
							>
						</div>
	
						
						
					<div class="modal-footer">
							
							<input type="button" onclick="uploadOrganization()" class="btn btn-primary" value="등록">
						</div>
						
					</form>
					
				</div>

			</div>
		</div>
	</div>

<div class="menu_profile">
	<div style="border-bottom: 1px solid white; text-align: center; margin-top: 20px;">
		<img
			src="${pageContext.request.contextPath}/resources/images/logo_img.png"
			width="100" height="100" class="d-inline-block align-top">
	</div>
	<div style="text-align: center;">
		<br> <br>
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/survey/surveysearch'/>">
				목록 조회</a>
		</div>
		<br> <br>
	
		
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white"
				href="<c:url value='/survey/surveyresultteam'/>">결과 통계</a>
		</div>
		<br> <br>
		<c:if test="${checked ne '' }">		
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/logout'/>">로그아웃</a>
		</div>
		</c:if>
		<c:if test="${checked eq '' }">
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/login'/>">로그인</a>
		</div>
		</c:if>
		<br> <br>
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a data-toggle="modal" class="text-white" data-target="#json" onclick="">프로젝트 이력 및 조직도 업로드</a>
		</div>
		
		
	</div>
	<!--<a class="btn btn-success btn-sm" href="#">로그아웃</a> -->
</div>


<script>

function uploadProjectHistory(){
	var projectHistoryForm = $('#projectHistoryForm')[0];
 	var projecthistoryJSONformData = new FormData(projectHistoryForm);
	
  $.ajax({
     method:'POST', //어떤 방식으로 보낼 지
     url:'/survey/fileuploadprojecthistory.do/', // qdiv를 보낼 경로 설정
	 data:projecthistoryJSONformData,
	 enctype: 'multipart/form-data',  
     processData : false,
     contentType : false,           
     beforeSend : function() { //보내기 전 실행
     console.log("요청이 보내지는가?"); 
     },
     success:function (result) {    //전송 성공시 실행
		if(result=="2"){
    	 	alert("저장 성공");
		}else if(result=="1") {
			alert("프로젝트 이력 파일인지 확인해 주세요.");
		}else if(result=="0"){
			alert("json타입의 파일만 지원 가능합니다.");	 
		}
     
    

        }, error:function(e) {   //실패, 에러
           console.log("Error", e);
        }
  });
}

function uploadOrganization(){
  var organizationForm = $('#organizationForm')[0];
  var organizationJSONformData = new FormData(organizationForm);
  $.ajax({
	     method:'POST', //어떤 방식으로 보낼 지
	     url:'/survey/fileUploadOrganization.do/', // qdiv를 보낼 경로 설정
		 data: organizationJSONformData,
		 enctype: 'multipart/form-data',  
	     processData : false,
	     contentType : false,           
	     beforeSend : function() { //보내기 전 실행
	     console.log("요청이 보내지는가?"); 
	     },
	     success:function (result) {    //전송 성공시 실행
	    	 if(result=="2"){
	     	 	alert("저장 성공");
	 		}else if(result=="1") {
	 			alert("프로젝트 이력 파일인지 확인해 주세요.");
	 		}else if(result=="0"){
	 			alert("json타입의 파일만 지원 가능합니다.");	 
	 		}


	        }, error:function(e) {   //실패, 에러
	           console.log("Error", e);
	        }
	  });
}
</script>