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
						name="평가자사원"> <a class="btn btn-secondary" id="btn_toggle">사원
					</a>
				</div>

				<%-- 	<c:forEach items=""></c:forEach --%>


				<div id="Toggle" class="Toggle" style="display: none">
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
						<input type="checkbox" value="" onclick='EMP_EMP(this)'
							class="EMP_EMP" name="피평가자사원"> 사원
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">
							<div class="form-check">
								<input class="EMP_EMP" type="checkbox" value="" name="피평가자사원"
									id="EMP_EMP"> 1팀 박
							</div>
							<div class="form-check">
								<input class="EMP_EMP" type="checkbox" value="" name="피평가자사원"
									id="EMP_EMP"> 1팀 최
							</div>
							<div class="form-check">
								<input class="EMP_EMP" type="checkbox" value="" name="피평가자사원"
									id="EMP_EMP"> 1팀 민
							</div>
							<div class="form-check">
								<input class="EMP_EMP" type="checkbox" value="" name="피평가자사원"
									id="EMP_EMP"> 1팀 형
							</div>
						</div>

						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class=""> 대리
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="EMP_AM" type="checkbox" value="" onclick='EMP_AM(this)'> <label
									class="EMP_AM" for="EMP_AM"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="EMP_AM" type="checkbox" value=""> <label
									class="EMP_AM" for="EMP_AM"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="EMP_AM" type="checkbox" value=""> <label
									class="EMP_AM" for="EMP_AM"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="EMP_AM" type="checkbox" value=""> <label
									class="EMP_AM" for="EMP_AM"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class="EMP_SM"> 과장
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="EMP_SM" type="checkbox" value=""> <label
									class="EMP_SM" for="대리"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="EMP_SM" type="checkbox" value=""> <label
									class="EMP_SM" for="대리"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="EMP_SM" type="checkbox" value=""> <label
									class="EMP_SM" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="EMP_SM" type="checkbox" value=""> <label
									class="EMP_SM" for="대리"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class="EMP_AGM"> 차장
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="EMP_AGM" type="checkbox" value=""> <label
									class="EMP_AGM" for="대리"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="EMP_AGM" type="checkbox" value=""> <label
									class="EMP_AGM" for="대리"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="EMP_AGM" type="checkbox" value=""> <label
									class="EMP_AGM" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="EMP_AGM" type="checkbox" value=""> <label
									class="EMP_AGM" for="대리"> 1팀 최병준 </label>
							</div>


						</div>
						<div class="col-12">&nbsp;</div>
						<!-- 대리 -->

						<input type="checkbox" value="" class="EMP_DM"> 부장
						<%-- 	<c:forEach items=""></c:forEach --%>
						<div class="list">

							<div class="form-check">
								<input class="EMP_DM" type="checkbox" value=""> <label
									class="EMP_DM" for="대리"> 1팀 김찬수 </label>
							</div>
							<div class="form-check">
								<input class="EMP_DM" type="checkbox" value=""> <label
									class="EMP_DM" for="대리"> 1팀 임진택 </label>
							</div>
							<div class="form-check">
								<input class="EMP_DM" type="checkbox" value=""> <label
									class="EMP_DM" for="flexCheckDefault"> 1팀 민채우
								</label>
							</div>
							<div class="form-check">
								<input class="EMP_DM" type="checkbox" value=""> <label
									class="EMP_DM" for="대리"> 1팀 최병준 </label>
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
				<div class="col-12"></div>
				<br>

																								<!-- 사원버튼 끝 -->

				<div class="col-12">&nbsp;</div>
				<!-- 공백을 위함 -->

																								<!-- 대리버튼 시작 -->
				<div class="col-3" style="border: none;">
					<input type="checkbox" value="" onclick='selectPS(this)'
						name="평가자사원"> <a class="btn btn-secondary" id="btn_toggle1">대리
					</a>
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
						name="평가자사원"> <a class="btn btn-secondary" id="btn_toggle2">과장
					</a>
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
						name="평가자사원"> <a class="btn btn-secondary" id="btn_toggle3">차장
					</a>
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
						name="평가자사원"> <a class="btn btn-secondary" id="btn_toggle4">부장
					</a>
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