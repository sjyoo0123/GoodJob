package com.goodjob.member.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.normalmember.model.NormalMemberDTO;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;

	public MemberDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}



	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}



	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	synchronized public int memberJoin(MemberDTO dto) {
		// TODO Auto-generated method stub
		int idCheck = idCheck(dto.getId());
		int emailCheck=emailCheck(dto.getEmail());
		
		if (idCheck == 0) {
			if(emailCheck==0) {
				
			int count = sqlMap.insert("memberJoin", dto);
			if (count > 0) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", dto.getId());
				map.put("pwd", dto.getPwd());
				MemberDTO memDto = sqlMap.selectOne("memberSelect", map);
				return memDto.getIdx();
			} else {// 가입실패
				return 0;
			}
			}else {
				return-2;
			}
		} else {// 아이디중복
			return -1;
		}
	}

	@Override
	public MemberDTO login(String id, String pwd, String user_category) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("user_category", user_category);
		MemberDTO memDto = sqlMap.selectOne("login", map);
		if (memDto == null && user_category.equals("개인")) {
			map.put("user_category", "관리자");
			memDto = sqlMap.selectOne("login", map);
		}

		return memDto;
	}

	@Override
	public int memberUpdate(Object dto) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		if (dto instanceof NormalMemberDTO) {
			NormalMemberDTO norDto = (NormalMemberDTO) dto;
			paseMap(map, norDto.getPwd(), norDto.getTel(), norDto.getIdx() + "", norDto.getAddr());
			map.put("qurey", "birth='" + norDto.getBirth() + "' , gender='" + norDto.getGender() + "'");
		} else if (dto instanceof CompanyMemberDTO) {
			CompanyMemberDTO comDto = (CompanyMemberDTO) dto;
			paseMap(map, comDto.getPwd(), comDto.getTel(), comDto.getIdx() + "", comDto.getAddr());
			map.put("qurey", "com_name='" + comDto.getName() + "' , com_num= '" + comDto.getCom_num()
					+ "' ,detail_addr='" + comDto.getDetail_addr() + "'");
		} else {
			return -1;
		}
		return sqlMap.update("memberUpdate", map);
	}@Override
	public int emailCheck(String email) {
		return sqlMap.selectOne("emailCheck",email);
	}@Override
	public int idCheck(String id) {
		return sqlMap.selectOne("idCheck",id);
	}

	public Map<String, String> paseMap(Map<String, String> map, String pwd, String tel, String idx, String addr) {
		map.put("idx", idx);
		map.put("pwd", pwd);
		map.put("tel", tel);
		map.put("addr", addr);
		return map;
	}
	
	@Override
	public int updateStatus(MemberDTO dto) {
		// TODO Auto-generated method stub
		int count =sqlMap.update("updateStatus",dto);
		return count;
	}
}
