<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>Good Job</title>
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
			<!-- 
				<h3>FAQ</h3>
				<div>
					<span><input type="button" class="btn btn-primary" value="전체"></span>
					<span><input type="button" class="btn btn-primary" value="개인"></span>
					<span><input type="button" class="btn btn-primary" value="기업"></span>
				</div>
				<form name="manFAQsearch" action="manFAQsearch.do" >
				<div>
					<input type="text" name="search">
					<input type="submit" value="검색" class="btn btn-primary">
				</div>
				</form>
				<input type="button" value="등록하기" onclick="location.href='manFAQAddPage.do'" class="btn btn-primary">
				 -->
				 <div class="row">
				 	<div class="col-sm-3">
				 		<h3>FAQ</h3>
				 	</div>
				 	<div class="col-sm-7"></div>
				 	<div class="col-sm-2"></div>
				 </div>
				 <br>
				 <div class="row">
				 	<div class="col-sm-6">
				 		<table class="table">
				 			<tr>
				 				<td><input type="button" class="btn btn-primary" value="전체" id="button1"></td>
				 				<td><input type="button" class="btn btn-primary" value="개인" id="button1"></td>
				 				<td><input type="button" class="btn btn-primary" value="기업" id="button1"></td>
				 			</tr>
				 		</table>
				 	</div>
				 	<div class="col-sm-4"></div>
				 </div>
			</article>
		</section>
	
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>