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

<!-- 				<form id="excelUploadForm" name="excelUploadForm" -->
<!-- 					enctype="multipart/form-data" method="post" -->
<%-- 					action="<c:url value='/survey/excelUpload_project.do'/>"> --%>
<%-- 					<a href="<c:url value='/excelDownload.do/project'/>"> 이력 다운받기</a> --%>
<!-- 					<div class="upload_file"> -->
<!-- 						<label for="excelFile">Excel 업로드</label> <input type="file" -->
<!-- 							id="excelFile" name="excelFile" /> -->
<!-- 						<button type="submit""> -->
<!-- 							<span>저장</span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</form> -->






<!-- 				<form id="excelUploadForm" name="excelUploadForm" -->
<!-- 					enctype="multipart/form-data" method="post" -->
<%-- 					action="<c:url value='/survey/excelUpload_OC.do'/>"> --%>
<%-- 					<a href="<c:url value='/excelDownload.do/OC'/>"> 조직정보 다운받기</a> --%>
<!-- 					<div class="upload_file"> -->
<!-- 						<label for="excelFile">Excel 업로드</label> <input type="file" -->
<!-- 							id="excelFile" name="excelFile" /> -->
<!-- 						<button type="submit""> -->
<!-- 							<span>저장</span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</form> -->




				<form action="/excelUploadOCD.do" id="excelUploadFormOCD" name="excelUploadForm" enctype="multpart/form-data" method="post">
					<div class="contents">
						<div>첨부파일은 한개만 가능합니다.</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">조직도 엑셀 첨부 파일</label>
							<input type="file" id="excelFileOCD" name="excelFile" class="form-control">
						</div>
					</div>
					<div  class="modal-footer">
						<a href="<c:url value='/excelDownload.do/project'/>"> 이력 다운받기</a>
						<input type="button" id="addExcelImportBtn" onclick="checkOCD()" class="btn btn-primary" value="추가">
					</div>
				</form>
				<form action="/excelUploadPH.do" id="excelUploadFormPH" name="excelUploadForm" enctype="multpart/form-data" method="post">
					<div class="contents">
						<div>첨부파일은 한개만 가능합니다.</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">프로젝트 엑셀 이력 첨부 파일</label>
							<input type="file" id="excelFilePH" name="excelFile" class="form-control">
						</div>
					</div>
					<div class="modal-footer">
					<a href="<c:url value='/excelDownload.do/OC'/>"> 조직정보 다운받기</a>
						<input type="button" id="addExcelImportBtn" onclick="checkPH()"  class="btn btn-primary" value="추가">
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
			width="160" height="100" style="margin-left:10px; margin-top:10px;" class="d-inline-block align-top">
	</div>
<div style="text-align: center;">
		<br> <br>
		<div class="menu_item" style="">
			<a class="menu_a" id="menu_list" href="<c:url value='/survey/surveysearch.do'/>">
				목록 조회</a>
		</div>
 <br>
		<div class="menu_item"  style="">
			<a class="menu_a" id="menu_result" href="<c:url value='/survey/surveyresultteam.do'/>">결과 통계</a>
		</div>
 <br>
		<div class="menu_item" style="">
		<div class="btn-group dropright">
  			<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" id="evaluate_result_btn"
  				style="padding: 0px!important;">
    			피평가자 결과
  			</button>
  			<div class="dropdown-menu" style="width:170px">
  				<c:forEach items="${completeSurvey}" var="CS">
    					<a style="color:black;" href="<c:url value='/survey/evaluatesearch.do//${CS.surveySeq}'/>">${CS.surveyName}<br></a>
  				</c:forEach>
  			</div>
		 </div>
		</div>
 <br>
		<div class="menu_item" style="">
		<div class="btn-group dropright">
  			<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" id="evaluate_message_btn"
  			style="padding: 0px!important;">
    			평가 참여 여부
  			</button>
  			<div class="dropdown-menu" style="width:170px">
  				<c:forEach items="${completeSurvey}" var="CS">
    					<a style="color:black;" href="<c:url value='/survey/evaluateMessage.do/${CS.surveySeq}'/>">${CS.surveyName}<br></a>
  				</c:forEach>
  			</div>
		</div>
		</div>
 <br>
		<div class="menu_item"style="height: 70px;cursor: pointer;">
			<a data-toggle="modal" style="color:black;" data-target="#json" onclick="">프로젝트 이력 및<br>조직도 업로드</a>
		</div>
 <br>
		<c:if test="${checked ne '' }">
		<div class="menu_item" style="">
			<a style="color:black;" href="<c:url value='/logout.do'/>">로그아웃</a>
		</div>
		</c:if>
 <br>
		<c:if test="${checked eq '' }">
		<div class="menu_item"style="">
			<a style="color:black;" href="<c:url value='/login.do'/>">로그인</a>
		</div>
		</c:if>
 <br>
	<!--<a class="btn btn-success btn-sm" href="#">로그아웃</a> -->
	</div>
</div>

<script src="https://malsup.github.io/jquery.form.js"></script>
<script>
function checkFileType(filePath) {
	var fileFormat = filePath.split(".");

	 if (fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1) {
         return true;
         } else {
         return false;
       }
     }

function checkOCD() {
	var file =$("#excelFileOCD").val();

	if(file==""||file==null){
		alert("파일을 선택해주세요.");
		return false;
	}else if(!checkFileType(file)){
		alert("엑셀 파일만 업로드 가능합니다.");
		return false;
	}

	if(confirm("업로드 하시겠습니까?")){
		var options={
				success:function(data){
					console.log(data);
					alert("모든 데이터가 업로드 되었습니다.");
					 $('#json').modal('hide');
				},error(){
					alert("다시 시도해 주세요.")
				},
				error:function(e){
					alert("데이터 업로드가 실패 되었습니다.");
					 $('#json').modal('hide');
				},
		type:"POST"
		};

		$("#excelUploadFormOCD").ajaxSubmit(options);

	}
}

function checkPH() {
	var file =$("#excelFilePH").val();

	if(file==""||file==null){
		alert("파일을 선택해주세요.");
		return false;
	}else if(!checkFileType(file)){
		alert("엑셀 파일만 업로드 가능합니다.");
		return false;
	}

	if(confirm("업로드 하시겠습니까?")){
		var options={
				success:function(data){
					console.log(data);
					alert("모든 데이터가 업로드 되었습니다.");
					 $('#json').modal('hide');
				},error(){
					alert("다시 시도해 주세요.")
				},
				error:function(e){
					alert("데이터 업로드가 실패 되었습니다.");
				},
		type:"POST"
		};

		$("#excelUploadFormPH").ajaxSubmit(options);
	}
}

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


function check() {
    if(confirm("업로드 여부")) {
    	var organizationForm = $('.excelUploadForm')[0];
    	  var organizationJSONformData = new FormData(organizationForm);
    	  $.ajax({
    		     method:'POST', //어떤 방식으로 보낼 지
    		     url:'/survey/excelUpload_project.do', // qdiv를 보낼 경로 설정
    			 data: organizationJSONformData,
    			 enctype: 'multipart/form-data',
    		     processData : false,
    		     contentType : false,
    		     beforeSend : function() { //보내기 전 실행
    		     console.log("요청이 보내지는가?");
    		     },
    		     success:function (result) {    //전송 성공시 실행



    		        }, error:function(e) {   //실패, 에러
    		           console.log("Error", e);
    		        }
    		  });
 }
}
</script>