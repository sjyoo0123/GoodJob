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

<title>Insert title here</title>

</head>
<body>
    <div id="joblist1"></div>
    <hr>
    <div id="joblist2"></div>
    <script>
$(document).ready(function() {
    $.ajax({
        url: "job.do",
        success: function(data) {
            for (var i = 0; i < data.length; i++) {
                $("#joblist1").append("<input type='radio' value='" + data[i] + "' name='job1' id='job1_"+i+"' class='btn-check' autocomplete='off'><label class='btn btn-outline-primary' for='job1_"+i+"'>"+data[i]+"</label>");
            }
            
            $(document).on('click','#joblist1 input',function(e) {
                var job1val = $('input[name="job1"]:checked').val();
                $.ajax({
                    url: "job.do",
                    method: "POST",
                    data: {job1: job1val},
                    success: function(data) {
                        $("#joblist2").empty();
                        for (var i = 0; i < data.length; i++) {
                            $("#joblist2").append("<button type='button' class='btn btn-outline-dark'>" + data[i] + "</button>");
                        }
                        $("#joblist2 button").click(function() {
                            var btnval = $(this).text();
                            opener.resumeUpdate.job.value=btnval;
                            window.self.close();
                        });
                    }
                });
            });
        }
    });
});
</script>
</body>
</html>
