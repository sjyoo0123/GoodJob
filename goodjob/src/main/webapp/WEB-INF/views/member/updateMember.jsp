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
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<form action="${url}" method="post">
					<input type="text" name="id" value="${dto.id}"> 
		기업은회사이름<input type="text" name="name" value="${dto.name}"> 
					<input type="text" name="email" value="${dto.email}">
						 <input type="text" name="tel" value="${dto.tel}"> 
						 <input type="password" name=pwd>
						<c:if test="${category eq nor}">
						<input type="text" name="birth">
						<select name="gender">
							<option>남자</option>
							<option>여자</option>
						</select>
					</c:if>
					<c:if test="${category eq com}">
						<input type="text" name="com_name">
					</c:if>
				</form>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>