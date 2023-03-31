package com.goodjob.blacklist.model;

import java.util.*;

import com.goodjob.member.model.MemberDTO;

public interface BlackListDAO {

	public List<MemberDTO> manBlackListGet(Map map);
	public int manBlackListTotalCnt(String category);
}
