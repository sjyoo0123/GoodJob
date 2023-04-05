package com.goodjob.one_one.model;

import java.util.*;

public interface One_OneDAO {

	public int  manOneAllCnt();
	
	public List<One_OneDTO> manOneList(int cp, int ls);
	
	public One_OneDTO manOneContent(int idx);
	
	public int manFAQAnswer(One_OneDTO dto);
	
	public One_OneDTO userOneList(int idx,int cp,int ls);
	
	public int userOneWrite(One_OneDTO dto);
}
