<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<script>${msg}</script>
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
<script type="text/javascript">${msg}</script>
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
						<div class="col-2 offset-4 text-center">
							<button class="w-100 bg-primary nor">
								<div class="text-nowrap">개인</div>
							</button>
						</div>
						<div class="col-2 text-center">
							<button class="w-100 com">
								<div class="text-nowrap">기업</div>
							</button>
						</div>
						<div class="form-floating col-4 offset-4 mt-2">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="아이디" name="id" value="${cookie.sid.value }">
							<label for="floatingInput">아이디</label>
						</div>
						<div class="form-floating col-4 offset-4 mt-2">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="비밀번호" name="pwd"> <label
								for="floatingPassword">비밀번호</label>
						</div>

						<div class="checkbox mb-3  col-4 offset-4">
							<label> <input type="checkbox" ${check} name="save">아이디
								저장
							</label>
						</div>
						<button class="btn btn-lg btn-primary  col-4 offset-4 mt-2"
							type="submit">로그인</button>
						<div class="col-4 offset-4 mt-2 text-center">
							<a type="button" data-bs-toggle="modal" data-bs-target="#staticBackdropId">아이디찾기</a> | <a type="button" data-bs-toggle="modal" data-bs-target="#staticBackdropPwd">비밀번호찾기</a>
						</div>
					</div>
				</form>

				<!--id  -->
				<div class="modal fade" id="staticBackdropId"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디찾기</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
							<form id="findId">
							<div class="row">
							<div class="form-floating mb-3 col-8 offset-2">
							
							<input type="text" class="form-control" id="findIdAndEmail"
								name="email" placeholder="email"> <label
								for="findIdAndEmail">이메일</label>
						</div>
							</div>
							</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary findIdSubMit">전송</button>
							</div>
						</div>
					</div>
				</div>

				<!-- pwd -->
				<div class="modal fade" id="staticBackdropPwd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호찾기</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
							<form id="findPwd">
							<div class="row">
									<div class="form-floating mb-3 col-8 offset-2">
							<input type="text" class="form-control" id="findPwdAndEmail"
								name="email" placeholder="email"> <label
								for="findPwdAndEmail">이메일</label>
						</div>
									<div class="form-floating mb-3 col-8 offset-2">
							<input type="text" class="form-control" id="findPwdAndId"
								name="id" placeholder="id"> <label
								for="findPwdAndId">아이디</label>
						</div>
							</div>
								
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary findPwdSubMit">전송</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="staticBackdropAlert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">알림</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body alertModal">
							-
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
<script>
$('.findIdSubMit').on('click',function(){
	$.ajax({
		url:'findId.do',
		data:{email:$('#findIdAndEmail').val()},
	}).done(function(data){
			 $('#staticBackdropId').modal('hide');
			 $('#staticBackdropAlert').modal('show');
		if(data>0){
			$('.alertModal').text('고객님의 이메일로 아이디가 전송되었습니다');
		}else{
			$('.alertModal').text('계정이 존재하지 않습니다');
			
		}
	})
});

$('.findPwdSubMit').on('click',function(){
	$.ajax({
		url:'findPwd.do',
		data:{id:$('#findPwdAndId').val(),email:$('#findPwdAndEmail').val()},
	}).done(function(data){
		 $('#staticBackdropPwd').modal('hide');
		 $('#staticBackdropAlert').modal('show');
		if(data>0){
			$('.alertModal').text('이메일을 통해 비밀번호를 변경해 주세요');
		}else{
			$('.alertModal').text('아이디 혹은 이메일을 확인해주세요');
		}
	})
});

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
$('.login').submit(function(event) {
  
    var filled = true;
    $(this).find('input').each(function() {
        if ($(this).val() === '') {
            filled = false;
            return false; 
        }
    });
    if (filled) {
        return true;
    } else {
        event.preventDefault();
        alert('모든 항목을 입력해주세요');
        return false;
    }
});
${script}
</script>
</body>
</html>