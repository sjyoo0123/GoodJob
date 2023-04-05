package com.goodjob.resume.model;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.career.model.CareerDTO;

public class ResumeDAOImple implements ResumeDAO {

	private SqlSessionTemplate sqlMap;

	public ResumeDAOImple() {
	}

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int resumeWrite(ResumeDTO dto) {

		int count = sqlMap.insert("resumeWrite", dto);
		return count;
	}

	@Override
	public int resumeWrite2(ResumeDTO dto, CareerDTO cto) {
		int count = sqlMap.insert("resumeWrite", dto);
		count += sqlMap.insert("resumeWrite2", cto);
		return count;
	}

}
