package com.goodjob.faq.model;

import java.util.*;

public interface FAQDAO {
	
	public int manFAQAdd(FAQDTO dto);
	
	public int manFAQAllCnt();
	
	public List<FAQDTO> manFAQList(int cp, int ls); 
	
	public FAQDTO manFAQContent(int idx);
	
	public int manFAQUpdate(FAQDTO dto);
	
	public int manFAQDel(int idx);
	
	public List<FAQDTO> manFAQSearch(int cp, int ls,String search);
	
}
