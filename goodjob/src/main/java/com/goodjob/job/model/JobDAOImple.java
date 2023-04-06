package com.goodjob.job.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class JobDAOImple implements JobDAO {

	private SqlSessionTemplate sqlMap;
	public JobDAOImple() {
		// TODO Auto-generated constructor stub
	}
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	public JobDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	@Override
	public List<String> jobList() {
		List<String> data=sqlMap.selectList("jobList");
		return data;
	}
	@Override
	public List<String> jobList2(String job1) {
		List<String> data=sqlMap.selectList("jobList2",job1);
		return data;
	}
}
