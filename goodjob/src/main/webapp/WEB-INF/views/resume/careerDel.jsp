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
	<h1>경력사항 삭제 페이지</h1>
	<h5>나의 경력</h5>
	<c:forEach var="list" items="${list}">

		<hr>
		<table id="career">
			<tr>
				<th>회사명</th>
				<td>${list.com_name }</td>
			</tr>
			<tr>
				<th>근무기간</th>
				<td><span>${list.startday } </span> ~ <span>${list.endday }</span></td>
			</tr>
			<tr>
				<th>담당업무</th>
				<td>${list.part }</td>
			</tr>
			<tr>
				<th>서비스타입</th>
				<td>${list.service_type }</td>
		</table>
		<form name="careerDel" action="careerDel.do" method="post">
			<input type="hidden" name="cidx" value="${list.idx}"> <span><input
				type="submit" value="삭제"></span>
			<tr>
		</form>
	</c:forEach>
</body>
</html>