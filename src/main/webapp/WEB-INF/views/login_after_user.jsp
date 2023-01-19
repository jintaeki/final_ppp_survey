<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
function surveyopen(obj){
    window.open("http://localhost:8080/springframework-xml-config-no-root/survey", "_blank");
	const tag = $(obj);
	 
	const completeMsg = `완료`;
	tag.parent().prev().html(completeMsg);
	tag.parent().prev().css('color', '#ccc').css('font-weight', 'normal');
	
	tag.parent().css('color', '#ccc');
	tag.parent().html(completeMsg);
	
   }
</script>
<div class="container">
	<div class="card-body">
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">프로젝트명</th>
						<th scope="col">대상</th>
						<th scope="col">진행상태</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td class="pj_name">다면평가 시스템 구축</td>
						<td>김찬수</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td class="pj_name">다면평가 시스템 구축</td>
						<td>민채우</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td class="pj_name">스프링부트를 이용한 배치관리시스템 구축</td>
						<td>임진택</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td class="pj_name">스프링부트를 이용한 배치관리시스템 구축</td>
						<td>최병준</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td class="pj_name">점포관리 시스템 구축</td>
						<td>홍길동</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">6</th>
						<td class="pj_name">점포관리 시스템 구축</td>
						<td>이순신</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">7</th>
						<td class="pj_name">용어사전 관리 시스템 구축</td>
						<td>을지문덕</td>
						<td class="not_comp">미완료</td>
						<td><button type="button" class="btn btn-primary"
								onclick="surveyopen(this)">설문 시작</button></td>
					</tr>
					<tr>
						<th scope="row">8</th>
						<td class="pj_name">용어사전 관리 시스템 구축</td>
						<td>권율</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">9</th>
						<td class="pj_name">연수관리 시스템 구축</td>
						<td>장보고</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
					<tr>
						<th scope="row">10</th>
						<td class="pj_name">연수관리 시스템구축</td>
						<td>임꺽정</td>
						<td class="comp">완료</td>
						<td class="comp">완료</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="page_wrap">
		<div class="page_nation">
			<a class="arrow prev" href="#"> << </a> 
			<a href="#" class="active">1</a>
			<a href="#">2</a> 
			<a href="#">3</a> 
			<a href="#">4</a> 
			<a href="#">5</a>
			<a class="arrow next" href="#"> >> </a>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>