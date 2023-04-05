package com.goodjob.module;

public class AjaxPageModule {
	public static String makePage(int totalCnt, int listSize, int pageSize, int cp) {
		 StringBuffer sb=new StringBuffer();
	      int totalPage=totalCnt/listSize+1;
	      if(totalCnt%listSize==0)totalPage--;
	      int userGroup=cp/pageSize;
	      if(cp%pageSize==0)userGroup--;
	      
	      if(userGroup!=0){
	         sb.append("<button type='button' class='btn col-1 qq' value="+((userGroup-1)*pageSize+pageSize)+"'><i class='bi bi-backspace-fill'></button>");
	      }
	      for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
	         sb.append("<button type='button' class='btn col-1' value='"+i+"'>"+i+"</button>");
	         if(i==totalPage)break;
	      }
	      if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	         sb.append("<button type='button' class='btn col-1 next' value="+((userGroup+1)*pageSize+1)+"'><i class='bi bi-backspace-reverse-fill'></i></button>");
	      }
	      return sb.toString();
	   }
}
