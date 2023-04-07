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
<title>Insert title here</title>
<style>
.container-fluid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="container-fluid" >
	<div class="row">
		<div class="col-sm-6 mb-4">
		<div class="card bg-secondary bg-opacity-10">
		<div class="card-body">
			<h2 class="card-title">나의회사</h2>
			<h3>회 ${dto.com_name} 사</h3>
		</div>
		</div>
		</div>
		<div class="col-sm-6 mb-4">
		<div class="card bg-secondary bg-opacity-10">
		<div class="card-body">
			<h2 class="card-title">
				<a href="#">나의 요금제</a>
			</h2>
			<h3>나의 요금제 목록 들어갈 자리</h3>
		</div>
		</div>
		</div>
		<br>
		<div class="col-sm-6 mb-4">
		<div class="card bg-secondary bg-opacity-10">
		<div class="card-body">
			<h1 class="card-title">
				<a href="noticeComList.do">공고 현황</a>
			</h1>
			<div class="row">
				<div class="col-sm-4">
				<h4>진행중인 공고</h4>
				<br>
						<h1>${ntotalCnt}건</h1>
					</div>
					<div class="col-sm-8">
						<c:if test="${empty nlists}"><p>등록된 공고가 없습니다.</p></c:if>
						<c:forEach var="dto" items="${nlists}">
							<h3>${dto.subject}</h3>
						</c:forEach>
					</div>
			</div>
		</div>
		</div>
		</div>
		<div class="col-sm-6 mb-4">
		<div class="card bg-secondary bg-opacity-10">
		<div class="card-body">
			<h1 class="card-title">
				<a href="ofComList.do">제의 현황</a>
			</h1>
			<div class="row">
			<div class="col-sm-5">
				<h4>진행중인 제의</h4>
				<h1>${ototalCnt}건</h1>
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