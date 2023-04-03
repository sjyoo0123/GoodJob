<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
window.alert('${msg}');
if(${sort}==1){
window.opener.ajaxgo();
window.self.close();
}else{
opener.location.href='manBlackList.do';
window.self.close();
}
</script>