package com.goodjob.plan_used_up.model;

import java.util.List;

import com.goodjob.notice.model.NoticeDTO;

public interface Plan_Used_UpDAO {

	public int comUpCount(int idx);
	public int comUpCountUse(int idx);
	public List<NoticeDTO> comUsedUP(int idx, int cp, int ls);
}
