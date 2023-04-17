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
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="container">
		<h1>받은 제안</h1>
		<article>
			<h1></h1>
			<div class="btn-group btn-group-lg" role="group"
				aria-label="Large button group"></div>
			<form>
				<div class="input-group mb-3">
					<input type="text" name="searchNotice" class="form-control"
						aria-describedby="button-addon2"><input type="submit"
						value="검색" class="btn btn-outline-secondary" type="button"
						id="button-addon2">
				</div>
			</form>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>지원일</th>
						<th>회사이름</th>
						<th>공고제목</th>
						<th>시급</th>
						<th>기간</th>
						<th>시간</th>
						<th>열람여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty lists}">
						<tr>
							<td colspan="6" align="center">제안이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${lists}">
						<tr>
							<c:url var="contentUrl" value="noticeContent.do">
								<c:param name="idx">${dto.idx}</c:param>
							</c:url>
							<td>${dto.writedate}</td>
							<td>${dto.com_name}</td>
							<td class="icon" id="${dto.plan_idx }"><a
								href="${contentUrl}">${dto.subject}</a></td>
							<td>${dto.pay_hour}원</td>
							<td>${dto.period}</td>
							<td>${dto.starttime}~${dto.finishtime}</td>
							<td></td>
							<c:choose>
								<c:when test="${dto.ref==0}">
									<td><svg xmlns="http://www.w3.org/2000/svg" width="30"
											height="30" fill="currentColor" class="bi bi-envelope-fill"
											viewBox="0 0 16 16">
								  <path
												d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
							</svg></td>
								</c:when>
								<c:when test="${dto.ref==1}">
										<td><svg xmlns="http://www.w3.org/2000/svg" width="30"
												height="30" fill="currentColor" class="bi bi-envelope-open "
												viewBox="0 0 16 16">
								   <path
													d="M8.47 1.318a1 1 0 0 0-.94 0l-6 3.2A1 1 0 0 0 1 5.4v.817l5.75 3.45L8 8.917l1.25.75L15 6.217V5.4a1 1 0 0 0-.53-.882l-6-3.2ZM15 7.383l-4.778 2.867L15 13.117V7.383Zm-.035 6.88L8 10.082l-6.965 4.18A1 1 0 0 0 2 15h12a1 1 0 0 0 .965-.738ZM1 13.116l4.778-2.867L1 7.383v5.734ZM7.059.435a2 2 0 0 1 1.882 0l6 3.2A2 2 0 0 1 16 5.4V14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5.4a2 2 0 0 1 1.059-1.765l6-3.2Z" />
							</svg></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6" align="center">${pageStr }</td>
					</tr>
				</tfoot>
			</table>
		</article>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
<script>
	$(document).ready(function() {
		$('.icon').on('click', function(e) {

			$.ajax({
				url : 'ofNorGetCheck.do',
				method : 'POST',
				data : {
					oidx : $(this).attr('id')
				}, // 업데이트할 데이터
				success : function(result) {
					// 업데이트가 성공하면 처리할 코드를 작성합니다.
				},
				error : function(error) {
					// 업데이트가 실패하면 처리할 코드를 작성합니다.
				}
			});
		});
	});
</script>
</html>