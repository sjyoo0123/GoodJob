<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
input[type=number] {
	-moz-appearance: textfield;
}
#graydiv{
	border-top: 2px solid #0d6efd;
}
#pinkdiv{
	border-left: 2px solid #0d6efd;
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<div class="btn-group" role="group"
					aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="btnradio" id="paycal"
						autocomplete="off"> <label class="btn btn-outline-primary"
						for="paycal">주휴수당 계산기</label> <input type="radio"
						class="btn-check" name="btnradio" id="endcal" autocomplete="off">
					<label class="btn btn-outline-primary" for="endcal">퇴직금 계산기</label>
				</div>
				<div id="my-div">
					<div class="card d-none" id="paycard">
						<div class="card-body">
							<div class="row">
								<div class="col-md-4">
									<label for="time" class="form-label">이번주 일한시간</label>
								</div>
								<div class="input-group col-md-4 ">
									<input type="number" id="time" class="form-control"
										placeholder="시간을 입력해주세요"> <span
										class="input-group-text">시간</span>
								</div>
								<div class="col-md-4">
									<label for="timeprice" class="form-label">나의 시급</label>
								</div>
								<div class="input-group col-md-4 form-check">
									<input type="number" id="timeprice" class="form-control"
										placeholder="시급을 입력해주세요"> <span
										class="input-group-text">원</span>
								</div>
								<div class="col-12">
									<button class="btn btn-primary" type="button"
										onclick="timecal()">계산하기</button>
								</div>
								<div class="col-md-4">
									<label for="result" class="form-label">나의 이번주 주휴수당</label>
								</div>
								<div class="input-group col-md-4">
									<input type="number" id="timeresult" class="form-control"
										readonly> <span class="input-group-text">원</span>
								</div>
							</div>
						</div>
					</div>
					<div class=" d-flex flex-wrap d-none" id="endcard">
						<div class="col-md-8">
							<div class="col-12">
								<label for="startdate" class="form-label">입사일</label>
							</div>
							<div class="col-5 ">
								<input type="date" id="startdate" class="form-control">
							</div>
							<div class="col-12">
								<label for="enddate" class="form-label">퇴사일</label>
							</div>
							<div class="col-5 ">
								<input type="date" id="enddate" class="form-control">
							</div>
							<div class="col-12">
								<label for="monthprice" class="form-label">퇴직전 3개월 봉급 합</label>
							</div>
							<div class="col-12 d-flex flex-wrap">
							<div class="col-9 ">
								<div class="input-group">
									<input type="number" id="monthprice" class="form-control">
									<span class="input-group-text">원</span>
									
								</div>
							</div>
							<div class="offset-1">
							<button type="button" class="btn btn-primary" onclick="endcal();">계산</button>
							</div>
							</div>
							<div class=" d-flex flex-wrap " id="graydiv">
								<div class="col-12">
									<h4>추가 입력 요소</h4>
								</div>
								<div class="col-12">
									<label for="yearsang" class="form-label">연간 상여금</label>
								</div>
								<div class="col-8 ">
									<div class="input-group">
										<input type="number" id="yearsang" class="form-control ">
										<span class="input-group-text">원</span>
									</div>
								</div>
								<div class="col-12">
									<label for="yearcha" class="form-label">연차수당</label>
								</div>
								<div class="col-8 ">
									<div class="input-group col-12">
										<input type="number" id="yearcha" class="form-control">
										<span class="input-group-text">원</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4" id="pinkdiv">
							<div class="col-12">
								<label for="endresult"" class="form-label">예상 퇴직금</label>
							</div>
							<div class="col-10 ">
								<div class="input-group col-12">
									<input type="number" id="endresult" class="form-control">
									<span class="input-group-text">원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$('#paycal').change(function() {
			$('#my-div >div').each(function() {
				if (!$(this).hasClass('d-none')) {
					$(this).addClass('d-none');
				}
			});
			$('#paycard').removeClass('d-none');

		})
		$('#endcal').change(function() {
			$('#my-div >div').each(function() {
				if (!$(this).hasClass('d-none')) {
					$(this).addClass('d-none');
				}
			});
			$('#endcard').removeClass('d-none');

		})
		function timecal() {
			var time = $('#time').val();
			var price = $('#timeprice').val();

			var result = (time / 40) * 8 * price;

			$('#timeresult').val(result);
		}
		function endcal(){
			var startdate=new Date($('#startdate').val());
			var enddate=new Date($('#enddate').val());
			var monthprice=$('#monthprice').val();
			
			var yearsang=$('#yearsang').val()>0?$('#yearsang').val():0;
			var yearcha=$('#yearcha').val()>0?$('#yearcha').val():0;
			
			var avgpay=((parseInt(monthprice)+((parseInt(yearsang)+parseInt(yearcha))/4))/90);
			
			const diffDate = startdate.getTime() - enddate.getTime();
			  
			var workday= Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
			
			var result=avgpay*workday/365*30;
			$('#endresult').val(parseInt(result));
		}
	</script>
</body>
</html>











