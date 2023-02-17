/* 전체 선택 */
   $(function() {
      $("#check_all").click(function() {
         var chk = $(this).is(":checked");
         if (chk)
            $("#resTb input[name='chk_res']").prop('checked', true);
         else
            $("#resTb input[name='chk_res']").prop('checked', false);
      });
   });
   /* 체크값이 없을 경우 알림 */
   function selectItem() {
      if ($("#resTb input[name='chk_res']:checked").length == 0) {
         alert("추가할 인원을 선택해주세요");
         return false;
      }
      var resArr = new Array();
      $("#resTb input[name='chk_res']:checked").each(
            function(index) {
               var plusId = $(this).val();
               var addObj = new Object();
               $tr = $("#tr_" + plusId);
               addObj.projectId      = $tr.find("input[name='projectId']").val();
               addObj.gradeId        = $tr.find("input[name='gradeId']").val();
               addObj.rDepartmentId   = $tr.find("input[name='rDepartmentId']").val();
               addObj.aDepartmentId   = $tr.find("input[name='aDepartmentId']").val();
               addObj.surveySeq      = $tr.find("input[name='surveySeq']").val();
               addObj.raterId        = $tr.find("input[name='raterId']").val();
               addObj.appraiseeId    = $tr.find("input[name='appraiseeId']").val();
               addObj.projectName    = $tr.find("input[name='projectName']").val();
               addObj.surveyName     = $tr.find("input[name='surveyName']").val();
               addObj.rDepartmentName = $tr.find("input[name='rDepartmentName']").val();
               addObj.aDepartmentName = $tr.find("input[name='aDepartmentName']").val();
               addObj.raterName      = $tr.find("input[name='raterName']").val();
               addObj.appraiseeName  = $tr.find("input[name='appraiseeName']").val();
               addObj.gradeName      = $tr.find("input[name='gradeName']").val();
               resArr.push(addObj);
      console.log(plusId);
      });
      console.log(resArr);   
     
     $.ajax({
       url: "popup.do",
       type: "POST",
       contentType: "application/json;charset=UTF-8",
       data:JSON.stringify(resArr),
       dataType : "json"
      })
     .done(function(resMap) {
        alert(resMap.msg);
       opener.parent.location.reload();
       window.close();
     })
     .fail(function(e) {
        alert("추가 실패");
     })
     always(function() {
       alert(resMap.msg);

     });   
   }