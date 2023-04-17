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
.container {
	width: 960px;
}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
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
					<div class="row">
						<div class="offset-sm-3 col-sm-6">
							<div class="card">
								<div class="card-header">
									up 요금제 수정하기
								</div>
								<table class="table">
									<c:if test="${empty lists_up_update }">
										<tr>
											<td colspan="4" align="center">등록된 up요금제가 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="dto" items="${lists_up_update }">
										
										<tr>
											
											<td>요금제 이름 : ${dto.plan_name }	</td>
											<td>업 횟수 : ${dto.count }</td>
											<td>요금제 가격 : ${dto.plan_price }</td>
											<td><input type="button" class="btn btn-primary" value="수정하기" onclick="location.href='manPlanUpUpdateContent.do?idx=${dto.idx}'"></td>
										</tr>
									</c:forEach>
										<tfoot>
											<tr>
												
											</tr>
										</tfoot>
								</table>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="offset-sm-3 col-sm-6">
							<div class="card">
								<div class="card-header">
									vip 요금제 수정하기
								</div>
								<table class="table">
									<c:if test="${empty lists_vip_update}">
										<tr>
											<td colspan="5" align="center">등록된 vip요금제가 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="dto" items="${lists_vip_update }">
										
										<tr>
											<td>요금제 이름 : ${dto.plan_name } </td>
											<td>요금제 등급 : ${dto.vip_floor }</td>
											<td>요금제 가격 : ${dto.plan_price }</td>
											<td>기간 : ${dto.plan_period }</td>
											<td><input type="button" class="btn btn-primary" value="수정하기" onclick="location.href='manPlanVipUpdateContent.do?idx=${dto.idx}'"></td>
										</tr>	
									</c:forEach>
								</table>
							
							</div>
						</div>
					</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp" %>
	</div>
</body>
</html>