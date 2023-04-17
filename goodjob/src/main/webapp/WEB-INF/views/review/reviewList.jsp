<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Good Job</title>
</head>
<style>
.button, .page {
	text-align: center;
}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<form name="search" action="review.do">
					<div class="button">
						<input type="text" name="keyword" size="30">
						<button type="submit" class="btn btn-outline-secondary">검색</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='reviewWrite.do'">후기 작성 하기</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='myReview.do'">내 알바 후기</button>
					</div>
				</form>
			</article>
			<article>
				<br>
				<c:if test="${empty list}">
					<p>등록된 글이 없습니다</p>
				</c:if>


				<div class="container text-center">
					<div class="row">
						<c:forEach var="map" items="${map}">
							<div class="col-md-6 card ">
								<div>${map.value.name }</div>
								<div>리뷰 ${map.value.member_idx }개</div>
								<div>
									<button>${map.value.gender }</button>
									&nbsp;
									<c:if test="${not empty map.value.addr }">
										<button>${map.value.addr }</button>&nbsp;</c:if>
									 <c:if
								test="${not empty map.value.detail_addr }">
								<button>${map.value.detail_addr }</button>&nbsp;</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="page">${pageStr }</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>