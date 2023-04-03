<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Good Job</title>
<script>
function manFAQAddCheck(){
	var subject=document.getElementById("subject");
	var content=document.getElementById("content");
	var category=document.getElementById("category");
	
	if(subject.value==""){
		alert("제목을 입력해주세요");
		return false;
	}
	
	if(content.value==""){
		alert("내용을 입력해주세요");
		return false;
	}
	if(category.value==""){
		alert("분류를 설정해주세요");
		return false;
	}
	
	document.manFAQAdd.submit();
}
</script>
</head>
<style>
.btn-primary {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd;
}
.container{
	width: 960px;
}
</style>
<body>
<div class="container">
<%@include file="/WEB-INF/views/header.jsp" %>
<section>
	<article>
		<form name="manFAQAdd" action="manFAQAdd.do" method="post">
			<h3 align="center">FAQ 작성</h3>
			<div class="row">
				<div class="offset-sm-4 col-sm-4">
					제목 : <input type="text" name="subject" class="form-control" id="subject">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="offset-sm-4 col-sm-4">
					내용 : <textarea rows="3"  class="form-control" name="content" id="content"></textarea>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="offset-sm-4 col-sm-4">
					회원 분류 :
					<select name="category" class="form-select" id="category">
						<option selected="selected">회원</option>
						<option value="기업">기업</option>
						<option value="개인">개인</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-2 offset-sm-10">
					<input type="button" value="작성하기" class="btn btn-primary" onclick="manFAQAddCheck();"> 
				</div>
			</div>
		</form>
	</article>
</section>
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>