package com.goodjob.resume.model;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.career.model.CareerDTO;
import com.goodjob.member.model.MemberDTO;
import com.goodjob.review.model.ReviewDTO;

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
	public MemberDTO resumeWriteForm(int idx) {
		MemberDTO dto = sqlMap.selectOne("resumeWriteForm", idx);
		return dto;
	}
	
	@Override
	public ReviewDTO resumeWriteForm1(int idx) {
		ReviewDTO dto = sqlMap.selectOne("resumeWriteForm1", idx);
		return dto;
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

	@Override
	public ResumeDTO resumeDown(int idx) {
		ResumeDTO dto = sqlMap.selectOne("resumeDown", idx);
		return dto;
	}
	@Override
	public CareerDTO resumeCarrerDown(int idx) {
		CareerDTO dto = sqlMap.selectOne("resumeCareerDown", idx);
		return dto;
	}
	@Override
	public ResumeDTO resumeContent(int idx) {
		ResumeDTO dto = sqlMap.selectOne("resumeContent", idx);
		return dto;
	}
	@Override
	public int resumeUpdate(ResumeDTO dto) {
		int count = sqlMap.update("resumeUpdate", dto);
		return count;
	}
	@Override
	public int careerUpdate(ResumeDTO dto, CareerDTO cto) {
		int count = sqlMap.update("resumeUpdate" , dto);
		count += sqlMap.update("careerUpdate" , cto);
		return count;
	}
}
