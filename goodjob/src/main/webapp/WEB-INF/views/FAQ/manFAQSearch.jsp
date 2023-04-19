<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
   <title>Good Job</title>
</head>
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
<style>
.btn-primary {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd;
    
}
.table{
width: 800px;

margin: auto;
}
</style>

<body>
<div class="container">
<%@include file="/WEB-INF/views/header.jsp" %>
      <section>
         <article>
             <div class="row">
             <div class="col-3">
                   <h3 align="center"><i class="bi bi-chat-dots"></i>FAQ</h3>
                </div>
             </div>
             <br>
             <br>
                <div class="row">
                <div class="offset-7 col-5">
                   <form name="manFAQSearch" action="manFAQSearch.do" method="post">
                      <i class="bi bi-search"></i>
                      <input type="text" name="search" placeholder="제목을 검색해주세요">
                      <input type="submit" value="검색하기" class="btn btn-primary">
                   </form>
                </div>
             </div>
             <br>
             <div class="row">
                <table class="table table-hover width">
                   <tbody>
                <c:if test="${empty lists }">
                   <tr>
                      <td align="center">등록된 FAQ글이 없습니다.</td>
                   </tr>
                </c:if>
                   <c:forEach var="dto" items="${lists }">
                      <c:url var="contentUrl" value="manFAQContent.do">
                         <c:param name="idx">${dto.idx }</c:param>
                      </c:url>
                      <tr class="table-info">
                         <th>제목 :</th>
                         <td ><a href="${contentUrl }">${dto.subject }</a></td>
                      </tr>
                      <tr>
                         <th>내용 : </th>
                         <td>${dto.content }</td>
                      </tr>
                      <tr>
                         <td align="right" colspan="2">
                         <input type="button" value="수정하기" class="btn btn-primary">
                         <input type="button" value="삭제하기"  class="btn btn-primary">
                         </td>
                      </tr>
                   </c:forEach>
                   </tbody>
                   <tfoot>
                      <tr>
                         <td id="td1" align="center" colspan="2">${pageStr }</td>
                      </tr>
                   </tfoot>
                </table>
             </div>
             <br>
             <div class="row">
                <div class="offset-sm-9 col-sm-3">
                   <input type="button" class="btn btn-primary" value="작성하기" onclick="location.href='manFAQAddPage.do'">
                </div>
             </div>
         </article>
      </section>

<%@include file="/WEB-INF/views/footer.jsp" %>
<script>
function page(){
   var para = $('manFAQList').serialize();
   $.ajax({
      url:'manFAQLIST.do',
      data: para,
      dataType: 'json',
      contentType:"application/json"
   }).done(function(data)){
      $('tbody').empty();
      var list = data.lists; //${list}에 해당하는 값으로 대체
      
      if(list.length == 0){
         var noListRow = $("<tr>")
            .append($("<td>")
                .attr("colspan", "5")
                .attr("align", "center")
                .text("등록된 FAQ가 없습니다."));
        $("#table").append(noListRow);
    } else { // 등록된 공고가 있을 경우
        $.each(list, function(index, dto) {
             
            var statusTd = $("<td>").append(statusButton);
            var tr = $("<tr>")
                .append($("<td>").text(dto.subject))
                .append($("<td>").text(dto.content))
            $("tbody").append(tr);
            
       
    $('#page').empty();
    $('#page').append(data.page);
  });
}})}
      
</script>
</div>
</body>
</html>