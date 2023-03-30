package com.goodjob.faq.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class FAQDAOImple implements FAQDAO {

	public SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int manFAQAdd(FAQDTO dto) {
		
		int count=sqlMap.insert("manFAQAdd", dto);
		
		return count;
	}

}
