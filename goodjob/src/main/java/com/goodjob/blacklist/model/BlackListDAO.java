package com.goodjob.blacklist.model;

import java.util.*;

import com.goodjob.member.model.MemberDTO;

public interface BlackListDAO {

	public List<MemberDTO> manBlackListGet(Map map);
	public int manBlackListTotalCnt(String category);
	public List<BlackListDTO> manBlackListContent(Map map);
	public String manBlackListGetName(int idx);
	public int manBlackListContentTotalCnt(int idx);
	public int manBlackListDel(int idx);
	public int manBlackListSingoDel(int idx);
	public List<BlackListDTO> manBlackListSingoList(Map map);
	public int manBlackListSingoTotalCnt(String category);
	public int manBlackListUpdateSingoCount(int idx);
	public int manBlackListAdd(int idx);
	public int manBlackListSingoCheckUpdate(int idx);
}
