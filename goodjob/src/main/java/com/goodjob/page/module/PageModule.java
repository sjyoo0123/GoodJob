package com.goodjob.page.module;

public class PageModule {

	public static String makePage(String pagename, int totalCnt, 
			int listSize,int pageSize, int cp) {
		StringBuffer sb = new StringBuffer();
		int totalPage = totalCnt / listSize + 1;
		if (totalCnt % listSize == 0) totalPage--;
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0)	userGroup--;
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			
			sb.append("'>&lt;&lt;</a>");
		
		}
		for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			
			if (i == totalPage)
				break;
			}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp = (userGroup + 1) * pageSize + 1;
				sb.append(temp);
				sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}
	
	/**파라미터 한개용 모듈*/
	public static String makePage(String pagename, int totalCnt, 
			int listSize,int pageSize, int cp, String keyword) {
		StringBuffer sb = new StringBuffer();
		int totalPage = totalCnt / listSize + 1;
		if (totalCnt % listSize == 0) totalPage--;
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0)	userGroup--;
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("&keyword=");
			sb.append(keyword);
			
			sb.append("'>&lt;&lt;</a>");
			
		}
		for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&keyword=");
			sb.append(keyword);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			
			if (i == totalPage)
				break;
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("&keyword=");
			sb.append(keyword);
			sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}
	
	/**파라미터 2개용 모듈*/
	public static String makePage(String pagename, int totalCnt, 
			int listSize,int pageSize, int cp,String category, String search) {
		StringBuffer sb = new StringBuffer();
		int totalPage = totalCnt / listSize + 1;
		if (totalCnt % listSize == 0) totalPage--;
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0)	userGroup--;
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("&category=");
			sb.append(category);
			sb.append("&search=");
			sb.append(search);
			sb.append("'>&lt;&lt;</a>");
			
		}
		for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&category=");
			sb.append(category);
			sb.append("&search=");
			sb.append(search);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			
			if (i == totalPage)
				break;
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("&category=");
			sb.append(category);
			sb.append("&search=");
			sb.append(search);
			sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}

}

