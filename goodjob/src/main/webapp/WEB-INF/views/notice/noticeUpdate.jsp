<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<title>공고수정</title>
<script>
function openjoblist(){
	window.open('joblist.do','joblist','width=900,height=400');
}
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
  $('input[name="selectworkday"]').change(function() {
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
$(document).ready(function() {
	$('#checkworktime').show();
  $('input[name="workdaytime"]').change(function() {
    if ($(this).val() == '시간지정') {
      $('#checkworktime').show();
    } else {
      $('#checkworktime').hide();
    }
  });
});
$(document).ready(function() {
  $('input[name="pay_category"]').change(function() {
    if ($(this).val() == '월급') {
      $('#weekworktime').show();
    } else {
      $('#weekworktime').hide();
    }
  });
});
$(document).ready(function() {
	$('#hourworktime').show();
	  $('input[name="pay_category"]').change(function() {
	    if ($(this).val() == '시급') {
	      $('#hourworktime').show();
	    } else {
	      $('#hourworktime').hide();
	    }
	  });
	});
$(document).ready(function() {
	  $('input[name="checkboxworkday"]').click(function() {
	    var selectedDays = '';
	    $('input[name="checkboxworkday"]').each(function() {
	      if($(this).is(':checked')) {
	        selectedDays += '1';
	      } else {
	        selectedDays += '0';
	      }
	    });
	    $('#workday').val(selectedDays);
	  });
	});
$(document).ready(function() {
	  var workday = document.getElementById("workday").value;
	  var days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun", "moo"];

	  for (var i = 0; i < workday.length; i++) {
	    if (workday[i] === '1') {
	      $("#" + days[i]).prop("checked", true);
	    }
	  }

	  $("#workday").val(workday);
	});
</script>
</head>
<body>
	<form action="noticeUpdate.do" method="post" id="writeForm" enctype="multipart/form-data">
<input type="hidden" name="com_idx" value="${dto.com_idx}">
<input type="hidden" name="writedate" value="${dto.writedate}">
<input type="hidden" name="idx" value="${dto.idx}">
	<div class="container px-4 px-lg-5">
	  	<%@include file="/WEB-INF/views/header.jsp"%>
	<h1>공고 수정</h1>
	<div class="row gx-4 gx-lg-5 justify-content-center">
	<div class="col-md-12 col-lg-9 col-xl-8">
		<div class="card bg-primary bg-opacity-10">
				<div class="card-body">
			<h2 class="card-title">공고제목</h2>
			<input type="text" name="subject"
				class="form-control form-control-lg" value="${dto.subject}">
		</div>
		</div>
		<hr class="my-4">
		<div class="card bg-primary bg-opacity-10">
						<div class="card-body">
			<h2 class="card-title">모집조건</h2>
			<div class="row">
			<table>
				<tr>
					<th>성별</th>
					<td><select name="gender"
						class="form-select form-select-lg mb-3 w-50"
						aria-label=".form-select-lg example">
							<option value="남자" <c:if test="${dto.gender=='남자'}">checked</c:if>>남자</option>
							<option value="여자" <c:if test="${dto.gender=='여자'}">checked</c:if>>여자</option>
					</select></td>
				</tr>
				<tr>
					<th>연령</th>
					<td><input type="radio" value="연령지정" name="age" id="age"
						class="btn-check" autocomplete="off" <c:if test="${dto.max_age!=0}">checked</c:if>><label
						class="btn btn-outline-primary" for="age">연령지정</label> <input
						type="radio" value="연령미지정" name="age" id="age1" class="btn-check"
						autocomplete="off" <c:if test="${dto.max_age==0}">checked</c:if>><label class="btn btn-outline-primary"
						for="age1">연령미지정</label></td>
				</tr>
				<tr>
					<th></th>
					<td><div id="minmaxage" style="display: none;">
					<div class="row">
							연령최소<input type="number" class="form-control w-25" name="min_age" value="<c:if test="${dto.min_age==0}">0</c:if><c:if test="${dto.min_age!=0}">${dto.min_age}</c:if>"> ~ 연령최대<input
								type="number" class="form-control w-25" name="max_age" value="<c:if test="${dto.max_age==0}">0</c:if><c:if test="${dto.max_age!=0}">${dto.max_age}</c:if>">
						</div></div></td>
				</tr>
				<tr>
					<th>학력</th>
					<td><select name="grade"
						class="form-select form-select-lg mb-3 w-50"
						aria-label=".form-select-lg example">
							<option value="중졸" <c:if test="${dto.grade=='중졸'}">selected</c:if>>중졸이상</option>
							<option value="고졸" <c:if test="${dto.grade=='고졸'}">selected</c:if>>고졸이상</option>
							<option value="초대졸" <c:if test="${dto.grade=='초대졸'}">selected</c:if>>초대졸이상</option>
							<option value="대졸" <c:if test="${dto.grade=='대졸'}">selected</c:if>>대졸이상</option>
							<option value="학력" <c:if test="${dto.grade=='학력'}">selected</c:if>>학력무관</option>
					</select></td>
				</tr>
				<tr>
					<th>직종</th>
					<td><div class="input-group mb-3  w-50">
					<button class="btn btn-primary" type="button" id="button-addon1" onclick="openjoblist()">
					직종선택</button>
					<input type="text" value="${dto.job}" class="form-control" name="job" id="job" readonly required>
					</div></td>
				</tr>
				<tr>
					<th>근무형태</th>
					<td><select name="service_type"
						class="form-select form-select-lg mb-3 w-50"
						aria-label=".form-select-lg example">
							<option value="아르바이트" <c:if test="${dto.service_type=='아르바이트'}">selected</c:if>>아르바이트</option>
							<option value="정규직" <c:if test="${dto.service_type=='정규직'}">selected</c:if>>정규직</option>
					</select></td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td><input type="text" name="recruit" value="${dto.recruit}" class="form-control w-50" required></td>
				</tr>
			</table>
			</div>
		</div>
		</div>
		<hr class="my-4">
		<div class="card bg-primary bg-opacity-10">
								<div class="card-body">
			<h2 class="card-title">근무조건</h2>
			<table>
				<tr>
					<th>근무기간</th>
					<td><input type="radio" name="period" value="하루"
						class="btn-check" id="period" autocomplete="off" <c:if test="${dto.period=='하루'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period">하루</label> <input
						type="radio" name="period" value="일주일이하" class="btn-check"
						id="period1" autocomplete="off" <c:if test="${dto.period=='일주일이하'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period1">일주일이하</label> <input
						type="radio" name="period" value="1주일~1개월" class="btn-check"
						id="period2" autocomplete="off" <c:if test="${dto.period=='1주일~1개월'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period2">1주일~1개월</label> <input
						type="radio" name="period" value="1개월~3개월" class="btn-check"
						id="period3" autocomplete="off" <c:if test="${dto.period=='1개월~3개월'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period3">1개월~3개월</label> <input
						type="radio" name="period" value="3개월~6개월" class="btn-check"
						id="period4" autocomplete="off" <c:if test="${dto.period=='3개월~6개월'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period4">3개월~6개월</label> <input
						type="radio" name="period" value="6개월~1년" class="btn-check"
						id="period5" autocomplete="off" <c:if test="${dto.period=='6개월~1년'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period5">6개월~1년</label> <input
						type="radio" name="period" value="1년이상" class="btn-check"
						id="period6" autocomplete="off" <c:if test="${dto.period=='1년이상'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period6">1년이상</label> <input
						type="radio" name="period" value="추후협의" class="btn-check"
						id="period7" autocomplete="off" <c:if test="${dto.period=='추후협의'}">checked</c:if>><label
						class="btn btn-outline-primary" for="period7">추후협의</label></td>
				</tr>
				<tr>
					<th>근무요일</th>
					<td><input type="radio" value="요일지정" class="btn-check"
						id="selectworkday" name="selectworkday" autocomplete="off" <c:if test="${dto.workday!='00000001'}">checked</c:if>><label
						class="btn btn-outline-primary" for="selectworkday">요일지정</label> <input
						type="radio" value="시간협의" class="btn-check" id="selectworkday1"
						name="selectworkday" autocomplete="off" <c:if test="${dto.workday=='00000001'}">checked</c:if>><label
						class="btn btn-outline-primary" for="selectworkday1">시간협의</label></td>
				</tr>
				<tr>
					<th></th>
					<td><div id="checkworkday" style="display: none;">
							<input type="checkbox" name="checkboxworkday" value="mon"
								class="btn-check" id="mon"><label
								class="btn btn-outline-dark" for="mon">월</label> <input
								type="checkbox" name="checkboxworkday" value="thu"
								class="btn-check" id="tue"><label
								class="btn btn-outline-dark" for="tue">화</label> <input
								type="checkbox" name="checkboxworkday" value="wed"
								class="btn-check" id="wed"><label
								class="btn btn-outline-dark" for="wed">수</label> <input
								type="checkbox" name="checkboxworkday" value="thu"
								class="btn-check" id="thu"><label
								class="btn btn-outline-dark" for="thu">목</label> <input
								type="checkbox" name="checkboxworkday" value="fri"
								class="btn-check" id="fri"><label
								class="btn btn-outline-dark" for="fri">금</label> <input
								type="checkbox" name="checkboxworkday" value="sat"
								class="btn-check" id="sat"><label
								class="btn btn-outline-dark" for="sat">토</label> <input
								type="checkbox" name="checkboxworkday" value="sun"
								class="btn-check" id="sun"><label
								class="btn btn-outline-dark" for="sun">일</label> <input
								type="checkbox" name="checkboxworkday" value="moo"
								class="btn-check" id="moo"><label
								class="btn btn-outline-dark" for="moo">무관</label>
						</div><input type="hidden" id="workday" name="workday" value="${dto.workday}"></td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td><input type="radio" value="시간지정" class="btn-check"
						id="workdaytime" name="workdaytime" autocomplete="off" <c:if test="${dto.finishtime!='000'}">checked</c:if>><label
						class="btn btn-outline-primary" for="workdaytime">시간지정</label> <input
						type="radio" value="시간협의" class="btn-check" id="workdaytime1"
						name="workdaytime" autocomplete="off" <c:if test="${dto.finishtime=='000'}">checked</c:if>><label
						class="btn btn-outline-primary" for="workdaytime1">시간협의</label></td>
				</tr>
				<tr>
					<th></th>
					<td><div id="checkworktime" style="display: none;">
					근무시작시간<select name="workstarttime1">
					<c:forEach var="i" begin="0" end="23" step="1">
						<option value="${i}" <c:if test="${workstarttime1==i}">selected</c:if>>${i}</option>
					</c:forEach>
					</select> : <select name="workstarttime2"><option value="00" <c:if test="${workstarttime2==0}">selected</c:if>>0</option><option value="30" <c:if test="${workstarttime2==30}">selected</c:if>>30</option></select> ~ 근무종료시간
					<select name="workendtime1">
					<c:forEach var="i" begin="0" end="48" step="1">
						<option value="${i}" <c:if test="${workendtime1==i}">selected</c:if>>${i}</option>
					</c:forEach>
					</select> : <select name="workendtime2"><option value="00" <c:if test="${workendtime2==0}">selected</c:if>>0</option><option value="30" <c:if test="${workendtime2==30}">selected</c:if>>30</option></select>
					</div></td>
				</tr>
				<tr>
					<th>급여</th>
					<td><input type="radio" value="시급" class="btn-check" id="pay_category"
						name="pay_category" autocomplete="off" <c:if test="${dto.pay_category=='시급'}">checked</c:if>><label
						class="btn btn-outline-primary" for="pay_category">시급</label> <input
						type="radio" value="월급" class="btn-check" id="pay_category1" name="pay_category"
						autocomplete="off" <c:if test="${dto.pay_category=='월급'}">checked</c:if>><label class="btn btn-outline-primary"
						for="pay_category1">월급</label> <input
						type="radio" value="협의" class="btn-check" id="pay_category2" name="pay_category"
						autocomplete="off" <c:if test="${dto.pay_category=='협의'}">checked</c:if>><label class="btn btn-outline-primary"
						for="pay_category2">협의</label><br><div id="hourworktime" style="display: none;"><input type="text" class="form-control inline w-50" name="pay_hour" value="<c:if test="${dto.pay_category=='시급'}">${dto.pay_hour}</c:if><c:if test="${dto.pay_category!='시급'}">0</c:if>">원</div>
						 <div id="weekworktime" style="display: none;"><input type="text" class="form-control inline w-50" name="pay_hour1" value="<c:if test="${dto.pay_category=='월급'}">${dto.pay_hour}</c:if><c:if test="${dto.pay_category!='월급'}">0</c:if>">원 1주 근무시간<input type="number" name="worktime" value="0"></div></td>
				</tr>
			</table>
		</div>
		</div>
		<hr class="my-4">
		<div class="card bg-primary bg-opacity-10">
								<div class="card-body">
			<h2 class="card-title">근무지정보</h2>
			<div>
				<table>
					<tr>
						<th>근무지주소</th>
						<td><div class="input-group mb-3  w-100">
						<input type="text" id="searchadd" class="form-control" readonly placeholder="주소 검색을 해주세요."  value="${dto.local1} ${dto.local2} ${dto.local3}"> 
						<button class="btn btn-primary" onclick="sample5_execDaumPostcode()">주소 검색</button>
						</div>
							<input type="hidden" name="x" id="x" value="${dto.x}">
							<input type="hidden" name="y" id="y" value="${dto.y}">
							<input type="hidden" id="sido" name="local1" value="${dto.local1}">
							<input type="hidden" id="sigungu" name="local2" value="${dto.local2}">
							<input type="hidden" id="query" name="local3" value="${dto.local3}"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="detail_addr" value="${dto.detail_addr}" class="form-control w-100" required></td>
					</tr>
				</table>
					<div id="map" style="width:100%;height:400px;margin-top:10px;display:none"></div>
				</div>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d67c0e8efbe506e6ef450c637bab0204&libraries=services"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("searchadd").value = addr;
                document.getElementById("sido").value = data.sido;
                document.getElementById("sigungu").value = data.sigungu;
                document.getElementById("query").value = data.query;
                $.ajax({
      		      url:'https://dapi.kakao.com/v2/local/search/address.json?analyze_type=similar&page=1&size=10&query='+addr,
      		      type:'GET',
      		      headers:{'Authorization': 'KakaoAK 61dcf9dc3f066d3fdbf620ba80e181cd'},//전송데이터
      		      contentType: "application/json"
      		      //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
      		   }).done((data)=>{
      			 document.getElementById("x").value=data.documents[0].x;
      			 document.getElementById("y").value=data.documents[0].y;
      		   });
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
			<table>
				<tr>
					<th>근무회사명</th>
					<td><input type="text" name="com_name" value="${dto.com_name}" class="form-control w-50"></td>
				</tr>
			</table>
		</div>
		</div>

		<hr class="my-4">
		<div class="card bg-primary bg-opacity-10">
								<div class="card-body">
			<h2 class="card-title">담당자정보</h2>
			<div class="row">
			<table>
				<tr>
					<th>담당자명</th>
					<td><input type="text" class="form-control w-50" name="manager_name" value="${dto.manager_name}"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" class="form-control w-50" name="manager_tel" value="${dto.manager_tel}"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" class="form-control w-50" name="manager_email" value="${dto.manager_email}"></td>
				</tr>
			</table>
			</div>
		</div>
		</div>
		<hr class="my-4">
		<div class="card bg-primary bg-opacity-10">
								<div class="card-body">
			<h2 class="card-title">상세정보</h2>
			<div class="mb-3">

<div style="position: relative;">
  <img id="preview" />
  <span id="clear" style="display: none; position: absolute; top: 0; right: 0;">
    <button type="button" class="btn btn-primary" onclick="clearFile()">X</button>
  </span>
</div>
<input type="hidden" value="${filepath}" name="filepath" id="filepath">
<input class="form-control" type="file" id="formFileMultiple" name="formFileMultiple" onchange="readURL(this);" multiple>
  <c:if test="${filepath!=''||filepath!=null}"><span id="reset" style="display: none; position: relative; top: 10; left: 10;">
    <button type="button" class="btn btn-primary" onclick="resetFile()">수정 전 파일로 초기화</button>
  </span></c:if>
<script>
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      var preview = document.getElementById('preview');
      preview.src = e.target.result;
      preview.width = 200;
      preview.height = 150;
      document.getElementById('clear').style.display = 'block';
      document.getElementById('reset').style.display = 'block';
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    clearFile();
  }
}

function clearFile() {
	  var preview = document.getElementById('preview');
	  preview.src = '';
	  preview.width = 0;
	  preview.height = 0;
	  document.getElementById('clear').style.display = 'none';
	  document.getElementById('reset').style.display = 'none';
	  var input = document.getElementById('formFileMultiple');
	  input.value = null;
	  // reset 버튼도 보이게 함
	  document.getElementById('reset').style.display = 'block';
	}


function resetFile() {
  var filepath = document.getElementById('filepath').value;
  var preview = document.getElementById('preview');
  preview.src = filepath;
  preview.width = 200;
  preview.height = 150;
  document.getElementById('clear').style.display = 'block';
  document.getElementById('reset').style.display = 'none';
}

window.onload = function() {
  var filepath = document.getElementById('filepath').value;
  var preview = document.getElementById('preview');
  if (filepath !== "") {
    preview.src = filepath;
    preview.width = 200;
    preview.height = 150;
    document.getElementById('clear').style.display = 'block';
  }
  if (!preview.src || preview.src.indexOf('data:') !== 0) {
    document.getElementById('reset').style.display = 'none';
  }
};
</script>


			<textarea rows="30" class="form-control" cols="50" name="content">${dto.content}</textarea>
		</div>
		</div>
		<button type="submit" class="btn btn-primary btn-icon-split btn-lg">
    <span class="icon text-white-50">
        <i class="bi bi-check-lg"></i>
    </span>
    <span class="text">공고 수정하기</span>
</button>
		</div>
		</div>
		</div>
		</div>
	</form>
	  	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>