<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="ko">
<head>
<script type="text/javascript">
	var s_status='${sessionScope.status}';
	var s_category='${sessionScope.scategory}';
	var check_category='관리자';
	if( s_status==''){
		window.alert('로그인이 필요합니다');
		location.href='login.do';
	}else if(s_status=='블랙'){
		window.alert('차단된 회원입니다');
		location.href='index.do';
	}else if(s_category!=check_category){
		window.alert(check_category+'만 이용 가능한 페이지입니다');
		location.href='index.do';
	}
</script>
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
			<div class="row">
			<div class="col-3 fs-1 fw-blod">
			${name}		
			</div>
			<c:if test="${status ne '활성'}">
			<button type="button" class="btn btn-primary col-2" id="delbutton">삭제하기</button>
			</c:if>
			<c:if test="${status eq '활성'}">
			<button type="button" class="btn btn-primary col-2" id="addbutton">블랙리스트 추가</button>
			</c:if>
			</div>
			<div id="my-div">
			</div>
			<input type="hidden" id="cp" value="1">
			<div id="page"></div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
<script>
$("body").onload=ajaxgo();

$('#delbutton').click(function(){
	window.open('manBlackListDelForm.do?sort=2&idx='+${idx},'delpopup','width=400,height=400');	
});

function deletefun(num){
	window.open('manBlackListDelForm.do?sort=1&idx='+num+'&member_idx='+${idx},'deletpopup','width=400;height=400;');
}
$('#addbutton').click(function(){
	window.open('manBlackListAdd.do?idx='+${idx},'addpopup','width=400,height=400');
});
$(document).on('click','#page button',function(){
	$('#cp').attr({value:$(this).val()});
	ajaxgo();
});

function ajaxgo(){
	$('#my-div').empty();

	 $.ajax({
	      url:'manBlackListContent.do',
	      type:'post',
	      data:{"idx":"${idx}","cp":$('#cp').val()},//전송데이터
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

				   function formatDate(date) {
				     var year = date.getFullYear();
				     var month = (date.getMonth() + 1).toString().padStart(2, '0');
				     var day = date.getDate().toString().padStart(2, '0');
				     return year + '-' + month + '-' + day;
				   }
					  $('#page').children().remove();
						$('#page').append(data.page);

			
			  
	   })}}).fail(()=>{
	      //실패시 실행
	   }).always(()=>{
	      //성공여부 무관 실행
	   })};
</script>
</body>
</html>