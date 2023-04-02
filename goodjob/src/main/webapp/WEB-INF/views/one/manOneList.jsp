<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<style>
.container{
	width: 960px;
}
.btn-primary {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd;
    
}
</style>
<body>
<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="container">
		<div class="row">
				<div class="offset-sm-3 col-sm-6">
					<h2>일대일 문의</h2>
				</div>
		</div>
		<div class="row">
			<form name="manOneKindList" action="manOneSearch.do">
				<div  class="col-sm-5">
					<select name="kind">
						<option value="전체">전체</option>
						<option value="개인">개인</option>
						<option value="기업">기업</option>
					</select>
					<input type="submit" value="바꾸기">		
			</div>
			</form>
		</div>
				<div class="row">
					<form name="manOneSearch" action="manOneSearch.do">
						<div class="offset-sm-8 col-sm-4">
							<input type="text" name="search" placeholder="제목을 입력하세요">
							<input type="submit" value="검색하기">
						</div>
					</form>
				</div>
				<hr>
				<br>
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>문의카테고리</th>
						<th>문의제목</th>
						<th>답변상태</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty lists }">
						<tr>
							<td colspan="5" align="center">
								등록된 문의글이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${lists }">
						<tr>
							<td>${dto.idx }</td>
							<td>${dto.category }</td>
							<c:url var="contentUrl" value="manOneContent.do">
								<c:param name="idx">${dto.idx }</c:param>
							</c:url>
							<td><a href="${contentUrl }">${dto.subject }</a></td>
							<c:if test="${dto.check == 0 }">
								<td>미답변</td>
							</c:if>
							<c:if test="${dto.check == 1 }">
								<td>답변</td>
							</c:if>
							<td>${dto.writedate }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">${pageStr }</td>
					</tr>
				</tfoot>
			</table>
	</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>