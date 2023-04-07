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
<button class="btn btn-outline-dark"><span>수정</span></button>
<button class="btn btn-outline-dark"><span>삭제</span></button>
</div>
	<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 justify-content-center">
	<div class="col-md-10 col-lg-8 col-xl-7">
<h1>${dto.subject}</h1>
<h6>${dto.writedate}</h6>
<div class="row row-cols-lg-auto g-3 align-items-center">
<div class="col-12"><svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
  <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
  <path d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z"/>
</svg><br>${dto.pay_category}${dto.pay_hour}원</div>
<div class="col-12"><svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
</svg><br>${yy}</div>
<div class="col-12"><svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
</svg><br>${startendtime}</div>
<div class="col-12"><svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
</svg><br>모집모집</div>
</div>
<hr class="my-4">
<div class="row row-cols-lg-auto g-3 align-items-center">
<div class="col-12">
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
<div class="col-12">
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
<div class="col-lg-5">
<h2>회사정보</h2>
<div>
<table>
<tr>
	<th>회사명</th>
	<td>@@회사명@@</td>
</tr>
<tr>
	<th>대표자명</th>
	<td>@@대표자명@@</td>
</tr>
<tr>
	<th>회사설립일</th>
	<td>@@회사설립일@@</td>
</tr>
<tr>
	<th>주소</th>
	<td>@@주소@@</td>
</tr>
<tr>
	<th>회사전화번호</th>
	<td>@@회사전화번호@@</td>
</tr>
<tr>
	<th>회사이메일</th>
	<td>@@회사이메일@@</td>
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