<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body onload="getList()">
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<h1>인재 정보</h1>
				<div class="btn-group" role="group"
					aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="btnradio" id="all" value="0" autocomplete="off" checked="checked"> 
					<label class="btn btn-outline-primary" for="all">전체</label> 
					<input type="radio" class="btn-check" name="btnradio" id="job" value="1" autocomplete="off"> 
					<label class="btn btn-outline-primary" for="job">직종별</label> 
					<input type="radio" class="btn-check" name="btnradio" id="local" value="2" autocomplete="off"> 
					<label class="btn btn-outline-primary" for="local">지역별</label>
				</div>
				<div id="card-div">
					<div class="card d-none" id="jobcard">
						<div class="card-body">
							<select name="job" class="keyword1" id="fjob"></select> 
							<div id="sjob"></div>
							<input type="button" value="직종 검색 " onclick="getList()">
						</div>
					</div>
					<div class="card d-none" id="localcard">
						<div class="card-body">
							<select name="locals" class="keyword2" id="keyword"></select> <input
								type="button" value="지역 검색" onclick="getList()">
						</div>
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
$.ajax({
	url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000',
      type:'get',
      contentType: "application/json"
}).done((data)=>{
	for(var i=0;i<data.regcodes.length;i++){
		var op= $('<option>').attr({id:data.regcodes[i].code.substring(0,2)}).attr({value:data.regcodes[i].name}).text(data.regcodes[i].name);
		$('#keyword ').append(op);
	}
});
$(document).on('click','#page button',function(){
	$('#cp').attr({value:$(this).val()});
	getList();
});

$('#all').change(function(){
	$('#card-div >div').each(function() {
	    if (!$(this).hasClass('d-none')) {
	      $(this).addClass('d-none');
	    }
	  });
	 getList()
}) 
$('#job').change(function(){
	$('#card-div >div').each(function() {
	    if (!$(this).hasClass('d-none')) {
	      $(this).addClass('d-none');
	    }
	  });
	  $('#jobcard').removeClass('d-none');
	 
}) 
$('#local').change(function(){
	$('#card-div >div').each(function() {
	    if (!$(this).hasClass('d-none')) {
	      $(this).addClass('d-none');
	    }
	  });
	  $('#localcard').removeClass('d-none');
	 
})
function getList(){
	$('#my-div').empty();
	$.ajax({
	      url:'injaeListGet.do',
	      type:'post',
	      data:{"sort":$('.btn-check:checked').val(),"cp":$('#cp').val(),"keyword":$('.btn-check:checked').val()>1?$('.keyword2').val():$('input[name=job]:checked').val()},//전송데이터
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
				     $('<p>').addClass('text-start').append(
				       $('<a>').attr('href', 'resumeContent.do?idx=' + dto.idx).text(dto.name)
				     )
				   );
				   $('<li>').addClass('nav-item').appendTo(headerList).append(
				     $('<p>').addClass('text-end').text(dto.age + '세')
				   );
				   $('<div>').addClass('card-header').append(headerList).appendTo(card);
				   var body = $('<div>').addClass('card-body').appendTo(card);
				   $('<h5>').addClass('card-title').text(dto.job).appendTo(body);
				   var row = $('<div>').addClass('row').appendTo(body);
				   $('<div>').addClass('col-5').appendTo(row).append(
				     $('<p>').addClass('card-text').text(dto.gender)
				   );


			  
			   })
			 }
			  $('#page').children().remove();
				$('#page').append(data.page);
	   }).fail(()=>{
	      //실패시 실행
	   }).always(()=>{
	      //성공여부 무관 실행
		   
	   })
}
$.ajax({
    url: "job.do",
    success: function(data) {
     for(var i = 0; i < data.length; i++) {
  	   var op=$('<option>').attr({value:data[i],id:'job'+i}).text(data[i]);
              $("#fjob ").append(op);
          }
          $(document).on('change','#fjob',function(e) {
          	$('#sjob').children().remove();
              var job1val = $(this).val();
              $.ajax({
                  url: "job.do",
                  method: "POST",
                  data: {job1: job1val},
                  success: function(data) {
                      for (var i = 0; i < data.length; i++) {
                      	if ($('#category input[value="' + data[i] + '"]').length > 0) {
                      		  
                      $("#sjob").append("<input type='radio' value='" + data[i] + "' name='job' id='job1_"+i+"' class='btn-check "+$(this).attr('id')+"' autocomplete='off'><label class='btn btn-outline-secondary' for='job1_"+i+"'>"+data[i]+"</label>");
                      		}else{
                      			
                      $("#sjob").append("<input type='radio' value='" + data[i] + "' name='job' id='job1_"+i+"' class='btn-check "+$(this).attr('id')+"' autocomplete='off'><label class='btn btn-outline-secondary' for='job1_"+i+"'>"+data[i]+"</label>");
                      		}
                      
                      }
                  }
              });
          });
      }
  });
</script>
</body>
</html>