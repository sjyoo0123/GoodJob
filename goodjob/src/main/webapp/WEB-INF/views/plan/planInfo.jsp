<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<style>
	.neonLamp {
  color: white;
  text-shadow: 0px 0px 48px #903d5d;
  font-family: monospace;
  font-size: 24px;
  line-height: 99px;
}

.neonLamp {
  animation: neonLamp 1s ease infinite;
  -moz-animation: neonLamp 1s ease infinite;
  -webkit-animation: neonLamp 1s ease infinite;
  -o-animation: neonLamp 1s ease infinite;
}

@-webkit-keyframes neonLamp {
  0%, 100% {
    text-shadow: 0px 0px 16px #00ffff,
      0px 0px 48px #00ffff,
      0px 0px 160px #00ffff,
      0px 0px 160px #00ffff,
      0px 0px 6.4px #00ffff,
      3px 4px 1.6px #00ffff;
    color: white;
  }
  50% {
    text-shadow: 0px 0px 8px #61e2ff,
      0px 0px 24px #61e2ff,
      0px 0px 80px #61e2ff,
      0px 0px 80px #61e2ff,
      0px 0px 3.2px #61e2ff,
      3px 4px 1.6px #fc03f4;
    color: white;
  }
}
.gneonLamp {
  color: white;
  text-shadow: 0px 0px 48px #903d5d;
  font-family: monospace;
  font-size: 24px;
  line-height: 99px;
}

.gneonLamp {
  animation: gneonLamp 1s ease infinite;
  -moz-animation: gneonLamp 1s ease infinite;
  -webkit-animation: gneonLamp 1s ease infinite;
  -o-animation: gneonLamp 1s ease infinite;
}

@-webkit-keyframes gneonLamp {
  0%, 100% {
    text-shadow: 0px 0px 16px #ffe36e,
      0px 0px 48px #ffe36e,
      0px 0px 160px #ffe36e,
      0px 0px 160px #ffe36e,
      0px 0px 6.4px #ffe36e,
      3px 4px 1.6px #ffe36e;
    color: white;
  }
  50% {
    text-shadow: 0px 0px 8px #eba511,
      0px 0px 24px #eba511,
      0px 0px 80px #eba511,
      0px 0px 80px #eba511,
      0px 0px 3.2px #eba511,
      3px 4px 1.6px #eba511;
    color: white;
  }
}
	</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<div class="row justify-content-center">
			<h1>요금제 안내</h1>
			<hr class="my-4">
			<div class="col-11">
				<div class="row align-items-center">
					<div class="col-11">
						<h1>UP 요금제</h1>
						<hr class="my-4">
						<div class="card bg-primary bg-opacity-10">
							<div class="card-body">
							<div class="row">
							<input type="hidden" id="upIdx"><div id="upCount" class="col-7"></div><div id="upPrice" class="col-3 fs-2"></div>
							<div class="col-2"><button class="btn btn-primary btn-icon-split btn-lg" onclick="BuyUp()">
    <span class="icon text-white-50">
        <i class="bi bi-cart4"></i>
    </span>
    <span class="text">구매</span>
</button></div>
							</div>
							</div>
						</div>
						<br>
						<br>
						<h1>VIP 요금제</h1>
						<hr class="my-4">
						<h2>실버등급</h2>
						<div class="card bg-primary bg-opacity-10">
							<div class="card-body">
							<div class="row">
							<input type="hidden" id="s_vipIdx"><div id="s_vipPeriod" class="col-7"></div><div id="s_vipPrice" class="col-3 fs-2"></div>
							<div class="col-2"><button class="btn btn-primary btn-icon-split btn-lg" onclick="Buys_vip()">
    <span class="icon text-white-50">
        <i class="bi bi-cart4"></i>
    </span>
    <span class="text">구매</span>
</button></div>
							</div>
							</div>
						</div>
						<div class="col-3 bg-dark text-center"><h2 class="gneonLamp fs-1">골드등급</h2></div>
						<div class="card bg-primary bg-opacity-10">
							<div class="card-body">
							<div class="row ">
							<input type="hidden" id="g_vipIdx"><div id="g_vipPeriod" class="col-7"></div><div id="g_vipPrice" class="col-3 fs-2"></div>
							<div class="col-2"><button class="btn btn-primary btn-icon-split btn-lg" onclick="Buyg_vip()">
    <span class="icon text-white-50">
        <i class="bi bi-cart4"></i>
    </span>
    <span class="text">구매</span>
</button></div>
							</div>
							</div>
						</div>
						<div class="col-3 bg-dark text-center"><h2 class="neonLamp fs-1">다이아등급</h2></div>
						<div class="card bg-primary bg-opacity-10">
							<div class="card-body">
							<div class="row">
							<input type="hidden" id="d_vipIdx"><div id="d_vipPeriod" class="col-7"></div><div id="d_vipPrice" class="col-3 fs-2"></div>
							<div class="col-2"><button class="btn btn-primary btn-icon-split btn-lg" onclick="Buyd_vip()">
    <span class="icon text-white-50">
        <i class="bi bi-cart4"></i>
    </span>
    <span class="text">구매</span>
</button></div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
				<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
<script>
$(document).ready(function() {
    $.ajax({
        url: "planInfoUp.do",
        method: "POST",
        success: function(data) {
            $("#upIdx").val(data[0].idx);
            $("#upPrice").append(data[0].plan_price+"원");
            $("#upCount").append("<select name='count' class='form-select fs-2'>");
            for (var i = 0; i < data.length; i++) {
                $("#upCount select").append("<option value='"+data[i].idx+"'>"+data[i].plan_name+'('+data[i].count+'회)'+"</option>");
            }
            $("#upCount").append("</select>");
            
            $("#upCount select").change(function(e) {
            	var count = $('select[name="count"]').val();
                $.ajax({
                    url: "planInfoUp.do",
                    method: "POST",
                    data: {idx: count},
                    success: function(data2) {
                        $("#up").empty();
                        $("#upPrice").empty();
                        $("#upIdx").empty();
                        $("#upIdx").val(data2[0].idx);
                        $("#upPrice").append(data2[0].plan_price+"원");
                    }
                });
            });

        }
    });
});
$(document).ready(function() {
    $.ajax({
        url: "planInfoVip.do",
        method: "POST",
        data: {floor: '실버'},
        success: function(data) {
            $("#s_vipIdx").val(data[0].idx);
            $("#s_vipPrice").append(data[0].plan_price+"원");
            $("#s_vipPeriod").append("<select name='splan_idx' class='form-select fs-2'>");
            for (var i = 0; i < data.length; i++) {
                $("#s_vipPeriod select").append("<option value='"+data[i].idx+"'>"+data[i].plan_name+'('+data[i].plan_period+'일)'+"</option>");
            }
            $("#s_vipPeriod").append("</select>");
            
            $("#s_vipPeriod select").change(function(e) {
            	var splan_idx = $('select[name="splan_idx"]').val();
                $.ajax({
                    url: "planInfoVip.do",
                    method: "POST",
                    data: {
                        idx: splan_idx,
                        floor: '실버'
                    },
                    success: function(data2) {
                        $("#s_vipPrice").empty();
                        $("#s_vipIdx").empty();
                        $("#s_vipIdx").val(data2[0].idx);
                        $("#s_vipPrice").append(data2[0].plan_price+"원");
                    }
                });
            });

        }
    });
});
$(document).ready(function() {
    $.ajax({
        url: "planInfoVip.do",
        method: "POST",
        data: {floor: '골드'},
        success: function(data) {
            $("#g_vipIdx").val(data[0].idx);
            $("#g_vip").append(data[0].plan_name);
            $("#g_vipPrice").append(data[0].plan_price+"원");
            $("#g_vipPeriod").append("<select name='g_plan_idx' class='form-select fs-2'>");
            for (var i = 0; i < data.length; i++) {
                $("#g_vipPeriod select").append("<option value='"+data[i].idx+"'>"+data[i].plan_name+'('+data[i].plan_period+'일)'+"</option>");
            }
            $("#g_vipPeriod").append("</select>");
            
            $("#g_vipPeriod select").change(function(e) {
            	var g_plan_idx = $('select[name="g_plan_idx"]').val();
                $.ajax({
                    url: "planInfoVip.do",
                    method: "POST",
                    data: {
                        idx: g_plan_idx,
                        floor: '골드'
                    },
                    success: function(data2) {
                        $("#g_vipPrice").empty();
                        $("#g_vipIdx").empty();
                        $("#g_vipIdx").val(data2[0].idx);
                        $("#g_vipPrice").append(data2[0].plan_price+"원");
                    }
                });
            });

        }
    });
});
$(document).ready(function() {
    $.ajax({
        url: "planInfoVip.do",
        method: "POST",
        data: {floor: '다이아'},
        success: function(data) {
            $("#d_vipIdx").val(data[0].idx);
            $("#d_vip").append(data[0].plan_name);
            $("#d_vipPrice").append(data[0].plan_price+"원");
            $("#d_vipPeriod").append("<select name='d_plan_idx' class='form-select fs-2'>");
            for (var i = 0; i < data.length; i++) {
                $("#d_vipPeriod select").append("<option value='"+data[i].idx+"'>"+data[i].plan_name+'('+data[i].plan_period+'일)'+"</option>");
            }
            $("#d_vipPeriod").append("</select>");
            
            $("#d_vipPeriod select").change(function(e) {
            	var d_plan_idx = $('select[name="d_plan_idx"]').val();
                $.ajax({
                    url: "planInfoVip.do",
                    method: "POST",
                    data: {
                        idx: d_plan_idx,
                        floor: '다이아'
                    },
                    success: function(data2) {
                        $("#d_vipPrice").empty();
                        $("#d_vipIdx").empty();
                        $("#d_vipIdx").val(data2[0].idx);
                        $("#d_vipPrice").append(data2[0].plan_price+"원");
                    }
                });
            });

        }
    });
});
function BuyUp(){
	var idx=document.getElementById("upIdx").value;
	location.href='manPayment_logPage.do?idx='+idx;
}
function Buys_vip(){
	var idx=document.getElementById("s_vipIdx").value;
	location.href='manPayment_logPage.do?idx='+idx;
}
function Buyg_vip(){
	var idx=document.getElementById("g_vipIdx").value;
	location.href='manPayment_logPage.do?idx='+idx;
}
function Buyd_vip(){
	var idx=document.getElementById("d_vipIdx").value;
	location.href='manPayment_logPage.do?idx='+idx;
}
</script>
</body>
</html>