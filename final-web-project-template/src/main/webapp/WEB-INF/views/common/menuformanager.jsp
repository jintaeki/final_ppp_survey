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
<%-- 					<c:url value="/fileUploadProjectHistory.do" var="actionURL" scope="page" /> --%>
					<form action="${pageContext.request.contextPath}/fileUploadProjectHistory.do" id="projectHistoryForm"  enctype="multipart/form-data" >

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">프로젝트 이력</label>
							<input type="file" id="projectHistory" class="form-control"
								>
						</div>
	
						<br>
						<br>
						
					<div class="modal-footer">
								<input type="reset" class="btn btn-secondary"
								data-dismiss="modal">초기화
							<input type="button" onclick="uploadProjectHistory()" class="btn btn-primary" value="등록">
						</div>
						
					</form>
					
					<c:url value="/fileUploadOrganization.do" var="actionURL" scope="page" />
					<form:form action="${actionURL}" modelAttribute="SLD" id="organization">

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">조직도</label>
							<input type="file" class="form-control"
							>
						</div>
	
						<br>
						<br>
						
					<div class="modal-footer">
							<input type="reset" class="btn btn-secondary"
								data-dismiss="modal">초기화
							<input type="button" onclick="uploadOrganization()" class="btn btn-primary" value="등록">
						</div>
						
					</form:form>
					
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
			<a class="text-white" href="<c:url value='/survey/surveysearch.do'/>">
				목록 조회</a>
		</div>
		<br> <br>
		
<!-- 		<div style="background:#1b2435;height: 50px; padding: 10px;"> -->
<!-- 			<a class="text-white" href="surveysearch?anonyMityCheckCode='30001'&pageno=&keyword=&selection=&surveyStartDate= />">작성 중인 평가지 보기 -->
<!-- 				</a> -->
<!-- 		</div> -->
<!-- 		<br> <br> -->
		
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white"
				href="<c:url value='/survey/surveyresultteam.do'/>">결과 통계</a>
		</div>
		<br> <br>
		<c:if test="${checked ne '' }">		
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/logout.do'/>">로그아웃</a>
		</div>
		</c:if>
		<c:if test="${checked eq '' }">
		<div style="background:#1b2435;height: 50px; padding: 10px;">
			<a class="text-white" href="<c:url value='/login.do'/>">로그인</a>
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

function checkFileType(filePath) {
    var fileFormat = filePath.split(".");
    if (fileFormat.indexOf("xlsx") > -1) {
        return true;
    } else {
        return false;
    }

}

function check() {
    var file = $("#excelFile").val();
    if (file == "" || file == null) {
        alert("파일을 선택해주세요.");
        return false;
    } else if (!checkFileType(file)) {
        alert("엑셀 파일만 업로드 가능합니다.");
        return false;
    }

    if (confirm("업로드 하시겠습니까?")) {
        var options = {
            success : function(data) {
            	console.log(data);
            	
            	if(data.length==0){
            		alert("모든 데이터가 업로드 되었습니다.");	
            	}else{
            		alert("중복 용어를 제외한 모든 데이터가 업로드 되었습니다."+data)
            	}
            },
            type : "POST"
        };
        $("#excelUploadForm").ajaxSubmit(options);

    }
}

function uploadProjectHistory(){

  var projecthistoryJSON = $('#projectHistory').val();
  var projecthistoryJSONformData = new FormData($('#projectHistoryForm')[0]);
//   var options = {
//           success : function(data) {
//           	console.log(data);
          	
//           	if(data.length==0){
//           		alert("모든 데이터가 업로드 되었습니다.");	
//           	}else{
//           		alert("중복 용어를 제외한 모든 데이터가 업로드 되었습니다."+data)
//           	}
//           },
//           type : "POST"
//       };
//   $('#projectHistoryForm').ajaxSubmit(options);
//   var projecthistoryJSONformData = new FormData(projecthistoryJSON)
//    var jsonFile = JSON.stringify(projecthistoryJSONformData);
//   console.log(jsonFile);
  $.ajax({
     method:'POST', //어떤 방식으로 보낼 지
     url:'fileUploadProjectHistory.do/', // qdiv를 보낼 경로 설정
     data: projecthistoryJSONformData,
     contentType: false,              
     processData: false,              
      beforeSend : function() { //보내기 전 실행
     console.log("요청이 보내지는가?");
     },
     success:function (data) {    //전송 성공시 실행



        }, error:function(e) {   //실패, 에러
           console.log("Error", e);
        }
  });
}

function uploadOrganization(){
  var organizationJSON = $('#organization').val();
  var questionid = $(obj).val();
  $.ajax({
     method:'POST', //어떤 방식으로 보낼 지
     url:'fileUploadOrganization.do/' + questionid+'/'+sq, // qdiv를 보낼 경로 설정
     dataType: "json",
      beforeSend : function() { //보내기 전 실행
     console.log("요청이 보내지는가?");
     },
     success:function (data) {    //전송 성공시 실행
        cntObj=0;
        cntMix=0;

            itemHtml(data,questionid);


        }, error:function(e) {   //실패, 에러
           console.log("Error", e);
        }
  });
}
</script>