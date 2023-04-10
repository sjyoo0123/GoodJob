package com.goodjob.jobhelper.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class JobHelperDAOImple implements JobHelperDAO {

	SqlSession sqlMap;
	public JobHelperDAOImple() {
		// TODO Auto-generated constructor stub
	}
	public SqlSession getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSession sqlMap) {
		this.sqlMap = sqlMap;
	}
	@Override
	public List<JobHelperDTO> helperJobGet(String job) {
		List<JobHelperDTO> lists=sqlMap.selectList("helperJobGet", job);
		return lists;
	}
	@Override
	public List<String> helperJobCategoryGet() {
		List<String> lists=sqlMap.selectList("helperJobCategoryGet");
		return lists;
	}
	@Override
	public List<JobHelperDTO> helperLocalGet(String local) {
		List<JobHelperDTO> lists=sqlMap.selectList("helperLocalGet", local);
		return lists;
	}
}
