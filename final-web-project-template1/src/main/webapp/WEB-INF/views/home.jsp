<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>

function change_my_select(){
	$('.btn_submit').attr('disabled',true);
	var hhh = document.getElementById('myselect')
	if(hhh.options[hhh.selectedIndex].value == "subj"){
		
		$('#btn_obj_toggle').attr('disabled',true);
		$('#btn_mix_toggle').attr('disabled',true);
		$('#btn_subj_toggle').removeAttr('disabled');
	}
	if(hhh.options[hhh.selectedIndex].value == "obj"){
		$('#btn_subj_toggle').attr('disabled',true);
		$('#btn_mix_toggle').attr('disabled',true);
		$('#btn_obj_toggle').removeAttr('disabled');
	}
	if(hhh.options[hhh.selectedIndex].value == "mix"){
		$('#btn_obj_toggle').attr('disabled',true);
		$('#btn_subj_toggle').attr('disabled',true);
		$('#btn_mix_toggle').removeAttr('disabled');
	}
	console.log(hhh);
}

	$(function() {
		//객관식 버튼
			
		$("#btn_obj_toggle").click(function() {
			if($('.btn_submit').attr('disabled') == 'disabled'){
				$('.btn_submit').removeAttr('disabled');
			}else{
				$('.btn_submit').attr('disabled',true);
			}	
				$("#obj_box_toggle").slideToggle();				
		});
		


		//혼합식 버튼
		$("#btn_mix_toggle").click(function() {
			if($('.btn_submit').attr('disabled') == 'disabled'){
				$('.btn_submit').removeAttr('disabled');
			}else{
				$('.btn_submit').attr('disabled',true);
			}	
				$("#mix_box_toggle").slideToggle();				
		});
		
		//주관식 버튼
		$("#btn_subj_toggle").click(function() {
			if($('.btn_submit').attr('disabled') == 'disabled'){
				$('.btn_submit').removeAttr('disabled');
			}else{
				$('.btn_submit').attr('disabled',true);
			}							
		});
		
		$("#btn_for_answer_box").click(function(){
			$(".select_answer_box").slideToggle();		

		});
		
		
	});
	

</script>
<!-- 문제 div 안에 넣기 -->
<div class="card m-2" style="float:left; width:150px;">
		<button class="btn btn-secondary" id="btn_for_answer_box" >ans</button>
	</div>
<!-- 문제 div 안에 넣기 끝-->


<div class="select_answer_box" style="display:none; width: 500px; float:right;" >
	
	<div class="select_one_of_three">
	<select id="myselect" onchange="change_my_select()">
		<option value="subj">주관식</option>
		<option value="obj">객관식</option>
		<option value="mix">혼합식</option>
	</select>
	
	<div class="card m-2">
		<button class="btn btn-secondary" id="btn_obj_toggle" disabled>객관식</button>
	</div>
	
	<div class="card m-2">
		<button class="btn btn-secondary" id="btn_subj_toggle"  disabled>주관식</button>
	</div>
	
	<div class="card m-2">
		<button class="btn btn-secondary" id="btn_mix_toggle" disabled>혼합식</button>
	</div>
	
	</div>
	
	
	

	



<div class="manage_answer_box">
	<div id="obj_box_toggle" style="display: none">객관식 문항 관리 박스</div>
	<div id="mix_box_toggle" style="display: none">혼합식 문항 관리 박스</div>
</div>

<input type="submit" value="등록" class="btn_submit" name="bbbb" disabled>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>


