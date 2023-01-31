<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>다면평가 시스템</title>

   <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paging.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700&family=Nanum+Gothic+Coding:wght@700&family=Nanum+Gothic:wght@800&family=Noto+Serif+KR:wght@600&display=swap" rel="stylesheet">

   <!-- Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>

</head>
<body>
   <div class="d-flex flex-column">

            <div class="col-12">
				&nbsp;
				<br>
				<br>
           </div>
		<div class="flex-grow-1 container-fluid">
			<div class="row h-100">
				<div class="col-1" >
										<div class="h-100 d-flex flex-column" style="width:160px;background:#031436; border-radius: 0.25rem;">
						<div class="flex-grow-1">
							<%@ include file="/WEB-INF/views/common/menuformanager.jsp"%>
						</div>
					</div>
				</div>

<!-- 				<div class="col-1 "> -->
