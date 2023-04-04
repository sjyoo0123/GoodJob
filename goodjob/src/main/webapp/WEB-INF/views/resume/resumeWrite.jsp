<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Insert title here</title>
<script>
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
		$('input[name="carrercheck"]').change(function() {
			if ($(this).val() == '경력') {
				$('#carrer1').show();
			} else {
				$('#carrer1').hide();
			}
		});
	});
	$(document).ready(function() {
		$('input[name=checkboxworkday]').click(function() {
			if (this.id === 'moo') {
				$('input[name=checkboxworkday]:lt(7)').prop('checked', false);
			} else {
				$('#moo').prop('checked', false);
			}
		});
	});
</script>
<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.addrtest1 {
	width: 400px;
}
</style>
</head>
<body>
	<h1>이력서 작성</h1>
	<form action="reviewWrite.do" method="post">
		<hr>
		<div>
			<table>
				<tr>
					<th>이름 / 성별 / 생녀월일</th>
					<td></td>
				</tr>
				<tr>
					<th>홍길동 / 남성 / 1990.09.09</th>
					<td></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>2</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>3</td>
				</tr>
				<tr>
					<th>tel</th>
					<td>3</td>
				</tr>
				<tr>

					<th><h2>이력서제목</h2></th>
					<td><div>
							<input type="text" name="subject"
								class="form-control form-control-lg">
						</div></td>
				</tr>
				<tr>
					<th>학력</th>
					<td><select name="grade"
						class="form-select form-select-lg mb-3"
						aria-label=".form-select-lg example">
							<option value="초등학교">초등학교</option>
							<option value="중학교">중학교</option>
							<option value="고등학교">고등학교</option>
							<option value="대학교">대학교</option>
							<option value="학력무관">학력무관</option>
					</select> <select name="gradefinish" class="form-select form-select-lg mb-3"
						aria-label=".form-select-lg example">
							<option value="졸업">졸업</option>
							<option value="재학">재학</option>
							<option value="중퇴">중퇴</option>
							<option value="휴학">휴학</option>
							<option value="수료">수료</option>
					</select></td>
				</tr>

			</table>
		</div>

		<hr>

		<div>
			<h2>경력사항</h2>
			<table>

				<tr>
					<th>경력구분</th>
					<td><input type="radio" value="신입" class="btn-check"
						id="carrercheck1" name="carrercheck" autocomplete="off" checked>
						<label class="btn btn-outline-primary" for="carrercheck1">신입</label>

						<input type="radio" value="경력" class="btn-check" id="carrercheck"
						name="carrercheck" autocomplete="off"> <label
						class="btn btn-outline-primary" for="carrercheck">경력</label></td>
				</tr>
				<tr>
					<th></th>
					<td><div id="carrer1" style="display: none;">
							<table>
								<h5>나의 경력</h5>
								<tr>
									<th>회사명</th>
									<td><input type="text" name="com_name"></td>
								</tr>
								<tr>
									<th>근무기간</th>
									<td><input type="text" id="date" name="startday"
										placeholder="근무시작일">&nbsp;<input type="text"
										id="date2" name="finishday" placeholder="근무종료일"></td>
								</tr>


								<script>
									$('#date').datepicker({
										format : 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
										autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
										templates : {
											leftArrow : '&laquo;',
											rightArrow : '&raquo;',
										}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
										showWeekDays : true, // 위에 요일 보여주는 옵션 기본값 : true
										title : '생년월일', //캘린더 상단에 보여주는 타이틀
										todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
										toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
										language : 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
									}).on('changeDate', function(e) {
										alert($('#date').val());
										console.log(e);
									});
									$('#date2').datepicker({
										format : 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
										autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
										templates : {
											leftArrow : '&laquo;',
											rightArrow : '&raquo;',
										}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
										showWeekDays : true, // 위에 요일 보여주는 옵션 기본값 : true
										title : '생년월일', //캘린더 상단에 보여주는 타이틀
										todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
										toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
										language : 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
									}).on('changeDate', function(e) {
										alert($('#date2').val());
										console.log(e);
									});
								</script>
								<tr>
									<th>담당업무</th>
									<td><input type="text" name="part"></td>
								<tr>
							</table>
						</div></td>
				</tr>

				<hr>

			</table>

			<h2>희망근무조건</h2>
			<table>

				<tr>
					<th>희망 근무지</th>
					<td><input type="text" name="local"></td>
				</tr>
				<tr>
					<th>업직종</th>
					<td><input type="button" value="직종"></td>
				</tr>


				<tr>
					<th>근무기간</th>
					<td><input type="radio" name="period" value="하루"
						class="btn-check" id="period" autocomplete="off" checked><label
						class="btn btn-outline-primary" for="period">하루</label> <input
						type="radio" name="period" value="일주일이하" class="btn-check"
						id="period1" autocomplete="off"><label
						class="btn btn-outline-primary" for="period1">일주일이하</label> <input
						type="radio" name="period" value="1주일~1개월" class="btn-check"
						id="period2" autocomplete="off"><label
						class="btn btn-outline-primary" for="period2">1주일~1개월</label> <input
						type="radio" name="period" value="1개월~3개월" class="btn-check"
						id="period3" autocomplete="off"><label
						class="btn btn-outline-primary" for="period3">1개월~3개월</label> <input
						type="radio" name="period" value="3개월~6개월" class="btn-check"
						id="period4" autocomplete="off"><label
						class="btn btn-outline-primary" for="period4">3개월~6개월</label> <input
						type="radio" name="period" value="6개월~1년" class="btn-check"
						id="period5" autocomplete="off"><label
						class="btn btn-outline-primary" for="period5">6개월~1년</label> <input
						type="radio" name="period" value="1년이상" class="btn-check"
						id="period6" autocomplete="off"><label
						class="btn btn-outline-primary" for="period6">1년이상</label> <input
						type="radio" name="period" value="추후협의" class="btn-check"
						id="period7" autocomplete="off"><label
						class="btn btn-outline-primary" for="period7">추후협의</label></td>
				</tr>
				<tr>
					<th>근무요일</th>
					<td><input type="radio" value="요일지정" class="btn-check"
						id="workday" name="workday" autocomplete="off" checked> <label
						class="btn btn-outline-primary" for="workday">요일지정</label> <input
						type="radio" value="시간협의" class="btn-check" id="workday1"
						name="workday" autocomplete="off"> <label
						class="btn btn-outline-primary" for="workday1">시간협의</label></td>
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
						</div></td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td><input type="radio" value="시간지정" class="btn-check"
						id="workdaytime" name="workdaytime" autocomplete="off" checked><label
						class="btn btn-outline-primary" for="workdaytime">시간지정</label> <input
						type="radio" value="시간협의" class="btn-check" id="workdaytime1"
						name="workdaytime" autocomplete="off"><label
						class="btn btn-outline-primary" for="workdaytime1">시간협의</label></td>
				</tr>
				<tr>
					<th>급여</th>
					<td><input type="radio" value="시급" class="btn-check" id="pay"
						name="pay" autocomplete="off" checked><label
						class="btn btn-outline-primary" for="pay">시급</label> <input
						type="radio" value="월급" class="btn-check" id="pay1" name="pay"
						autocomplete="off"><label class="btn btn-outline-primary"
						for="pay1">월급</label><br> <input type="text" name="pay">원</td>
				</tr>
			</table>
		</div>
		<hr>

		</div>
		<hr>

		<div>
			<h2>자기소개서</h2>
			<textarea rows="30" cols="50" name="content"></textarea>
		</div>
		<input type="submit" value="등록">
	</form>
</body>
</html>