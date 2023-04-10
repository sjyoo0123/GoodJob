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
				<div class="row">
					<div class="col-8 offset-2">
						<h2 class="text-center">공지사항</h2>
						<form id="gongji">
							<input type="hidden" name="cp" value="1" id="cp"> <input
								type="hidden" name="bAjax" value="true"> <input
								type="text" name="subject">
							<button type="button" id="submit" class="search">검색</button>
						</form>
						<table class="table table-border">
							<thead>
								<tr>
									<th scope="col" class="text-center">번호</th>
									<th scope="col" class="text-center">제목</th>
									<th scope="col" class="text-end px-4">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
									<tr>
										<td colspan="3">등록된 게시글이 없습니다</td>
									</tr>
								</c:if>
								<c:forEach var="dto" items="${list}">
									<tr>
										<td scope="row" class="text-center">${dto.idx}</td>
										<td class="text-center"><a href="userGongJiContent.do?idx=${dto.idx}">${dto.subject}</a></td>
										<td class="text-end">${dto.writedate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="page">${page}</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script>
	$("form").on("keydown", function(e) {
	    if (e.keyCode == 13) {
	        stopSubmit(e);
	    }
	});
	 function stopSubmit(e) {
	        e.preventDefault();
	    }
	
		$(document).on('click','#page button',function(){
			$('#cp').attr({value:$(this).val()});
			page();
		});
	 
	 $('#submit').on('click',()=>{
		 $('#cp').attr({value:'1'});
		 page();
	 }); 
		 function page(){
			$.ajax({
				url:'userGongJiList.do',
				data:$('#gongji').serialize()
			}).done((data)=>{
				$('tbody').children().remove();
				/////////////////////////////////
				var tbody=$('tbody');
				if(data.list.length==0){
					tbody.append( $('<td>', {colspan: 3}).text('등록된 게시글이 없습니다') );
				}else{
					 $.each(data.list, function(i, dto) {
						 var date = new Date(dto.writedate);
						  var year = date.getFullYear();
						  var month = ('0' + (date.getMonth() + 1)).slice(-2);
						  var day = ('0' + date.getDate()).slice(-2);
						  var formattedDate = year + '-' + month + '-' + day;
						  
						    var tr = $('<tr>').append(
						      $('<td>', {class: 'text-center', scope: 'row'}).text(dto.idx),
						      $('<td>', {class: 'text-center'}).append($('<a>', {href: '#'}).text(dto.subject)
						      ),
						      $('<td>', {class: 'text-end'}).text(formattedDate)
						    );
						    tbody.append(tr);
						  });
				////////////////////////////////
				$('#page').children().remove();
				$('#page').append(data.page);
				}
			})}
		
	</script>
</body>
</html>