package com.goodjob.totalfile.model;

import java.util.*;

public interface TotalFileDAO {
	
	public int manFileAdd(Map map);

	public int manFileUpdate(TotalFileDTO dto);
	
	public int manFileDel(int idx);
	
	public String noticeFile(int idx);
	
	public int noticeFileUpdate(Map map);
}

