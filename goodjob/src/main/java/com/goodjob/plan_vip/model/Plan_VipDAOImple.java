package com.goodjob.plan_vip.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class Plan_VipDAOImple implements Plan_VipDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int manPlanAdd(Plan_VipDTO dto) {
	
		int count=sqlMap.insert("manPlanAdd_vip", dto);
		
		return count;
	}
	
	
	@Override
	public int manPlanVipAdd(Map map) {
	
		int count=sqlMap.insert("manPlanVipAdd", map);
		
		return count;
	}
	
	@Override
	public List<Plan_VipDTO> manPlanVipList() {
		
		List<Plan_VipDTO> lists=sqlMap.selectList("manPlanVipList");
		
		return lists;
	}
	
	@Override
	public int manPlanDel_vip(int idx) {
		
		int count=sqlMap.update("manPlanDel_vip", idx);
		
		return count;
	}
	
	@Override
	public List<Plan_VipDTO> manPlanVipList_update() {
	
		List<Plan_VipDTO> lists= sqlMap.selectList("manPlanVipList_update");
		
		return lists;
		
	}
	
	@Override
	public Plan_VipDTO manPlanVipContent(int idx) {
		
		Plan_VipDTO dto=sqlMap.selectOne("manPlanVipContent",idx);
		
		return dto;	
		
	}
	@Override
	public int manPlanVipUpdate_a(Plan_VipDTO dto) {
		
		int count=sqlMap.update("manPlanVipUpdate_a", dto);
		
		return count;
	}
	
	@Override
	public int manPlanVipUpdate_b(Plan_VipDTO dto) {

		int count=sqlMap.update("manPlanVipUpdate_b", dto);
		
		return count;
	}
}
