<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<style>
.container{
	width: 960px;
}
</style>

<body>
<div class="container">
<%@include file="/WEB-INF/views/header.jsp" %>
	<div class="row">
		<div class="col-sm-4">
			문의 답변
		</div>
	</div>
	<br>
	<form name="manOneAnswer" action="manOneAnswer.do" method="post">
	<div class="row">
		<div class="offset-sm-3 col-sm-6"> 
			<table class="table">
			
				<tr>
					<td>
					문의 제목: <input type="text" name="subject" value="${dto.subject }"> &nbsp;&nbsp;
					<c:if test="${dto.check == 0 }">
						답변 상태 : 미답변
					</c:if>
					<c:if test="${dto.check == 1 }">
					답변 상태 : 답변
					</c:if> 
					</td>
				</tr>
				<tr>
					<td>
						<textarea cols="50" rows="20" name="content" style="resize: none">${dto.content}&#10;---------------------------------------&#10;답변:</textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="hidden" value="${dto.idx }" name="idx">
						<input type="submit" value="답변하기" class="btn btn-primary">
					</td>
				</tr>

			</table>
		</div>
	</div>
	</form>
	<%@include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>