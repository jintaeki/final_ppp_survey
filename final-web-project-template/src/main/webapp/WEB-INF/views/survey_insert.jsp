<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<head>
 <meta charset="utf-8">
 <link rel="stylesheet"  href="../../resources/css/insert_survey.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
</head>
<main class="d-flex flex-nowrap">
  <h1 class="visually-hidden">설문 등록</h1>

  <div class="b-example-divider b-example-vr"></div>

  <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 380px;">
    <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
    
    
    <div class="list-group list-group-flush border-bottom scrollarea">
      <a href="#" class="list-group-item list-group-item-action active py-3 lh-sm" aria-current="true">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 1</strong>
          <small>Wed</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 2</strong>
          <small class="text-muted">Tues</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 3</strong>
          <small class="text-muted">Mon</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 4</strong>
          <small class="text-muted">Wed</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 5</strong>
          <small class="text-muted">Tues</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 6</strong>
          <small class="text-muted">Mon</small>
        </div> 
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 7</strong>
          <small class="text-muted">Wed</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 8</strong>
          <small class="text-muted">Tues</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 9</strong>
          <small class="text-muted">Mon</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 10</strong>
          <small class="text-muted">Wed</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 11</strong>
          <small class="text-muted">Tues</small>
        </div>
      </a>
      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">문제 들어갈 자리 12</strong>
          <small class="text-muted">Mon</small>
        </div>
      </a>
    </div>
  </div>

  <div class="b-example-divider b-example-vr"></div>
  
 <fieldset class="block_box">
    <p class="question">다음 문자 중에 마음에 드는 것을 하나 고르세요</p>
    <div class="icon_line">
        <label><input type="radio"  name="company" value="naver"checked required>1</label>
    </div>
    <div class="icon_line">
        <label><input type="radio" name="company" value="kakao">2</label> 
    </div>
    <div class="icon_line">
        <label><input type="radio"  name="company" value="line">3</label> 
    </div>
    <div class="icon_line">
        <label><input type="radio"  name="company" value="coupang">4</label>
    </div>
    <div class="icon_line">
        <label><input type="radio"  name="company" value="baemin">5</label>
    </div>    
  </fieldset>
  
  
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>