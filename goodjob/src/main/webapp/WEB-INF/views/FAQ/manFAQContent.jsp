<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<title>Good Job</title>
<style>
.container{
	width: 960px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="offset-sm-3 col-sm-6">
				<h3>FAQ 수정</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				${dto.idx }번 FAQ 수정
			</div>
		</div>
		<form name="manFAQUpdatePage" action="manFAQUpdatePage.do">
			<div class="row">
				<div class="col-sm-3">
					회원 : ${dto.category }
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3">
					제목 : ${dto.subject	 }
				</div>
			</div>
			<div class="row">
				<div class="offset-sm-3 col-sm-6">
					내용 : ${dto.content }
				</div>
			</div>
			<div class="row">
				<div class="offset-sm-9 col-sm-3">
				<input type="hidden" value="${dto.idx}" name="idx">
					<input type="submit" value="수정하기">
					
				</div>
			</div>
		</form>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>