
//평가 유무 비동기 체크
function result_search_btn(surveySeq, employeeId) {
      var data =$('#surveyResultList')[0]
      let empid = employeeId;
      let surseq = surveySeq;
      $.ajax({
       method: 'POST',
       url: '/survey/surveyresultcheck.do/' + surveySeq + '/' + employeeId,
       processData : false,
       contentType : false,
        cache : false,
        beforeSend: function() {
            console.log("surveyresult 비동기 요청");
            console.log(employeeId);
            console.log(surveySeq);

         },
         success: function(data){
       if(data[0] != null){

//           console.log(data);
//          console.log(empid);
//          console.log(surseq);
          location.href="/survey/surveyresult.do/"+surseq+'/'+empid;
       }else{
            alert("평가 데이터가 없습니다.");
       }
          },error : function(e) {   //실패, 에러
              console.log("Error", e);
          }
      });
   }
   
   