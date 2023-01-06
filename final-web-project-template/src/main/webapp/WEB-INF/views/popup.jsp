<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- contextPath가 변경돼도 소스 수정없이 적용 (유지보수 용이) -->


<div class="card mt-3">
<div class="card-body">
<div class="table-responsive mt-2 ">
<table id="resTb" class="table table-striped table-bordered text-center">
<caption>LIST</caption>
    <colgroup>
        <col width="5%" />
        <col width="8%" />
        <col />
        <col />
        <col />
    </colgroup>
<thead>
    <tr>
        <th><input type="checkbox" id="check_all" /></th>
        <th>프로젝트</th>
        <th>직급</th>
        <th>이름</th>
    </tr>
</thead>
<tbody>
   
<input type="button" type="submit" value="저장" />
<input type="button" type="reset" value="닫기" onclick="window.close();" />