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
</head>
<style>
.container{
	width: 960px;
}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<form name="manPlanUpUpdate" action="manPlanUpUpdate.do" method="post">
					<div class="row">
						<div class="col-sm-6 offset-sm-3">
							<h2 align="center">요금제 관리</h2>
						</div>
					</div>
					<div class="row">
						<div class="offset-sm-3 col-sm-6" align="center">
							<a href="manPlanPage.do">추가</a> | <a href="manPlanUpdatePage.do">수정</a>
							| <a href="manPlanDelPage.do">삭제</a>
						</div>
					</div>
					<hr>
					<br>
					<br>
					<table class="table" style="width:50%;"  align="center">
							<tr>
								<td>요금제 이름 : <input type="text" name="plan_name" value="${dto.plan_name }" class="form-control"></td>
							</tr>
							<tr>
								<td>요금제 가격 : <input type="text" name="plan_price" value="${dto.plan_price }" class="form-control"></td>
							</tr>
							<tr>
								<td>
									업 횟수 :
									<input type="text" name="count" value="${dto.count }" class="form-control">
									 <input type="hidden" name="idx" value="${dto.idx }">
								</td>
							</tr>	
							<tr>
								<td align="right"><input type="submit" value="수정하기" class="btn btn-primary"></td>
							</tr>
					</table>
				</form>
			</article>
		</section>
	</div>
</body>
</html>