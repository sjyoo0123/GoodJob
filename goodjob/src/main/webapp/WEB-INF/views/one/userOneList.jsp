<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Good Job</title>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<div class="row mt-5 pt-1">
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td scope="row">작성된 문의가 없습니다</td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td scope="row">${dto.idx }</td>
									<td><a href="userOneContent.do?idx=${dto.idx}">${dto.subject}</a></td>
									<td>${dto.writedate}</td>
									<c:if test="${dto.check==0 }">
										<td>대기</td>
									</c:if>
									<c:if test="${dto.check==1 }">
										<td>완료</td>
									</c:if>
								</tr>

							</c:forEach>
						</tbody>
					</table>
					<form id="category">
						<input type="hidden" value="1" name="cp" id="cp"> <input
							type="hidden" value="true" name="bAjax">
					</form>
				</div>
				<div id="page">${page}</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script>

	$(document).on('click','#page button',function(){
		$('#cp').attr({value:$(this).val()});
		page();
	});
	
	function page(){
		para=$('#category').serialize();
		$.ajax({
			url:'userOneList.do',
			data:para
		}).done((data)=>{
			/////////////////////////////////
var tbody = $('tbody');
			tbody.children().remove();
var list=data.list;
if (list==0) {
  var row = $('<tr>').append($('<td>').attr('colspan', 4).text('작성된 문의가 없습니다'));
  tbody.append(row);
} else {
  list.forEach(function(dto) {
    var row = $('<tr>');
    $('<td>').text(dto.idx).appendTo(row);
    $('<td>').text(dto.subject).appendTo(row);
    
    var date = new Date(dto.writedate);
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    var formattedDate = year + '-' + month + '-' + day;
    
    $('<td>').text(formattedDate).appendTo(row);
    if(dto.check==1){
    $('<td>').text('완료').appendTo(row);
    }else{
    $('<td>').text('대기').appendTo(row);
    }
    
    tbody.append(row);
  });
}
			////////////////////////////////
			$('#page').children().remove();
			$('#page').append(data.page);
		})
	}
	</script>
</body>
</html>