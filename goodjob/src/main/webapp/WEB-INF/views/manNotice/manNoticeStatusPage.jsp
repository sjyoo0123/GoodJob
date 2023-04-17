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
</head>
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
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp" %>
			<section>
				<article>
				<div class="row">
					<div class="offset-sm-3 col-sm-6">
						<h3>공고 관리</h3>
					</div>
				</div>
				<div class="row">
					<div class="offset-sm-3 col-sm-6">
						<a href="manNoticeStatusPage.do">상태관리</a> | <a href="manNoticeAcceptPage.do">승인</a> | <a href="manNoticeDelPage.do">삭제</a>
					</div>
					<div class="row">
						<div class="offset-sm-7 col-sm-3">
							<form id="manNoticeStatusPage">
							<select name="category">
								<option value="com_name">기업명</option>
								<option value="subject">제목</option>
								<option value="subjectContent">제목+내용</option>
							</select>
							<input type="text" name="search" class="form-control">
							<input type="button" id="submit" value="검색하기" class="btn btn-primary">
							<input type="hidden" value="1" id="cp" name="cp">
							<input type="hidden" name="bAjax" value="true">
							</form>
						</div>	
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>공고 번호</th>
								<th>공고 제목</th>
								<th>기업 이름</th>
								<th>작성일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lists }">
								<tr>
									<td colspan="5" align="center">
										등록된 공고가 없습니다.
									</td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${lists }">
								<tr>
									<td>${dto.idx }</td>
									<td>${dto.subject }</td>
									<td>${dto.com_name }</td>
									<td>${dto.writedate }</td>
									<c:if test="${dto.status.equals('활성') }">
										<td><button type="button" value="${dto.idx }" class="check">비활성화하기</button></td>
 									</c:if>
									<c:if test="${dto.status.equals('비활성') }">
										<td><button type="button" value="${dto.idx }" class="check">활성화하기</button></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="page">${page}</div>
				</div>
				<hr>
				<br>
					
				</article>
			</section>
		<%@include file="/WEB-INF/views/footer.jsp" %>
	</div>
<script>
	$(document).on('click','.check',function(){
		var button=$(this);
		$.ajax({
			url:'manNoticeStatus_No.do',
			type:'get',
			data:{'idx':$(this).val(),'button':$(this).text()},
			contentType:"application/json"	
		}).done(function(data){
			if(data.count == '1'){
				if(button.text() == '활성화하기'){
					button.text('비활성화하기');
				}else{
					
					button.text('활성화하기');
				}
			}
		})
	});
	$("#manNoticeStatusPage").on("keydown", function(e) {
	    if (e.keyCode == 13) {
	        stopSubmit(e);
	    }
	});
	 function stopSubmit(e) {
	        e.preventDefault();
	    }
	 $('#submit').click(function() {
			$('#cp').attr({value:'1'});
			page();
		});
		$(document).on('click','#page button',function(){
			$('#cp').attr({value:$(this).val()});
			page();
		});
		
	
	
	function page() {
		  var para = $('#manNoticeStatusPage').serialize();
		  $.ajax({
		    url: 'manNoticeStatusPage.do',
		    data: para,
		    dataType: 'json', 
		    contentType: "application/json"
		  }).done(function(data) {
		    $('tbody').empty();
		    var list = data.lists; // ${list}에 해당하는 값으로 대체해주세요.
		    
		    if (list.length == 0) { // 등록된 공고가 없을 경우
		        var noListRow = $("<tr>")
		            .append($("<td>")
		                .attr("colspan", "5")
		                .attr("align", "center")
		                .text("등록된 공고가 없습니다."));
		        $("#table").append(noListRow);
		    } else { // 등록된 공고가 있을 경우
		        $.each(list, function(index, dto) {
		        	  var date = new Date(dto.writedate);
			            var year = date.getFullYear();
			            var month = ('0' + (date.getMonth() + 1)).slice(-2);
			            var day = ('0' + date.getDate()).slice(-2);
			            var formattedDate = year + '-' + month + '-' + day;
			            
		            var statusButton = $("<button>")
		                .attr("type", "button")
		                .val(dto.idx)
		                .addClass("check")
		                .text(dto.status === "활성" ? "비활성화하기" : "활성화하기");
		            var statusTd = $("<td>").append(statusButton);
		            var tr = $("<tr>")
		                .append($("<td>").text(dto.idx))
		                .append($("<td>").text(dto.subject))
		                .append($("<td>").text(dto.com_name))
		                .append($("<td>").text(formattedDate))
		                .append(dto.status === "활성" ? statusTd : "");
		          
		            $("tbody").append(tr);
		            
		            
		    $('#page').empty();
		    $('#page').append(data.page);
		  });
		}})}
	
</script>
</body>
</html>