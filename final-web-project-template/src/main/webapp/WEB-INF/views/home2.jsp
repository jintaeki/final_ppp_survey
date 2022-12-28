<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mapping_view.css" />


<form action="">
	<select>

		<option>다면평가 시스템 구축</option>
		<option>연수관리 시스템 구축</option>
		<option>점포관리 시스템 구축</option>
		<option selected>프로젝트 선택</option>
	</select> <input type="submit" value="조회">
</form>
<br>
<form action="">
	<div class="makeborder">
		<div class="container">

			<div class="row" style="margin-bottom: 10px;">
				<div class="col-3">
					<div id="lev">직급</div>
				</div>

				<div class="col-3">
					<div id="lev">평가자</div>
				</div>
				<div class="col-3">
					<div id="lev">피평가자</div>
				</div>
				<div class="col-3">
					<div id="lev">옵션</div>
				</div>

				<div class="col-12">&nbsp;</div>
				<!-- 공백을 위함 -->
				<!-- 사원버튼 시작 -->

				<div class="col-3" style="border: none;">
					<input type="checkbox" value="" onclick='selectPEmp(this)'
						name="EMP"> <a class="btn btn-secondary" id="btn_toggle">사원
					</a>
				</div>

				<%-- 	<c:forEach items=""></c:forEach --%>


				<div id="Toggle" class="Toggle" style="display: none">
					<!-- 평가자 -->
					<div class="col-3">
						<div class="list">
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP1">
								<label for="EMP1"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP2">
								<label for="EMP2"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP3">
								<label for="EMP3"> 1팀 민채우 </label>
							</div>
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP4">
								<label for="EMP4"> 1팀 최병준 </label>
							</div>
						</div>
					</div>

					<!-- 피평가자 -->
					<!-- 사원 -->
					<div class="col-3" style="width: 900px;">
						<input type="checkbox" value="" onclick='EMPEMP(this)'
							class="EMPPEMP" name="EMP_EMP"> 사원
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">
							<div class="form-check">
								<input class="EMPPEMP" type="checkbox" value="" name="EMP_EMP"
									id="EMP_EMP1"> <label for="EMP_EMP1"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="EMPPEMP" type="checkbox" value="" name="EMP_EMP"
									id="EMP_EMP2"> <label for="EMP_EMP2"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="EMPPEMP" type="checkbox" value="" name="EMP_EMP"
									id="EMP_EMP3"> <label for="EMP_EMP3"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="EMPPEMP" type="checkbox" value="" name="EMP_EMP"
									id="EMP_EMP4"> <label for="EMP_EMP4"> 1팀 김찬수 </label>
							</div>
						</div>

						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" onclick='EMPAM(this)'
							class="EMPPAM"> 대리
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input id="EMP_AM1" type="checkbox" value="" name="EMP_AM"
									class="EMPPAM"> <label for="EMP_AM1"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input id="EMP_AM2" type="checkbox" value="" name="EMP_AM"
									class="EMPPAM"> <label for="EMP_AM2"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input id="EMP_AM3" type="checkbox" value="" name="EMP_AM"
									class="EMPPAM"> <label for="EMP_AM3"> 1팀 민채우 </label>
							</div>
							<div class="form-check">
								<input id="EMP_AM4" type="checkbox" value="" name="EMP_AM"
									class="EMPPAM"> <label for="EMP_AM4"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" onclick='EMPSM(this)'
							class="EMPPSM"> 과장
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input id="EMP_SM1" type="checkbox" value="" name="EMP_SM"
									class="EMPPSM"> <label for="EMP_SM1"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input id="EMP_SM2" type="checkbox" value="" name="EMP_SM"
									class="EMPPSM"> <label for="EMP_SM2"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input id="EMP_SM3" type="checkbox" value="" name="EMP_SM"
									class="EMPPSM"> <label for="EMP_SM3"> 1팀 민채우 </label>
							</div>
							<div class="form-check">
								<input id="EMP_SM4" type="checkbox" value="" name="EMP_SM"
									class="EMPPSM"> <label for="EMP_SM4"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" onclick='EMPAGM(this)'
							class="EMPPAGM"> 차장
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input id="EMP_AGM1" type="checkbox" value="" name="EMP_AGM"
									class="EMPPAGM"> <label for="EMP_AGM1"> 1팀 김찬수
								</label>
							</div>
							<div class="form-check">
								<input id="EMP_AGM2" type="checkbox" value="" name="EMP_AGM"
									class="EMPPAGM"> <label for="EMP_AGM2"> 1팀 임진택
								</label>
							</div>
							<div class="form-check">
								<input id="EMP_AGM3" type="checkbox" value="" name="EMP_AGM"
									class="EMPPAGM"> <label for="EMP_AGM3"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input id="EMP_AGM4" type="checkbox" value="" name="EMP_AGM"
									class="EMPPAGM"> <label for="EMP_AGM4"> 1팀 최병준
								</label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" onclick='EMPDM(this)'
							class="EMPPDM"> 부장
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input id="EMP_DM1" type="checkbox" value="" name="EMP_DM"
									class="EMPPDM"> <label for="EMP_DM1"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input id="EMP_DM2" type="checkbox" value="" name="EMP_DM"
									class="EMPPDM"> <label for="EMP_DM2"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input id="EMP_DM3" type="checkbox" value="" name="EMP_DM"
									class="EMPPDM"> <label for="EMP_DM3"> 1팀 민채우 </label>
							</div>
							<div class="form-check">
								<input id="EMP_DM4" type="checkbox" value="" name="EMP_DM"
									class="EMPPDM"> <label for="EMP_DM4"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>

						<div class="col-12">&nbsp;</div>

					</div>

					<div class="col-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="EMPsame"> <label for="EMPsame">동일 직급 제외</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="EMPlower" disabled> <label for="EMPlower">하급자
								평가 제외</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="EMPhigher"> <label for="EMPhigher">상급자 평가 제외</label>

						</div>
					</div>
				</div>
				<div class="col-12"></div>
				<br>

				<!-- 사원버튼 끝 -->

				<div class="col-12">&nbsp;</div>
				<!-- 공백을 위함 -->

				<!-- 대리버튼 시작 -->
				<div class="col-3" style="border: none;">
					<input type="checkbox" value="" onclick='selectPS(this)'
						name="평가자사원"> <a class="btn btn-secondary"
						id="btn_toggle1">대리 </a>
				</div>

				<%-- 	<c:forEach items=""></c:forEach --%>


				<div id="Toggle1" class="Toggle" style="display: none">
					<!-- 평가자 -->
					<div class="col-3">
						<div class="list">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 김찬수
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 임진택
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 최병준
								</label>
							</div>
						</div>
					</div>

					<!-- 피평가자 -->
					<!-- 사원 -->
					<div class="col-3" style="width: 900px;">
						<input type="checkbox" value="" onclick='selectPPS(this)'
							class="emp" name="피평가자사원"> 사원
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 박
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 최
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 민
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 형
							</div>
						</div>

						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class="대리"> 대리
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>

						<div class="col-12">&nbsp;</div>

					</div>

					<div class="col-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="same"> <label class="form-check-label" for="same">동일
								직급 제외</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="lower" disabled> <label class="form-check-label"
								for="lower">하급자 평가 제외</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="higher"> <label class="form-check-label"
								for="higher">상급자 평가 제외</label>

						</div>
					</div>
				</div>

				<!--  -->
				<div class="col-12"></div>
				<br>

				<!-- 대리버튼 끝 -->


				<div class="col-12">&nbsp;</div>
				<!-- 공백을 위함 -->
				<!--  과장버튼 시작 -->

				<div class="col-3" style="border: none;">
					<input type="checkbox" value="" onclick='selectPS(this)'
						name="평가자사원"> <a class="btn btn-secondary"
						id="btn_toggle2">과장 </a>
				</div>

				<%-- 	<c:forEach items=""></c:forEach --%>


				<div id="Toggle2" class="Toggle" style="display: none">
					<!-- 평가자 -->
					<div class="col-3">
						<div class="list">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 김찬수
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 임진택
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 최병준
								</label>
							</div>
						</div>
					</div>

					<!-- 피평가자 -->
					<!-- 사원 -->
					<div class="col-3" style="width: 900px;">
						<input type="checkbox" value="" onclick='selectPPS(this)'
							class="emp" name="피평가자사원"> 사원
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 박
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 최
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 민
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 형
							</div>
						</div>

						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class="대리"> 대리
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>

						<div class="col-12">&nbsp;</div>

					</div>

					<div class="col-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="same"> <label class="form-check-label" for="same">동일
								직급 제외</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="lower" disabled> <label class="form-check-label"
								for="lower">하급자 평가 제외</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="higher"> <label class="form-check-label"
								for="higher">상급자 평가 제외</label>

						</div>
					</div>
				</div>
				<!-- 지우기 -->
				<!--  -->
				<div class="col-12"></div>
				<br>

				<!-- 과장버튼 끝 -->

				<div class="col-12">&nbsp;</div>
				<!-- 공백을 위함 -->

				<!--  차장버튼 시작 -->

				<div class="col-3" style="border: none;">
					<input type="checkbox" value="" onclick='selectPS(this)'
						name="평가자사원"> <a class="btn btn-secondary"
						id="btn_toggle3">차장 </a>
				</div>

				<%-- 	<c:forEach items=""></c:forEach --%>


				<div id="Toggle3" class="Toggle" style="display: none">
					<!-- 평가자 -->
					<div class="col-3">
						<div class="list">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 김찬수
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 임진택
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 최병준
								</label>
							</div>
						</div>
					</div>

					<!-- 피평가자 -->
					<!-- 사원 -->
					<div class="col-3" style="width: 900px;">
						<input type="checkbox" value="" onclick='selectPPS(this)'
							class="emp" name="피평가자사원"> 사원
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 박
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 최
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 민
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 형
							</div>
						</div>

						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class="대리"> 대리
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>

						<div class="col-12">&nbsp;</div>

					</div>

					<div class="col-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="same"> <label class="form-check-label" for="same">동일
								직급 제외</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="lower" disabled> <label class="form-check-label"
								for="lower">하급자 평가 제외</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="higher"> <label class="form-check-label"
								for="higher">상급자 평가 제외</label>

						</div>
					</div>
				</div>
				<!-- 지우기 -->
				<!--  -->
				<div class="col-12"></div>
				<br>

				<!-- 차장버튼 끝 -->

				<div class="col-12">&nbsp;</div>
				<!-- 공백을 위함 -->

				<!--  부장버튼 시작 -->

				<div class="col-3" style="border: none;">
					<input type="checkbox" value="" onclick='selectPS(this)'
						name="평가자사원"> <a class="btn btn-secondary"
						id="btn_toggle4">부장 </a>
				</div>

				<%-- 	<c:forEach items=""></c:forEach --%>


				<div id="Toggle4" class="Toggle" style="display: none">
					<!-- 평가자 -->
					<div class="col-3">
						<div class="list">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 김찬수
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 임진택
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									name="평가자사원" id="flexCheckDefault"> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 최병준
								</label>
							</div>
						</div>
					</div>

					<!-- 피평가자 -->
					<!-- 사원 -->
					<div class="col-3" style="width: 900px;">
						<input type="checkbox" value="" onclick='selectPPS(this)'
							class="emp" name="피평가자사원"> 사원
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 박
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 최
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 민
							</div>
							<div class="form-check">
								<input class="emp" type="checkbox" value="" name="피평가자사원"
									id="emp"> 1팀 형
							</div>
						</div>

						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class="대리"> 대리
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="대리" type="checkbox" value=""> <label
									class="form-check-label" for="대리"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>

						<div class="col-12">&nbsp;</div>

					</div>

					<div class="col-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="same"> <label class="form-check-label" for="same">동일
								직급 제외</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="lower" disabled> <label class="form-check-label"
								for="lower">하급자 평가 제외</label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="higher"> <label class="form-check-label"
								for="higher">상급자 평가 제외</label>

						</div>
					</div>
				</div>
				<!-- 지우기 -->
				<!--  -->
				<div class="col-12"></div>
				<br>

				<!-- 부장버튼 끝 -->

				<!-- row 끝  -->
			</div>
			<!-- container 끝  -->
		</div>
	</div>
</form>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>