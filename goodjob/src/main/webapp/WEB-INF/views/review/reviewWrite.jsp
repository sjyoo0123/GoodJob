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
	테스트
	<h2>후기 작성</h2>
	<table>
		<c:if test="${empty dto}">
			<tr>
				<td>등록된 글이 없습니다</td>
			</tr>
		</c:if>

		<c:forEach var="dto" items="${dto}">
			<tr>
				<td><input class="list" type="button" value="${dto.content }"
					id="${dto.idx }"></td>
			</tr>
		</c:forEach>
	</table>

	<div>

		<div class="input">
			<!-- 삽입할 위치 -->
		</div>


	</div>


	테스트


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
	 var maxAppend = 0;
 $('.list').click((e)=>{
	 if (maxAppend >= ${idsize}) return;
 var nodetext=$('.list').val();
 alert()
 alert(nodetext);
 var closeButton=$('<input>').attr({'type':'button',name:nodetext,'onclick':'deleteNode();'});
 var testNode = $('<span>').text(nodetext).append(closeButton).attr('class','me' );
 $('.input').append(testNode);
 maxAppend ++;
	
});
 ///
 alert($('#2').val());
 ///
function deleteNode() {
   $('.me').remove();
   maxAppend -- ;
 }
	

</script>
	/////////////



	////////////////
</body>
</html>