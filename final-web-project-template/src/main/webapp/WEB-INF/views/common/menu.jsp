<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="menu_profile">
	<div style="margin-right:20px; ">
		<img src="${pageContext.request.contextPath}/resources/images/profile.gif"
			style="width: 280px; position: fixed; margin-top:40px;">

	</div>
	<br>
	<table style="margin-top: 200px;
    margin-left: 30px; background:#665998; border-radius: 20px 20px 20px 20px;">
		<tr style="/* border:5px solid #665998; *//*  background:#665998; */">
			<th class="col-5" style="font-size:15px; color:white; text-align:center; /* border:5px solid #665998; */ /* background:#665998; */">부서명</th>
			<td class="col-7"><div class="menu_profile_text">${checked.raterDepartmentName }</div></td>
		</tr>

		<tr style="/* border:5px solid #665998; *//* background:#665998; */">
			<th class="col-5" style="font-size:15px; color:white; text-align:center; border:/* 5px solid #665998; */ /* background:#665998; */">이름</th>
			<td class="col-7"><div class="menu_profile_text">${checked.raterName }</div></td>
		</tr>

<!-- 		<tr> -->
<!-- 			<th class="col-5"></th> -->
<!-- 			<td class="col-7"><div> -->
<!-- 					<a class="menu_profile_text" href="/logout">로그아웃</a> -->
<!-- 				</div></td> -->
<!-- 		</tr> -->


	</table>
</div>