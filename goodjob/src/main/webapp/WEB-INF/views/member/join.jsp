<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script>${msg}</script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<title>Good Job</title>
</head>

<body>
	<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
			<i class="bi bi-eye-slash"></i>
				<div class="row text-center p-4 m-4">
					<div class="col fs-1 fw-bold subject">회원가입</div>
				</div>
				<div class="row text-center p-4 main">
					<div class="col p-4">
						<div class="card">
							<img alt="123" src="img/main.jpg" class="card-img-top">
							<div class="card-body">
								<button type="button" class="btn btn-secondary btn-lg w-100 normal">개인 회원가입</button>
							</div>
						</div>
					</div>
					<div class="col p-4">
						<div class="card">
							<img alt="123" src="img/main.jpg" class="card-img-top">
							<div class="card-body">
								<button type="button" class="btn btn-secondary btn-lg w-100 company">기업 회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
		<script>
		//backlink
		let ibutton=$('<a>').attr('href','#;');
		let icon=$('<i>').attr('class','bi bi-arrow-90deg-left');
		let iconDiv=$('<div>').attr('class','col-9 fs-1 offset-3 text-start').append(ibutton.append(icon));
		//id
		let idInput = $('<input>').attr({type:'text',id:'floatingInputId',placeholder:'id',class:'form-control',name:'id'});
		let idLabel=$('<label>').attr({for:'floatingInputId'}).text('아이디');
		let idDiv=$('<div>').attr({class:'form-floating'}).append(idInput, idLabel);
		let idColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'}).append(idDiv);
		let idText=$('<div>').attr({class:'col-10 offset-2 offset-md-0 col-md-4 text-start fs-3 '}).css('color','red').text('test');
		//pwd
		let pwdInput = $('<input>').attr({type:'password',id:'floatingInputPwd',placeholder:'password',class:'form-control',name:'pwd'});
		let pwdLabel=$('<label>').attr({for:'floatingInputPwd'}).text('비밀번호');
		let pwdDiv=$('<div>').addClass('form-floating').append(pwdInput, pwdLabel);
		let pwdColDiv=$('<div>').addClass('col-10 col-md-4 offset-md-4 offset-2').append(pwdDiv);
		let pwdText=$('<div>').attr({class:'col-10 offset-2 offset-md-0 col-md-4 text-start fs-3 '}).css('color','red').text('test');
		//name
		let nameDiv=$('<div>').attr({class:'form-floating'});
		let nameInput = $('<input>').attr({type:'text',id:'floatingInputName',placeholder:'name',class:'form-control',name:'name'});
		let nameColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'});
		//com_name
		let comNameInput = $('<input>').attr({type:'text',id:'floatingInputcomName',placeholder:'id',class:'form-control',name:'com_name'});
		let comNameLabel=$('<label>').attr({for:'floatingInputcomName'}).text('대표자명');
		let comNameDiv=$('<div>').attr({class:'form-floating'}).append(comNameInput,comNameLabel);
		let comNameColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'}).append(comNameDiv);
		//email
		let emailInput = $('<input>').attr({type:'text',id:'floatingInputEmail',placeholder:'email',class:'form-control',name:'email'});
		let emailLabel=$('<label>').attr({for:'floatingInputEmail'}).text('이메일');
		let emailDiv=$('<div>').addClass('form-floating').append(emailInput, emailLabel);
		let emailColDiv=$('<div>').addClass('col-10 col-md-4 offset-md-4 offset-2').append(emailDiv);
		//tel
		let telInput = $('<input>').attr({type:'text',id:'floatingInputTel',placeholder:'tel',class:'form-control',name:'tel'});
		let telLabel=$('<label>').attr({for:'floatingInputTel'}).text('전화번호');
		let telDiv=$('<div>').addClass('form-floating').append(telInput, telLabel);
		let telColDiv=$('<div>').addClass('col-10 col-md-4 offset-md-4 offset-2').append(telDiv);
		//submit
		let submit =$('<button>').attr({'type':'submit'}).text('가입');
		let submitCol=$('<div>').addClass('col-10 col-md-4 offset-md-4 offset-2').append(submit);
		//addr
		let siColDiv=$('<div>').attr({class:'col-md-4'});
		let siDiv=$('<div>').attr({class:'form-floating'});
		let guColDiv=$('<div>').attr({class:'col-md-4'});
		let guDiv=$('<div>').attr({class:'form-floating'});
		let dongColDiv=$('<div>').attr({class:'col-md-4'});
		let dongDiv=$('<div>').attr({class:'form-floating'});
		let siSelect=$('<select>').attr({class:'form-select','aria-label':'Default select example',name:'addr'});
		let siOption=$('<option>').attr({selected:'selected'}).text('시 도');
		let guSelect=$('<select>').attr({class:'form-select','aria-label':'Default select example',name:'addr'});
		let guOption=$('<option>').attr({selected:'selected'}).text('시 구 군');
		let dongSelect=$('<select>').attr({class:'form-select','aria-label':'Default select example',name:'addr'});
		let dongOption=$('<option>').attr({selected:'selected'}).text('동 읍 면');
		//date
		let dateColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'});
		let dateDiv=$('<div>').attr({class:'form-floating'});
		let dateInput=$('<input>').attr({type:'text',id:'date',class:'form-control',name:'birth_s'});
			dateInput.datepicker({
	         format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	         autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	         templates: {
	            leftArrow: '&laquo;',
	            rightArrow: '&raquo;',
	         }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
	         showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
	         title: '생년월일', //캘린더 상단에 보여주는 타이틀
	         todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
	         toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	         language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	      })
	      .on('changeDate', function (e) {
	         alert($('#date').val());
	         console.log(e);
	      });
				dateDiv.append(dateInput);
				dateColDiv.append(dateDiv);
	    //detailaddr2
			var addrColDiv=$('<div>').attr({class:'col-12'});
			var addrDiv=$('<div>').attr({class:'form-floating'});
			var addrInput = $('<input>').attr({type:'text',id:'floatingInputAddr',placeholder:'addr',class:'form-control'});
			var addrLabel=$('<label>').attr({for:'floatingInputAddr'}).text('상세주소');
			//nomaljoin
		$('.normal').click(()=>{
			$('.subject').text('개인 회원가입');
				let startContent = $('.main').children().detach();
				let form =$('<form>').attr({action :'normalJoin.do',method:'post',class:'form-floating'});
				let formRowDiv=$('<div>').attr({class:'row g-3'});
				//name
				let nameLabel=$('<label>').attr({for:'floatingInputName'}).text('이름');
				//gen
				let genColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'});
				let genDiv=$('<div>').attr({class:'form-floating'});
				let genSelect=$('<select>').attr({class:'form-select','aria-label':'Default select example',name:'gender'});
				let optionN=$('<option>').attr({selected:'selected'}).text('성별');
				let optionM=$('<option>').attr({value:'남성'}).text('남성');
				let optionG=$('<option>').attr({value:'여성'}).text('여성');
				nameDiv.append(nameInput).append(nameLabel);
				genSelect.append(optionN).append(optionM).append(optionG);
				genDiv.append(genSelect);
				//addrDiv.append(addrInput).append(addrLabel);
				nameColDiv.append(nameDiv);
				genColDiv.append(genDiv);
				siSelect.append(siOption);
				guSelect.append(guOption);
				dongSelect.append(dongOption);
				siDiv.append(siSelect);
				guDiv.append(guSelect);
				dongDiv.append(dongSelect);
				siColDiv.append(siDiv);
				guColDiv.append(guDiv);
				dongColDiv.append(dongDiv);
				//addrColDiv.append(addrDiv);
				formRowDiv.append(iconDiv).append(idColDiv).append(idText).append(pwdColDiv).append(pwdText).append(nameColDiv).append(emailColDiv).append(telColDiv).append(genColDiv).append(siColDiv).append(guColDiv).append(dongColDiv).append(dateColDiv).append(submitCol);
				form.append(formRowDiv);
				$('.main').append(form);
			});
			//comjoin
		$('.company').click(()=>{
			$('.subject').text('기업 회원가입');
			let main = $('.main').children().detach();
			let form =$('<form>').attr({action :'comJoin.do',method:'post',class:'form-floating'});
			let formRowDiv=$('<div>').attr({class:'row g-3'});
			let nameLabel=$('<label>').attr({for:'floatingInputName'}).text('기업이름');
			//사업자번호
			let comnumInput = $('<input>').attr({type:'text',id:'floatingInputNum',placeholder:'comnum',class:'form-control',name:'com_num'});
			let comnumLabel=$('<label>').attr({for:'floatingInputNum'}).text('사업자번호');
			let comnumDiv=$('<div>').attr({class:'form-floating'}).append(comnumInput,comnumLabel);
			let comnumColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'}).append(comnumDiv);
			let comnumText=$('<div>').attr({class:'col-10 offset-2 offset-md-0 col-md-4 text-start fs-3 '}).css('color','red').text('test');
			//상세주소
			let dAddrInput = $('<input>').attr({type:'text',id:'floatingInputdAddr',placeholder:'id',class:'form-control',name:'detail_addr'});
			let dAddrLabel=$('<label>').attr({for:'floatingInputdAddr'}).text('상세주소');
			let dAddrDiv=$('<div>').attr({class:'form-floating'}).append(dAddrInput, dAddrLabel);
			let dAddrColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'}).append(dAddrDiv);
			let dAddrText=$('<div>').attr({class:'col-10 offset-2 offset-md-0 col-md-4 text-start fs-3 '}).css('color','red').text('test');
			siSelect.append(siOption);
			guSelect.append(guOption);
			dongSelect.append(dongOption);
			siDiv.append(siSelect);
			guDiv.append(guSelect);
			dongDiv.append(dongSelect);
			siColDiv.append(siDiv);
			guColDiv.append(guDiv);
			dongColDiv.append(dongDiv);

			nameDiv.append(nameInput).append(nameLabel);
			nameColDiv.append(nameDiv);
			formRowDiv.append(iconDiv).append(idColDiv).append(idText).append(pwdColDiv).append(pwdText).append(comNameColDiv).append(nameColDiv).append(emailColDiv).append(telColDiv).append(comnumColDiv).append(siColDiv).append(guColDiv).append(dongColDiv).append(dAddrColDiv).append(dateColDiv).append(submitCol);
			form.append(formRowDiv);
			$('.main').append(form);
			});
			//$('.main').append(startContent);
	</script>
</body>
</html>