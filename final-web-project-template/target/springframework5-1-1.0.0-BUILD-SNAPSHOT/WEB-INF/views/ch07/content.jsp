<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
		Controller/Data Delivery
	</div>
	<div class="card-body">
		<div class="card mb-3">
			<div class="card-header">
				JSP 템플릿 엔진 이해(~.jps -> ~.java -> ~.class)
			</div>
			<div class="card-body">
				<%--
				1)Dynamin Web Project를 생성해서 index.jsp에서 HTML과 Java 코드를 같이 작성한 것을 보여줌
				2)~.jsp가 ~.java, ~.class로 변환된 것을 보여줌
				3)Spring에서 HTML과 Java 코드가 분리해서 작성할 수 있음을 보여줌
				--%>
				<%-- 오늘 날짜: <%=request.getAttribute("strDate")%> --%>
				오늘 날짜: ${strDate}  <%-- Expression Language(EL) --%>
			</div>
		</div>	
		
		<div class="card mb-3">
			<div class="card-header">
				객체 저장 범위
			</div>
			<div class="card-body">	
				<a href="requestScopeSave" class="btn btn-info btn-sm mr-2">request 범위에 객체 저장</a>
				<a href="sessionScopeSave" class="btn btn-info btn-sm mr-2">session 범위에 객체 저장</a>
				<a href="applicationScopeSave" class="btn btn-info btn-sm mr-2">application 범위에 객체 저장</a>
				<hr/>
					
				<h6>[request 범위 객체 값]</h6>
				<p>
					request 범위 객체 값: <%=request.getAttribute("requestScopeValue")%> <br/>
					request 범위 객체 값: ${requestScopeValue}
				</p>
				<p>
					member's name: ${member.name} <br/>
					member's age: ${member.age} <br/>
					member's job: ${member.job} <br/>
					member's city: ${member.city.name} <br/>
				</p>		
				<hr/>
				
				<h6>[session 범위 객체 값]</h6>
				<p>
					session 범위 객체 값: <%=session.getAttribute("sessionScopeValue")%> <br/>
					session 범위 객체 값: ${sessionScopeValue}
				</p>
				<p>
					member's name: ${member2.name} <br/>
					member's age: ${member2.age} <br/>
					member's job: ${member2.job} <br/>
					member's city: ${member2.city.name} <br/>
				</p>
				<hr/>		
				
				<h6>[application 범위 객체 값]</h6>
				<p>
					application 범위 객체 값: <%=application.getAttribute("applicationScopeValue")%> <br/>
					application 범위 객체 값: ${applicationScopeValue}
				</p>
				<p>방문 카운팅: ${counter}</p>
			</div>
		</div>		
		
		<div class="card mb-3">
			<div class="card-header">
				JSTL(Java Standard Tag Library): 조건처리, 반복처리
			</div>
			<div class="card-body">
				<a href="useJstl" class="btn btn-info btn-sm">JSTL 사용하기</a>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-header">
				ModelAndView로 객체 전달
			</div>
			<div class="card-body">	
				<a href="modelAndViewReturn" class="btn btn-info btn-sm mr-2">ModelAndView 리턴해서 객체 전달</a>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-header">
				Model 매개변수로 객체 전달
			</div>
			<div class="card-body">	
				<a href="modelArgument" class="btn btn-info btn-sm mr-2">Model 매개변수로 객체 전달</a>
			</div>
		</div>
		
		
		<div class="card mb-3">
			<div class="card-header">
				@ModelAttribute로 객체 전달
			</div>
			<div class="card-body">	
				<a href="modelAttribute?kind=suit&sex=woman" class="btn btn-info btn-sm mr-2">@ModelAttribute로 Argument객체 전달</a>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-header">
				Command(DTO) 객체로 전달
			</div>
			<div class="card-body">	
				<a href="commandObject?kind=suit&sex=woman" class="btn btn-info btn-sm mr-2">Command 객체 전달</a>
			</div>
		</div>		
		
		<div class="card mb-3">
			<div class="card-header">
				@ModelAttribute를 이용해서 공용 데이터 전달
			</div>
			<div class="card-body">
				<a href="useModelAttribute1" class="btn btn-info btn-sm mr-2">useModelAttribute1</a>
				<a href="useModelAttribute2" class="btn btn-info btn-sm mr-2">useModelAttribute2</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>