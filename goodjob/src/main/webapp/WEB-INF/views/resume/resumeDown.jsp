<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<hr>
		<div>
			<table>
				<tr>
					<th> 이름 / 성별  /  생년월일 </th>
					<td>${dto.name} / ${nto.status} / ${nto.review_num }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><span>${dto.addr }</span> 
					<div>상세주소<input type="text" name="deltai_addr"></div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.email }</td>
				</tr>
				<tr>
					<th>tel</th>
					<td>${dto.tel }</td>
				</tr>
				<tr>
				
			<hr>
				<div>
				 <input type="hidden" name="name" value="${dto.name} ">
				<input type="hidden" name="addr" value="${dto.addr }">
				<input type="hidden" name="gender" value="${nto.status }">
				<input type="hidden" name="email" value="${dto.email }">
				<input type="hidden" name="tel" value="${dto.tel }">
				<input type="hidden" name="age" value="${nto.review_num }">
				</div>
					<th><h2>이력서제목</h2></th>
					<td>
						<div>
							<input type="text" name="subject" class="form-control form-control-lg">
						</div>
					</td>
				</tr>
				<tr>
					<th>학력</th>
					<td><select name="grade" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option value="초등학교 졸업">초등학교 졸업</option>
							<option value="중학교 졸업">중학교 졸업</option>
							<option value="고등학교 졸업">고등학교 졸업</option>
							<option value="대학교 졸업">대학교 졸업</option>
							<option value="학력무관">학력무관</option>
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
					<td>
						<input type="radio" value="신입" class="btn-check" id="career_check1" name="career_check" autocomplete="off" checked>
						<label class="btn btn-outline-primary" for="career_check1">신입</label>

						<input type="radio" value="경력" class="btn-check" id="career_check" 	name="career_check" autocomplete="off"> 
						<label class="btn btn-outline-primary" for="career_check">경력</label>
					</td>
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
									<td><input type="text" id="date" name="startday_s" placeholder="근무시작일">
									&nbsp;
									<input type="text" id="date2" name="endday_s" placeholder="근무종료일"></td>
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
								<tr>
									<th>서비스타입</th>
									<td><input type="text" name="service_type"></td>
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
					<td><sapan> 
						<select name="h_local1" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option value="시">시</option>
						</select> 
						<select name="h_local2" class="form-select form-select-lg mb-3"
							aria-label=".form-select-lg example">
							<option value="구">구</option>
						</select> </span></td>
				</tr>
				<tr>
					<th>업직종</th>
					<td><input type="button" value="직종" onclick="show();"></td>
				</tr>


				<tr>
					<th>근무기간</th>
					<td>
					<input type="radio" name="h_period" value="하루" class="btn-check" id="h_period" autocomplete="off" checked>
					<label class="btn btn-outline-primary" for="h_period">하루</label> 
					<input type="radio" name="h_period" value="일주일이하" class="btn-check"	id="h_period1" autocomplete="off">
					<label class="btn btn-outline-primary" for="h_period1">일주일이하</label> 
						<input type="radio" name="h_period" value="1주일~1개월" class="btn-check" id="h_period2" autocomplete="off">
						<label class="btn btn-outline-primary" for="h_period2">1주일~1개월</label> 
						<input type="radio" name="h_period" value="1개월~3개월" class="btn-check" id="h_period3" autocomplete="off">
						<label class="btn btn-outline-primary" for="h_period3">1개월~3개월</label> 
						<input type="radio" name="h_period" value="3개월~6개월" class="btn-check" id="h_period4" autocomplete="off">
						<label class="btn btn-outline-primary" for="h_period4">3개월~6개월</label>
						<input type="radio" name="h_period" value="6개월~1년" class="btn-check" id="h_period5" autocomplete="off">
						<label class="btn btn-outline-primary" for="h_period5">6개월~1년</label> 
						<input type="radio" name="h_period" value="1년이상" class="btn-check" id="h_period6" autocomplete="off">
						<label class="btn btn-outline-primary" for="h_period6">1년이상</label>
						<input type="radio" name="h_period" value="추후협의" class="btn-check" 	id="h_period7" autocomplete="off">
						<label class="btn btn-outline-primary" for="h_period7">추후협의</label>
						</td>
				</tr>
				<tr>
					<th>근무요일</th>
					<td><input type="radio" value="요일지정" class="btn-check"
						id="h_workday" name="h_workday" autocomplete="off" checked> <label
						class="btn btn-outline-primary" for="h_workday">요일지정</label> <input
						type="radio" value="시간협의" class="btn-check" id="h_workday1"
						name="h_workday" autocomplete="off"> <label
						class="btn btn-outline-primary" for="h_workday1">시간협의</label></td>
				</tr>
				<tr>
					<th></th>
					<td><div id="checkh_h_workday" style="display: none;">
							<input type="checkbox" name="checkboxh_h_workday" value="mon"
								class="btn-check" id="mon"><label
								class="btn btn-outline-dark" for="mon">월</label> <input
								type="checkbox" name="checkboxh_h_workday" value="thu"
								class="btn-check" id="tue"><label
								class="btn btn-outline-dark" for="tue">화</label> <input
								type="checkbox" name="checkboxh_h_workday" value="wed"
								class="btn-check" id="wed"><label
								class="btn btn-outline-dark" for="wed">수</label> <input
								type="checkbox" name="checkboxh_h_workday" value="thu"
								class="btn-check" id="thu"><label
								class="btn btn-outline-dark" for="thu">목</label> <input
								type="checkbox" name="checkboxh_h_workday" value="fri"
								class="btn-check" id="fri"><label
								class="btn btn-outline-dark" for="fri">금</label> <input
								type="checkbox" name="checkboxh_h_workday" value="sat"
								class="btn-check" id="sat"><label
								class="btn btn-outline-dark" for="sat">토</label> <input
								type="checkbox" name="checkboxh_h_workday" value="sun"
								class="btn-check" id="sun"><label
								class="btn btn-outline-dark" for="sun">일</label> <input
								type="checkbox" name="checkboxh_h_workday" value="moo"
								class="btn-check" id="moo"><label
								class="btn btn-outline-dark" for="moo">무관</label>
						</div></td>
				</tr>
				<tr>
					<th>희망하는 근무시간</th>
					<td><select name="h_worktime" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option value="오전">오전</option>
							<option value="오후">오후</option>
							<option value="무관">무관</option>
					</select></td>
					</tr>
				<tr>
					<th>급여</th>
					<td><input type="radio" value="시급" class="btn-check" id="h_pay_category"
						name="h_pay_category" autocomplete="off" checked><label
						class="btn btn-outline-primary" for="h_pay_category">시급</label> 
						<input type="radio" value="월급" class="btn-check" id="h_pay_category1" name="h_pay_category"
						autocomplete="off"><label class="btn btn-outline-primary"
						for="h_pay_category1">월급</label><br> <input type="text" name="h_pay">원 
						<div id="week_h_worktime" style="display: none;">1주 근무시간<input type="number" name="h_worktime" value="0"></div></td>
						<!-- weekh_h_wortime 을 week_h_worktime으로 수정  -->
				</tr>
			</table>
		</div>

		<hr>

		<div>
			<h2>자기소개서</h2>
			<textarea rows="30" cols="50" name="content"></textarea>
		</div>
		<div>
			<h2>공개여부</h2>
			<lable> <input type="checkbox" name="check" value=1>공개</lable>
			<lable> <input type="checkbox" name="check" value=0>비공개</lable>

		</div>
		<input type="submit" value="등록">
	</form>
</body>
</html>