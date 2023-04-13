<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
			<h1>인재 정보</h1>
				<div class="row">
					<div class="col-5 offset-7">
					<input type="text">
					</div>
				</div>
				<div id="my-div"></div>
				<input type="hidden" id="cp" value="1">
				<div id="page"></div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
<script>
function getList(){
	$('#my-div').empty();
	$.ajax({
	      url:'manBlackListGet.do',
	      type:'post',
	      data:{"category":$('.btn-check:checked').val(),"cp":$('#cp').val()},//전송데이터
	      dataType:'json'
	      //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
	   }).done((data)=>{
	      //성공시 실행
		   if (data.lists.length == 0) {
			   $('<div>').text('글이 없습니다').appendTo($('#my-div'));
			 } else {
			   data.lists.forEach(function(dto) {
				   var card = $('<div>').addClass('card').appendTo($('#my-div'));
				   var headerList = $('<ul>').addClass('nav nav-pills nav-fill card-header-pills');
				   $('<li>').addClass('nav-item').appendTo(headerList).append(
				     $('<p>').addClass('text-start').text(dto.subject)
				   );
				   $('<li>').addClass('nav-item').appendTo(headerList).append(
				     $('<p>').addClass('text-end').text(dto.singo_date ? formatDate(new Date(dto.singo_date)) : 'N/A')
				   );
				   $('<div>').addClass('card-header').append(headerList).appendTo(card);
				   var body = $('<div>').addClass('card-body').appendTo(card);
				   $('<h5>').addClass('card-title').text(dto.singo_content).appendTo(body);
				   var row = $('<div>').addClass('row').appendTo(body);
				   $('<div>').addClass('col-5').appendTo(row).append(
				     $('<p>').addClass('card-text').text(dto.name)
				   );
				   $('<div>').addClass('offset-3 col-4').appendTo(row).append(
				     $('<a>').addClass('btn btn-primary').attr('href', '#').text('삭제').on('click', function() {deletefun(dto.idx);})
				   );
			  
			  $('#my-div').append($table);
			  $('#page').children().remove();
				$('#page').append(data.page);
			  
	   }).fail(()=>{
	      //실패시 실행
	   }).always(()=>{
	      //성공여부 무관 실행
		   
	   })
}
</script>
</body>
</html>