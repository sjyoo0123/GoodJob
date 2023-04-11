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
	<title>Good Job</title>
</head>
<script>
const IMP = window.IMP; // 생략 가능
IMP.init("imp82514218"); // 예: imp00000000a

function requestPay() {
    IMP.request_pay({
      pg: "kcp.{상점ID}",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",   // 주문번호 DB저장 필요
      name: "노르웨이 회전 의자",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      if (rsp.success) {
        // 결제 성공 시 로직
      } else {
        // 결제 실패 시 로직
      }
    });
  }
</script>
<body>
	<div class="container">
	 <%@include file="/WEB-INF/views/header.jsp"%> 
		<section>
			<article>
				<div class="row">
					<div class="offset-sm-3 col-sm-6">
						<h3 align="center">유료서비스 요금 안내</h3>
					</div>
				</div>
				<br>
				<table class="table">
					
				</table>
			</article>
		</section>
	 <%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
</body>
</html>