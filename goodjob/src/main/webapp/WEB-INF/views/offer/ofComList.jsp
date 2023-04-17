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
<article>
<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
<div class="row">
	<div class="col-12">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.do">Home</a></li>
    <li class="breadcrumb-item"><a href="company.do">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">내가보낸제안</li>
  </ol>
</nav>
	</div>
			<hr class="my-4">
					</div>

<table class="table table-hover">
<thead>
<tr>
	<th></th>
	<th>제안일</th>
	<th>제안자</th>
	<th>나이</th>
	<th>성별</th>
	<th>주소</th>
	<th>이력서</th>
</tr>
</thead>
<tbody>
	<c:if test="${empty lists}">
		<tr>
			<td colspan="6" align="center">제안내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">

			<c:choose>
	<c:when test="${dto.ref==0}">
	<tr>
	<td>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
</svg>
</td>
	</c:when>
	<c:when test="${dto.ref==1}">
	<tr class="table-active">
	<td>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-envelope-open" viewBox="0 0 16 16">
  <path d="M8.47 1.318a1 1 0 0 0-.94 0l-6 3.2A1 1 0 0 0 1 5.4v.817l5.75 3.45L8 8.917l1.25.75L15 6.217V5.4a1 1 0 0 0-.53-.882l-6-3.2ZM15 7.383l-4.778 2.867L15 13.117V7.383Zm-.035 6.88L8 10.082l-6.965 4.18A1 1 0 0 0 2 15h12a1 1 0 0 0 .965-.738ZM1 13.116l4.778-2.867L1 7.383v5.734ZM7.059.435a2 2 0 0 1 1.882 0l6 3.2A2 2 0 0 1 16 5.4V14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5.4a2 2 0 0 1 1.059-1.765l6-3.2Z"/>
</svg>
</td>
	</c:when>
	</c:choose>
			<td>${dto.writedate}</td>
			<td>${dto.subject}</td>
			<td>${dto.pay_month}년(${dto.min_age}세)</td>
			<td>${dto.gender}</td>
			<td>${dto.period}</td>			
			<td><button type="submit" class="btn btn-primary btn-icon-split btn-lg col-12" onclick="location.href='resumeContent.do?idx=${dto.idx}'">
    <span class="icon text-white-50">
        <i class="bi bi-check-lg"></i>
    </span>
    <span class="text">이력서</span>
</button></td>
		</tr>
	</c:forEach>
</tbody>
<tfoot>
		<tr>
			<td colspan="7" align="center">
			${pageStr}
			</td>
		</tr>
</tfoot>
</table>
</div>
</article>
		<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>