package com.goodjob.banner.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BannerDAOImple implements BannerDAO {

	@Autowired
	SqlSessionTemplate sqlMap;
	
	
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}



	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}



	@Override
	public int manBannerAdd(BannerDTO dto) {
		
		
		
		int count=sqlMap.insert("manBannerAdd", dto);
		
		return count;
	}
	
	@Override
	public int manBannerRef() {
		
		int ref=sqlMap.update("manBannerRef");
		
		return ref;
	}
	
	@Override
	public List<Banner_totalFileDTO> manBannerFileList() {
		
		List<Banner_totalFileDTO> lists=sqlMap.selectList("manBannerFileList");
		
		return lists;
	}
	
	@Override
	public Banner_totalFileDTO manBannerUpdateContent(int idx) {
		
		Banner_totalFileDTO dto=sqlMap.selectOne("manBannerUpdateContent", idx);
		System.out.println(dto);
		
		return dto;
		
	}
	
	@Override
	public int manBannerDel(int idx) {
		
		int count=sqlMap.delete("manBannerDel", idx);
		
		return count;
	}
	
	@Override
	public int manBannerCount() {
		
		int count=sqlMap.selectOne("manBannerCount");
		
		return count;
	}
}
