var surveySeq="";
var raterId="";

$(document).ready(function() {
    $('#popup').on('shown.bs.modal', function(event) {
        surveySeq = $(event.relatedTarget).data('surveyseq');
        raterId = $(event.relatedTarget).data('raterid');
        console.log(surveySeq);
    });
});

function popup(){
   var month = $('#month').val();

   let popUrl ="/mapping/popup.do?pageNo=1&surveySeq="+surveySeq+"&raterId="+raterId
            +"&month="+month+"&keyword=&keyword2=&selection=60004&selection2=60004&selectGD=60004";
   let popOption = "width=1000, height=820, left=370, top=100";
   window.open(popUrl, "다면평가 대상 추가", popOption);
}

function mapInsert(surveySeq){

   let popUrl ="/mapping/another.do?surveySeq="+surveySeq
            +"&keyword=&keyword2=&selection=60004&selection2=60004&selectGD=60004";
   let popOption = "width=1000, height=820, left=370, top=100";
   window.open(popUrl, "다면평가 대상 추가", popOption);
}


function map_delete(surveySeq, raterId, appraiseeId){
   if(confirm("삭제를 하시겠습니까?")){
      var submitObj = new Object();
      submitObj.surveySeq= surveySeq;
      submitObj.raterId= raterId;
      submitObj.appraiseeId= appraiseeId;
      $.ajax({
         url: "deleteMapping.do",
          type: "POST",
          contentType: "application/json;charset=UTF-8",
          data:JSON.stringify(submitObj),
          dataType : "json"
          })
          .done(function(resMap) {
             alert(resMap.msg);
             window.location.reload();
          })
          .fail(function(e) {
              alert("삭제를 실패하였습니다.");
          })
          .always(function() {
          });
   };
}
