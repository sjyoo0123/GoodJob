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
				</select> 
					<input type="text" name="search" size="30"> 
					<input type="submit" value="검색"> 
					<input type="button" value="후기 작성 하기" onclick="location.href='reviewWrite.do'">
					<input type="button" value="내 알바 후기" onclick="location.href='myReview.do'">
			</form>
		</article>
		<article>

			<table>
				<c:if test="${empty list}">
					<tr>
						<td>등록된 글이 없습니다</td>
					</tr>
				</c:if>

				<c:forEach var="map" items="${map}">
				<div border :1px solid gold >
					<div>회사명 ${map.value.name }</div>
					<div>리뷰 ${map.value.member_idx }</div>
					<div>키워드 ${map.value.addr } ${map.value.gender }
						${map.value.detail_addr }</div>
				</div>		
				</c:forEach>
			</table>
		</article>
	</section>
</body>
</html>