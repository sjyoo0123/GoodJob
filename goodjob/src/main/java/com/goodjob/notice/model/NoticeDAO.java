package com.goodjob.notice.model;

import java.util.List;

public interface NoticeDAO {
	public int noticeWrite(NoticeDTO dto);
	public List<NoticeDTO> noticeList(int cp);
}
