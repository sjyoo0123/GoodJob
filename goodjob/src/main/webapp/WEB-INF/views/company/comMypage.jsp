<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
div{
background-color: skyblue;
}
</style>
</head>
<body class="container overflow-hidden text-left">
	<h1>기업마이페이지</h1>
	<div class="row g-2">
		<div class="col-6">
			<h2>나의회사${dto.com_name}</h2>
		</div>
		<div class="col-6">
			<h2>
				<a href="#">나의 요금제</a>
			</h2>
			<h3>나의 요금제 목록 들어갈 자리</h3>
		</div>
		<br>
		<div class="col-6">
			<h1>
				<a href="noticeComList.do">공고 현황</a>
			</h1>
			<div>
				<h4>진행중인 공고</h4>
				<br>
				<h3>@건</h3>
			</div>
			<div>
				<h3>공고 리스트 들어갈 자리</h3>
			</div>
		</div>
		<div class="col-6">
			<h1>
				<a href="#">제의 현황</a>
			</h1>
			<div>
				<h4>진행중인 제의</h4>
				<h3>@건</h3>
			</div>
			<div>
				<h3>리스트 들어갈 자리</h3>
			</div>
		</div>
	</div>
</body>
</html>