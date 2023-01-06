<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey_list.css"/>

<script>
function send(obj){	
	const tag = $(obj);
	
	const completeMsg = `전송완료`;
	const complete = `확정`;
	const text = `<button type="button" class="btn btn-link" onclick="location.href='mapping/deleteMapping.do'">조회</button>`;
	tag.parent().next().append(text);
	
	tag.parent().prev().html(complete);
	tag.parent().prev().css('font-weight', 'bold');
	
	tag.closest('tr').css('color', '#ccc');	
	tag.parent().html(completeMsg);
		
	tag.hide();
		
   }

function popup() 
{window.open("/springframework-xml-config-no-root/popup", "다면평가 대상 추가", 
      "width=800, height=600, left=500, top=100");}
   
</script>

<div class="card m-2">
	<div class="card-body">
		<h3>설문조사이름 - 평가자-피평가자 목록</h3>
		<div class="container my-5">
			<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">직급</th>
							<th scope="col">평가자</th>
							<th scope="col">피평가자</th>
							<th scope="col">삭제여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">9</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>직급</td>
							<td class="sv_name"><input type="button" value="대상 추가" onclick="popup();" /></td>
							<td>이떙떙</td>
							<td>삭제 버튼</td>
						</tr>
					</tbody>
				</table>
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>