package com.goodjob.notice.model;
import java.util.*;
public interface NoticeDAO {
	public int noticeWrite(NoticeDTO dto);
	public List<NoticeDTO> noticeComList(int idx,int cp,int ls,String status);
	public int noticeTotalCnt(int idx,String status);
	public NoticeDTO noticeContent(int idx);
	public int noticeDel(int idx);
	public List<NoticeDTO> manNoticeStatusList(int cp, int ls);
	public List<NoticeDTO> manNoticeAcceptList(int cp, int ls);
	public int manNoticeStatusCnt();
	public NoticeDTO manNoticeAcceptContent(int idx);
	public int manNoticeAcceptContent_Ok(int idx);
	public int manNoticeAcceptContent_No(int idx);
	public int manNoticeDel(int idx);
	public List<NoticeDTO> manNoticeDelList(int cp, int ls);
	public int manNoticeCnt();
	public int whereNoticeTotalCnt(String workday,String[] local2,String[] local3,String[] job);
	public List<NoticeDTO> whereNoticeList(String workday,String[] local2,String[] local3,String[] job,int start,int end);
	public List<Map<String,Object>>mainPlan(int one,int two,int three);
	public int noticeUpdate(NoticeDTO dto);
}
