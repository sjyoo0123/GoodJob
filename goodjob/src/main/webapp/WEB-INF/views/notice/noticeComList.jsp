<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<h1>내공고리스트페이지</h1>
			<hr class="my-4">
	<article>
		<div class="btn-group btn-group-lg" role="group"
			aria-label="Large button group">
			<button class="btn btn-outline-dark" onclick="location.href='noticeComList.do?status=0'">
				<span>진행중</span>
			</button>
			<button class="btn btn-outline-dark" onclick="location.href='noticeComList.do?status=1'">
				<span>승인대기</span>
			</button>
			<button class="btn btn-outline-dark" onclick="location.href='noticeComList.do?status=2'">
				<span>마감</span>
			</button>
		</div>
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text"
					class="form-control bg-secondary bg-opacity-10 border-primary small"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2" name="searchNotice">
				<button class="btn btn-primary" type="submit">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
		<hr class="my-4">
<div class="container">
<div class="row">
	<div class="col-12">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>게재기간</th>
					<th>공고제목/기업명</th>
					<th>유료서비스</th>
					<th>지원자</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty lists}">
					<tr>
						<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${lists}">
					<tr>
						<td>${dto.writedate}~${dto.deadline}</td>
						<c:url var="contentUrl" value="noticeContent.do">
							<c:param name="idx">${dto.idx}</c:param>
						</c:url>
						<td><a href="${contentUrl}">${dto.subject}</a><br>${dto.com_name}</td>
						<td>${dto.period}</td>
						<td><button type="button"
								class="btn btn-primary position-relative"
								onclick="location.href='apComList.do?noticeidx=${dto.idx}&subject=${dto.subject}'">
								${dto.ref}명
								<c:if test="${dto.recruit!=0}">
									<span
										class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">+${dto.recruit}<span
										class="visually-hidden">unread messages</span></span>
								</c:if>

							</button></td>
						<td><button type="button" class="btn btn-primary btn-lg">
								<span>UP</span>
							</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">${pageStr}</td>
					<td><input type="button" value="공고등록"
						onclick="location.href='noticeWrite.do'" type="button"
						class="btn btn-outline-primary"></td>
				</tr>
			</tfoot>
		</table>
		</div>
		</div>
		</div>
	</article>
</body>
</html>