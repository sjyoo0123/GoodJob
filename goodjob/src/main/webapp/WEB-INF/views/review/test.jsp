<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
    <title>Document</title>
    <script>
        $(document).ready(function() {
            //첫 번째 버튼 이벤트
            $("#firstButton").on("click", function() {
                var bodyHtml = "<button id='secondButton'>두 번째 버튼</button>";
                $("#mainDiv").append(bodyHtml);
            });
            //두 번째 버튼 이벤트
            $(document).on("click", "#secondButton", function() {
                alert("두 번째 버튼을 클릭했습니다.");
            });
        });
    </script>
</head>
<body>
    <div id="mainDiv">
        <button id="firstButton">첫 번째 버튼</button>
    </div>
</body>

</html>