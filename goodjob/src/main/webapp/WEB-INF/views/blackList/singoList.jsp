<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
				<div class="form-check form-check-inline">
					<input type="radio" class="btn-check" name="options" id="normal" autocomplete="off" value="개인" >
					<label class="btn btn-secondary" for="normal">일반회원</label>
					<input type="radio" class="btn-check" name="options" id="company" value="기업" autocomplete="off">
					<label class="btn btn-secondary" for="company">기업회원</label>
				</div>
				<div id="my-div">
				</div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
<script>
$('input[name=options]').change(function(){
	$('#my-div').empty();
	 $.ajax({
	      url:'manBlackListSingoListGet.do',
	      type:'post',
	      data:{"category":$('.btn-check:checked').val()},//전송데이터
	      dataType:'json'
	      //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
	   }).done((data)=>{
	      //성공시 실행
		   var $table = $('<table>').addClass('table table-hover');
			  var $thead = $('<thead>');
			  var $theadRow = $('<tr>');
			  var $th1 = $('<th>').text('이름');
			  var $th2 = $('<th>').text('신고 횟수');
			  var $th3 = $('<th>').text('등록일');
			  var $th4 = $('<th>').text('확인여부');
			  
			  $('#my-div').append($table);
			  $theadRow.append($th1);
			  $theadRow.append($th2);
			  $theadRow.append($th3);
			  $theadRow.append($th4);
			  
			  $thead.append($theadRow);
			  $table.append($thead);
			  
			  var $tbody = $('<tbody>');
			  
			  // 만약 lists가 비어있을 경우 "글이 없습니다" 행 추가
			  if (data.lists.length==0) {
			    var $noDataTr = $('<tr>').append($('<td>').attr('colspan', '4').text('글이 없습니다'));
			    $tbody.append($noDataTr);
			  } else {
			    // lists가 비어있지 않은 경우 데이터 행 추가
			    $.each(data.lists, function(index, dto) {
			      var $dataTr = $('<tr>');
			      var $td1 = $('<td>').append($('<a>').attr('href', 'manBlackListContentForm.do?idx='+dto.member_idx+'&status='+dto.status).text(dto.name));
			      var $td2 = $('<td>').text(dto.singo_count);
			      var $td3 = $('<td>').text(dto.singo_date ? formatDate(new Date(dto.singo_date)) : 'N/A');
			      var $td4 = $('<td>').text( (dto.check == 1) ? "확인" : "미확인");

			      function formatDate(date) {
			        var year = date.getFullYear();
			        var month = (date.getMonth() + 1).toString().padStart(2, '0');
			        var day = date.getDate().toString().padStart(2, '0');
			        return year + '-' + month + '-' + day;
			      }
			      
			      $dataTr.append($td1);
			      $dataTr.append($td2);
			      $dataTr.append($td3);
			      $dataTr.append($td4);
			      
			      $tbody.append($dataTr);
			    });
			  }
			  
			  $table.append($tbody);
			  
			  $('#my-div').append($table);
			  
	   }).fail(()=>{
	      //실패시 실행
	   }).always(()=>{
	      //성공여부 무관 실행
		   
	   })
	  
	});
</script>
</body>
</html>