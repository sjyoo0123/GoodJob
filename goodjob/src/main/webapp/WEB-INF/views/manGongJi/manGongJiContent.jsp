<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
			<div class="row">
			<div class="col-8 offset-2">
			<table border="1" style="height: 600px; width: 800px">
				<thead>
					<tr>
						<th>
						<div class="input-group mb-3">
						  <span class="input-group-text" id="basic-addon1">글번호</span>
						  <input type="text" class="form-control" placeholder="Username" value="${dto.idx }" aria-label="${dto.idx }" aria-describedby="basic-addon1" readonly="readonly">
						  <span class="input-group-text" id="basic-addon1">작성일</span>
						  <input type="text" class="form-control" placeholder="Username" value="${dto.writedate}" aria-label="${dto.writedate}" aria-describedby="basic-addon1" readonly="readonly">
						</div>
						</th>
						
					</tr>
					<tr>
						<th colspan="2">
						<div class="input-group mb-3">
						  <span class="input-group-text" id="basic-addon1">제목</span>
						  <input type="text" class="form-control" placeholder="Username" value="${dto.subject}" aria-label="${dto.subject}" aria-describedby="basic-addon1" readonly="readonly">
						</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
						${dto.content }
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
						<div style="text-align: center;">
						<input type="button" class="btn btn-primary btn-sm" value="수정하기" onclick="javascript:location.href='manGongjiUpdateForm.do?idx=${dto.idx}'">
						<input type="button" class="btn btn-primary btn-sm" value="삭제하기" onclick="javascript:location.href='manGongjiDel.do?idx=${dto.idx}'">
						</div>
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
			</div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
</body>
</html>












