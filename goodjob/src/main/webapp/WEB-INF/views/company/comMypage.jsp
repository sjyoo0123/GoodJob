<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<title>마이페이지</title>
<style>
.container-fluid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
}
.card-stats {
position: relative;
}

.card-icon {
position: absolute;
top: 0;
right: 0;
width: 100%;
height: 100%;
display: flex;
justify-content: flex-end;
align-items: flex-start;
z-index: -1; 
}

.card-body {
position: relative;
z-index: 1;
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}
</style>
</head>
<body>
	<div class="container" >
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="row">
	<div class="col-12">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.do">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">마이페이지</li>
  </ol>
</nav>
	</div>
		<div class="col-sm-6 mb-4">
		<div class="card bg-primary bg-opacity-10">
		<div class="card-body">
			<h2 class="card-title">나의회사</h2>
			<h3>${cdto.com_name}</h3>
		</div>
		</div>
		</div>
		<div class="col-sm-6 mb-4">
		<div class="card-stats card <c:if test='${empty vlists}'>bg-primary bg-opacity-10</c:if>" <c:if test='${not empty vlists}'>style="background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            color:white;"</c:if>>
		<div class="card-icon"><i class="bi bi-ticket" style="font-size: 6rem; color: gold;"></i></div>
		<div class="card-body">
			<h2 class="card-title">
				<a href="comPlanList.do">나의 요금제</a><br>
			</h2>
			<h3><c:if test="${empty vlists}"><p>무료 요금제</p></c:if>
			<c:forEach var="dto" items="${vlists}">
							<h3>${dto.subject}</h3>
						</c:forEach>
			</h3>
		</div>
		</div>
		</div>
		<br>
		<div class="col-sm-6 mb-4">
		<div class="card-stats card bg-primary bg-opacity-10">
		<div class="card-body">
		<div class="card-icon"><i class="bi bi-clipboard" style="font-size: 6rem; color: #1A4369;"></i></div>
			<h1 class="card-title">
				<a href="noticeComList.do">공고 현황</a>
			</h1>
			<div class="row">
				<div class="col-sm-4">
				<h4>진행중인 공고</h4>
				<br>
						<h1 class="col-6 bg-primary bg-opacity-50"><c:if test="${ntotalCnt==null||nototalCnt==''}">0</c:if>${ntotalCnt}건</h1>
					</div>
					<div class="col-sm-6">
						<c:if test="${empty nlists}"><p>등록된 공고가 없습니다.</p></c:if>
						<c:forEach var="dto" items="${nlists}">
						<c:url var="contentUrl" value="noticeContent.do">
							<c:param name="idx">${dto.idx}</c:param>
						</c:url>
							<h3 class="text-truncate"><a href="${contentUrl}">${dto.subject}</a></h3>
						</c:forEach>
					</div>
			</div>
		</div>
		</div>
		</div>
		<div class="col-sm-6 mb-4">
		<div class="card-stats card bg-primary bg-opacity-10">
		<div class="card-body">
				<div class="card-icon"><i class="bi bi-people" style="font-size: 6rem; color: #52C640;"></i></div>
			<h1 class="card-title">
				<a href="ofComList.do">제의 현황</a>
			</h1>
			<div class="row">
			<div class="col-sm-5">
				<h4>진행중인 제의</h4>
				<h1 class="col-5 bg-primary bg-opacity-50"><c:if test="${ototalCnt==null||ototalCnt==''}">0</c:if>${ototalCnt}건</h1>
			</div>
			<div class="col-sm-7">
				<c:if test="${empty olists}"><p>등록된 공고가 없습니다.</p></c:if>
						<c:forEach var="dto" items="${olists}">
							<h3>${dto.subject}(${dto.min_age}세)</h3>
						</c:forEach>
			</div>
			</div>
		</div>
		</div>
	</div>
	</div>
	</div>
		<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>