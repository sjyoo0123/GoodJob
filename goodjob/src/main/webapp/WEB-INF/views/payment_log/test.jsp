<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp82514218"); // 예: imp00000000a

function requestPay(pg= '테스트 PG.TC0ONETIME') {
  IMP.request_pay({
    pg: "kakaopay.{TC0ONETIME}",
    pay_method: "card",
    merchant_uid: "ORD20180131-0000013",   // 주문번호
    name: "노르웨이 회전 의자",
    amount: 100,                         // 숫자 타입
    buyer_email: "gildong@gmail.com",
    buyer_name: "홍길동",
    buyer_tel: "010-4242-4242",
    buyer_addr: "서울특별시 강남구 신사동",
    buyer_postcode: "01181"
  }, function (rsp) { // callback
    if (rsp.success) {
      // 결제 성공 시 로직
    	console.log(rsp);
    } else {
      // 결제 실패 시 로직
    	console.log(rsp);
    }
  });
}

</script>
</head>
<body>
<div class="row">
<div class="offset-sm-8 col-sm-3">
	<input type="button" value="결제하기" onclick="requestPay()" id="button">
</div>
</div>
</body>
</html>