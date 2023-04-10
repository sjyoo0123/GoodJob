<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
			<form action="manGongjiUpdate.do">
			<input type="hidden" name="idx" value="${dto.idx }">
			<table border="1">
				<thead>
					<tr>
						<th>글번호</th>
						<td>${dto.idx }</td>
						<th>작성일</th>
						<td>${dto.writedate}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="subject"value="${dto.subject}"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
						<textarea rows="20" cols="100" name="content" style="resize: none;">${dto.content }</textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
						<div style="text-align: center;">
						<input type="submit" value="수정하기">
						</div>
						</td>
					</tr>
				</tfoot>
			</table>
			</form>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
</body>
</html>