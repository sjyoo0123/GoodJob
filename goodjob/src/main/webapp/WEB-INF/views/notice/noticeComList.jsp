<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내공고리스트페이지</h1>
<article>
<button><span>진행중</span></button><button><span>승인대기</span></button><button><span>마감</span></button>
<form><input type="text" name="searchNotice"><input type="submit" value="검색"></form>
<table>
<thead>
<tr>
	<th>게재기간</th>
	<th>공고제목/기업명</th>
	<th>유료서비스</th>
	<th>지원자</th>
	<th>비고</th>
</tr>
</thead>
<tbody>
	<c:if test="${empty lists}">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
	</c:if>
</tbody>
<tfoot>
		<tr>
			<td colspan="4" align="center">
			${pageStr}
			</td>
			<td><input type="button" value="공고등록"></td>
		</tr>
</tfoot>
</table>
</article>
</body>
</html>