<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d67c0e8efbe506e6ef450c637bab0204&libraries=services"></script>
<title>${dto.subject}</title>
</head>
<body>
<input type="hidden" id="x" value="${dto.x}">
<input type="hidden" id="y" value="${dto.y}">
<div class="container">
<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
<button class="btn btn-outline-dark" ><span>수정</span></button>
<button class="btn btn-outline-dark"><span>삭제</span></button>
</div>
<c:if test="${sidx!=dto.com_idx}">
<button class="btn btn-danger btn-icon-split btn-lg">
    <span class="icon text-white-50">
        <i class="bi bi-clipboard-check-fill"></i>
    </span>
    <span class="text">신고하기</span>
</button>
</c:if>
<c:if test="${scategory=='관리자'}">
<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
<button class="btn btn-outline-info"  onclick="location.href='manNoticeAccept_Ok.do?idx=${dto.idx}'"><span>승인</span></button>
<button class="btn btn-outline-info"  onclick="location.href='manNoticeAccept_No.do?idx=${dto.idx}'"><span>거부</span></button>
</div>
</c:if>
	<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 justify-content-center">
	<div class="col-md-10 col-lg-8 col-xl-7">
<h1>${dto.subject}</h1>
<h6>${dto.writedate}</h6>
<div class="row align-items-center">
<div class="col-3"><i class="bi bi-cash" style="font-size: 6rem;"></i><br>${dto.pay_category}${dto.pay_hour}원</div>
<div class="col-3"><i class="bi bi-calendar" style="font-size: 6rem;"></i><br>${yy}</div>
<div class="col-3"><i class="bi bi-clock" style="font-size: 6rem;"></i><br>${startendtime}</div>
<div class="col-3"><i class="bi bi-people-fill" style="font-size: 6rem;"></i><br>모집모집</div>
</div>
<hr class="my-4">
<div class="row">
<div class="col-6">
<h2>모집조건</h2>
<table>
<tr>
	<th>성별</th>
	<td>${dto.gender}</td>
</tr>
<tr>
	<th>연령</th>
	<td>${dto.min_age}~${dto.max_age}</td>
</tr>
<tr>
	<th>학력</th>
	<td>${dto.grade}이상</td>
</tr>
<tr>
	<th>직종</th>
	<td>@직종@</td>
</tr>
<tr>
	<th>모집인원</th>
	<td>${dto.recruit}</td>
</tr>
</table>
</div>
<div class="col-6">
<h2>근무조건</h2>
<table>
<tr>
	<th>급여</th>
	<td>${dto.pay_category} ${dto.pay_hour}</td>
</tr>
<tr>
	<th>근무기간</th>
	<td>${dto.period}</td>
</tr>
<tr>
	<th>근무요일</th>
	<td>${yy}</td>
</tr>
<tr>
	<th>근무시간</th>
	<td>${startendtime}</td>
</tr>
</table>
<button><span>통계페이지로</span></button>
</div>
</div>
<hr class="my-4">
<div>
<h2>근무지정보</h2>
<h5>근무지명&nbsp;${dto.com_name}(${dto.local1} ${dto.local2} ${dto.local3} ${dto.detail_addr})</h5>
<input type="hidden" id="com_name" value="${dto.com_name}">
</div>
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d67c0e8efbe506e6ef450c637bab0204"></script>
<script>
var x=document.getElementById('x').value;
var y=document.getElementById('y').value;
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(y, x); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
var com_name=document.getElementById('com_name').value;
var iwContent = '<div style="padding:5px;">'+com_name+' <br><a href="https://map.kakao.com/link/map/'+com_name+','+y+','+x+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+com_name+','+y+','+x+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(y, x); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
<hr class="my-4">
<div>
<h2>상세내용</h2>
<div>
${dto.content}
</div>
</div>
<hr class="my-4">
<div class="bs-docs-section">
<div class="row">
<div class="col-lg-5">
<h2>담당자정보</h2>
<table>
<tr>
	<th>담당자명</th>
	<td>${dto.manager_name}</td>
</tr>
<tr>
	<th>담당자 전화번호</th>
	<td>${dto.manager_tel}</td>
</tr>
<tr>
	<th>담당자 이메일</th>
	<td>${dto.manager_email}</td>
</tr>
</table>
</div>
<div class="col-lg-7">
<h2>회사정보</h2>
<div>
<table>
<tr>
	<th>회사명</th>
	<td>${cdto.com_name}</td>
</tr>
<tr>
	<th>대표자명</th>
	<td>${cdto.name}</td>
</tr>
<tr>
	<th>회사설립일</th>
	<td>${cdto.com_birth}</td>
</tr>
<tr>
	<th>주소</th>
	<td>${dto.local1} ${dto.local2} ${dto.local3} ${dto.detail_addr}</td>
</tr>
<tr>
	<th>회사전화번호</th>
	<td>${cdto.tel}</td>
</tr>
<tr>
	<th>회사이메일</th>
	<td>${cdto.email}</td>
</tr>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>