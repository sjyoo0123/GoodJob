<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
</head>
<body>
<h1>지원자리스트페이지</h1>
<article>
<h1>${subject}</h1>
<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
<button class="btn btn-outline-dark"><span>수정</span></button>
<button class="btn btn-outline-dark"><span>삭제</span></button>
</div>
<form><div class="input-group mb-3"><input type="text" name="searchNotice" class="form-control" aria-describedby="button-addon2"><input type="submit" value="검색"  class="btn btn-outline-secondary" type="button" id="button-addon2"></div></form>
<table class="table table-hover">
<thead>
<tr>
	<th>지원일</th>
	<th>지원자</th>
	<th>나이</th>
	<th>성별</th>
	<th>주소</th>
	<th>열람</th>
</tr>
</thead>
<tbody>
	<c:if test="${empty lists}">
		<tr>
			<td colspan="6" align="center">지원자가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr>
			<td>${dto.applydate}</td>
			<c:url var="contentUrl" value="applyContent.do">
				<c:param name="idx">${dto.memberidx}</c:param>
			</c:url>
			<td><a href="${contentUrl}">${dto.normal_name}</a></td>
			<td>${dto.notice_idx}</td>
			<td>${dto.gender}</td>
			<td><c:if test="${dto.check=0}">X</c:if><c:if test="${dto.check=1}">O</c:if></td>
		</tr>
	</c:forEach>
</tbody>
<tfoot>
		<tr>
			<td colspan="4" align="center">
			${pageStr}
			</td>
			<td></td>
		</tr>
</tfoot>
</table>
</article>
</body>
</html>