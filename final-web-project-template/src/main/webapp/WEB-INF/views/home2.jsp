<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mapping_view.css" />


하하하하한
<form action="">
	<select>

		<option>다면평가 시스템 구축</option>
		<option>연수관리 시스템 구축</option>
		<option>점포관리 시스템 구축</option>
		<option selected>프로젝트 선택</option>
	</select> <input type="submit" value="조회">
</form>
<br>

<div class="makeborder" style="height: max-content;">
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

			<form action="" style=" width: 100%; height: 100%; display: contents;">
				<div id="Toggle" class="Toggle" style="display: none">
					<!-- 평가자 -->
					<div class="col-3">
						<div class="list">
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP1"> <label
									for="EMP1"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP2"> <label
									for="EMP2"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP3"> <label
									for="EMP3"> 1팀 민채우 </label>
							</div>
							<div class="form-check">
								<input type="checkbox" value="" name="EMP" id="EMP4"> <label
									for="EMP4"> 1팀 최병준 </label>
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
						<!-- 과장 -->

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
						<!-- 차장 -->

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
						<!-- 부장 -->

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
						<input type="submit" value="등록">
					</div>
				</div>
			</form>
			<div class="col-12"></div>
			<br>

			<!-- 사원버튼 끝 -->

			<div class="col-12">&nbsp;</div>
			<!-- 공백을 위함 -->

			<!-- 대리버튼 시작 -->
			<div class="col-3" style="border: none;">
				<input type="checkbox" value="" onclick='selectPAM(this)'
					name="AM"> <a class="btn btn-secondary" id="btn_toggle1">대리
				</a>
			</div>

			<%-- 	<c:forEach items=""></c:forEach --%>

			<form action="" style=" width: 100%; height: 100%; display: contents;">
			<div id="Toggle1" class="Toggle" style="display: none">
				<!-- 평가자 -->
				<div class="col-3">
					<div class="list">
						<div class="form-check">
							<input type="checkbox" value="" name="AM" id="AM1"> <label
								for="AM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="AM" id="AM1"> <label
								for="AM1"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="AM" id="AM1"> <label
								for="AM1"> 1팀 민채우 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="AM" id="AM1"> <label
								for="AM1"> 1팀 최병준 </label>
						</div>
					</div>
				</div>

				<!-- 피평가자 -->
				<!-- 사원 -->
				<div class="col-3" style="width: 900px;">
					<input type="checkbox" value="" onclick='AMEMP(this)'
						class="AMPEMP" name="AM_EMP"> 사원
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AMPEMP" type="checkbox" value="" name="AM_EMP"
								id="AM_EMP1"><label for="AM_EMP1">1팀 김찬수</label>
						</div>
						<div class="form-check">
							<input class="AMPEMP" type="checkbox" value="" name="AM_EMP"
								id="AM_EMP2"><label for="AM_EMP2">1팀 최병준</label>
						</div>
						<div class="form-check">
							<input class="AMPEMP" type="checkbox" value="" name="AM_EMP"
								id="AM_EMP3"><label for="AM_EMP3">1팀 민채우</label>
						</div>
						<div class="form-check">
							<input class="AMPEMP" type="checkbox" value="" name="AM_EMP"
								id="AM_EMP4"><label for="AM_EMP4">1팀 임진택</label>
						</div>
					</div>

					<div class="col-12">&nbsp;</div>
					<!-- 대리 -->	

					<input type="checkbox" value="" onclick='AMAM(this)'
						   class="AMPAM" name="AM_AM"> 대리
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AMPAM" type="checkbox" value="" name="AM_AM"
							       id="AM_AM1"><label for="AM_AM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AMPAM" type="checkbox" value="" name="AM_AM"
							       id="AM_AM2"><label for="AM_AM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AMPAM" type="checkbox" value="" name="AM_AM"
							       id="AM_AM3"><label for="AM_AM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AMPAM" type="checkbox" value="" name="AM_AM"
							       id="AM_AM4"><label for="AM_AM4"> 1팀 최병준 </label>
						</div>


					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 과장 -->	

					<input type="checkbox" value="" onclick='AMSM(this)'
						   class="AMPSM" name="AM_SM"> 과장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AMPSM" type="checkbox" value="" name="AM_SM"
							       id="AM_SM1"><label for="AM_SM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AMPSM" type="checkbox" value="" name="AM_SM"
							       id="AM_SM2"><label for="AM_SM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AMPSM" type="checkbox" value="" name="AM_SM"
							       id="AM_SM3"><label for="AM_SM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AMPSM" type="checkbox" value="" name="AM_SM"
							       id="AM_SM4"><label for="AM_SM4"> 1팀 최병준 </label>
						</div>
						
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 차장 -->	

					<input type="checkbox" value="" onclick='AMAGM(this)'
						   class="AMPAGM" name="AM_AGM"> 차장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AMPAGM" type="checkbox" value="" name="AM_AGM"
							       id="AM_AGM1"><label for="AM_AGM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AMPAGM" type="checkbox" value="" name="AM_AGM"
							       id="AM_AGM2"><label for="AM_AGM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AMPAGM" type="checkbox" value="" name="AM_AGM"
							       id="AM_AGM3"><label for="AM_AGM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AMPAGM" type="checkbox" value="" name="AM_AGM"
							       id="AM_AGM4"><label for="AM_AGM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 부장 -->	

					<input type="checkbox" value="" onclick='AMDM(this)'
						   class="AMPDM" name="AM_DM"> 부장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AMPDM" type="checkbox" value="" name="AM_DM"
							       id="AM_DM1"><label for="AM_DM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AMPDM" type="checkbox" value="" name="AM_DM"
							       id="AM_DM2"><label for="AM_DM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AMPDM" type="checkbox" value="" name="AM_DM"
							       id="AM_DM3"><label for="AM_DM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AMPDM" type="checkbox" value="" name="AM_DM"
							       id="AM_DM4"><label for="AM_DM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>

					<div class="col-12">&nbsp;</div>
				</div>

				<div class="col-3">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="AMsame">
						<label for="AMsame">동일 직급 제외</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="AMlower"> <label for="AMlower">하급자 평가 제외</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="AMhigher"> <label for="AMhigher">상급자 평가 제외</label>
					</div>
					<input type="submit" value="등록">
				</div>
			</div>
			</form>
			<!--  -->
			<div class="col-12"></div>
			<br>

			<!-- 대리 버튼 끝 -->

			<!-- 공백을 위함 -->
			<div class="col-12">&nbsp;</div>
			
			<!-- 과장버튼 시작 -->
			<div class="col-3" style="border: none;">
				<input type="checkbox" value="" onclick='selectPSM(this)'
					name="SM"> <a class="btn btn-secondary" id="btn_toggle2">과장
				</a>
			</div>

			<%-- 	<c:forEach items=""></c:forEach --%>

			<form action="" style=" width: 100%; height: 100%; display: contents;">
			<div id="Toggle2" class="Toggle" style="display: none">
				<!-- 평가자 -->
				<div class="col-3">
					<div class="list">
						<div class="form-check">
							<input type="checkbox" value="" name="SM" id="SM1"> <label
								for="SM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="SM" id="SM2"> <label
								for="SM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="SM" id="SM3"> <label
								for="SM3"> 1팀 민채우 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="SM" id="SM4"> <label
								for="SM4"> 1팀 최병준 </label>
						</div>
					</div>
				</div>

				<!-- 피평가자 -->
				<!-- 사원 -->
				<div class="col-3" style="width: 900px;">
					<input type="checkbox" value="" onclick='SMEMP(this)'
						class="SMPEMP" name="SM_EMP"> 사원
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AGMPEMP" type="checkbox" value="" name="SM_EMP"
								id="SM_EMP1"><label for="SM_EMP1">1팀 김찬수</label>
						</div>
						<div class="form-check">
							<input class="SMPEMP" type="checkbox" value="" name="SM_EMP"
								id="SM_EMP2"><label for="SM_EMP2">1팀 최병준</label>
						</div>
						<div class="form-check">
							<input class="SMPEMP" type="checkbox" value="" name="SM_EMP"
								id="SM_EMP3"><label for="SM_EMP3">1팀 민채우</label>
						</div>
						<div class="form-check">
							<input class="SMPEMP" type="checkbox" value="" name="SM_EMP"
								id="SM_EMP4"><label for="SM_EMP4">1팀 임진택</label>
						</div>
					</div>

					<div class="col-12">&nbsp;</div>
					<!-- 대리 -->	

					<input type="checkbox" value="" onclick='SMAM(this)'
						   class="SMPAM" name="SM_AM"> 대리
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="SMPAM" type="checkbox" value="" name="SM_AM"
							       id="SM_AM1"><label for="SM_AM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="SMPAM" type="checkbox" value="" name="SM_AM"
							       id="SM_AM2"><label for="SM_AM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="SMPAM" type="checkbox" value="" name="SM_AM"
							       id="SM_AM3"><label for="SM_AM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="SMPAM" type="checkbox" value="" name="SM_AM"
							       id="SM_AM4"><label for="SM_AM4"> 1팀 최병준 </label>
						</div>


					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 과장 -->	

					<input type="checkbox" value="" onclick='SMSM(this)'
						   class="SMPSM" name="SM_SM"> 과장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="SMPSM" type="checkbox" value="" name="SM_SM"
							       id="SM_SM1"><label for="SM_SM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="SMPSM" type="checkbox" value="" name="SM_SM"
							       id="SM_SM2"><label for="SM_SM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="SMPSM" type="checkbox" value="" name="SM_SM"
							       id="SM_SM3"><label for="SM_SM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="SMPSM" type="checkbox" value="" name="SM_SM"
							       id="SM_SM4"><label for="SM_SM4"> 1팀 최병준 </label>
						</div>
						
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 차장 -->	

					<input type="checkbox" value="" onclick='SMAGM(this)'
						   class="SMPAGM" name="SM_AGM"> 차장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="SMPAGM" type="checkbox" value="" name="SM_AGM"
							       id="SM_AGM1"><label for="SM_AGM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="SMPAGM" type="checkbox" value="" name="SM_AGM"
							       id="SM_AGM2"><label for="SM_AGM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="SMPAGM" type="checkbox" value="" name="SM_AGM"
							       id="SM_AGM3"><label for="SM_AGM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="SMPAGM" type="checkbox" value="" name="SM_AGM"
							       id="SM_AGM4"><label for="SM_AGM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 부장 -->	

					<input type="checkbox" value="" onclick='SMDM(this)'
						   class="SMPDM" name="SM_DM"> 부장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="SMPDM" type="checkbox" value="" name="SM_DM"
							       id="SM_DM1"><label for="SM_DM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="SMPDM" type="checkbox" value="" name="SM_DM"
							       id="SM_DM2"><label for="SM_DM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="SMPDM" type="checkbox" value="" name="SM_DM"
							       id="SM_DM3"><label for="SM_DM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="SMPDM" type="checkbox" value="" name="SM_DM"
							       id="SM_DM4"><label for="SM_DM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>

					<div class="col-12">&nbsp;</div>
				</div>

				<div class="col-3">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="SMsame">
						<label for="SMsame">동일 직급 제외</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="SMlower"> <label for="SMlower">하급자 평가 제외</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="SMhigher"> <label for="SMhigher">상급자 평가 제외</label>
					</div>
					<input type="submit" value="등록">
				</div>
			</div>
			</form>
			<!--  -->
			<div class="col-12"></div>
			<br>

			<!-- 과장버튼 끝 -->
			
			<div class="col-12">&nbsp;</div>
			<!-- 공백을 위함 -->
			
			<!-- 차장버튼 시작 -->
			<div class="col-3" style="border: none;">
				<input type="checkbox" value="" onclick='selectPAGM(this)'
					name="AGM"> <a class="btn btn-secondary" id="btn_toggle3">차장
				</a>
			</div>

			<%-- 	<c:forEach items=""></c:forEach --%>

			<form action="" style=" width: 100%; height: 100%; display: contents;">
			<div id="Toggle3" class="Toggle" style="display: none">
				<!-- 평가자 -->
				<div class="col-3">
					<div class="list">
						<div class="form-check">
							<input type="checkbox" value="" name="AGM" id="AGM1"> <label
								for="AGM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="AGM" id="AGM1"> <label
								for="AGM1"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="AGM" id="AGM1"> <label
								for="AGM1"> 1팀 민채우 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="AGM" id="AGM1"> <label
								for="AGM1"> 1팀 최병준 </label>
						</div>
					</div>
				</div>

				<!-- 피평가자 -->
				<!-- 사원 -->
				<div class="col-3" style="width: 900px;">
					<input type="checkbox" value="" onclick='AGMEMP(this)'
						class="AGMPEMP" name="AGM_EMP"> 사원
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AGMPEMP" type="checkbox" value="" name="AGM_EMP"
								id="AGM_EMP1"><label for="AGM_EMP1">1팀 김찬수</label>
						</div>
						<div class="form-check">
							<input class="AGMPEMP" type="checkbox" value="" name="AGM_EMP"
								id="AGM_EMP2"><label for="AGM_EMP2">1팀 최병준</label>
						</div>
						<div class="form-check">
							<input class="AGMPEMP" type="checkbox" value="" name="AGM_EMP"
								id="AGM_EMP3"><label for="AGM_EMP3">1팀 민채우</label>
						</div>
						<div class="form-check">
							<input class="AGMPEMP" type="checkbox" value="" name="AGM_EMP"
								id="AGM_EMP4"><label for="AGM_EMP4">1팀 임진택</label>
						</div>
					</div>

					<div class="col-12">&nbsp;</div>
					<!-- 대리 -->	

					<input type="checkbox" value="" onclick='AGMAM(this)'
						   class="AGMPAM" name="AGM_AM"> 대리
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AGMPAM" type="checkbox" value="" name="AGM_AM"
							       id="AGM_AM1"><label for="AGM_AM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AGMPAM" type="checkbox" value="" name="AGM_AM"
							       id="AGM_AM2"><label for="AGM_AM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AGMPAM" type="checkbox" value="" name="AGM_AM"
							       id="AGM_AM3"><label for="AGM_AM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AGMPAM" type="checkbox" value="" name="AGM_AM"
							       id="AGM_AM4"><label for="AGM_AM4"> 1팀 최병준 </label>
						</div>


					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 과장 -->	

					<input type="checkbox" value="" onclick='AGMSM(this)'
						   class="AGMPSM" name="AGM_SM"> 과장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AGMPSM" type="checkbox" value="" name="AGM_SM"
							       id="AGM_SM1"><label for="AGM_SM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AGMPSM" type="checkbox" value="" name="AGM_SM"
							       id="AGM_SM2"><label for="AGM_SM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AGMPSM" type="checkbox" value="" name="AGM_SM"
							       id="AGM_SM3"><label for="AGM_SM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AGMPSM" type="checkbox" value="" name="AGM_SM"
							       id="AGM_SM4"><label for="AGM_SM4"> 1팀 최병준 </label>
						</div>
						
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 차장 -->	

					<input type="checkbox" value="" onclick='AGMAGM(this)'
						   class="AGMPAGM" name="AGM_AGM"> 차장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AGMPAGM" type="checkbox" value="" name="AGM_AGM"
							       id="AGM_AGM1"><label for="AGM_AGM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AGMPAGM" type="checkbox" value="" name="AGM_AGM"
							       id="AGM_AGM2"><label for="AGM_AGM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AGMPAGM" type="checkbox" value="" name="AGM_AGM"
							       id="AGM_AGM3"><label for="AGM_AGM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AGMPAGM" type="checkbox" value="" name="AGM_AGM"
							       id="AGM_AGM4"><label for="AGM_AGM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 부장 -->	

					<input type="checkbox" value="" onclick='AGMDM(this)'
						   class="AGMPDM" name="AGM_DM"> 부장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="AGMPDM" type="checkbox" value="" name="AGM_DM"
							       id="AGM_DM1"><label for="AGM_DM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="AGMPDM" type="checkbox" value="" name="AGM_DM"
							       id="AGM_DM2"><label for="AGM_DM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="AGMPDM" type="checkbox" value="" name="AGM_DM"
							       id="AGM_DM3"><label for="AGM_DM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="AGMPDM" type="checkbox" value="" name="AGM_DM"
							       id="AGM_DM4"><label for="AGM_DM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>

					<div class="col-12">&nbsp;</div>
				</div>

				<div class="col-3">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="AGMsame">
						<label for="AGMsame">동일 직급 제외</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="AGMlower"> <label for="AGMlower">하급자 평가 제외</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="AGMhigher"> <label for="AGMhigher">상급자 평가 제외</label>
					</div>
					<input type="submit" value="등록">
				</div>
			</div>
			</form>
			<!--  -->
			<div class="col-12"></div>
			<br>

			<!-- 차장버튼 끝 -->

			<div class="col-12">&nbsp;</div>
			<!-- 공백을 위함 -->
			
			<!-- 부장버튼 시작 -->
			<div class="col-3" style="border: none;">
				<input type="checkbox" value="" onclick='selectPDM(this)'
					name="DM"> <a class="btn btn-secondary" id="btn_toggle4">부장
				</a>
			</div>

			<%-- 	<c:forEach items=""></c:forEach --%>

			<form action="" style=" width: 100%; height: 100%; display: contents;">
			<div id="Toggle4" class="Toggle" style="display: none">
				<!-- 평가자 -->
				<div class="col-3">
					<div class="list">
						<div class="form-check">
							<input type="checkbox" value="" name="DM" id="DM1"> <label
								for="DM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="DM" id="DM1"> <label
								for="DM1"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="DM" id="DM1"> <label
								for="DM1"> 1팀 민채우 </label>
						</div>
						<div class="form-check">
							<input type="checkbox" value="" name="DM" id="DM1"> <label
								for="DM1"> 1팀 최병준 </label>
						</div>
					</div>
				</div>

				<!-- 피평가자 -->
				<!-- 사원 -->
				<div class="col-3" style="width: 900px;">
					<input type="checkbox" value="" onclick='DMEMP(this)'
						class="DMPEMP" name="DM_EMP"> 사원
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="DMPEMP" type="checkbox" value="" name="DM_EMP"
								id="DM_EMP1"><label for="DM_EMP1">1팀 김찬수</label>
						</div>
						<div class="form-check">
							<input class="DMPEMP" type="checkbox" value="" name="DM_EMP"
								id="DM_EMP2"><label for="DM_EMP2">1팀 최병준</label>
						</div>
						<div class="form-check">
							<input class="DMPEMP" type="checkbox" value="" name="DM_EMP"
								id="DM_EMP3"><label for="DM_EMP3">1팀 민채우</label>
						</div>
						<div class="form-check">
							<input class="DMPEMP" type="checkbox" value="" name="DM_EMP"
								id="DM_EMP4"><label for="DM_EMP4">1팀 임진택</label>
						</div>
					</div>

					<div class="col-12">&nbsp;</div>
					<!-- 대리 -->	

					<input type="checkbox" value="" onclick='DMAM(this)'
						   class="DMPAM" name="DM_AM"> 대리
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="DMPAM" type="checkbox" value="" name="DM_AM"
							       id="DM_AM1"><label for="DM_AM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="DMPAM" type="checkbox" value="" name="DM_AM"
							       id="DM_AM2"><label for="DM_AM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="DMPAM" type="checkbox" value="" name="DM_AM"
							       id="DM_AM3"><label for="DM_AM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="DMPAM" type="checkbox" value="" name="DM_AM"
							       id="DM_AM4"><label for="DM_AM4"> 1팀 최병준 </label>
						</div>


					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 과장 -->	

					<input type="checkbox" value="" onclick='DMSM(this)'
						   class="DMPSM" name="DM_SM"> 과장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="DMPSM" type="checkbox" value="" name="DM_SM"
							       id="DM_SM1"><label for="DM_SM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="DMPSM" type="checkbox" value="" name="DM_SM"
							       id="DM_SM2"><label for="DM_SM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="DMPSM" type="checkbox" value="" name="DM_SM"
							       id="DM_SM3"><label for="DM_SM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="DMPSM" type="checkbox" value="" name="DM_SM"
							       id="DM_SM4"><label for="DM_SM4"> 1팀 최병준 </label>
						</div>
						
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 차장 -->	

					<input type="checkbox" value="" onclick='DMAGM(this)'
						   class="DMPAGM" name="DM_AGM"> 차장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="DMPAGM" type="checkbox" value="" name="DM_AGM"
							       id="DM_AGM1"><label for="DM_AGM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="DMPAGM" type="checkbox" value="" name="DM_AGM"
							       id="DM_AGM2"><label for="DM_AGM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="DMPAGM" type="checkbox" value="" name="DM_AGM"
							       id="DM_AGM3"><label for="DM_AGM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="DMPAGM" type="checkbox" value="" name="DM_AGM"
							       id="DM_AGM4"><label for="DM_AGM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>
					<!-- 부장 -->	

					<input type="checkbox" value="" onclick='DMDM(this)'
						   class="DMPDM" name="DM_DM"> 부장
					<%-- 	<c:forEach items=""></c:forEach --%>
					<div class="list">
						<div class="form-check">
							<input class="DMPDM" type="checkbox" value="" name="DM_DM"
							       id="DM_DM1"><label for="DM_DM1"> 1팀 김찬수 </label>
						</div>
						<div class="form-check">
							<input class="DMPDM" type="checkbox" value="" name="DM_DM"
							       id="DM_DM2"><label for="DM_DM2"> 1팀 임진택 </label>
						</div>
						<div class="form-check">
							<input class="DMPDM" type="checkbox" value="" name="DM_DM"
							       id="DM_DM3"><label for="DM_DM3"> 1팀 민채우
							</label>
						</div>
						<div class="form-check">
							<input class="DMPDM" type="checkbox" value="" name="DM_DM"
							       id="DM_DM4"><label for="DM_DM4"> 1팀 최병준 </label>
						</div>
					</div>
					<div class="col-12">&nbsp;</div>

					<div class="col-12">&nbsp;</div>
				</div>

				<div class="col-3">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="DMsame">
						<label for="DMsame">동일 직급 제외</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="DMlower"> <label for="DMlower">하급자 평가 제외</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="DMhigher" disabled> <label for="DMhigher">상급자 평가 제외</label>
					</div>
					<input type="submit" value="등록">
				</div>
			</div>
			</form>
			<!--  -->
			<div class="col-12"></div>
			<br>

			<!-- 부장버튼 끝 -->
			<!-- row 끝  -->
		</div>
		<!-- container 끝  -->
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>