<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Good Job</title>
<style type="text/css">
.qurey div.nav {
	background-color: gray;
	
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<div class="row">
					<div class="col-12 fs-1 mt-5 pt-5">
						<div class="col-4 offset-4 text-center">채용정보</div>
					</div>
					<div class="col-8 offset-2 qurey">
						<div class="nav text-center">
							<div class="col-2 offset-2">
								<button type="button" class="btn">업종별</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn">지역별</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn">기간별</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn">급여별</button>
							</div>
							<div class="col-12">asd</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script>
	$.ajax({
	    url: "https://dapi.kakao.com/v2/local/search/keyword.json",
	    headers: { "Authorization": "KakaoAK 61dcf9dc3f066d3fdbf620ba80e181cd" },
	    data: {
	        query: "서울",
	        category_group_code: "AD5"
	    },
	    success: function(response) {
	        console.log(response);
	    }
	});
	</script>
</body>
</html>