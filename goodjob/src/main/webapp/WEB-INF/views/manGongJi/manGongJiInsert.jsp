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
<title>Insert title here</title>
<<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<form action="manGongjiInsert.do">
			<table border="1">
				<thead>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="subject"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
						<textarea rows="20" cols="100" name="content" style="resize: none;"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
						<div style="text-align: center;">
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시쓰기">
						</div>
						</td>
					</tr>
				</tfoot>
			</table>
			</form>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
</body>
</html>