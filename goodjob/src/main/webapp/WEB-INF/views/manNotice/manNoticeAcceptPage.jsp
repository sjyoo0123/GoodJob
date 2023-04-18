<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<title>Good Job</title>
</head>
<script type="text/javascript">
   var s_status='${sessionScope.status}';
   var s_category='${sessionScope.scategory}';
   var check_category='관리자';
   if( s_status==''){
      window.alert('로그인이 필요합니다');
      location.href='login.do';
   }else if(s_status=='블랙'){
      window.alert('차단된 회원입니다');
      location.href='index.do';
   }else if(s_category!=check_category){
      window.alert(check_category+'만 이용 가능한 페이지입니다');
      location.href='index.do';
   }
</script>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp" %>
		<section>
				<article>
				<div class="row">
					<div class="mx-auto">
						<h3><i class="bi bi-calendar-check"></i>공고 관리</h3>
					</div>
				</div>
				<div class="row">
					<div class="mx-auto">
						<a href="manNoticeStatusPage.do">상태관리</a> | <a href="manNoticeAcceptPage.do">승인</a> | <a href="manNoticeDelPage.do">삭제</a>
					</div>
					<br>
					<br>
				<br>
				<br>
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th>공고 이름</th>
								<th>기업 이름</th>
								<th>급여 </th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lists }">
								<tr>
									<td colspan="4" align="center">승인 대기중인 공고가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${lists }">
								<c:url var="contentUrl" value="manNoticeAcceptContent.do">
									<c:param name="idx" value="${dto.idx }"></c:param>
								</c:url>
								<tr>
									<td><a href="${contentUrl }">${dto.subject }</a></td>
									<td>${dto.com_name }</td>
									<td>${dto.pay_hour }</td>
									<td>${dto.writedate }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4" align="center">${pageStr }</td>
							</tr>
						</tfoot>
					</table>
				</div>	
				</article>
			</section>
		<%@include file="/WEB-INF/views/footer.jsp" %>
	</div>
</body>
</html>