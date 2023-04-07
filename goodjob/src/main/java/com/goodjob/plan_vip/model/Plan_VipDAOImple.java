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
}
