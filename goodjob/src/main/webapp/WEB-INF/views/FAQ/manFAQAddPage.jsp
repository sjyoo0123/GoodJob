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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Insert title here</title>
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
		<form name="manFAQAdd" action="manFAQAdd.jsp">
			<h3 align="center">FAQ 작성</h3>
			<div class="row">
				<div class="col-sm-4"> </div>
				<div class="col-sm-4">
					제목 : <input type="text" name="subject" class="form-control">
				</div>
				<div class="col-sm-4"></div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-4"> </div>
				<div class="col-sm-4">
					내용 : <textarea rows="3"  class="form-control" name="content"></textarea>
				</div>
				<div class="col-sm-4"></div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-4"> </div>
				<div class="col-sm-4">
					회원 분류 :
					<select name="category" class="form-select">
						<option selected="selected">회원</option>
						<option value="기업">기업</option>
						<option value="회원">개인</option>
					</select>
				</div>
				<div class="col-sm-4"></div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-7"></div>
				<div class="col-sm-2">
					<input type="submit" value="작성하기" class="btn btn-primary"> 
				</div>
			</div>
		</form>
	</article>
</section>
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>