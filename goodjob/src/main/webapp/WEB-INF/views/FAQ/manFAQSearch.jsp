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
#back{
	 color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd;
}
</style>

<body>
<div class="container">
<%@include file="/WEB-INF/views/header.jsp" %>
		<section>
			<article>
				 <div class="row">
				 	<div class="col-sm-3">
				 		<h3>FAQ</h3>
				 	</div>
				 </div>
				 <br>
				 <div class="row">
				 	<div class="col-sm-6">
				
				 		<table class="table">
				 			<tr>
				 				<td>
				 				<select class="form-select" name="category">
									  <option value="전체">전체</option>
									  <option value="개인">개인</option>
									  <option value="기업">기업</option>
									</select>
				 				</td>
				 			</tr>
				 		</table>

				 	</div>
				 </div>
				 <br>
				 <div class="row">
						
					 <table class="table">
					 	<tbody>
					 <c:if test="${empty lists }">
					 	<tr>
					 		<td align="center">등록된 FAQ글이 없습니다.</td>
					 	</tr>
					 </c:if>
					 	<c:forEach var="dto" items="${lists }">
					 		<tr>
					 			<td align="center" id="back">${dto.subject }</td>
					 		</tr>
					 		<tr>
					 			<td align="center">${dto.content }</td>
					 		</tr>
					 		<tr>
					 			<td align="right">
					 			<input type="button" value="수정하기" class="btn btn-primary">
					 			<input type="button" value="삭제하기"  class="btn btn-primary">
					 			</td>
					 		</tr>
					 	</c:forEach>
						 </tbody>
						 <tfoot>
						 	<tr>
						 		<td align="center">${pageStr }</td>
						 	</tr>
						 </tfoot>
					 </table>
				 </div>
				 <br>
				 <div class="row">
				 	<div class="offset-sm-9 col-sm-3">
				 		<input type="button" class="btn btn-primary" value="작성하기" onclick="location.href='manFAQAddPage.do'">
				 	</div>
				 </div>
			</article>
		</section>
	
<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>