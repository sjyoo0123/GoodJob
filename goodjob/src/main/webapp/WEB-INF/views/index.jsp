<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
	${msg}
</script>
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
<style>
.carousel-item img {
	max-height: 150px;
	width: auto;
}
</style>
</head>

<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<section class="mt-5 pt-3">
			<article>
				<div class="row banner">
					<div class="card col-2 offset-1">
						<ul class="list-group list-group-flush gongji">
							<c:if test="${empty gList }">
								<li>등록된 공지가 없습니다</li>
							</c:if>
							<c:forEach var="gdto" items="${gList }">
								<li class="list-group-item">${gdto.idx}${gto.subject }</li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-6">
						<div id="carouselExampleControls" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="bdto" items="${banner }" varStatus="status">
								<c:if test="${status.first}">
									<div class="carousel-item active">
										<a href="${bdto.link }"><img src="/goodjob/bannerImg/${bdto.file }" class="w-100"  alt="${bdto.subject }"></a>
									</div>
								</c:if>
								<c:if test="${!(status.first)}">
									<div class="carousel-item">
										<a href="https://${bdto.link }"><img src="/goodjob/bannerImg/${bdto.file }" class="w-100" alt="${bdto.subject }"></a>
									</div>
								</c:if>
								</c:forEach>

							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
					<div class="card col-2 menu"></div>
				</div>
			</article>
		</section>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>