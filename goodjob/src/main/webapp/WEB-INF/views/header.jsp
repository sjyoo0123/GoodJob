<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="logIdx" value="${sessionScope.sidx}"/>
<c:set var="logName" value="${sessionScope.sname}"/>
<c:set var="logCategory" value="${sessionScope.scategory}"/>
<style>
header{
z-index: 1 !important;
}
header .position-absolute{
top:-100%;
z-index:-1;
background-color: white;
transition: all 3s;

}
section{
z-index:-2 !important;
}
div.col-11.mt-4.position-relative{
}
</style>
<header class="mt-1 bg-white">
	<div class="row">
		<div class="offset-9 col-3 text-end">
		<c:if test="${!(empty logIdx)}">
			<c:if test="${logCategory=='개인' }">
			개인
			</c:if>
			<c:if test="${logCategory==기업 }">
			기업
			</c:if>
			<c:if test="${logCategory==관리자 }">
			관리자
			</c:if>
			
			<a href="logout.do">로그아웃</a>
		</c:if>
		<c:if test="${empty idx}">
			<a href="login.do">로그인</a>
			<a href="join.do">회원가입</a>
		</c:if>
		</div>
		<a href="index.do" class="col-2"><img src="img/logo.png"
			class="col-12"></a>
		<div class="col-10">
			<form action="" class="offset-2 col-8 mt-5">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="검색"
						aria-label="Recipient's username with two button addons">
					<button class="btn btn-outline-secondary" type="button">
						<i class="bi bi-search"></i>
					</button>
				</div>
			</form>
			<div class="col-11 mt-4 position-relative pb-5">
				<div class="nav">
					<div class="col-2 offset-1">
						<a href="#" class="">공고정보</a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="#">지역별</a></li>
							<li class="col-12"><a href="#">업종별</a></li>
							<li class="col-12"><a href="#">기간별</a></li>
							<li class="col-12"><a href="#">급여별</a></li>
						</ul>
					</div>
					<div class="col-2">
						<a href="#" class="">인재정보</a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="#">지역별</a></li>
							<li class="col-12"><a href="#">업종별</a></li>
							<li class="col-12"><a href="#">기간별</a></li>
							<li class="col-12"><a href="#">급여별</a></li>
						</ul>
					</div>
					<div class="col-2">
						<a href="#" class="">후기게시판</a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="#">키워드게시판</a></li>
							<li class="col-12"><a href="#">나의후기</a></li>
						</ul>
					</div>
					<div class="col-2">
						<a href="#" class="">job도우미</a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="#">급여통계</a></li>
							<li class="col-12"><a href="#">지역별</a></li>
							<li class="col-12"><a href="#">직종별</a></li>
							<li class="col-12"><a href="#">계산기</a></li>
						</ul>
					</div>
					<div class="col-2">
						<a href="#" class="">고객센터</a>
						<ul class="nav position-absolute">
							<li class="col-12"><a href="#">FAQ</a></li>
							<li class="col-12"><a href="#">공지사항</a></li>
							<li class="col-12"><a href="#">문의목록</a></li>
							<li class="col-12"><a href="#">1대1문의</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</header>
<script>
$('div.col-11.mt-4.position-relative,header .position-absolute').hover(()=>{
	$('header').hover(()=>{
	$('header .position-absolute').css({'margin-top':'160px'});
	},()=>{
		$('header .position-absolute').css({'margin-top':'0px','z-index':'-1'});
	});
},()=>{
	$('header .position-absolute').css({'margin-top':'0px','z-index':'-1'});
});

</script>