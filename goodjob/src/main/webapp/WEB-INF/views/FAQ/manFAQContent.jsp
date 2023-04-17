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
<style>
.h3{
color: blue;
}
</style>
<body>
	<div class="container">
	<%@include file="/WEB-INF/views/header.jsp" %>
		<div class="row">
			<div class="offset-sm-3 col-sm-6">
				<h3 align="center">FAQ 수정</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4" >
				${dto.idx }번 FAQ 수정
			</div>
		</div>
		<form name="manFAQUpdatePage" action="manFAQUpdatePage.do">
			<table class="table">
				<tr>
					<td>회원 : ${dto.category }</td>
				</tr>
				<tr>
					<Td>제목 : ${dto.subject }</Td>
				</tr>
				<Tr>
					<tD>내용 : ${dto.content }</tD>
				</Tr>
			</table>
			<div class="row">
			<div class="col-sm-10"></div>
			<div classs="col-sm-1">
				<input type="hidden" value="${dto.idx }" name="idx">
			<input type="submit" value="수정하기" class="btn btn-primary">
			</div>
			</div>
		</form>
		<%@include file="/WEB-INF/views/footer.jsp" %>
	</div>
</body>
</html>