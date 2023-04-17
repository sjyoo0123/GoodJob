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

<title>Good Job</title>
<style type="text/css">
div.new {
	border: 1px solid #efefef;
}

.lAddr, .sjob, .weekday {
	overflow: auto !important;
	max-height: 100px !important;
	min-height: 100px !important;
}

div .col-8.offset-2.mh-100 {
	background-color: #efefef;
}

div .col-8.offset-2.mh-100>*>*>div {
	background-color: white;
}
table a{
color: black;
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<c:set var="si" value="시급"></c:set>
		<section>
			<article>
				<div class="row">
					<div class="col-12 fs-1 mt-5 pt-5">
						<div class="col-4 offset-4 text-center">채용정보</div>
					</div>
					<div class="col-8 offset-2 mh-100">
						<div class="nav text-center">
							<div class="col-2 offset-3">
								<button type="button" class="btn btn-outline-secondary navi">직종별</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn btn-outline-secondary navi">지역별</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn btn-outline-secondary navi">요일별</button>
							</div>
							<div class="col-12 query">
								<!--업종별 -->
								<div class="d-none occupation input-group p-3">
									<select class=" fjob form-select col-4" size="3"
										aria-label="size 3 select example"></select>
									<div class="sjob col-8"></div>
								</div>

								<!--지역별 -->
								<div class="d-none addr input-group p-3">
									<select class="mAddr form-select col-2" size="4">
										<option selected disabled="disabled">시 도</option>
									</select> <select class="sAddr form-select col-2" size="4">
										<option selected disabled>시 구 군</option>
									</select>
									<div class="lAddr col-8"></div>
								</div>
								<!--기간별 -->
								<div class="d-none weekday justify-content-center p-3">
									<!-- 요일 -->
									<input type="checkbox" value="월" name="listworkday"
										class="btn-check" id="btn-check-outlined1" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined1">월</label>
									<input type="checkbox" value="화" name="listworkday"
										class="btn-check" id="btn-check-outlined2" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined2">화</label>
									<input type="checkbox" value="수" name="listworkday"
										class="btn-check" id="btn-check-outlined3" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined3">수</label>
									<input type="checkbox" value="목" name="listworkday"
										class="btn-check" id="btn-check-outlined4" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined4">목</label>
									<input type="checkbox" value="금" name="listworkday"
										class="btn-check" id="btn-check-outlined5" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined5">금</label>
									<input type="checkbox" value="토" name="listworkday"
										class="btn-check" id="btn-check-outlined6" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined6">토</label>
									<input type="checkbox" value="일" name="listworkday"
										class="btn-check" id="btn-check-outlined7" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined7">일</label>
									<input type="checkbox" value="무관" name="listworkday"
										class="btn-check" id="btn-check-outlined8" autocomplete="off"><label
										class="btn btn-outline-secondary" for="btn-check-outlined8">무관</label>
								</div>
							</div>
							<div class="text-end col-12">
								<button id="submit" class="btn btn-light text-end">조회</button>
							</div>
							<form id="category" class="col-12 d-flex flex-wrap">
								<input type="hidden" id="cp" name="cp" value="1"> <input
									type="hidden" name="bAjax" value="true">
							</form>
						</div>
					</div>
					<div class="content">
						<c:if test="${!empty list}">
							<table class="table table-striped table-hover">

								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">직종</th>
										<th scope="col">지역</th>
										<th scope="col">급여</th>
										<th scope="col">회사명</th>
										<th scope="col">마감일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list }">
										<tr>
											<td scope="row">${dto.idx}</td>
											
											<td><a href="noticeContent.do?idx=${dto.idx}">${dto.subject}</a></td>
											
											<td>${dto.job}</td>
											<td>${dto.local2}${dto.local3}</td>
											<td>${dto.pay_category}<c:if
													test="${dto.pay_category eq si}">
							${dto.pay_hour}
							</c:if> <c:if test="${!(dto.pay_category eq si)}">
							${dto.pay_month}
							</c:if></td>
											<td>${dto.com_name}</td>
											<td>${dto.writedate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<c:if test="${empty list }">
						조회된 공고가 없습니다
						</c:if>


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
					 var label=  $('<label>').attr({for:data.regcodes[i].code,class:'btn btn-outline-secondary'}).text(sname.slice(sname.length-1)+'전체')
					 var input=$('<input>').attr({id:data.regcodes[i].code,type:'checkbox',value:sname.slice(sname.length-1),name:'local2',class:'btn-check',autocomplete:'off'}); 
					 
				 }else{
				 var name=data.regcodes[i].name;
				 var sname=name.split(' ');
					 var label=  $('<label>').attr({for:data.regcodes[i].code,class:'btn btn-outline-secondary'}).text(sname.slice(sname.length-1));
					var input=$('<input>').attr({id:data.regcodes[i].code,type:'checkbox',value:sname.slice(sname.length-1),name:'local3',class:'btn-check',autocomplete:'off'}); 
					
					 }
				 if ($('#category input[value="' + sname.slice(sname.length-1) + '"]').length > 0){
					 input.prop('checked', true);
				 }
				 $('.lAddr').append(input,label);
			 }
		 })
	 })
	
	$('button:contains("직종별")').on('click',function(){
		$('.navi').each(function(){
			if($(this).hasClass('active')){
			$(this).removeClass('active');	
			}
		});
		$(this).addClass('active');
 	 $('.query > div').each(function() {
    if (!$(this).hasClass('d-none')) {
      $(this).addClass('d-none');
    }
  });
  $('.occupation').removeClass('d-none');
});
	$('button:contains("지역별")').on('click',function(){
		$('.navi').each(function(){
			if($(this).hasClass('active')){
			$(this).removeClass('active');	
			}
		});
		$(this).addClass('active');
		 $('.query >div').each(function() {
			    if (!$(this).hasClass('d-none')) {
			      $(this).addClass('d-none');
			    }
			  });
			  $('.addr').removeClass('d-none');
	});
	$('button:contains("요일별")').on('click',function(){
		$('.navi').each(function(){
			if($(this).hasClass('active')){
			$(this).removeClass('active');	
			}
		});
		$(this).addClass('active');
		 $('.query >div').each(function() {
			    if (!$(this).hasClass('d-none')) {
			      $(this).addClass('d-none');
			    }
			  });
			  $('.weekday').removeClass('d-none');
	});
	$(document).on('change', '.lAddr input,.weekday input,.sjob input', function() {
		  var labelText =  $('label[for="'+this.id+'"]').text();
		  var $checkbox = $(this);
		  if ($checkbox.is(':checked')) {
		    var div = $('<div>').attr({class:'col-3 new'});
		    var icon= $('<i>').addClass('btn-light bi bi-x-circle');
		    var btn =$('<a>').attr('href','#;').append(icon);
		    div.append($('<span>').text(labelText));
		    div.append(btn);
		   var input=$('<input>').attr({type:'hidden',value:$checkbox.val(),name:$checkbox.attr('name')});
		   div.append(input);
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
//형식
//<div class="row">
//<form id="category">
//<input type="hidden" name="cp" value="1">
//<input type="hidden" name="bAjax" value="true"> //ajax인지 판별할려면필요 컨트롤러에서 defaultValue = "false"
//<button type="button" id="submit">조회</button>
//</form>
//<div class="content">
//</div>
//</div>
//<div id="page">
//</div>
var para=$('#category').serialize();

	$('#submit').click(function() {
		$('#cp').attr({value:'1'});
		page();
	});
	$(document).on('click','#page button',function(){
		$('#cp').attr({value:$(this).val()});
		page();
	});
	
	function page(){
		para=$('#category').serialize();
		$.ajax({
			url:'noticeList.do',
			data:para
		}).done((data)=>{
			/////////////////////////////////
				$('table tbody').children().remove();
			$.each(data.list, function(index, dto) {
  var tr = $('<tr>');
  tr.append('<td scope="row">' + dto.idx + '</td>');
  tr.append('<td><a href=noticeContent.do?idx='+dto.idx+'>' + dto.subject + '</a></td>');
  tr.append('<td>' + dto.job + '</td>');
  tr.append('<td>' + dto.local2 + dto.local3 + '</td>');
  tr.append('<td>' + dto.pay_category +' '+ (dto.pay_category === '시급' ? dto.pay_hour : dto.pay_month) + '</td>');
  tr.append('<td>' + dto.com_name + '</td>');
  var date = new Date(dto.writedate);
  var year = date.getFullYear();
  var month = ('0' + (date.getMonth() + 1)).slice(-2);
  var day = ('0' + date.getDate()).slice(-2);
  var formattedDate = year + '-' + month + '-' + day;
  
  tr.append('<td>' + formattedDate + '</td>');
  $('table tbody').append(tr);
});
			////////////////////////////////
			$('#page').children().remove();
			$('#page').append(data.page);
		})
	}
	
	$.ajax({
	      url: "job.do",
	      success: function(data) {
	       for(var i = 0; i < data.length; i++) {
	    	   var op=$('<option>').attr({value:data[i],id:'job'+i}).text(data[i]);
	                $(".fjob ").append(op);
	            }
	            $(document).on('change','.fjob',function(e) {
	            	$('.sjob').children().remove();
	                var job1val = $(this).val();
	                $.ajax({
	                    url: "job.do",
	                    method: "POST",
	                    data: {job1: job1val},
	                    success: function(data) {
	                        for (var i = 0; i < data.length; i++) {
	                        	if ($('#category input[value="' + data[i] + '"]').length > 0) {
	                        		  
	                        $(".sjob").append("<input type='checkbox' checked value='" + data[i] + "' name='job' id='job1_"+i+"' class='btn-check "+$(this).attr('id')+"' autocomplete='off'><label class='btn btn-outline-secondary' for='job1_"+i+"'>"+data[i]+"</label>");
	                        		}else{
	                        			
	                        $(".sjob").append("<input type='checkbox' value='" + data[i] + "' name='job' id='job1_"+i+"' class='btn-check "+$(this).attr('id')+"' autocomplete='off'><label class='btn btn-outline-secondary' for='job1_"+i+"'>"+data[i]+"</label>");
	                        		}
	                        
	                        }
	                    }
	                });
	            });
	        }
	    });
	${query}
	</script>
</body>
</html>