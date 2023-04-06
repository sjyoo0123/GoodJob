<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="btnradio" id="job" autocomplete="off">
				  <label class="btn btn-outline-primary" for="job">직종별</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="local" autocomplete="off">
				  <label class="btn btn-outline-primary" for="local">지역별</label>
			</div>
			<div id="my-div">
			<div class="card d-none" id="rangecard">
			      <div class="card-body">
			        시작일
			        <input type="date" name="date1" id="startdate">
			        종료일
			        <input type="date" name="date2" id="enddate">
			        <input type="button" value="기간 검색 " onclick="periodSearch()">
			      </div>
			</div>
			<div class="card d-none" id="monthcard">
			      <div class="card-body">
			        월 선택
			        <input type="month" name="monthdate" id="monthdate">
			        <input type="button" value="월 검색 " onclick="monthSearch()">
			        (6개월 전 데이터까지 검색)
			      </div>
			</div>
 		   </div>
			<div id="myPieChart"></div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>