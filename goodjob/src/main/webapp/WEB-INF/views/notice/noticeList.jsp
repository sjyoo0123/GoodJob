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
<style type="text/css">
div {
	/*border: 1px black solid;*/
	
}

.btn.col-1 {
	border: 1px black solid;
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<div class="row">
					<div class="col-12 fs-1 mt-5 pt-5">
						<div class="col-4 offset-4 text-center">채용정보</div>
					</div>
					<div class="col-8 offset-2">
						<div class="nav text-center">
							<div class="col-2 offset-2">
								<button type="button" class="btn">직종별</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn">지역별</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn">요일별</button>
							</div>
							<div class="col-12 query">
								<!--업종별 -->
								<div class="d-none occupation">대분류 중분류 셀박 소분류 체크박스</div>

								<!--지역별 -->
								<div class="addr input-group">
									<select class="mAddr" size="3">
										<option selected>시 도</option>
									</select> <select class="sAddr" size="3">
										<option selected>시 구 군</option>
									</select>
									<div class="lAddr"></div>
								</div>
								<!--기간별 -->
								<div class="weekday">
									<!-- 요일 -->
									<label>월<input type="checkbox" value="월"
										name="listworkday"></label><label>화<input
										type="checkbox" value="화" name="listworkday"></label><label>수<input
										type="checkbox" value="수" name="listworkday"></label><label>목<input
										type="checkbox" value="목" name="listworkday"></label><label>금<input
										type="checkbox" value="금" name="listworkday"></label><label>토<input
										type="checkbox" value="토" name="listworkday"></label><label>일<input
										type="checkbox" value="일" name="listworkday"></label><label>무관</label><input
										type="checkbox" value="무관" name="listworkday">
									<!-- 근무시간 -->

								</div>
								<button id="submit">조회</button>
							</div>
							<form id="category">
								<input type="hidden" id="cp" name="cp" value="1"> 선택한 쿼리 들어감
								<input type="hidden" name="bAjax" value="true">
							</form>
						</div>
					</div>
					<div class="content">
						<c:if test="${empty list}">
						조회된 공고가 없습니다
						</c:if>
						<c:forEach var="dto" items="${list }"></c:forEach>
					</div>
				</div>
				<div class="page">
					<div class="row justify-content-evenly">
						<button type="button" class="btn col-1">
							<i class="bi bi-backspace-fill"></i>
						</button>
						<button type="button" class="btn col-1">1</button>
						<button type="button" class="btn col-1">2</button>
						<button type="button" class="btn col-1">3</button>
						<button type="button" class="btn col-1">4</button>
						<button type="button" class="btn col-1">5</button>
						<button type="button" class="btn col-1 next" value="next">
							<i class="bi bi-backspace-reverse-fill"></i>
						</button>
					</div>
				</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script>
	$.ajax({
		url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000',
	      type:'get',
	      contentType: "application/json"
	}).done((data)=>{
		for(var i=0;i<data.regcodes.length;i++){
			var op= $('<option>').attr({id:data.regcodes[i].code.substring(0,2)}).text(data.regcodes[i].name);
			$('.mAddr').append(op);
		}
	});
	
	$('.mAddr').on('change',()=>{
		$('.sAddr').empty();
		$('.lAddr').empty();
		var pattern=$('.mAddr option:selected').attr('id');
		$.ajax({
			url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern='+pattern+'*00000&is_ignore_zero=true',
			type:'get',
		      contentType:"application/json"
		}).done((data)=>{
			for(var i=0; i<data.regcodes.length; i++){
				  if (i > 0 && data.regcodes[i].code.substring(0, 5) - 1 == data.regcodes[i-1].code.substring(0, 5)) {
					  if(data.regcodes[i-1].code.substring(0, 5).substr(-1) == '0'){
				   		 $('#' + data.regcodes[i-1].code.substring(0, 5)).remove();
					  }
				  }
				  var name = data.regcodes[i].name;
				  var sname = name.split(' ');
				  if(sname.length==3){
					  var op = $('<option>').attr({id: data.regcodes[i].code.substring(0, 5)}).text(sname[1]+' '+sname[2]);
					  $('.sAddr').append(op);
				  }else{
					  
				  var op = $('<option>').attr({id: data.regcodes[i].code.substring(0, 5)}).text(sname.slice(1));
				  $('.sAddr').append(op);
				  }
				
				}
			})
	});
	 $('.sAddr').on('change',()=>{
		 $('.lAddr').empty();
		 var pattern=$('.sAddr option:selected').attr('id');
		 $.ajax({
			 url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern='+pattern+'*00',
			type:'get',
			content:'application/json'
		 }).done((data)=>{
			 for(var i=0;i<data.regcodes.length;i++){
				 if(i==0){
					 var name=data.regcodes[i].name;
					 var sname=name.split(' ');
						 var op=  $('<label>').text(sname.slice(sname.length-1)+'전체').append($('<input>').attr({id:data.regcodes[i].code,type:'checkbox',value:sname.slice(sname.length-1),name:'local2'})); 
					 $('.lAddr').append(op);
				 }else{
				 var name=data.regcodes[i].name;
				 var sname=name.split(' ');
					 var op=  $('<label>').text(sname.slice(sname.length-1)).append($('<input>').attr({id:data.regcodes[i].code,type:'checkbox',value:sname.slice(sname.length-1),name:'local3'})); 
				 $('.lAddr').append(op);
				 }
			 }
		 })
	 })
	
	$('button:contains("업종별")').on('click',()=>{
 	 $('.query > div').each(function() {
    if (!$(this).hasClass('d-none')) {
      $(this).addClass('d-none');
    }
  });
  $('.occupation').removeClass('d-none');
});
	$('button:contains("지역별")').on('click',()=>{
		 $('.query >div').each(function() {
			    if (!$(this).hasClass('d-none')) {
			      $(this).addClass('d-none');
			    }
			  });
			  $('.addr').removeClass('d-none');
	});
	$('button:contains("기간별")').on('click',()=>{
		 $('.query >div').each(function() {
			    if (!$(this).hasClass('d-none')) {
			      $(this).addClass('d-none');
			    }
			  });
			  $('.weekday').removeClass('d-none');
	});

	
	$(document).on('change', '.lAddr label input,.weekday input', function() {
		  var labelText = $(this).parent().text().trim();
		  var $checkbox = $(this);
		  if ($checkbox.is(':checked')) {
		    var div = $('<div>');
		    var btn = $('<button>').text('삭제');
		    div.append($('<span>').text(labelText));
		    div.append(btn);
		   var input=$('<input>').attr({type:'hidden',value:$checkbox.val(),name:$checkbox.attr('name')});
		   div.append(input)
		    $('#category').append(div);
		    btn.on('click', function() {
		      div.remove();
		      $checkbox.prop('checked', false);
		    })
		  } else {
		    $('div span:contains(' + labelText + ')').parent().remove();
		  }
		});
//pageing
var para=null;
var purl='noticeList.do';
	$('#submit').click(function() {
		$('#cp').attr({value:'1'});
		para=$('#category').serialize();
		page(purl);
	});
	
	$(document).on('click','.page button',function(){
		$('#cp').attr({value:$(this).val()});
		page(purl);
	});
	
	function page(purl){
		$.ajax({
			url:purl,
			data:para
		}).done((data)=>{
			$('.page').text(data.page);
			alert(data);
		})
	}
	
	</script>
	<script>

	</script>
</body>
</html>