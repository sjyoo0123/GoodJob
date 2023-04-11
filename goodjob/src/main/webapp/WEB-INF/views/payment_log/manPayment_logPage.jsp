<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp82514218"); // 예: imp00000000a

function requestPay() {
    IMP.request_pay({
      pg: "inicis.{INIBillTst}",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",   // 주문번호 DB저장 필요
      name: "노르웨이 회전 의자",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남x구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      if (rsp.success) {
    	  IMP.request_pay({ /** 요청 객체를 추가해주세요 */ },
    			  function (rsp) {
    			    if (rsp.success) {
    			      // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
    			      // jQuery로 HTTP 요청
    			      jQuery.ajax({
    			        url: "manPayment_logEnd.do", 
    			        method: "POST",
    			        headers: { "Content-Type": "application/json" },
    			        data: {
    			          imp_uid: rsp.imp_uid,            // 결제 고유번호
    			          merchant_uid: rsp.merchant_uid   // 주문번호
    			        }
    			      }).done(function (data) {
    			        // 가맹점 서버 결제 API 성공시 로직
    			        alert('결제에 성공하셨습니다');
    			      })
    			    } else {
    			      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
    			    }
    			  });
      } else {
        //결제 실패시
    	  alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
      }
    });
  }
</script>
	<title>Good Job</title>
</head>
<body>
	<div class="container">
	 <%@include file="/WEB-INF/views/header.jsp"%> 
		<section>
			<article>
				<div class="row">
					<div class="clo-sm-3">
						<h3>결제</h3>
					</div>
				</div>
				<br>
				<table class="table">
					<thead>
						<tr>
							<th>요금제 정보</th>
							<th>기간</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="offset-sm-6 col-sm-3">
						총 갯수 :
					</div>
					<div class="col-sm-2">
						총 합 :
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<h3>결제 방법</h3>
					</div>
					<input type="radio" value="이니시스">이니시스
				</div>
				<div class="row">
					<div class="offset-sm-8 col-sm-3">
						<input type="button" value="결제하기" onclick="requestPay()" id="button">
					</div>
				</div>
			</article>
		</section>
	 <%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
</body>
</html>