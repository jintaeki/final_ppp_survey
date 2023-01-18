	//진택
	var cnt = 0;
	//설문 설정 비동기 수정
	function register() {
		var form = $('#form')[0];

		var data = new FormData(form);

		$.ajax({
			method : "POST",
			url : 'surveyupdate.do', // form을 전송할 실제 파일경로
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			beforeSend : function() {
				// 전송 전 실행 코드
			},
			success : function(data) {
				// 전송 후 성공 시 실행 코드
				console.log(data);
			},
			error : function(e) {
				// 전송 후 에러 발생 시 실행 코드
				console.log("ERROR : ", e);
			}
		});

	}

	//문항 비동기 등록(수정) 
	function updateitem_btn() {
		var form = $('#form')[0];

		var data = new FormData(form);

		$.ajax({
			method : "POST",
			url : 'itemupdate.do', // form을 전송할 실제 파일경로
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			beforeSend : function() {
				// 전송 전 실행 코드
			},
			success : function(data) {
				// 전송 후 성공 시 실행 코드
				console.log(data);
			},
			error : function(e) {
				// 전송 후 에러 발생 시 실행 코드
				console.log("ERROR : ", e);
			}
		});

	}

	/*문제 삭제*/
	function delete_btn(obj) {
		const tag = $(obj);
		tag.parent().remove();
	}

	//문제 추가
	$("#itemcopy").click(function() {
		if (cnt < 1000) {
			const testDiv = document.getElementById('newItem');
			const testDiv1 = document.getElementById('ItemAfter');
			const newNode = testDiv.cloneNode(true);
			newNode.style.display = 'inline-block';
			cnt++;
			testDiv1.after(newNode);

		} else {
			alert("문항은 최대 5개까지 생성 가능합니다.");
		}
	});
	// 진택 끝