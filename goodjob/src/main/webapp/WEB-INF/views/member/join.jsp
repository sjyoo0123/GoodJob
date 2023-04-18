<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<title>Good Job</title>
</head>

<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
				<div class="row text-center p-4 m-4">
					<div class="col fs-1 fw-bold subject">회원가입</div>
				</div>
				<div class="row text-center p-4 main">
					<div class="col p-4">
						<div class="card">
							<img alt="123" src="img/main.jpg" class="card-img-top">
							<div class="card-body">
								<button type="button"
									class="btn btn-secondary btn-lg w-100 normal">개인 회원가입</button>
							</div>
						</div>
	
					</div>
					<div class="col p-4">
						<div class="card">
							<img alt="123" src="img/main.jpg" class="card-img-top">
							<div class="card-body">
								<button type="button"
									class="btn btn-secondary btn-lg w-100 company">기업 회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('d67c0e8efbe506e6ef450c637bab0204'); 
</script>
	<script>
	function loginWithKakao() {
	    Kakao.Auth.authorize({
	      redirectUri: 'http://localhost:9090/goodjob/oauth/getToken.do',
	    });
	    
	  }


	
	  /////////////////////////////
	var idcheck=false;
	var pwdcheck=false;
	var emailcheck=false;
	$(document).on('click','.pwdcon',function(){
		if($(this).hasClass('bi-eye-slash-fill')){
			$(this).removeClass('bi-eye-slash-fill');
			$(this).addClass('bi-eye-fill');
			$('#floatingInputPwd').attr('type','password');
		}else{
			$(this).removeClass('bi-eye-fill');
			$(this).addClass('bi-eye-slash-fill');
			$('#floatingInputPwd').attr('type','text');
		}
	});
	$(document).on('focusout','#floatingInputId',function(){
	    var idRegex = /^[a-z0-9]{8,20}$/;
	    var idValue = $(this).val();
	    if (!idRegex.test(idValue)) { 
	        $('#idtest').text('영문 소문자와 숫자로 8~20자 이내로 입력해주세요.');
	        idcheck=false;
	    } else { 
	        $.ajax({
	            url:'check.do',
	            data:{id:idValue}
	        }).done((data)=>{
	            if(data==1){
	                $('#idtest').text('등록된 아이디가 있습니다');
	                idcheck=false;
	            }else if(data==0){
	                $('#idtest').text('사용 가능한 아이디입니다');
	                idcheck=true;
	            }
	        });
	    }
	});
	$(document).on('change','#floatingInputPwd',function(){
	    var password = $(this).val();
	    var password_regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+]).{8,}$/;
	    if (password_regex.test(password)) {
	        $('#pwdtest').text('사용 가능한 비밀번호입니다');
	        pwdcheck=true;
	    } else {
	        $('#pwdtest').text('영문 대/소문자, 숫자, 특수문자를 포함한 8자리 이상의 비밀번호를 입력해주세요');
	        pwdcheck=false;
	    }
	});
	$(document).on('submit', 'form', function(event) {
		if(idcheck&&pwdcheck&&email){
	    var filled = true;
	    $(this).find('input, select, textarea').each(function() {
	        if ($(this).val() === ''||$(this).text()=== '' ) {
	        	if($(this).is('select')){
	        		if($(this).text() === '성별'||$(this).text() === '시 도'||$(this).text() === '시 구 군'||$(this).text() === '동 읍 면')
	        			filled = false;
		           		 return false; 
	        	}
	            filled = false;
	            return false; 
	        }
	    });
	    if (filled) {
	        return true;
	    } else {
	        event.preventDefault();
	        alert('모든 항목을 입력해주세요');
	        return false;
	    }
		}else{
			event.preventDefault();
			alert('아이디,비밀번호,이메일 항목을 확인해주세요')
		}
	});
	$(document).on('focusout', '#floatingInputEmail', function() {
		  var emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
		  var email = $(this).val();
		  if (emailRegex.test(email)) {
		    $.ajax({
		      url: 'check.do',
		      data: { email: email }
		    }).done((data) => {
		      if (data == 1) {
		        $('#emailtest').text('등록된 이메일이 있습니다');
		        emailcheck = false;
		      } else if (data == 0) {
		        $('#emailtest').text('사용 가능한 이메일입니다');
		        emailcheck = true;
		      }
		    });
		  } else {
		    $('#emailtest').text('유효한 이메일 주소를 입력하세요.');
		    emailcheck = false;
		  }
		});
		//backlink
		let ibutton=$('<a>').attr('href','join.do');
		let icon=$('<i>').attr('class','bi bi-arrow-90deg-left');
		let iconDiv=$('<div>').attr('class','col-9 fs-1 offset-3 text-start').append(ibutton.append(icon));
		//id
		let idInput = $('<input>').attr({type:'text',id:'floatingInputId',placeholder:'id',class:'form-control',name:'id'});
		let idLabel=$('<label>').attr({for:'floatingInputId'}).text('아이디');
		let idDiv=$('<div>').attr({class:'form-floating'}).append(idInput, idLabel);
		let idColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'}).append(idDiv);
		let idText=$('<div>').attr({class:'col-10 offset-2 offset-md-0 col-md-4 text-start fs-6',id:'idtest'}).css('color','red');
		//pwd
		let pcon=$('<i>').attr('class','pwdcon bi bi-eye-fill fs-4');
		let pbutton=$('<a>').attr({'href':'#;','class':'position-absolute top-50 end-0 translate-middle-y'}).append(pcon);
		let pwdInput = $('<input>').attr({type:'password',id:'floatingInputPwd',placeholder:'password',class:'form-control',name:'pwd'});
		let pwdLabel=$('<label>').attr({for:'floatingInputPwd'}).text('비밀번호');
		let pwdDiv=$('<div>').addClass('form-floating position-relative').append(pwdInput, pwdLabel,pbutton);
		let pwdColDiv=$('<div>').addClass('col-10 col-md-4 offset-md-4 offset-2').append(pwdDiv);
		let pwdText=$('<div>').attr({class:'col-10 offset-2 offset-md-0 col-md-4 text-start fs-6',id:'pwdtest'}).css('color','red');
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
		let emailText=$('<div>').attr({class:'col-10 offset-2 offset-md-0 col-md-4 text-start fs-6',id:'emailtest'}).css('color','red');
		//tel
		let telInput = $('<input>').attr({type:'text',id:'floatingInputTel',placeholder:'tel',class:'form-control',name:'tel'});
		let telLabel=$('<label>').attr({for:'floatingInputTel'}).text('전화번호');
		let telDiv=$('<div>').addClass('form-floating').append(telInput, telLabel);
		let telColDiv=$('<div>').addClass('col-10 col-md-4 offset-md-4 offset-2').append(telDiv);
		//submit
		let submit =$('<button>').attr({'type':'submit','class':'btn btn-outline-primary'}).text('가입');
		let submitCol=$('<div>').addClass('col-10 col-md-4 offset-md-4 offset-2').append(submit);
		//addr
		let mAddrColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'});
		let mAddrDiv=$('<div>').attr({class:'form-floating input-group'});
		let siSelect=$('<select>').attr({class:'form-select col-4 mainAddr','aria-label':'Default select example',name:'addr'});
		let siOption=$('<option>').attr({label:'시 도',selected:'selected',disabled:'disabled'});
		siSelect.append(siOption);
			$.ajax({
				url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000',
			      type:'get',
			      contentType: "application/json"
			}).done((data)=>{
				for(var i=0;i<data.regcodes.length;i++){
					var op= $('<option>').attr({id:data.regcodes[i].code.substring(0,2)}).text(data.regcodes[i].name);
					siSelect.append(op);
				}
			});
		let guSelect=$('<select>').attr({class:'form-select col-4 subAddr','aria-label':'Default select example',name:'addr'});
		let guOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('시 구 군');
		guSelect.append(guOption);
		$(document).on('change', '.mainAddr', function(){
			$('.subAddr').empty();
			let guOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('시 구 군');
			guSelect.append(guOption);
			$('.ssubAddr').empty();
			let dongOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('동 읍 면');
			dongSelect.append(dongOption);
			var data= $('.mainAddr  option:selected').attr('id');
			$.ajax({
				url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern='+data+'*00000&is_ignore_zero=true',
			      type:'get',
			      contentType: "application/json"
			}).done((data)=>{
				for(var i=0;i<data.regcodes.length;i++){
					if (i > 0 && data.regcodes[i].code.substring(0, 5) - 1 == data.regcodes[i-1].code.substring(0, 5)) {
						  if(data.regcodes[i-1].code.substring(0, 5).substr(-1) == '0'){
					   		 $('#' + data.regcodes[i-1].code.substring(0, 5)).remove();
						  }
					  }
					  var name = data.regcodes[i].name;
					  var sname = name.split(' ');
					  if(sname.length==3){
						  var op = $('<option>').attr({id: data.regcodes[i].code.substring(0, 5)}).text(sname[1]+' '+sname[2]);
						  guSelect.append(op);
					  }else{
						  
					  var op = $('<option>').attr({id: data.regcodes[i].code.substring(0, 5)}).text(sname.slice(1));
					  guSelect.append(op);
					  }
				}
			});
		});
		let dongSelect=$('<select>').attr({class:'form-select col-4 ssubAddr','aria-label':'Default select example',name:'addr'});
		let dongOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('동 읍 면');
		dongSelect.append(dongOption);
		$(document).on('change','.subAddr',function(){
			$('.ssubAddr').empty();
			let dongOption=$('<option>').attr({selected:'selected',disabled:'disabled'}).text('동 읍 면');
			dongSelect.append(dongOption);
			var data= $('.subAddr  option:selected').attr('id');
			$.ajax({
				url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern='+data+'*00&is_ignore_zero=true',
				type:'get',
				contentType: "application/json"
			}).done((data)=>{
				for(var i=0;i<data.regcodes.length;i++){
					 var name=data.regcodes[i].name;
					 var sname=name.split(' ');
						 var op=$('<option>').attr({id:data.regcodes[i].code}).text(sname.slice(sname.length-1)); 
						 dongSelect.append(op);
				}
			});
		});
				mAddrDiv.append(siSelect).append(guSelect).append(dongSelect);
				mAddrColDiv.append(mAddrDiv);
		//date
		let dateColDiv=$('<div>').attr({class:'col-10 col-md-4 offset-md-4 offset-2'});
		let dateDiv=$('<div>').attr({class:'form-floating'});
		let dateInput=$('<input>').attr({type:'text',id:'date',class:'form-control',name:'birth_s'});
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
				let optionN=$('<option>').attr({disabled:'disabled',selected:'selected'}).text('성별');
				let optionM=$('<option>').attr({value:'남성'}).text('남성');
				let optionG=$('<option>').attr({value:'여성'}).text('여성');
				let addrLabel=$('<label>').attr({for:'date'}).text('생년월일');
				//date
					dateInput.datepicker({
	         format: 'yyyy-mm-dd',
	         autoclose: true,
	         templates: {
	            leftArrow: '&laquo;',
	            rightArrow: '&raquo;',
	         },
	         showWeekDays: true,
	         title: '생년월일', 
	         toggleActive: true, 
	         language: 'ko', 
	      });
				dateDiv.append(dateInput).append(addrLabel);
				dateColDiv.append(dateDiv);
				nameDiv.append(nameInput).append(nameLabel);
				nameColDiv.append(nameDiv);
				genSelect.append(optionN).append(optionM).append(optionG);
				genDiv.append(genSelect);
				genColDiv.append(genDiv);
				formRowDiv.append(iconDiv,idColDiv,idText,pwdColDiv,pwdText,nameColDiv,emailColDiv,emailText).append(telColDiv).append(genColDiv).append(mAddrColDiv).append(dateColDiv).append(submitCol);
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
			//date
			dateInput.datepicker({
	         format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	         autoclose: true,
	         templates: {
	            leftArrow: '&laquo;',
	            rightArrow: '&raquo;',
	         }, 
	         showWeekDays: true,
	         title: '설립일',
	         todayHighlight: true,
	         toggleActive: true,
	         language: 'ko',
	      });
				let addrLabel=$('<label>').attr({for:'date'}).text('설립일');
				dateDiv.append(dateInput).append(addrLabel);
				dateColDiv.append(dateDiv);
			nameDiv.append(nameInput).append(nameLabel);
			nameColDiv.append(nameDiv);
			formRowDiv.append(iconDiv).append(idColDiv).append(idText).append(pwdColDiv).append(pwdText).append(comNameColDiv).append(nameColDiv).append(emailColDiv).append(telColDiv).append(comnumColDiv).append(mAddrColDiv).append(dAddrColDiv).append(dateColDiv).append(submitCol);
			form.append(formRowDiv);
			$('.main').append(form);
			});
			//$('.main').append(startContent);
	</script>
</body>
</html>