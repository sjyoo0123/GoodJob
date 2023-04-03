<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				</select> <input type="text" name="search" size="30"> <input
					type="submit" value="검색"> <input type="button"
					value="후기 작성 하기" onclick="location.href='reviewWrite.do'">
			</form>
		</article>
		<article>

			<table>
				<c:if test="${empty list}">
					<tr>
						<td>등록된 글이 없습니다</td>
					</tr>
				</c:if>

				<c:forEach var="dto" items="${list}">
					<div>회사명 ${dto.com_name }</div>
					<div>리뷰 ${dto.normal_idx}</div>
					<div></div>
				</c:forEach>
		</article>
	</section>
</body>
</html>