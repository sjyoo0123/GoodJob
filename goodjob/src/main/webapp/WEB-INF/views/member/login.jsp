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
<style>
button.w-100{
border: 0px;
min-height: 3rem;
}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<form action="${url}" method="get" class="login">
					<div class="row mt-5 gx-3 pt-5">
				<div class="col-2 offset-4 text-center"><button class="w-100 bg-primary nor"><div class="text-nowrap">개인</div></button></div>
				<div class="col-2 text-center"><button class="w-100 com"><div class="text-nowrap">기업</div></button></div>
						<div class="form-floating col-4 offset-4 mt-2">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="아이디" name="id" value="${cookie.sid.value }"> <label for="floatingInput">아이디</label>
						</div>
						<div class="form-floating col-4 offset-4 mt-2">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="비밀번호" name="pwd"> <label for="floatingPassword">비밀번호</label>
						</div>

						<div class="checkbox mb-3  col-4 offset-4">
							<label> <input type="checkbox" ${check} name="save">아이디
								저장
							</label>
						</div>
						<button class="btn btn-lg btn-primary  col-4 offset-4 mt-2" type="submit">로그인</button>
						<div class="col-4 offset-4 mt-2 text-center"><a href="">아이디찾기</a>|<a href="">비밀번호찾기</a></div>
					</div>
				</form>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
<script>
$('.nor').click((e)=>{
    e.preventDefault();
    $('.login').attr('action', 'normalLogin.do');
    $('.com').attr('class','w-100 com');
    $('.nor').attr('class','w-100 bg-primary nor');
});
$('.com').click((e)=>{
    e.preventDefault();
    $('.login').attr('action', 'comLogin.do');
    $('.nor').attr('class','w-100 nor');
    $('.com').attr('class','w-100 bg-primary com');
});
</script>
</body>
</html>