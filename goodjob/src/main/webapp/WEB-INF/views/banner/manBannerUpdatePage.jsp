<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<section>
	<article>
		<div class="container">
			<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<h2 align="center">배너 관리</h2>
					</div>
				</div>
				<div class="row">
					<div class="offset-sm-3 col-sm-6" align="center">
						<a href="manBannerPage.do">추가</a> | <a href="manBannerUpdatePage.do">수정</a> | <a href="manBannerDelPage.do">삭제</a>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						적용중인 배너
					</div>
				</div>
				<div class="row">
					<table class="table">
					<c:if test="${empty lists }">
						<tr>
							<td align="center">등록된 배너가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${lists }">
						<thead>
							<tr>
								<th>배너 이름 :  ${dto.subject }</th>
								<th>배너 번호 : ${dto.idx }</th>
								<th>배너 파일 </th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>배너링크 : ${dto.link }</td>
								<td>순번 : ${dto.ref }</td>
								<td><img alt="이미지" src="${dto.file }" width="300" height="300"></td>
							</tr>

							<tr>
								<td colspan="3" align="right"><input type="button" value="수정하기" onclick="location.href='manBannerUpdateContent.do?idx=${dto.idx}'" class="btn btn-primary"></td>
							</tr>
						</tbody>
					</c:forEach>
						
					</table>
				</div>
		</div>
	</article>
</section>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>