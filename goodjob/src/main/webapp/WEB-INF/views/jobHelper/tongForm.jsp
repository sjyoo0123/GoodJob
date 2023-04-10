<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
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
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="btnradio" id="job" autocomplete="off">
				  <label class="btn btn-outline-primary" for="job">직종별</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="local" autocomplete="off">
				  <label class="btn btn-outline-primary" for="local">지역별</label>
			</div>
			<div id="my-div">
			<div class="card d-none" id="jobcard">
			      <div class="card-body">
			       <select name="job" id="jobs">
			       <c:forEach var="jobs" items="${lists }">
			       <option value="${jobs }">${jobs}</option>
			       </c:forEach>
			       </select>
			        <input type="button" value="직종 검색 " onclick="jobSearch()">
			      </div>
			</div>
			<div class="card d-none" id="localcard">
			      <div class="card-body">
			        <select name="locals" id="localselect"></select>
			        <input type="button" value="지역 검색" onclick="localSearch()">
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

$.ajax({
	url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000',
      type:'get',
      contentType: "application/json"
}).done((data)=>{
	for(var i=0;i<data.regcodes.length;i++){
		var op= $('<option>').attr({id:data.regcodes[i].code.substring(0,2)}).attr({value:data.regcodes[i].name}).text(data.regcodes[i].name);
		$('#localselect ').append(op);
	}
});
$('#job').change(function(){
	$('#my-div >div').each(function() {
	    if (!$(this).hasClass('d-none')) {
	      $(this).addClass('d-none');
	    }
	  });
	  $('#jobcard').removeClass('d-none');
	 
}) 
$('#local').change(function(){
	$('#my-div >div').each(function() {
	    if (!$(this).hasClass('d-none')) {
	      $(this).addClass('d-none');
	    }
	  });
	  $('#localcard').removeClass('d-none');
	 
})
function jobSearch(){
	$.ajax({
	     url:'helperJobGet.do',
	     type:'post',
	     data:{"job":$('#jobs').val()},//전송데이터
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
        data.addColumn('string', 'category');
        data.addColumn('number', '시급');
        for(var i=0; i<jsonData.length; i++) {
        	var category = jsonData[i].category;
          data.addRow([category, jsonData[i].price]);
        }
        var options = {
          title: '직종',
          curveType: 'function',
          width: 800,
          height: 500,
          hAxis : {
				title : '평균 시급'
			},
			vAxis: {
			},
          legend: { position: 'bottom' }
        };
        var chart = new google.visualization.BarChart(document.getElementById('myPieChart'));
        chart.draw(data, options);
    }
}
function localSearch(){
	$.ajax({
	     url:'helperLocalGet.do',
	     type:'post',
	     data:{"local":$('#localselect').val()},//전송데이터
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
        data.addColumn('string', 'category');
        data.addColumn('number', '시급');
        for(var i=0; i<jsonData.length; i++) {
        	var category = jsonData[i].category;
          data.addRow([category, jsonData[i].price]);
        }
        var options = {
          title: '지역',
          curveType: 'function',
          width: 800,
          height: 500,
          hAxis : {
				title : '평균 시급'
			},
			vAxis: {
			},
          legend: { position: 'bottom' }
        };
        var chart = new google.visualization.BarChart(document.getElementById('myPieChart'));
        chart.draw(data, options);
    }
}
</script>
</body>
</html>