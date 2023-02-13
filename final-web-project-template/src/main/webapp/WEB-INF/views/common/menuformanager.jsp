<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

body {
 font-family: RegularFont, NanumGothic, sans-serif;
}

</style>

<!--  모달 -->
<div class="modal fade" id="json" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로젝트 이력 및 조직도 업로드</h5>

				</div>

			
				<div class="modal-body">
					<form  id="projectHistoryForm"  method="POST" >
				<a href="<c:url value='/excelDownload.do/project'/>"> 이력 다운받기</a>

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">프로젝트 이력</label>
							<input type="file" id="filePath" name="projecthistoryjson" class="form-control">
						</div>


					<div class="modal-footer">

							<input type="button" onclick="uploadProjectHistory()" class="btn btn-primary" value="등록">
						</div>

					</form>
							

						
					
					
					<form  id="organizationForm">
<a href="<c:url value='/excelDownload.do/OC'/>"> 조직정보 다운받기</a>

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">조직정보</label>
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
	</div><!--  모달 끝 -->

<div class="menu_profile">
	<div style="border-bottom: 1px solid white; text-align: center;">
		<img
			src="${pageContext.request.contextPath}/resources/images/logo_img.png"
			width="100" height="100" class="d-inline-block align-top">
	</div>
	<div style="text-align: center;">
		<br> <br>
		<div class="menu_item" style="">
			<a style="color:black;" href="<c:url value='/survey/surveysearch.do'/>">
				목록 조회</a>
		</div>
		<br> <br>


		<div class="menu_item" style="">
			<a style="color:black;" href="<c:url value='/survey/surveyresultteam.do'/>">결과 통계</a>
		</div>
		<br> <br>
		<c:if test="${checked ne '' }">
		<div class="menu_item" style="">
			<a style="color:black;" href="<c:url value='/logout.do'/>">로그아웃</a>
		</div>
		</c:if>
		<c:if test="${checked eq '' }">
		<div class="menu_item"style="">
			<a style="color:black;" href="<c:url value='/login.do'/>">로그인</a>
		</div>
		</c:if>
		<br> <br>
		<div class="menu_item"style="height: 70px;">
			<a data-toggle="modal" style="color:black;" data-target="#json" onclick="">프로젝트 이력 및<br>조직도 업로드</a>

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