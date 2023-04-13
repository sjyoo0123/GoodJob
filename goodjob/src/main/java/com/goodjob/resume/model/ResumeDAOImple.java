package com.goodjob.resume.model;

import java.util.List;

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

		ReviewDTO dto = sqlMap.selectOne("resumeWriteFormasd", idx);
		return dto;
	}

	@Override
	public int resumeWrite(ResumeDTO dto) {

		int count = sqlMap.insert("resumeWrite", dto);
		return count;
	}

	@Override
	public int resumeWrite2(ResumeDTO dto, List<CareerDTO> cto) {
		int count = sqlMap.insert("resumeWrite", dto);

		for (int i = 0; i < cto.size(); i++) {

			sqlMap.insert("resumeWrite2", cto.get(i));
		}
		return count;
	}

	@Override
	public ResumeDTO resumeDown(int idx) {
		ResumeDTO dto = sqlMap.selectOne("resumeDown", idx);
		return dto;
	}

	@Override
	public List<CareerDTO> resumeCarrerDown(int idx) {
		List<CareerDTO> list = sqlMap.selectList("resumeCareerDown", idx);
		return list;
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
	public int careerUpdate(CareerDTO dto) {
		int count = sqlMap.update("careerUpdate", dto);

		
		return count;
	}
	@Override
	public int carrInsert(CareerDTO dto) {
		// TODO Auto-generated method stub
		int count= sqlMap.insert("careerWrite",dto);
		return count;
	}
	@Override
	public int careerDelete(int idx) {
		int count=sqlMap.update("careerDelete", idx);
		return count;
	}
}
