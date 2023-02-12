<script>
function reset_btn_mapping(){
		$('.searchRangeAll').empty();
		html='';
		
		//이 안에 select 옵션 들어가는 거 채워줭

	html +=`<div class="input-group-append">
			<input type="text" class="form-control" id="selectedKeyword" placeholder="search" name="keyword" aria-describedby="button-addon2">
			<input type="hidden" name="pageNo" value="1">
			<input type="submit" class="btn btn-outline-secondary"
				id="button-addon2" value="검색"> <input type="button" style="margin-left:10px;"
				class="btn btn-outline-secondary" onclick="reset_btn_mapping()" value="초기화">
			</div>
			</div>`;
		$('.searchRangeAll').append(html);

	}

function reset_btn_mapping_popup(){
	$('.searchRangeAll').empty();
	html='';
	
	//이 안에 select 옵션 들어가는 거 채워줭

	html +=`<div class="input-group-append">
		<input type="text" class="form-control" id="selectedKeyword" placeholder="search" name="keyword" aria-describedby="button-addon2">
		<input type="hidden" name="pageNo" value="1">
		<input type="submit" class="btn btn-outline-secondary"
			id="button-addon2" value="검색"> <input type="button" style="margin-left:10px;"
			class="btn btn-outline-secondary" onclick="reset_btn_mapping_popup()" value="초기화">
		</div>
		</div>`;
	$('.searchRangeAll').append(html);

}





function reset_btn_evaluate_message(){
	$('.searchRangeAll').empty();
	html='';
	
	//이 안에 select 옵션 들어가는 거 채워줭

	html +=`<div class="input-group-append">
		<input type="text" class="form-control" id="selectedKeyword" placeholder="search" name="keyword" aria-describedby="button-addon2">
		<input type="hidden" name="pageNo" value="1">
		<input type="submit" class="btn btn-outline-secondary"
			id="button-addon2" value="검색"> <input type="button" style="margin-left:10px;"
			class="btn btn-outline-secondary" onclick="reset_btn_evaluate_message()" value="초기화">
		</div>
		</div>`;
	$('.searchRangeAll').append(html);

}

</script>