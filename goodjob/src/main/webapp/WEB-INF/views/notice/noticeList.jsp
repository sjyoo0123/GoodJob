<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
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
div{
border: 1px black solid;
}
.btn.col-1{
border: 1px black solid;
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
					<div class="col-8 offset-2">
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
							<div class="col-12 query">
								<!--업종별 -->
								<div>
								대분류 중분류 셀박 소분류 체크박스 
								</div>
								<!--지역별 -->
								<div></div>
								<!--기간별 -->
								<div>
								요일 체크박스 시간 기간
								</div>
								<!--급여별 -->
								<div>
								시급 월급셀박 급여 셀박 무관포함 체크박스
								</div>
							</div>
							<div>선택한 쿼리 들어감</div>
						</div>
					</div>
					<div class="content">콘텐츠 들어갈곳</div>
				</div>
				<div class="page">
					<div class="row justify-content-evenly">
						<button type="button" class="btn col-1"><i class="bi bi-backspace-fill"></i></button>
								<button type="button" class="btn col-1">1</button>
								<button type="button" class="btn col-1">2</button>
								<button type="button" class="btn col-1 aa">3</button>
								<button type="button" class="btn col-1">4</button>
								<button type="button" class="btn col-1">5</button>
						<button type="button" class="btn col-1 next" value="next"><i class="bi bi-backspace-reverse-fill"></i></button>
					</div>
				</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script>
	$('button:contains("업종별")').on('click',()=>{
		
	});
	$('button:contains("지역별")').on('click',()=>{
		
	});
	$('button:contains("기간별")').on('click',()=>{
		
	});
	$('button:contains("급여별")').on('click',()=>{
		
	});
	</script>
	<script>
	var a=page();
	alert($('.aa').val());
	const a=page('{"cp":2,$('.vasdds').val():"qq"}');
	function page(data) {
		return $.ajax({
		    url: location.pathname,
		    type: 'get',
		    data: JSON.parse(data),
		    contentType: "application/json"
		  }).done((data) => {
		  }).fail(() => {
		  });
	}
	
	</script>
</body>
</html>