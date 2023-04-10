 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="resumeUpdateTest" action="resumeUpdateTest.do"
		method="post">
		<div>
			제목<input type="text" name="subject" value=${dto.subject }>
			상세주소<input type="text" name="detail_addr" value="${dto.detail_addr }">
			<div>
				학년 <select name="grade" class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example">
					<option value="초등학교 졸업" ${dto.grade == "초등학교 졸업" ? "selected" : ""}>초등학교
						졸업</option>
					<option value="중학교 졸업" ${dto.grade == "중학교 졸업" ? "selected" : ""}>중학교
						졸업</option>
					<option value="고등학교 졸업" ${dto.grade == "고등학교 졸업" ? "selected" : ""}>고등학교
						졸업</option>
					<option value="대학교 졸업" ${dto.grade == "대학교 졸업" ? "selected" : ""}>대학교
						졸업</option>
					<option value="학력무관" ${dto.grade == "학력무관" ? "selected" : ""}>학력무관</option>
				</select>
			</div>
			<div>
				경력구분<input type="radio" value="신입" class="btn-check"
					id="career_check1" name="career_check" autocomplete="off" checked>
				<label class="btn btn-outline-primary" for="career_check1">신입</label>
				<input type="radio" value="경력" class="btn-check" id="career_check"
					name="career_check" autocomplete="off"> <label
					class="btn btn-outline-primary" for="career_check">경력</label>
			</div>
			<div>
				
					
					희망 근무지<div class="addr input-group">
						<select class="h_local1" size="3" name="h_local1">
							<option selected>${dto.h_local1 }</option>
						</select> <select class="h_local2" size="3" name="h_local2">
							<option selected>${dto.h_local2 }</option>
						</select>
						<div class="lAddr"></div>
					</div>
				
					<th>직종</th>
					<td><input type="button" value="직종" onclick="show()">
						<input type="text" value="${dto.job }" name="job" id="job"	readonly></td>
				</tr>


				<tr>
					<th>근무기간</th>
					<td><input type="radio" name="h_period" value="하루"
						class="btn-check" id="h_period" autocomplete="off"
						${dto.h_period == "하루" ? "checked" : ""}> <label
						class="btn btn-outline-primary" for="h_period">하루</label> <input
						type="radio" name="h_period" value="일주일이하" class="btn-check"
						id="h_period1" autocomplete="off"
						${dto.h_period == "일주일이하" ? "checked" : ""}> <label
						class="btn btn-outline-primary" for="h_period1">일주일이하</label> <input
						type="radio" name="h_period" value="1주일~1개월" class="btn-check"
						id="h_period2" autocomplete="off"
						${dto.h_period == "1주일~1개월" ? "checked" : ""}> <label
						class="btn btn-outline-primary" for="h_period2">1주일~1개월</label> <input
						type="radio" name="h_period" value="1개월~3개월" class="btn-check"
						id="h_period3" autocomplete="off"
						${dto.h_period == "1개월~3개월" ? "checked" : ""}> <label
						class="btn btn-outline-primary" for="h_period3">1개월~3개월</label> <input
						type="radio" name="h_period" value="3개월~6개월" class="btn-check"
						id="h_period4" autocomplete="off"
						${dto.h_period == "3개월~6개월" ? "checked" : ""}> <label
						class="btn btn-outline-primary" for="h_period4">3개월~6개월</label> <input
						type="radio" name="h_period" value="6개월~1년" class="btn-check"
						id="h_period5" autocomplete="off"
						${dto.h_period == "6개월~1년" ? "checked" : ""}> <label
						class="btn btn-outline-primary" for="h_period5">6개월~1년</label> <input
						type="radio" name="h_period" value="1년이상" class="btn-check"
						id="h_period6" autocomplete="off"
						${dto.h_period == "1년이상" ? "checked" : ""}> <label
						class="btn btn-outline-primary" for="h_period6">1년이상</label> <input
						type="radio" name="h_period" value="추후협의" class="btn-check"
						id="h_period7" autocomplete="off"
						${dto.h_period == "추후협의" ? "checked" : ""}></td>
				</tr>
			</div>


		</div>
		<input type="submit" value="수정테스트">
	</form>
</body>
</html>