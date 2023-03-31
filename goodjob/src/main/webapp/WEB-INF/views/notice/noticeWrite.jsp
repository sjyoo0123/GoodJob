<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d67c0e8efbe506e6ef450c637bab0204&libraries=services"></script>
<title>Insert title here</title>
<script>
$(document).ready(function() {
	$('#minmaxage').show();
  $('input[name="age"]').change(function() {
    if ($(this).val() == '연령지정') {
      $('#minmaxage').show();
    } else {
      $('#minmaxage').hide();
    }
  });
});
$(document).ready(function() {
	$('#checkworkday').show();
  $('input[name="workday"]').change(function() {
    if ($(this).val() == '요일지정') {
      $('#checkworkday').show();
    } else {
      $('#checkworkday').hide();
    }
  });
});
$(document).ready(function() {
	  $('input[name=checkboxworkday]').click(function() {
	    if (this.id === 'moo') {
	      $('input[name=checkboxworkday]:lt(7)').prop('checked', false);
	    }
	    else {
	      $('#moo').prop('checked', false);
	    }
	  });
	});
</script>
<style>
    .map_wrap {position:relative;width:100%;height:500px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    .addrtest1{width:400px;}
</style>
</head>
<body>



	<h1>공고 등록</h1>
	<form action="noticeWrite.do" method="post">
		<div>
			<h2>공고제목</h2>
			<input type="text" name="subject" class="form-control form-control-lg">
		</div>
		<hr>
		<div>
			<h2>모집조건</h2>
			<table>
				<tr>
					<th>성별</th>
					<td><select name="gender" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
					</select></td>
				</tr>
				<tr>
					<th>연령</th>
					<td><input type="radio" value="연령지정" name="age" id="age" class="btn-check" autocomplete="off" checked><label class="btn btn-outline-primary" for="age">연령지정</label>
					<input type="radio" value="연령미지정" name="age" id="age1" class="btn-check" autocomplete="off"><label class="btn btn-outline-primary" for="age1">연령미지정</label></td>
				</tr>
				<tr>
					<th></th>
					<td><div id="minmaxage" style="display:none;">연령최소<input type="text" name="min_age"> ~ 연령최대<input type="text" name="max_age"></div></td>
				</tr>
				<tr>
					<th>연령최소</th>
					<td><input type="text" name="min_age"></td>
				</tr>
				<tr>
					<th>연령최대</th>
					<td><input type="text" name="max_age"></td>
				</tr>
				<tr>
					<th>학력</th>
					<td><select name="grade" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option value="중졸이상">중졸이상</option>
							<option value="고졸이상">고졸이상</option>
							<option value="초대졸이상">초대졸이상</option>
							<option value="대졸이상">대졸이상</option>
							<option value="학력무관">학력무관</option>
					</select></td>
				</tr>
				<tr>
					<th>직종</th>
					<td><input type="button" value="직종"></td>
				</tr>
				<tr>
					<th>근무형태</th>
					<td><select name="service_type" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option value="아르바이트">아르바이트</option>
							<option value="정규직">정규직</option>
					</select></td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td><input type="text" name="recruit"></td>
				</tr>
			</table>
		</div>
		<hr>
		<div>
			<h2>근무조건</h2>
			<table>
				<tr>
					<th>근무기간</th>
					<td><input type="radio" name="period" value="하루" class="btn-check" id="period" autocomplete="off" checked><label class="btn btn-outline-primary" for="period">하루</label> <input type="radio" name="period" value="일주일이하" class="btn-check" id="period1" autocomplete="off"><label class="btn btn-outline-primary" for="period1">일주일이하</label>
						<input type="radio" name="period" value="1주일~1개월" class="btn-check" id="period2" autocomplete="off"><label class="btn btn-outline-primary" for="period2">1주일~1개월</label> <input type="radio" name="period" value="1개월~3개월" class="btn-check" id="period3" autocomplete="off"><label class="btn btn-outline-primary" for="period3">1개월~3개월</label>
						<input type="radio" name="period" value="3개월~6개월" class="btn-check" id="period4" autocomplete="off"><label class="btn btn-outline-primary" for="period4">3개월~6개월</label> <input type="radio" name="period" value="6개월~1년" class="btn-check" id="period5" autocomplete="off"><label class="btn btn-outline-primary" for="period5">6개월~1년</label>
						<input type="radio" name="period" value="1년이상" class="btn-check" id="period6" autocomplete="off"><label class="btn btn-outline-primary" for="period6">1년이상</label> <input type="radio" name="period" value="추후협의" class="btn-check" id="period7" autocomplete="off"><label class="btn btn-outline-primary" for="period7">추후협의</label></td>
				</tr>
				<tr>
					<th>근무요일</th>
					<td><input type="radio" value="요일지정" class="btn-check" id="workday" name="workday"autocomplete="off" checked><label class="btn btn-outline-primary" for="workday">요일지정</label>
					<input type="radio" value="시간협의" class="btn-check" id="workday1" name="workday"autocomplete="off"><label class="btn btn-outline-primary" for="workday1">시간협의</label></td>
				</tr>
				<tr>
					<th></th>
					<td><div id="checkworkday" style="display:none;">
					<input type="checkbox" name="checkboxworkday" value="mon" class="btn-check" id="mon"><label class="btn btn-outline-dark" for="mon">월</label>
					<input type="checkbox" name="checkboxworkday" value="thu" class="btn-check" id="tue"><label class="btn btn-outline-dark" for="tue">화</label>
					<input type="checkbox" name="checkboxworkday" value="wed" class="btn-check" id="wed"><label class="btn btn-outline-dark" for="wed">수</label>
					<input type="checkbox" name="checkboxworkday" value="thu" class="btn-check" id="thu"><label class="btn btn-outline-dark" for="thu">목</label>
					<input type="checkbox" name="checkboxworkday" value="fri" class="btn-check" id="fri"><label class="btn btn-outline-dark" for="fri">금</label>
					<input type="checkbox" name="checkboxworkday" value="sat" class="btn-check" id="sat"><label class="btn btn-outline-dark" for="sat">토</label>
					<input type="checkbox" name="checkboxworkday" value="sun" class="btn-check" id="sun"><label class="btn btn-outline-dark" for="sun">일</label>
					<input type="checkbox" name="checkboxworkday" value="moo" class="btn-check" id="moo"><label class="btn btn-outline-dark" for="moo">무관</label>
					</div></td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td><input type="radio" value="시간지정" class="btn-check" id="workdaytime" name="workdaytime" autocomplete="off" checked><label class="btn btn-outline-primary" for="workdaytime">시간지정</label>
					<input type="radio" value="시간협의" class="btn-check" id="workdaytime1" name="workdaytime" autocomplete="off"><label class="btn btn-outline-primary" for="workdaytime1">시간협의</label></td>
				</tr>
				<tr>
					<th>급여</th>
					<td><input type="radio" value="시급" class="btn-check" id="pay" name="pay" autocomplete="off" checked><label class="btn btn-outline-primary" for="pay">시급</label>
					<input type="radio" value="월급" class="btn-check" id="pay1" name="pay" autocomplete="off"><label class="btn btn-outline-primary" for="pay1">월급</label><br>
					<input type="text" name="pay">원</td>
				</tr>
			</table>
		</div>
		<hr>
		<div>
			<h2>근무지정보</h2>
			<div>
				<table>
					<tr>
						<th>근무지주소</th>
						<td><input type="text" id="searchadd">
						<input type="button" value="검색" onclick="searchaddr()"><input type="text" name="x" id="x"><input type="text" id="y"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="detail_addr"></td>
					</tr>
				</table>
				<div>
					
					<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
</div>
					</div>
						<script>
//html내부 onclick형
function searchaddr() {
	var value=document.getElementById("searchadd").value;
$.ajax({
      url:'https://dapi.kakao.com/v2/local/search/address.json?analyze_type=similar&page=1&size=10&query='+value,
      type:'GET',
      headers:{'Authorization': 'KakaoAK 61dcf9dc3f066d3fdbf620ba80e181cd'},//전송데이터
      contentType: "application/json"
      //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
   }).done((data)=>{
	   
	   var x=data.documents[0].x;
	   document.getElementById("x").value=x;
	   var y=data.documents[0].y;
	   document.getElementById("y").value=y;
	   var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(y, x),
			level: 3
		};
		
		
		var map = new kakao.maps.Map(container, options);
		
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(y, x), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
   }).fail(()=>{
      //실패시 실행
   }).always(()=>{
      //성공여부 무관 실행
   })
}
</script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.56540, 126.97569), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
	</script>
				</div>
				<table>
					<tr>
						<th>근무회사명</th>
						<td><input type="text" name="com_name"></td>
					</tr>
				</table>
			</div>
		</div>
		<hr>
		<div>
			<h2>담당자정보</h2>
			<table>
				<tr>
					<th>담당자명</th>
					<td><input type="text" name="manager_name"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="manager_tel"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="manager_email"></td>
				</tr>
			</table>
		</div>
		<hr>
		<div>
			<h2>상세정보</h2>
			<textarea rows="30" cols="50" name="content"></textarea>
		</div>
		<input type="submit" value="등록">
	</form>

</body>
</html>