package com.goodjob.totalfile.model;

import java.util.List;
import java.util.Map;

public interface TotalFileDAO {
	
	public int manFileAdd(Map map);

	public int manFileUpdate(TotalFileDTO dto);
	
	public int manFileDel(int idx);
}

