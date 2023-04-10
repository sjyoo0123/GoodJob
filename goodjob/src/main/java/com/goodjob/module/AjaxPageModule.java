package com.goodjob.module;

public class AjaxPageModule {
	public static String makePage(int totalCnt, int listSize, int pageSize, int cp) {
		 StringBuffer sb=new StringBuffer();
	      int totalPage=totalCnt/listSize+1;
	      if(totalCnt%listSize==0)totalPage--;
	      int userGroup=cp/pageSize;
	      if(cp%pageSize==0)userGroup--;
	      System.out.println(totalPage+"'"+userGroup);
	      sb.append("<div class='row justify-content-evenly'><button type='button'");
	      if(userGroup<=0){
	    	  sb.append(" disabled");
	      }else {
	    	  sb.append(" value='"+((userGroup-1)*pageSize+pageSize)+"'");
	      }
	    	sb.append(" class='btn col-1 qq'><i class='bi bi-backspace-fill'></i></button>");  
	      for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
	         sb.append("<button type='button'");
	         if(i==cp) {
	        	 sb.append(" disabled");
	         }
	        sb.append(" class='btn col-1' value='"+i+"'>"+i+"</button>");
	         if(i>=totalPage)break;
	      }
	      sb.append("<button type='button'");
	      if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	    	  sb.append( "value="+((userGroup+1)*pageSize+1)+"'");
	      }else {
	    	  sb.append(" disabled");
	      }
	      sb.append(" class='btn col-1 next'><i class='bi bi-backspace-reverse-fill'></i></button></div>");
	      return sb.toString();
	   }
}
