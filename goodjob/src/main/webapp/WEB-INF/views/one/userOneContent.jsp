<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<script>${msg}</script>
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
		<section>
			<article>
			<div class="row">
			<div class="col-8 offset-2 mt-5 pt-5 text-center">
					<c:if test="${empty dto}">
				삭제된 게시글 입니다
				</c:if>
					<h2>${dto.subject}</h2>
					<c:forEach var="arr" items="${content}">
						<c:if test="${arr.startsWith('답변:')}">
							<div class="col-12"><div class="col-3 mt-3 bg-danger bg-opacity-10">${arr}</div></div>
						</c:if>
						<c:if test="${arr.startsWith('질문:')}">
							<div class="col-12"><div class="offset-10 col-3 mt-3 bg-info bg-opacity-10">${arr}</div></div>
						</c:if>
					</c:forEach>
					<c:if test="${dto.check ==1}">
						<form action="userOneReWrite.do" method="post" class="mt-5">
							<div class="input-group">
							<textarea rows="" cols="" name="plusContent" class="form-control"></textarea>
							<input type="hidden" name="idx" value="${dto.idx}"> <input
								type="hidden" name="content" value="${dto.content}"> <input
								type="submit" value="작성" class="btn btn-outline-primary">
							</div>
						</form>
					</c:if>
				</div>
				</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
</body>
</html>