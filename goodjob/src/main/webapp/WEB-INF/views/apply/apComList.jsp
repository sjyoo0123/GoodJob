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
<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
			<div class="col-12">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.do">Home</a></li>
    <li class="breadcrumb-item"><a href="company.do">마이페이지</a></li>
    <li class="breadcrumb-item"><a href="noticeComList.do">내 공고</a></li>
    <li class="breadcrumb-item active" aria-current="page">지원자리스트</li>
  </ol>
</nav>
	</div>
<article>
<h1 class="fw-bold display-3">${subject}</h1>
<div class="row">
<div class="col-9"></div><div class="col-3">
<form><div class="input-group mb-3"><input type="text" name="searchNotice" class="form-control" aria-describedby="button-addon2"><input type="submit" value="검색"  class="btn btn-outline-secondary" type="button" id="button-addon2"></div></form>
</div>
</div>
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
			<td>${dto.writedate}</td>
			<td><a href="resumeContent.do?idx=${dto.com_idx}" class="resume-link" data-max-age="${dto.max_age}">${dto.subject}</a></td>
			<td>${dto.plan_idx}</td>
			<td>${dto.gender}</td>
			<td>${dto.local1}</td>			
			<td>
			<c:choose>
	<c:when test="${dto.min_age==1}">
		O
	</c:when>
	<c:when test="${dto.min_age==0}">
		X
	</c:when>
	</c:choose>
	</td>
		</tr>
	</c:forEach>
</tbody>
<tfoot>
		<tr>
			<td colspan="6" align="center">
			${pageStr}
			</td>
		</tr>
</tfoot>
</table>
<script>
	$(document).ready(function() {
		  $('.resume-link').click(function(e) {
		    var idx = $(this).data('max-age');
		    $.ajax({
		      url: 'applyCheck.do',
		      type: 'POST',
		      data: { idx: idx },
		      success: function(response) {
		          window.location.href = "resumeContent.do?idx=" + idx;
		      }
		    });
		  });
		});

	</script>
</article>
		<%@include file="/WEB-INF/views/footer.jsp"%>
		</div>
</body>
</html>