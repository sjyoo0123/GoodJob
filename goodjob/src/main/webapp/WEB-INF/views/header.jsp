<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="logIdx" value="${sessionScope.sidx}" />
<c:set var="logName" value="${sessionScope.sname}" />
<c:set var="logCategory" value="${sessionScope.scategory}" />
<c:set var="nor" value="개인"></c:set>
<c:set var="com" value="기업"></c:set>
<c:set var="man" value="관리자"></c:set>
<c:set var="logStatus" value="${sessionScope.status}"></c:set>
<style>
*::-webkit-scrollbar {
	width: 10px;
}

*::-webkit-scrollbar-track {
	background-color: #f1f1f1;
}

*::-webkit-scrollbar-thumb {
	background-color: #aaa;
	border-radius: 5px;
}

hr {
	margin: 2px !important;
}

section {
	margin-top: 10px;
}

.nav {
	z-index: 1001;
}

header .nav li {
	display: none;
	max-height: 0;
	z-index: 1000 !important;
}
.menu_title{
	border-radius: 5px;
	color:#1a4369;
	padding-left: 20px;
	padding-top: 10px;
	width: 130px;
	height: 40px;
	cursor: pointer;
}
.menu_title:hover{
	background: #1a4369;
	color:#fff;
}
ul .col-12{
}
.nav:hover li {
	display: block;
	max-height: none;
	transition: all 10s;
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: skyblue;
}

</style>
<header class="mt-1 bg-white">
	<div class="row">
		<div class="offset-9 col-3 text-end">
			<c:if test="${!(empty logIdx)}">
			
				<c:if test="${logCategory eq nor}">
					<div class="btn-group">
						<button type="button" class="btn btn-white dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${logName }님</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#"></a></li>
							<li><a class="dropdown-item" href="#"></a></li>
							<li><a class="dropdown-item" href="#"></a></li>
							
						</ul>
					</div>
				</c:if>
				<c:if test="${logCategory eq com}">
					<div class="btn-group">
						<button type="button" class="btn btn-white dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${logName }님</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="company.do">마이페이지</a></li>
							<li><a href="comPlanList.do" class="dropdown-item">나의 요금제</a></li>
							<li><a href="noticeComList.do" class="dropdown-item">공고 현황</a></li>
							<li><a href="ofComList.do" class="dropdown-item">제의 현황</a></li>
							
						</ul>
					</div>
				</c:if>
				<c:if test="${logCategory eq man}">
					<div class="btn-group">
						<button type="button" class="btn btn-white dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${logName }님</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="manNoticeStatusPage.do">공고관리</a></li>
							<li><a class="dropdown-item" href="manReviewPage.do">키워드관리</a></li>
							<li><a class="dropdown-item" href="manBlackList.do">블랙리스트</a></li>
							<li><a class="dropdown-item" href="manBannerPage.do">배너관리</a></li>
							<li><a class="dropdown-item" href="manPlanPage.do">요금제관리</a></li>
							<li><a class="dropdown-item" href="salesForm.do">매출통계</a></li>
							<li><a class="dropdown-item" href="salesListForm.do">매출현황</a></li>							
						</ul>
					</div>
				</c:if>

				<a href="logout.do">로그아웃</a>
			</c:if>
			<c:if test="${empty logIdx}">
				<a href="login.do">로그인</a>
				<a href="join.do">회원가입</a>
			</c:if>
		</div>
		<a href="index.do" class="col-2"><img src="img/logo.png"
			class="col-12"></a>
		<div class="col-10">
			<form action="" class="offset-2 col-8 mt-5 pb-3">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="검색"
						aria-label="Recipient's username with two button addons">
					<button class="btn btn-outline-secondary" type="button">
						<i class="bi bi-search"></i>
					</button>
				</div>
			</form>
			<hr>
			<div class="col-11 mt-4 position-relative" >
				<div class="nav">
					<div class="col-2 offset-1">
						<a href="noticeList.do"><label class="menu_title">공고정보</label></a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="#"><label class="menu_title">지역별</label></a></li>
							<li class="col-12"><a href="#"><label class="menu_title">직종별</label></a></li>
							<li class="col-12"><a href="#"><label class="menu_title">기간별</label></a></li>
						</ul>
					</div>
					<div class="col-2">
						<a href="injaeListForm.do" class=""><label class="menu_title">인재정보</label></a>
					</div>
					<div class="col-2">
						<a href="review.do" class=""><label class="menu_title">후기게시판</label></a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="review.do"><label class="menu_title">키워드게시판</label></a></li>
							<li class="col-12"><a href="#"><label class="menu_title">나의후기</label></a></li>
						</ul>
					</div>
					<div class="col-2">
						<a href="jobHelperTong.do" class=""><label class="menu_title">job도우미</label></a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="jobHelperTong.do"><label class="menu_title">급여통계</label></a></li>
							<li class="col-12"><a href="helperCalForm.do"><label class="menu_title">계산기</label></a></li>
						</ul>
					</div>
					<div class="col-2">
						<a href="userFAQList.do" class=""><label class="menu_title">고객센터</label></a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="userFAQList.do"><label class="menu_title">FAQ</label></a></li>
							<li class="col-12"><a href="userGongJiList.do"><label class="menu_title">공지사항</label></a></li>
							<li class="col-12"><a href="#"><label class="menu_title">1대1문의</label></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>
</header>
<script>
	
</script>