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
<script>
function Check(){
	var category=document.getElementById("category");
	var subject=document.getElementById("subject");
	var content=document.getElementById("content");
	
	if(category.value == null){
		alert("카테고리를 선택해주세요");
		
		return false;
	}
	if(subject.value == null){
		alert("제목을 입력해주세요");
		
		return false;
	}
	if(content.value == null){
		alert("내용을 입력해주세요");
		
		return false;
	}
	
	document.manFAQUpdate.submit();
}

</script>
<style>
#h3{
color: blue;
}


</style>	
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp" %>
		<div class="row">
			<div class="offset-sm-3 col-sm-6">
				<h3 align="center" id="h3">FAQ 수정</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4" id="div1">
				${dto.idx }번 FAQ 수정
			</div>
		</div>
		<hr>
		<br>
		<form name="manFAQUpdate" action="manFAQUpdate.do" method="post">
			<div class="row">
				<div class="col-sm-3">
					회원 : 
					<select name="category" id="category" class="form-control">
						<option value="개인">개인</option>
						<option value="기업">기업</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-3">
					제목 : <input type="text" name="subject" value="${dto.subject	 }" id="subject" class="form-control">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-10">
					내용 : <input type="text"	 value="${dto.content }" name="content" id="content" class="form-control">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="offset-sm-9 col-sm-3">
					<input type="hidden" value="${dto.idx }" name="idx">
					<input type="button" value="수정하기" onclick="Check();"  class="btn btn-primary">
				</div>
			</div>
		</form>
			<%@include file="/WEB-INF/views/footer.jsp" %>
	</div>
</body>
</html>