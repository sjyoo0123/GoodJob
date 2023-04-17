package com.goodjob.apply.model;

import java.util.List;

import com.goodjob.normalmember.model.NormalMemberDTO;
import com.goodjob.notice.model.NoticeDTO;

public interface ApplyDAO {
	public List<NoticeDTO> apComList(int idx,int cp,int ls);
	public int applyTotalCnt(int idx);
	public int apNorInsert(ApplyDTO dto);
	public NormalMemberDTO apNorGet(int member_idx);
	public int apNorButtonHide(int notice_idx, int member_idx);
	public List<NoticeDTO>  apNorlist(int member_idx, int cp,int ls);
	public int applyNorTotalCnt(int member_idx);
	public int applyCheck(int idx);
}
