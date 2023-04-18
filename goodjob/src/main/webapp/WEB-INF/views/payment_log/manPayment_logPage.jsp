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
	
function requestPay(pg= '테스트 PG.TC0ONETIME') {
    let planType = ''; // 변수 초기화 inisis
    if ('${planDto.plan_type}' === 'VIP') {
        planType = 'VIP';
    } else if ('${planDto.plan_type}' === 'UP') {
        planType = 'UP';
    }
    IMP.request_pay({ 
      pg: "kakaopay.{TC0ONETIME}", //inicis
      pay_method: "card",
      merchant_uid: ${str},   // 주문번호
      name: '${planDto.plan_name}',
      amount: ${planDto.plan_price},                         // 숫자 타입 나중에
      buyer_email: '${dto.email}',
      buyer_name: '${dto.name}',
      buyer_tel: '${dto.tel}',
      buyer_addr: '${dto.addr}',	
      buyer_postcode: "",
      custom_data : "${planDto.idx}",
    }, function (rsp) { // callback
      if (rsp.success) {
        // 결제 성공 시 로직	
	      jQuery.ajax({
	        url: "manPayment_logEnd.do", 
	        method: "POST",
	        headers: { "Content-Type": "application/json" },
	        data: JSON.stringify(rsp)

	      }).done(function (data) {
	        // 가맹점 서버 결제 API 성공시 로직
	       	alert("결제에 성공하셨습니다.");	
	        location.href="company.do";
	      })
    	  console.log(rsp);
      } else {
        // 결제 실패 시 로직
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
	 	<c:set var="logIdx" value="${sessionScope.sidx}" />
		<c:set var="logName" value="${sessionScope.sname}" />
		<c:set var="logCategory" value="${sessionScope.scategory}" />
		<c:set var="nor" value="개인"></c:set>
		<c:set var="com" value="기업"></c:set>
		<c:set var="man" value="관리자"></c:set>
		<c:set var="logStatus" value="${sessionScope.status}"></c:set>
		<section>
			<article>
				<div class="row">
					<div class="col-sm-3">
						<h3>결제</h3>
					</div>
				</div>
				<br>
				<table class="table table-hover">
					<thead>
						<tr class="table-dark">
							<th>요금제 정보</th>
							<th>타입</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty planDto }">
							<tr>
								<td colspan="3">등록된 요금제가 없습니다</td>
							</tr>
						</c:if>
							<tr>
								<td>${planDto.plan_name }</td>
								<td>${planDto.plan_type }</td>
								<td>${planDto.plan_price }</td>
							</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="offset-sm-8 col-sm-3">
						<input type="button" value="결제하기" onclick="requestPay()" id="button" class="btn btn-primary">
					</div>
				</div>
			</article>
		</section>
	 <%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
</body>
</html>