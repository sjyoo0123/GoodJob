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
		<section>
			<article>
				<div class="row">
					<div class="offset-sm-3 col-sm-6">
						<h3>공고 관리</h3>
					</div>
				</div>
				<div class="row">
					<div class="offset-sm-3 col-sm-6">
						승인 | 삭제
					</div>
					<br>
				<div class="row">
					<div class="col-sm-4">
						공고 삭제
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>공고 이름</th>
							<th>기업 이름</th>
							<th>급여</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty lists }">
							<tr>
								<td colspan="3" align="center">존재하는 공고가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${lists }">
							<tr>
								<td>${dto.subject }</td>
								<td>${dto.com_name }</td>
								<td>${dto.pay_hour }</td>
								<td><input type="button" value="삭제하기" onclick="location.href='manNoticeDel.do?idx=${dto.idx}'"></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">${pageStr }</td>
						</tr>
					</tfoot>
				</table>
			</article>
		</section>
	 <%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
</body>
</html>