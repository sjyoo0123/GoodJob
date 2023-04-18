<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
	${msg}
</script>
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
<style>
.carousel-item img {
	max-height: 150px;
	width: auto;
}
.cardgroup a img{
min-width: max(100%);
max-width: max(100%);
min-height: 150px;
max-height: 150px;
}
.dcard,.gcard,.scard{
max-height: 250px;
min-height: 250px;
}
/*호버하면 크기 1.05배 박스쉐도우*/
.dcard{
   box-shadow: 0px 0px 0px grey;
   transition: box-shadow 0.5s ease-in-out, transform 0.5s ease-in-out;
}
.dcard:hover{
   box-shadow:  10px 10px 10px grey;
   transform: scale(1.05);
}
/*호버하면 박스쉐도우*/
.gcard{
box-shadow: 0px 0px 0px grey;
}
.gcard:hover{
 box-shadow:  10px 10px 10px grey;
}
</style>
</head>

<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<section class="mt-5 pt-5">
			<article class="mt-3">
				<div class="row banner">
					<div class="card col-2 offset-1">
						<ul class="list-group list-group-flush gongji text-nowrap overflow-hidden">
							<c:if test="${empty gList }">
								<li>등록된 공지가 없습니다</li>
							</c:if>
							<c:forEach var="gongdto" items="${gList }">
								<li class="list-group-item"><a href="userGongJiContent.do?idx=${gongdto.idx }">${gongdto.subject }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-6">
						<div id="carouselExampleControls" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="bdto" items="${banner }" varStatus="status">
								<c:if test="${status.first}">
									<div class="carousel-item active">
										<a href="https://${bdto.link }"><img src="${bdto.file }" class="w-100"  alt="${bdto.subject }"></a>
									</div>
								</c:if>
								<c:if test="${!(status.first)}">
									<div class="carousel-item">
										<a href="https://${bdto.link }"><img src="${bdto.file }" class="w-100" alt="${bdto.subject }"></a>
									</div>
								</c:if>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon bg-black" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="next">
								<span class="carousel-control-next-icon bg-black" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
					<div class="card col-2 menu">
					<ul class="list-group list-group-flush text-center my-auto">
					<c:if test="${logCategory eq null}">
					<li class="list-group-item"><a href="login.do">로그인</a></li>
					<li class="list-group-item"><a href="join.do">회원가입</a></li>
					</c:if>
					<c:if test="${logCategory eq nor}">
					<li class="list-group-item"><a href="updateMember.do">내정보수정</a></li>
					<li class="list-group-item"><a href="resumeUpdate.do">이력서수정</a></li>
					<li class="list-group-item"><a href="apNorList.do">지원내역</a></li>
					<li class="list-group-item"><a href="userFAQList.do">고객센터</a></li>
					</c:if>
					<c:if test="${logCategory eq com}">
					<li class="list-group-item"><a href="updateMember.do">내정보수정</a></li>
					<li class="list-group-item"><a href="#;" onclick="location.href='noticeWrite.do'">공고작성하기</a></li>
					<li class="list-group-item"><a href="ofComList.do">지원한인재</a></li>
					<li class="list-group-item"><a href="userFAQList.do">고객센터</a></li>
					</c:if>
					<c:if test="${logCategory eq man}">
					<li class="list-group-item"><a href="manBlackListSingoList.do">신고관리</a></li>
					<li class="list-group-item"><a href="manFAQList.do">FAQ관리</a></li>
					<li class="list-group-item"><a href="manOneList.do">작성된문의</a></li>
					<li class="list-group-item"><a href="manGongJiList.do">공지관리</a></li>
					</c:if>
					</ul>
					</div>
				</div>
				<div class="cardgroup col-10 offset-1 mt-3">
				
				<!-- die -->
				<div class="row mb-5  row-cols-4 g-4">
				<c:forEach var="dDto" items="${dieList}">
				<div class="col">
				<div class="card dcard border-info">
  				<a href="noticeContent.do?idx=${dDto.IDX}"><img src="${dDto.FILE}" class="card-img-top" alt="${dDto.SUBJECT}"></a>
  				<div class="card-body">
  				  <div class="fs-6 col-6">${dDto.COM_NAME}</div>
  				  <div class="fs-5 text-nowrap overflow-hidden"><a href="noticeContent.do?idx=${dDto.IDX}">${dDto.SUBJECT}</a></div>
  				  <div class="fs-6 ">${dDto.LOCAL1} ${dDto.LOCAL2}</div>
 				 </div>
				</div>
				</div>
				</c:forEach>
				</div>
				<!-- gold -->
				<div class="row mb-5  row-cols-4 g-4">
				<c:forEach var="gDto" items="${goldList}">
				<div class="col">
				<div class="card gcard">
  				<a href="noticeContent.do?idx=${gDto.IDX}"><img src="${gDto.FILE}" class="card-img-top" alt="${gDto.SUBJECT}"></a>
  				<div class="card-body">
  				  <div class="fs-6 col-6">${gDto.COM_NAME}</div>
  				  <div class="fs-5 text-nowrap overflow-hidden"><a href="noticeContent.do?idx=${gDto.IDX}">${gDto.SUBJECT}</a></div>
  				  <div class="fs-6 ">${gDto.LOCAL1} ${gDto.LOCAL2}</div>
 				 </div>
				</div>
				</div>
				</c:forEach>
				</div>
				<!-- sil -->
				<div class="row mb-5  row-cols-4 g-4">
				<c:forEach var="sDto" items="${silList}">
				<div class="col">
				<div class="card scard">
  				<a href="noticeContent.do?idx=${sDto.IDX}"><img src="${sDto.FILE}" class="card-img-top" alt="${sDto.SUBJECT}"></a>
  				<div class="card-body">
  				  <div class="fs-6 col-6">${sDto.COM_NAME}</div>
  				  <div class="fs-5 text-nowrap overflow-hidden"><a href="noticeContent.do?idx=${sDto.IDX}">${sDto.SUBJECT}</a></div>
  				  <div class="fs-6 ">${sDto.LOCAL1} ${sDto.LOCAL2}</div>
 				 </div>
				</div>
				</div>
				</c:forEach>
				</div>
				</div>
			</article>
		</section>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>