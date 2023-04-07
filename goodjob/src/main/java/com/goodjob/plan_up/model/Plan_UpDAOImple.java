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
}
