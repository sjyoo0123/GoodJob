<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<div class="form-check form-check-inline">
					<input type="radio" class="btn-check" name="options" id="normal" autocomplete="off" value="개인" checked>
					<label class="btn btn-secondary" for="normal">일반회원</label>

					<input type="radio" class="btn-check" name="options" id="company" value="기업" autocomplete="off">
					<label class="btn btn-secondary" for="company">기업회원</label>
				</div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	
<script>
$("label").click(function(){
	 $.ajax({
	      url:'manBlackListGet.do',
	      type:'post',
	      data:{"category":$(".btn-check").value},//전송데이터
	      contentType: "application/json"
	      //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
	   }).done((data)=>{
	      //성공시 실행
		   window.alert('성공');
	   }).fail(()=>{
	      //실패시 실행
	   }).always(()=>{
	      //성공여부 무관 실행
		   
	   })
	});
</script>
</body>
</html>