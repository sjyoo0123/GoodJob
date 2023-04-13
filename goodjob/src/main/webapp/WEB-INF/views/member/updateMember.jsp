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
<style>
select[disabled] {
  pointer-events: none;
}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
<c:if test="${logCategory eq nor }">
<c:set var="url" value="normalUpdate.do"></c:set>
</c:if>
<c:if test="${logCategory eq com }">
<c:set var="url" value="comUpdate.do"></c:set>
</c:if>
		<section>
			<article>
				<form action="${url}" method="post">
				<div class="row">
					<h2 class="col-12 text-center">개인정보수정</h2>
					<input type="hidden" name="member_idx" value="${dto.member_idx }">
					<div class="col-6 offset-3 mb-5 mt-5">
  					<label for="id" class="form-label">아이디</label>
  					<input type="text" class="form-control" readonly="readonly" value="${dto.id}" id="id" placeholder="id">
					</div>
					
					<div class="col-6 offset-3 mb-5">
					<label for="pwd" class="form-label">비밀번호</label>
					<div class="input-group">
					<input type="password" readonly="readonly" id="pwd" class="form-control" placeholder="pwd" value="${dto.pwd}" name="pwd">
					<button type="button" class="input btn btn-light" value="pwd">변경</button>
					</div>
					</div>
					
					<div class="col-6 offset-3 mb-5">
					<label for="name" class="form-label"><c:if test="${logCategory eq nor}">이름</c:if><c:if test="${logCategory eq com}">기업명</c:if></label>
					<div class="input-group">
					<input type="text" value="${dto.name}" readonly="readonly" id="name" class="form-control" placeholder="name" name="name">
					<button type="button" class="input btn btn-light" value="name">변경</button>
					</div>
					</div>
					
					<div class="col-6 offset-3 mb-5">
					<label for="email" class="form-label">이메일</label>
  					<input type="text" class="form-control" readonly="readonly" value="${dto.email}" id="email" placeholder="email">
					</div>
					
					<div class="col-6 offset-3 mb-5">
					<label for="tel" class="form-label">전화번호</label>
					<div class="input-group">
					<input type="text" readonly="readonly" id="tel" class="form-control" placeholder="tel" value="${dto.tel }" name="tel">
					<button type="button" class="input btn btn-light" value="tel">변경</button>
					</div>
					</div>
					
					<c:if test="${logCategory eq nor}">
					<div class="col-6 offset-3 mb-5">
					<label for="gender" class="select-label">성별</label>
					<div class="input-group">
					<select class="form-select" id="gender" disabled="disabled" name="gender">
						<option disabled="disabled" value="성별">성별</option>
						<option value="남성">남성</option>
						<option value="여성">여성</option>
					</select>
					<input type="hidden" value="${dto.gender}" name="gender" id="hgender">
					<button type="button" class="btn btn-light" value="gender">변경</button>
					</div>
					
					</div>
					<div class="col-6 offset-3 mb-5">
					<label for="birth" class="form-label">생년월일</label>
					<div class="input-group">
					<input type="date" id="birth" class="form-control"  readonly="readonly" name="birth" value="${dto.birth}">
					<button type="button" class="btn btn-light input" value="birth">변경</button>
					</div>
					</div>
					<input type="hidden" name="nor_idx" value="${dto.idx}">
					</c:if>
					
					<div class="col-6 offset-3 mb-5">
					<div class="input-group">
					<select class="form-select addr" name="addr" id="si">
					<option disabled="disabled" value="시 도">시 도</option>
					</select>
					<select class="form-select addr" name="addr" id="gu">
					<option disabled="disabled" value="시 구 군">시 구 군</option>
					</select>
					<select class="form-select addr" name="addr" id="dong">
					<option disabled="disabled"  value="동 읍 면">동 읍 면</option>
					</select>
					<input type="hidden" name="addr" value="${dto.addr}" id="haddr">
					<button type="button" class="btn btn-light" value="addr">변경</button>
					</div>
					</div>
					
					<c:if test="${logCategory eq com}">
					<div class="col-6 offset-3 mb-5">
					<label for="detail_addr" class="form-label">상세주소</label>
					<div class="input-group">
						<input type="text" name="detail_addr" id="detail_addr" readonly="readonly" class="form-control" value="${dto.detail_addr}">
					<button type="button" class="input btn btn-light" value="detail_addr">변경</button>
					</div>
					</div>
					
					<div class="col-6 offset-3 mb-5">
					<label for="com_name" class="form-label">대표자명</label>
					<div class="input-group">
						<input type="text" name="com_name" id="com_name" readonly="readonly" class="form-control" value="${dto.com_name}">
					<button type="button" class="input btn btn-light" value="com_name">변경</button>
					</div>
					</div>
						<div class="col-6 offset-3 mb-5">
						<label for="com_num" class="form-label">사업자번호</label>
						<div class="input-group">
						<input type="text" readonly="readonly" id="com_num" name="com_num" class="form-control" value="${dto.com_num }">
					<button type="button"  class="input btn btn-light" value="com_num">변경</button>
						</div>
						</div>
						<div class="col-6 offset-3 mb-5">
						<label for="com_birth" class="form-label">설립일</label>
						<input type="date" id="com_birth" value="${dto.com_birth}" readonly="readonly" class="form-control">
						</div>
					</c:if><div class="col-6 offset-3">
					<button type="submit" class="btn btn-outline-primary">등록</button>
					</div>
					</div>
				</form>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
		<script>
		<c:if test="${logCategory eq nor }">
		var selectedGender = "${dto.gender}";
		$("#gender option[value='" + selectedGender + "']").prop("selected", true);
		$('.row button[value="gender"]').on('click', function(){
		    var target = $(this).val();
		    var $targetSelect = $('#' + target);
		    if ($(this).text() === '변경'){
		        $(this).text('취소');
		        $targetSelect.removeAttr('disabled');
		        $targetSelect.find('option[value="성별"]').prop("selected", true);
		        $('#hgender').removeAttr('name');
		    } else {
		        $(this).text('변경');
		        $targetSelect.attr('disabled', true);
		        $targetSelect.val($targetSelect.data('initial-value'));
		        $('#hgender').attr('name', 'gender');
		    }
		});
		</c:if>
		var addr="${dto.addr}";
		var addrArr=addr.split(',');
		
		$('.row input,.row select').each(function(){
			  $(this).data('initial-value', $(this).val());
			});
		
		
		$('#si').on('change',()=>{
			$('#gu').empty();
			let guOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('시 구 군');
			$('#gu').append(guOption);
			$('#dong').empty();
			let dongOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('동 읍 면');
			$('#dong').append(dongOption);
			var pattern=$('#si option:selected').attr('id');
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
						  $('#gu').append(op);
					  }else{
						  
					  var op = $('<option>').attr({id: data.regcodes[i].code.substring(0, 5)}).text(sname.slice(1));
					  $('#gu').append(op);
					  }
					}
				})
		});
		$('#gu').on('change',function(){
			$('#dong').empty();
			let dongOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('동 읍 면');
			$('#dong').append(dongOption);
			var data= $('#gu  option:selected').attr('id');
			$.ajax({
				url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern='+data+'*00&is_ignore_zero=true',
				type:'get',
				contentType: "application/json"
			}).done((data)=>{
				for(var i=0;i<data.regcodes.length;i++){
					 var name=data.regcodes[i].name;
					 var sname=name.split(' ');
						 var op=$('<option>').attr({id:data.regcodes[i].code}).text(sname.slice(sname.length-1)); 
						 $('#dong').append(op);
				}
			});
		});
		function replay(){
			$.ajax({
			    url: 'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000',
			    type: 'get',
			    contentType: "application/json"
			  }).done((data) => {
			    for (var i = 0; i < data.regcodes.length; i++) {
			      var op = $('<option>').attr({ id: data.regcodes[i].code.substring(0, 2) }).text(data.regcodes[i].name);
			      $('#si').append(op);
			    }
			    $('#si option:contains(' + addrArr[0] + ')').prop('selected', true);

			    var pattern = $('#si option:selected').attr('id'); // pattern 변수 정의

			    $.ajax({
			      url: 'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=' + pattern + '*00000&is_ignore_zero=true',
			      type: 'get',
			      contentType: "application/json"
			    }).done((data) => {
			      for (var i = 0; i < data.regcodes.length; i++) {
			        if (i > 0 && data.regcodes[i].code.substring(0, 5) - 1 == data.regcodes[i - 1].code.substring(0, 5)) {
			          if (data.regcodes[i - 1].code.substring(0, 5).substr(-1) == '0') {
			            $('#' + data.regcodes[i - 1].code.substring(0, 5)).remove();
			          }
			        }
			        var name = data.regcodes[i].name;
			        var sname = name.split(' ');
			        if (sname.length == 3) {
			          var op = $('<option>').attr({ id: data.regcodes[i].code.substring(0, 5) }).text(sname[1] + ' ' + sname[2]);
			          $('#gu').append(op);
			        } else {
			          var op = $('<option>').attr({ id: data.regcodes[i].code.substring(0, 5) }).text(sname.slice(1));
			          $('#gu').append(op);
			        }
			      }
			      $('#gu option:contains(' + addrArr[1] + ')').prop('selected', true);
			  	var data= $('#gu  option:selected').attr('id');
				$.ajax({
					url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern='+data+'*00&is_ignore_zero=true',
					type:'get',
					contentType: "application/json"
				}).done((data)=>{
					for(var i=0;i<data.regcodes.length;i++){
						 var name=data.regcodes[i].name;
						 var sname=name.split(' ');
							 var op=$('<option>').attr({id:data.regcodes[i].code}).text(sname.slice(sname.length-1)); 
							 $('#dong').append(op);
					}
			    $('#dong option:contains(' + addrArr[2] + ')').prop('selected', true);
				});
			    })
			    $('.addr').prop('disabled', true);
			  });
		
		}
		$(window).on('load', function() {
			replay();
		});
		$('.row button[value="addr"]').on('click',function(){
			var target = $(this).val();
			var $targetSelect = $('.' + target);
			if ($(this).text() === '변경'){
				$(this).text('취소');
				$targetSelect.removeAttr('disabled');
				$('#si').find('option[value="시 구"]').prop("selected", true);
				$('#gu').find('option[value="시 구 군"]').prop("selected", true);
				$('#dong').find('option[value="동 읍 면"]').prop("selected", true);
				$('#haddr').removeAttr('name');
			}else{
				 $(this).text('변경');
				 $targetSelect.attr('disabled', true);
				 replay();
				 $('#haddr').attr('name', 'addr');
			}
		});
		
		
			$('.row button.input').on('click',function(){
			  var taget = $(this).val();
			  var $targetInput = $('#' + taget);
			  if ($(this).text() === '변경'){
			    $(this).text('취소');
			    $targetInput.removeAttr('readonly');
			    $targetInput.val('');
			  } else {
			    $(this).text('변경');
			    $targetInput.attr({'readonly':'readonly'});
			    $targetInput.val($targetInput.data('initial-value'));
			  }
			});
			
			
		
			
		</script>
	</div>
</body>
</html>