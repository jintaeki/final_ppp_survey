function login(){
	var data = $('#loginCheck')[0];
	var formdata = new FormData(data);
	
	$.ajax({
		method : "POST",
         url : 'logincheck.do/', // form을 전송할 실제 파일경로
         data: formdata,
         processData : false,
         contentType : false,
         cache : false,
         timeout : 600000,
         dataType: 'html',
         beforeSend : function() {
            // 전송 전 실행 코드
         },
         success : function(data) {
        	 if(data=='noPassword'){alert("비밀번호를 입력해 주세요."); return false;}
        	 else if(data=='noId'){alert("아이디를 입력해 주세요."); return false;}
        	 else if(data=='successRater'){var raterName = sessionStorage.getItem('raterName');alert(raterName+" 님 어서오세요");location.href="/survey.do" }
        	 else if(data=='successManager'){alert("관리자 님 어서오세요.");location.href="/survey/surveysearch.do" }
        	 else if(data=='loginFail'){alert("아이디 혹은 비밀번호를 정확하게 입력해 주세요."); return false;}
        	 else{alert(data+"님 어서오세요");location.href="/survey.do" };
         },
         error : function(e) {
            // 전송 후 에러 발생 시 실행 코드
            console.log("ERROR : ", e);
         }
	})
	
}
