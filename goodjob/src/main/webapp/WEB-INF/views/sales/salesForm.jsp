<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var s_status='${sessionScope.status}';
	var s_category='${sessionScope.scategory}';
	var check_category='관리자';
	if( s_status==''){
		window.alert('로그인이 필요합니다');
		location.href='login.do';
	}else if(s_status=='블랙'){
		window.alert('차단된 회원입니다');
		location.href='index.do';
	}else if(s_category!=check_category){
		window.alert(check_category+'만 이용 가능한 페이지입니다');
		location.href='index.do';
	}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert title here</title>
 
  
</head> 
<body>
	<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
			<h1><i class="bi bi-bar-chart-line-fill"></i>매출 통계</h1>
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="btnradio" id="period" autocomplete="off" checked="checked">
				  <label class="btn btn-outline-primary" for="period">기간 매출</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="month" autocomplete="off">
				  <label class="btn btn-outline-primary" for="month">월 매출</label>
			</div>
			<div id="my-div">
			<div class="card" id="rangecard">
			      <div class="card-body">
			        시작일
			        <input type="date" name="date1" id="startdate">
			        종료일
			        <input type="date" name="date2" id="enddate">
			        <input type="button" value="기간 검색 " onclick="periodSearch()">
			      </div>
			</div>
			<div class="card d-none" id="monthcard">
			      <div class="card-body">
			        월 선택
			        <input type="month" name="monthdate" id="monthdate">
			        <input type="button" value="월 검색 " onclick="monthSearch()">
			        (6개월 전 데이터까지 검색)
			      </div>
			</div>
 		   </div>
			<div id="myPieChart"></div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>

<script>
google.charts.load('current', { packages: ['corechart'] });

$('#period').change(function(){
	$('#my-div >div').each(function() {
	    if (!$(this).hasClass('d-none')) {
	      $(this).addClass('d-none');
	    }
	  });
	  $('#rangecard').removeClass('d-none');
	 
}) 
$('#month').change(function(){
	$('#my-div >div').each(function() {
	    if (!$(this).hasClass('d-none')) {
	      $(this).addClass('d-none');
	    }
	  });
	  $('#monthcard').removeClass('d-none');
	 
}) 
function periodSearch(){
	$.ajax({
	     url:'salesGetPeriod.do',
	     type:'post',
	     data:{"startdate":$('#startdate').val(),"enddate":$('#enddate').val()},//전송데이터
	     dataType:'json'
	     //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
	  }).done((data)=>{
	     //성공시 실행
		google.charts.setOnLoadCallback(function () {
			drawChart(data)
		});
	  }).fail(()=>{
	     //실패시 실행
	  }).always(()=>{
	     //성공여부 무관 실행
		   
	  })
	  function drawChart(listdata) {
      // Define the chart to be drawn.
    	var jsonData = listdata;
    	var jsonData = JSON.parse(listdata.lists);
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Date');
        data.addColumn('number', 'Price');
        for(var i=0; i<jsonData.length; i++) {
        	var date = jsonData[i].date;
          data.addRow([date, jsonData[i].price]);
        }
        var options = {
          title: '날짜',
          curveType: 'function',
          width: 800,
          height: 400,
          hAxis : {
				title : '금액'
			},
			vAxis: {
			format: 'MMM d, yyyy'
			},
          legend: { position: 'bottom' }
        };
        var chart = new google.visualization.BarChart(document.getElementById('myPieChart'));
        chart.draw(data, options);
    }
}
function monthSearch(){
	
	$.ajax({
	     url:'salesGetMonth.do',
	     type:'post',
	     data:{"monthdate":$('#monthdate').val()},//전송데이터
	     dataType:'json'
	     //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
	  }).done((data)=>{
	     //성공시 실행
	
		google.charts.setOnLoadCallback(function () {
			drawChart(data)
		});
	  }).fail(()=>{
	     //실패시 실행
	  }).always(()=>{
	     //성공여부 무관 실행
		   
	  })
	  function drawChart(listdata) {
     // Define the chart to be drawn.
   	var jsonData = listdata;
   	var jsonData = JSON.parse(listdata.lists);
       var data = new google.visualization.DataTable();
       data.addColumn('string', 'date');
       data.addColumn('number', 'price');
       for(var i=0; i<jsonData.length; i++) {
         var date = jsonData[i].date;
         data.addRow([date, jsonData[i].price]);
       }

       var options = {
         title: '날짜',
         curveType: 'function',
         width: 800,
         height: 400,
         hAxis : {
				title : '금액'
			},
			vAxis: {
				format: 'MMM, yyyy'
			}
       };
       var chart = new google.visualization.BarChart(document.getElementById('myPieChart'));
       chart.draw(data, options);
   }
}
</script>
</body>
</html>


















