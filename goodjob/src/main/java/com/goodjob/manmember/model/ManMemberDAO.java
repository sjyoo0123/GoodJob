package com.goodjob.manmember.model;

import java.util.*;

import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.member.model.MemberDTO;

public interface ManMemberDAO {

	public List<MemberDTO> manMemberList(Map map);
	public int manMemberListTotalCnt();
	public CompanyMemberDTO manMemberContent(int idx);
}
