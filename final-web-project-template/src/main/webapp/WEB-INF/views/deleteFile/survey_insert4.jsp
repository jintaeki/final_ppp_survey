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



function reset_btn_evaluate(){
	$('.searchRangeAll').empty();
	html='';
	
	html +='<div class="searchRange">';
    html +='<select class="subSelection" name="selection2">';
    html += `<option value=""
        <c:out value ='${paigingDto.selection2== null? "selected":""}'/>>직급</option>
           <option value="사원"
              <c:out value = '${param.selection2 eq "사원"? "selected":"사원"}'/>>사원</option>
           <option value="대리"
           <c:out value = '${param.selection2 eq "대리"? "selected":"대리"}'/>>대리</option>
           <option value="과장"
           <c:out value = '${param.selection2 eq "과장"? "selected":"과장"}'/>>과장</option>
           <option value="차장"
           <c:out value = '${param.selection2 eq "차장"? "selected":"차장"}'/>>차장</option>
          <option value="부장"
          <c:out value = '${param.selection2 eq "부장"? "selected":"부장"}'/>>부장</option>

     </select>`;
	html +=`<select class="selection" name="selection">
    <option value="employeeName"
        <c:if test="${pagram.selection eq 'employeeName'}">selected</c:if>>이름</option>

     <option value="departmentName"
        <c:if test="${param.selection eq 'departmentName'}">selected</c:if>>부서명</option>

  </select>
  </div>`;

	html +=`<div class="input-group-append">

        <input type="text" class="form-control" id="selectedKeyword"
           placeholder="search" name="keyword"
           value="${pagingDto.keyword}${param.keyword}" aria-describedby="button-addon2">
        <input type="hidden" name="pageNo" value="1"> <input
           type="hidden" name="surveySeq" value="${surveySeq}" />
        <input type="submit" class="btn btn-outline-secondary"
              id="button-addon2" value="검색"> <input type="reset"
              class="btn btn-outline-secondary" id="button-addon2" onclick="reset_btn_evaluate()"
              value="초기화">
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