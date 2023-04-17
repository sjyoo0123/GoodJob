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
</head>

<body>
	<div class="container">
		<%@include  file="/WEB-INF/views/header.jsp"%>
			<section>
				<article>
					<div class="row">
						<div class="offset-sm-3 col-sm-6">
							<h3 align="center"><i class="bi bi-pencil-square"></i>키워드 관리</h3>
						</div>
						<br>
						
					</div>
					<br>	
					<form name="manKeywordAdd" action="manKeywordAdd.do">
					  <div class="row justify-content-center">
					    <div class="col-sm-8 ">
					      <div class="d-flex justify-content-center mb-3">
					        <span>키워드 추가</span>
					      </div>
					      <div class="d-flex justify-content-center">
					        <input type="text" name="content" placeholder="키워드를 입력해주세요." class="form-control mr-2">
					        <input type="submit" value="추가하기" class="btn btn-primary">
					      </div>
					    </div>
					  </div>
					</form>
					<br>
					<form name="manKeywordDel" action="manKeywordDel.do">
					<div class="row justify-content-center">
							<div class="col-sm-8">
								<div class="d-flex justify-content-center mb-3">
								<span>키워드 삭제</span>
								</div>
								<div class="d-flex justify-content-center">
									<input type="text"  name="keywordDel" placeholder="키워드를 입력해주세요." readonly="readonly" id="keywordDel" class="form-control">
									<input type="hidden" name="keywordDel2" id="keywordDel2"> 
									<input type="submit" value="삭제하기" class="btn btn-primary">
								</div>									
							</div>
						</div>
					</form>
					<br>
					<br>
							<div class="row">
								<div class="offset-sm-3 col-sm-6" >
									<c:if test="${empty lists }">
										키워드가 없습니다.
									</c:if>
									<c:forEach var="dto" items="${lists }">
										<input type="button" value="${dto.content}" name="keyword" onclick="document.getElementById('keywordDel').value='${dto.content}'; document.getElementById('keywordDel2').value='${dto.idx}';"  id="keyword" class="btn btn-primary mb-4">
									</c:forEach>
								</div>
							</div>
				</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp" %>
	</div>
</body>
</html>