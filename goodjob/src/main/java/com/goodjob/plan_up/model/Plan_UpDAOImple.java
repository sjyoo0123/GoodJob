package com.goodjob.plan_up.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class Plan_UpDAOImple implements Plan_UpDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int manPlanAdd(Plan_UpDTO dto) {
		
		int count=sqlMap.insert("manPlanAdd_up", dto);
		
		return count;
	}
	
	@Override
	public int manPlanUpAdd(Map map) {

		int count=sqlMap.insert("manPlanUpAdd", map);
		
		return count;
	}
	
	@Override
	public List<Plan_UpDTO> manPlanUpList() {
		
		
		List<Plan_UpDTO> lists=sqlMap.selectList("manPlanUpList");
		
		return lists;
	}
	
	@Override
	public int manPlanUpDel(int idx) {
		
		int count = sqlMap.update("manPlanDel_up", idx);
		
		return count;
		
	}
	
	@Override
	public List<Plan_UpDTO> manPlanUpList_update() {
		
		List<Plan_UpDTO> lists=sqlMap.selectList("manPlanUpList_update");
		
		return lists;
	}
	
	@Override
	public Plan_UpDTO manPlanUpContent(int idx) {
		
		Plan_UpDTO dto=sqlMap.selectOne("manPlanUpContent", idx);
		
		return dto;
		
	}
	
	@Override
	public int manPlanUpUpdate_a(Plan_UpDTO dto) {
	
		int count=sqlMap.update("manPlanUpUpdate_a", dto);
		
		return count;
	}
	
	@Override
	public int manPlanUpUpdate_b(Plan_UpDTO dto) {
		
		int count=sqlMap.update("manPlanUpUpdate_b", dto);
		
		return count;
	}
}
