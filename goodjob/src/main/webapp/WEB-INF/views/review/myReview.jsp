<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>나의 후기</h1>
	<table border="1">
		<tr>
			<th>회사이름</th>
			<th>후기</th>
			<th>작성일</th>
		</tr>
			<c:forEach var="map" items="${map}">
			<tr>
				<div>
				<td>${map.value.name}</td>
				<td>${map.value.gender}&nbsp;${map.value.addr }&nbsp;
					${map.value.detail_addr }</td>
				<td>${map.value.writedate }</td>
				</div>
				<br>
			</tr>
		</c:forEach>
	</table>
</body>
</html>