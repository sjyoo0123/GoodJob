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
				<h2 class="text-center">자주찾는질문</h2>
					<div class="col-8 offset-2">
						<form id="seachFAQ">
						<div class="col-6 offset-6 d-flex flex-wrap">
						<div class="col-4">
							<select name="category" class="form-select">
								<option disabled selected="selected">목록</option>
								<option>개인</option>
								<option>기업</option>
							</select> 
						</div>
							<input type="text" name="subject" class=" col-6">
									<button id="submit" class="btn btn-light text-end col-2"
										type="button">조회</button>
									<input type="hidden"
								name="cp" id="cp"> 
								<input type="hidden" name="bAjax"
								value="true">
						</div>
						</form>
						<div class="accordion accordion-flush mt-1" id="accordionFlushExample">
							<c:if test="${empty list}">
								등록된 글이 없습니다
								</c:if>
							<c:forEach var="dto" items="${list}">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-heading${dto.idx }">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapse${dto.idx }"
											aria-expanded="false"
											aria-controls="flush-collapse${dto.idx }">
											${dto.subject}</button>
									</h2>
									<div id="flush-collapse${dto.idx }"
										class="accordion-collapse collapse"
										aria-labelledby="flush-heading${dto.idx }"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">${dto.content}</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div id="page">${page}</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script>
	$("#seachFAQ").on("keydown", function(e) {
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
		  var para = $('#seachFAQ').serialize();
		  $.ajax({
		    url: 'userFAQList.do',
		    data: para,
		    dataType: 'json', 
		    contentType: "application/json"
		  }).done(function(data) {
		    $('#accordionFlushExample').empty();
		    if (data.list.length === 0) {
		      $('#accordionFlushExample').append('<p>등록된 글이 없습니다</p>');
		    } else {
		      $.each(data.list, function(index, dto) {
		        var accordionHeader = $('<h2>').addClass('accordion-header').attr('id', 'flush-heading' + dto.idx);
		        var accordionButton = $('<button>').addClass('accordion-button collapsed').attr({
		          'type': 'button',
		          'data-bs-toggle': 'collapse',
		          'data-bs-target': '#flush-collapse' + dto.idx,
		          'aria-expanded': 'false',
		          'aria-controls': 'flush-collapse' + dto.idx
		        }).text(dto.subject);
		        accordionHeader.append(accordionButton);

		        var accordionCollapse = $('<div>').addClass('accordion-collapse collapse').attr({
		          'id': 'flush-collapse' + dto.idx,
		          'aria-labelledby': 'flush-heading' + dto.idx,
		          'data-bs-parent': '#accordionFlushExample'
		        });
		        var accordionBody = $('<div>').addClass('accordion-body').text(dto.content);
		        accordionCollapse.append(accordionBody);

		        var accordionItem = $('<div>').addClass('accordion-item');
		        accordionItem.append(accordionHeader);
		        accordionItem.append(accordionCollapse);

		        $('#accordionFlushExample').append(accordionItem);
		      });
		    }
		    $('#page').empty();
		    $('#page').append(data.page);
		  });
		}
	</script>
</body>
</html>