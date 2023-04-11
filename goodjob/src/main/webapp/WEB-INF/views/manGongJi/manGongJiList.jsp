<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty lists }">
							<tr>
							<td colspan="3">작성된 글이 없습니다</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${lists}">
							<c:url var="urlstr" value="manGonjiContent.do">
								<c:param name="idx" value="${dto.idx }"></c:param>
							</c:url>
							<tr>
								<td>${dto.idx }</td>
								<td><a href="${urlstr }">${dto.subject }</a></td>
								<td>${dto.writedate }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3">
							${pagestr}
							</td>
						</tr>
						<tr>
							<td colspan="3">
							<div>
							<input type="button" value="글작성" onclick="javascript:location.href='manGongjiInertForm.do'">
							</div>
							</td>
						</tr>
					</tfoot>
				</table>
					
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
</body>
</html>








