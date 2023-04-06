package com.goodjob.notice.model;
import java.util.*;
public interface NoticeDAO {
	public int noticeWrite(NoticeDTO dto);
	public List<NoticeDTO> noticeComList(int idx,int cp,int ls);
	public int noticeTotalCnt(int idx);
	public NoticeDTO noticeContent(int idx);
	public int noticeDel(int idx);
}
