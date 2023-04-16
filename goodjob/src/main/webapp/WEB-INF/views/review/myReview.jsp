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
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<h1>나의 후기</h1>
		<table border="1">
			<tr>
				<th>회사이름</th>
				<th>후기</th>
				<th>작성일</th>
				<th></th>
			</tr>
			<c:forEach var="map" items="${map}">
				<div>
					<tr>
						<td>${map.value.name}</td>
						<td><button>${map.value.gender}</button>&nbsp; <c:if
								test="${not empty map.value.addr }">
								<button>${map.value.addr }</button>&nbsp;</c:if> <c:if
								test="${not empty map.value.detail_addr }">
								<button>${map.value.detail_addr }</button>&nbsp;</c:if>
						<td>${map.value.writedate }</td>
						<td><form method="POST" action="reviewDel.do">
								<input type="hidden" name="ridx" value="${map.value.age}">
								<input type="submit" value="삭제">

							</form></td>
					</tr>
				</div>
				<br>
			</c:forEach>
		</table>
		<div>${pageStr }</div>

		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>