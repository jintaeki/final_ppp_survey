<<<<<<< HEAD
<<<<<<< HEAD
//survey start alert
Swal.fire({
  title: '<br>1.건전한 조직 문화 건설을 위해 거짓없이 성실히 임할 것을 약속한다.<br>2.다면 평가 관련 편견에 치우친  공개적 발언을 하여서는 아니된다.<br>3.다면 평가 중 편견이나 정실에 흐름없이 공정을 기하여야 한다.<br>4.다면 평가 자료를 외부로 유출 (사진 촬영 등) 행위는 금한다.<br><br>평가자 본인은 다면평가 수칙을 준수할 것을 약속합니다.  ',
  allowOutsideClick: () => {
    const popup = Swal.getPopup()
    popup.classList.remove('swal2-show')
    setTimeout(() => {
      popup.classList.add('animate__animated', 'animate__headShake')
    })
    setTimeout(() => {
      popup.classList.remove('animate__animated', 'animate__headShake')
    }, 500)
    return false
    document.getElementById("popup").style.fontSize = "5px";
  }
})

//survey Question
$(function() {
	const cardBody = $(".card-body").eq(0);
	console.log(cardBody.length);

	$(".card-body").hide();
	cardBody.show();

	$(".card-body button").click(
			function() {
				$(this).parent().toggle();
//				if(다음꺼 카드 클래스가 컴플리트가 아니면 토글)
				$(this).closest(".accordion").next().find(".card-body")
				.slideToggle();
			});
})

$(function (){
	$(".accordion .card-header").click(function() {
		$(this).parent().find(".card-body").toggle();
	});
});
=======
//survey start alert
Swal.fire({
  title: '<br>1.건전한 조직 문화 건설을 위해 거짓없이 성실히 임할 것을 약속한다.<br>2.다면 평가 관련 편견에 치우친  공개적 발언을 하여서는 아니된다.<br>3.다면 평가 중 편견이나 정실에 흐름없이 공정을 기하여야 한다.<br>4.다면 평가 자료를 외부로 유출 (사진 촬영 등) 행위는 금한다.<br><br>평가자 본인은 다면평가 수칙을 준수할 것을 약속합니다.  ',
  allowOutsideClick: () => {
    const popup = Swal.getPopup()
    popup.classList.remove('swal2-show')
    setTimeout(() => {
      popup.classList.add('animate__animated', 'animate__headShake')
    })
    setTimeout(() => {
      popup.classList.remove('animate__animated', 'animate__headShake')
    }, 500)
    return false
    document.getElementById("popup").style.fontSize = "5px";
  }
})

//survey Question
$(function() {
	const cardBody = $(".card-body").eq(0);
	console.log(cardBody.length);

	$(".card-body").hide();
	cardBody.show();

	$(".card-body button").click(
			function() {
				$(this).parent().toggle();
//				if(다음꺼 카드 클래스가 컴플리트가 아니면 토글)
				$(this).closest(".accordion").next().find(".card-body")
				.slideToggle();
			});
})

$(function (){
	$(".accordion .card-header").click(function() {
		$(this).parent().find(".card-body").toggle();
	});
});
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
=======
//survey start alert
Swal.fire({
  title: '<br>1.건전한 조직 문화 건설을 위해 거짓없이 성실히 임할 것을 약속한다.<br>2.다면 평가 관련 편견에 치우친  공개적 발언을 하여서는 아니된다.<br>3.다면 평가 중 편견이나 정실에 흐름없이 공정을 기하여야 한다.<br>4.다면 평가 자료를 외부로 유출 (사진 촬영 등) 행위는 금한다.<br><br>평가자 본인은 다면평가 수칙을 준수할 것을 약속합니다.  ',
  allowOutsideClick: () => {
    const popup = Swal.getPopup()
    popup.classList.remove('swal2-show')
    setTimeout(() => {
      popup.classList.add('animate__animated', 'animate__headShake')
    })
    setTimeout(() => {
      popup.classList.remove('animate__animated', 'animate__headShake')
    }, 500)
    return false
    document.getElementById("popup").style.fontSize = "5px";
  }
})

//survey Question
$(function() {
	const cardBody = $(".card-body").eq(0);
	console.log(cardBody.length);

	$(".card-body").hide();
	cardBody.show();

	$(".card-body button").click(
			function() {
				$(this).parent().toggle();
//				if(다음꺼 카드 클래스가 컴플리트가 아니면 토글)
				$(this).closest(".accordion").next().find(".card-body")
				.slideToggle();
			});
})

$(function (){
	$(".accordion .card-header").click(function() {
		$(this).parent().find(".card-body").toggle();
	});
});
>>>>>>> refs/remotes/origin/cbj2
