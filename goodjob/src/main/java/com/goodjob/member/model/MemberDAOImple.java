package com.goodjob.member.model;

import java.util.Date;
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

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	synchronized public int memberJoin(MemberDTO dto) {
		// TODO Auto-generated method stub
		int idCheck=sqlMap.selectOne("idCheck", dto.getId());
		if(idCheck==0) {
			int count = sqlMap.insert("memberJoin", dto);
			if (count > 0) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", dto.getId());
				map.put("pwd", dto.getPwd());
				MemberDTO memDto = sqlMap.selectOne("memberSelect", map);
				return memDto.getIdx();
			} else {//가입실패
				return 0;
			}
		}else {//아이디중복
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
	public Object getMember(String idx, String category) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("idx", idx);
		map.put("category", category);
		Map<String, String> dtoMap = sqlMap.selectOne(category, map);
		sqlMap.selectOne(idx, category);
		if (category.equals("normalmember")) {
			return new NormalMemberDTO(0,dtoMap.get("id"), dtoMap.get("pwd"),dtoMap.get("name"),dtoMap.get("email"),dtoMap.get("tel"),
					dtoMap.get("addr"),null, 0, null, null, 0, 0, null, dtoMap.get("gender"));
		} else if (category.equals("companymember")) {
			return new CompanyMemberDTO(0, idx, category, category, category, category,
					category, null, 0, category, category, 0, 0, idx, 0, category, null);
		} else {
			return null;
		}
	}
}
