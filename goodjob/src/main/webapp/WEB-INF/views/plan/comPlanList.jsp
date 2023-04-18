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

<title>Good Job</title>
</head>
<body>
		<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
	<article>
			<div class="row">
				<div class="col-12">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.do">Home</a></li>
    <li class="breadcrumb-item"><a href="company.do">마이페이지</a></li>
    <li class="breadcrumb-item active" aria-current="page">내 요금제</li>
  </ol>
</nav>
	</div>
	<h1>내요금제</h1>
			<hr class="my-4">
		<div class="btn-group btn-group-lg col-4" role="group"
			aria-label="Large button group">
			<button class="btn btn-<c:if test="${plan_type!='VIP'}">outline-</c:if>dark" onclick="location.href='comPlanList.do?plan_type=VIP'">
				<span>VIP</span>
			</button>
			<button class="btn btn-<c:if test="${plan_type!='UP'}">outline-</c:if>dark" onclick="location.href='comPlanList.do?plan_type=UP'">
				<span>UP</span>
			</button>
		</div>
				<div class="col-5"></div>
						<div class="col-3">
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
			</div>
					</div>
		<hr class="my-4">
<div class="container">
<div class="row">
	<div class="col-12">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>요금제종류</th>
					<th>요금제명</th>
					<c:if test="${plan_type=='VIP'}"><th>요금기간</th></c:if>
					<th><c:if test="${plan_type=='VIP'}">등급</c:if><c:if test="${plan_type=='UP'}">남은횟수</c:if></th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="<c:if test="${plan_type=='VIP'}">5</c:if><c:if test="${plan_type=='UP'}">4</c:if>" align="center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.gender}</td>
						<td>${dto.subject}</td>
						<c:if test="${plan_type=='VIP'}"><td>${dto.writedate}~${dto.deadline}<br>(잔여일:${dto.com_idx}일)</td></c:if>
						<td><c:if test="${plan_type=='VIP'}">${dto.grade}</c:if><c:if test="${plan_type=='UP'}">${dto.com_idx}</c:if></td>
						<td><button type="button" class="btn btn-primary btn-lg" onclick="location.href='planInfo.do'">
								<span><c:if test="${plan_type=='VIP'}">연장</c:if><c:if test="${plan_type=='UP'}">추가</c:if></span>
							</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="<c:if test="${plan_type=='VIP'}">4</c:if><c:if test="${plan_type=='UP'}">3</c:if>" align="center">${pageStr}</td>
					<td><button class="btn btn-primary btn-icon-split btn-lg" onclick="location.href='planInfo.do'">
    <span class="icon text-white-50">
        <i class="bi bi-cart4"></i>
    </span>
    <span class="text">요금제구매</span>
</button>
</td>
				</tr>
			</tfoot>
		</table>
		</div>
		</div>
		</div>
	</article>
			<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
</body>
</html>