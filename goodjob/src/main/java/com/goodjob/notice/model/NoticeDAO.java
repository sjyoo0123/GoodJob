package com.goodjob.notice.model;
import java.util.*;
public interface NoticeDAO {
	public int noticeWrite(NoticeDTO dto);
	public List<NoticeDTO> noticeComList(int idx,int cp,int ls,String status);
	public int noticeTotalCnt(int idx,String status);
	public NoticeDTO noticeContent(int idx);
	public int noticeDel(int idx);
	public int whereNoticeTotalCnt(String workday,String[] local2,String[] local3,String[] job);
	public List<NoticeDTO> whereNoticeList(String workday,String[] local2,String[] local3,String[] job,int start,int end);
}
