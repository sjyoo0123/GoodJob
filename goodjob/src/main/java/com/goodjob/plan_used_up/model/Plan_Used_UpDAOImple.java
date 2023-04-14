package com.goodjob.plan_used_up.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.*;

public class Plan_Used_UpDAOImple implements Plan_Used_UpDAO {

	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public int manPlanUsedAdd(Map map) {
		
		int count=sqlMap.insert("manPlanUsedAdd", map);
		
		return count;
	}
	
	@Override
	public int manPlanUsedAdd_up(Map map) {
		
		int result=sqlMap.insert("manPlanUsedAdd_up", map);
		
		return result;
	}
}
