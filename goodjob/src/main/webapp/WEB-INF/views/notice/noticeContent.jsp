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

	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="row">
	<div class="col-7"></div>
	<div class="col-5">
	<c:if test="${scategory == '기업' && sidx==dto.com_idx }">
<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
<button class="btn btn-outline-dark" onclick="location.href='noticeUpdate.do?idx=${dto.idx}'"><span>공고 수정</span></button>
<button class="btn btn-outline-dark" onclick="if (confirm('정말 삭제하시겠습니까?')) { location.href='noticeDel.do?idx=${dto.idx}' }"><span>공고 삭제</span></button>
</div>
</c:if>
</div>
</div>
<c:if test="${sidx!=dto.com_idx}">

<button class="btn btn-danger btn-icon-split btn-lg text-white-50" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        <i class="bi bi-clipboard-check-fill icon"></i>
    신고하기
</button>

</c:if>
<c:choose>
<c:when test="${scategory == '개인' && resumeNum != 0  }">
<c:if test="${atoNum == 0 }" >
	<button type="button" class="btn btn-primary btn-lg" onclick="location.href='apNorInsert.do?notice_idx=${dto.idx}'">지원하기</button>
</c:if>
 <c:if test="${atoNum != 0}" >
 <button type="button" class="btn btn-primary btn-lg">이미 지원함</button>
 </c:if>
 </c:when>
 <c:when test="${resumeNum == 0 &&  scategory =='기업'}">
 </c:when>
 <c:when test="${resumeNum == 0 }">
 	<button type="button" class="btn btn-primary btn-lg">이력서 작성 후 지원 가능합니다</button>
 </c:when>
 	
 <c:otherwise>
 	
 </c:otherwise>
 </c:choose>
<c:if test="${scategory=='관리자'}">
<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
<button class="btn btn-outline-info"  onclick="location.href='manNoticeAccept_Ok.do?idx=${dto.idx}'"><span>승인</span></button>
<button class="btn btn-outline-info"  onclick="location.href='manNoticeAccept_No.do?idx=${dto.idx}'"><span>거부</span></button>
</div>
</c:if>
	<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 justify-content-center">
	<div class="col-md-10 col-lg-8 col-xl-7">
<h1 class="fw-bold display-3">${dto.subject}</h1>
<h6>${dto.writedate}</h6>
<div class="row align-items-center text-center">
<div class="col-3"><i class="bi bi-cash" style="font-size: 6rem;"></i><br><c:if test="${dto.pay_category=='협의'}">협의</c:if><c:if test="${dto.pay_category=='월급'}">${dto.pay_category}${dto.pay_month}원</c:if><c:if test="${dto.pay_category=='시급'}">${dto.pay_category}${dto.pay_hour}원</c:if></div>
<div class="col-3"><i class="bi bi-calendar" style="font-size: 6rem;"></i><br>${yy}</div>
<div class="col-3"><i class="bi bi-clock" style="font-size: 6rem;"></i><br><c:if test="${startendtime=='0:00 ~ 0:00'}">시간합의</c:if><c:if test="${startendtime!='0:00 ~ 0:00'}">${startendtime}</c:if></div>
<div class="col-3"><i class="bi bi-people-fill" style="font-size: 6rem;"></i><br>${dto.service_type}</div>
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
	<td><c:if test="${dto.min_age==0&&dto.max_age==0}">나이무관</c:if><c:if test="${dto.max_age!=0}">${dto.min_age}~${dto.max_age}</c:if></td>
</tr>
<tr>
	<th>학력</th>
	<td><c:if test="${dto.grade=='학력무관'}">${dto.grade}</c:if><c:if test="${dto.grade!='학력무관'}">${dto.grade}이상</c:if></td>
</tr>
<tr>
	<th>직종</th>
	<td>${dto.job}</td>
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
	<td><c:if test="${dto.pay_category=='협의'}">협의</c:if><c:if test="${dto.pay_category=='월급'}"><h3 class="fw-bold display-5">${dto.pay_category}${dto.pay_month}원</h3></c:if><c:if test="${dto.pay_category=='시급'}"><h3 class="fw-bold display-5">${dto.pay_category}${dto.pay_hour}</h3></c:if></td>
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
	<td><c:if test="${startendtime=='0:00 ~ 0:00'}">시간합의</c:if><c:if test="${startendtime!='0:00 ~ 0:00'}">${startendtime}</c:if></td>
</tr>
</table>
<button class="btn btn-primary btn-icon-split btn-lg" onclick="window.open('jobHelperTong.do')">
    <span class="icon text-white-50">
        <i class="bi bi-bar-chart-line-fill"></i>
    </span>
    <span class="text">통계페이지 열기</span>
</button>
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
<img src="${filepath}" class="col-12">
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
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <c:if test="${empty logIdx }">
       <div>로그인후 이용가능합니다</div>
       </c:if>
       <c:if test="${!empty logIdx }">
       <form  id="singo">
       <div class="row">
       <input type="hidden" name="member_idx" value="${cdto.member_idx }">
       <input type="hidden" name="category" value="기업">
       <select class="form-select" name="singo_type">
		<option selected disabled="disabled">카테고리</option>
		<option>거짓 공고</option>
		<option>부적절한 단어사용</option>
		<option>도영님</option>
		</select>
       
       
       <div class="form-floating mb-3 col-8 offset-2">
		<input type="text" class="form-control" id="floatingInput" name="subject" placeholder="subject"> 
		<label for="floatingInput">제목</label>
		</div>
		<div class="form-floating mb-3 col-8 offset-2">
		<textarea class="form-control" name="singo_content" id="floatingTextarea"></textarea>
		<label for="floatingTextarea">내용</label>
		</div>
		<div class=" form-floating mb-3  col-8 offset-2">
		<label for="formFile" class="form-label"></label>
		 <input class="form-control" type="file" id="formFile">
		</div>
       </div>
       </form>
       </c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger singoing">신고하기</button>
      </div>
    </div>
  </div>
</div>
<script> 
$('.singoing').on('click',()=>{
    var formData = new FormData();
    formData.append('subject', $('#floatingInput').val());
    formData.append('singo_content', $('#floatingTextarea').val());
    formData.append('file', $('#formFile')[0].files[0]);
    formData.append('category',$('input[name="category"]').val());
    formData.append('member_idx',$('input[name="member_idx"]').val() || 0);
    formData.append('singo_type',$('select[name="singo_type"]').val());

    $.ajax({
        url:'sinGo.do',
        type:'post',
        contentType: false,
        processData: false,
        data: formData
    }).done((data)=>{
        if(data>0){
        alert('정상 등록되었습니다');
        $('#staticBackdrop').modal('hide');
        }else{
        	alert('서버와의 접속이 원활하지 않습니다 다시시도해주세요');
        }
    }).fail((xhr, status, error) => {
        // Handle error response
    });
});
</script>
  	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>