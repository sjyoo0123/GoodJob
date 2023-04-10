<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
	 <%@include file="/WEB-INF/views/header.jsp"%> 
		<section class="mt-5">
			<article>
			<div class="row">
				<div class="col-10 offset-2 text-start"><a href="userGongJiList.do">목록으로</a></div>
				<c:if test="${empty dto}">
				<div class="col-8 offset-2">존재하지않는 게시글 입니다</div>
				</c:if>
				<div class="col-8 offset-2 text-center fs-2 mt-5">제목${dto.subject}</div>
				<div class="col-1">${dto.writedate}</div>
				<div class="col-8 offset-2">${dto.content}</div>
			
			</div>
			</article>
		</section>
	 <%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
</body>
</html>