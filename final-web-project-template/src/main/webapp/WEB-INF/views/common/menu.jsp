<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="menu_profile">
	<div style="margin-right:20px; ">
		<c:if test="${checked.gender eq '남'}">
		<img src="${pageContext.request.contextPath}/resources/images/profile.gif"
			style="width: 350px; position: fixed; left: -25px;">
 		</c:if>
 		<c:if test="${checked.gender eq '녀'}">
		<img src="${pageContext.request.contextPath}/resources/images/profile2.gif"
			style="width: 350px; position: fixed; left: -25px;">
 		</c:if>
	</div>
	<br>
<!-- 	<table style="margin-top: 200px; -->
<!--     margin-left: 30px; background:#665998; border-radius: 20px 20px 20px 20px;"> -->
<!-- 		<tr style="/* border:5px solid #665998; *//*  background:#665998; */"> -->
<!-- 			<th class="col-5" style="font-size:15px; color:white; text-align:center; /* border:5px solid #665998; */ /* background:#665998; */">부서명</th> -->
<%-- 			<td class="col-7"><div class="menu_profile_text">${checked.raterDepartmentName }</div></td> --%>
<!-- 		</tr> -->

<!-- 		<tr style="/* border:5px solid #665998; *//* background:#665998; */"> -->
<!-- 			<th class="col-5" style="font-size:15px; color:white; text-align:center; border:/* 5px solid #665998; */ /* background:#665998; */">이름</th> -->
<%-- 			<td class="col-7"><div class="menu_profile_text">${checked.raterName }</div></td> --%>
<!-- 		</tr> -->

<!-- 	</table> -->
	<div style=" margin-top: 200px; z-index:1">

		<table
			style="margin: auto; font-size: 20px; background: #aba2a4; border-radius: 20px 20px 20px 20px;">
			<tr style="">
				<th class="col-5"
					style="font-size: 15px; color: white; text-align: center;">부서명</th>
				<th class="col-5"
					style="font-size: 15px; color: white; text-align: center;">이름</th>
			</tr>

			<tr>
				<td class="col-7"
					style="background: #00000087; border-radius: 1px 0px 0px 20px;"><div
						class="menu_profile_text">${checked.raterDepartmentName }</div></td>
				<td class="col-7"
					style="background: #00000087; border-radius: 0px 1px 20px 0px;"><div
						class="menu_profile_text">${checked.raterName }</div></td>
			</tr>

		</table>
		<div style="margin-top:10px;">
			<a style="margin-left: 100px;" href="/logout.do">로그아웃</a>
		</div>
	</div>
</div>