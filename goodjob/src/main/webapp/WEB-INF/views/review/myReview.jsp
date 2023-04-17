<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
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
<title>Insert title here</title>
</head>
<style>
.page {
	text-align: center;
}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<h1>나의 후기</h1>

		<table class="table table-hover table-responsive-md">
			<thead class= "table-light">
				<tr>
					<th scope="col">회사이름</th>
					<th scope="col">후기</th>
					<th scope="col">삭제버튼</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="map" items="${map}">
					<tr>
						<th scope="row">${map.value.name}</th>
						<td><button>${map.value.gender}</button>&nbsp; <c:if
								test="${not empty map.value.addr }">
								<button>${map.value.addr }</button>&nbsp;</c:if> <c:if
								test="${not empty map.value.detail_addr }">
								<button>${map.value.detail_addr }</button>&nbsp;</c:if></td>
						<td><form method="POST" action="reviewDel.do">
								<input type="hidden" name="ridx" value="${map.value.age}">
								<input type="submit" value="삭제">
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="page">${pageStr }</div>

		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>