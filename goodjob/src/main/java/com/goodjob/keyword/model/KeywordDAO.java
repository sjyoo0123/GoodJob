package com.goodjob.keyword.model;
import java.util.List;
public interface KeywordDAO {
	
	public List<KeywordDTO> reviewWriteForm();

	public List<KeywordDTO> manKeywordList();
	
	public int manKeywordAdd(KeywordDTO dto);
	
	public int manKeywordDel(int idx);
}
