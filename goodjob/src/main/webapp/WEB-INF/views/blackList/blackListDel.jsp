<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="manBlackListDel.do">
	<fieldset>
	<input type="hidden" name="idx" value="${idx }">
	<input type="hidden" name="sort" value="${sort}">
	<input type="hidden" name="member_idx" value="${member_idx}">
		<legend>삭제하시겠습니까?</legend>
		<input type="submit" value="삭제하기">
		<input type="button" value="취소하기" onclick="javascript:window.self.close()">
	</fieldset>
</form>
</body>
</html>