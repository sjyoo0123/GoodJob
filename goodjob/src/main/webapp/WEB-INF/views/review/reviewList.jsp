<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good Job</title>
</head>
<body>
	<section>
		<article>
				<form name="search" action="reviewListSubmit.do" method="get">
					<select name="category">
						<option value="newest" selected>최신순</option>
						<option value="reviewCount">리뷰 많은 순</option>
					</select> 
						<input type="text" name="reviewKeyword" size="30"> 
						<input type="submit" value="검색"> 
						<input type="button" value="후기 작성 하기" onclick="location.href='reviewWrite.do'" >
				</form> 
		</article>
	</section>
</body>
</html>