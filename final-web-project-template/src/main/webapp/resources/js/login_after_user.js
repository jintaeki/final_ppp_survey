function surveyopen(obj){
	// survey_result 테이블에 필요한 요소들 온클릭 메소드 안에 넣어주고 같이 survey 컨트롤러로 이동해보자
	// 위 사항을 적어둔 이유는 평가 페이지를 통해서 survey_result 테이블에 데이터가 들어갈거고 평가했는 지 여부가 결정나기 때문
    window.open("http://localhost:8080/springframework-xml-config-no-root/survey", "_blank");
	const tag = $(obj);
	
	const completeMsg = `완료`;
	tag.parent().prev().html(completeMsg);
	tag.parent().prev().css('color', '#ccc').css('font-weight', 'normal');
	
	tag.parent().css('color', '#ccc');
	tag.parent().html(completeMsg);
	
   }