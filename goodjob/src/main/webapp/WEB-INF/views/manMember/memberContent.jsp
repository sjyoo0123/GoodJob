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
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
			<div>
				<ul>
					<li>id:${dto.id }</li>
					<li>이름:${dto.name }</li>
					<li>대표자명:${dto.com_name }</li>
					<li>사업자번호:${dto.com_num }</li>
					<li>이메일:${dto.email }</li>
					<li>전화번호:${dto.tel }</li>
					<li>주소:${dto.addr }</li>
					<li>상세주소:${dto.detail_addr }</li>
				</ul>
			</div>
			<div>
				<input type="button" value="승낙하기" onclick="javascript:location.href='manMemberUpdate.do?idx=${dto.idx}&category=활성'">
				<input type="button" value="거절하기" onclick="javascript:location.href='manMemberUpdate.do?idx=${dto.idx}&category=거절'">
			</div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>